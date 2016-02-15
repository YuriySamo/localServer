<?php
class ControllerModuleSmartcarousel extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/smartcarousel');
		$this->load->model('setting/setting');
						
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$saveNclose = $this->request->post['saveNclose'];
			unset($this->request->post['saveNclose']);
			
			$this->model_setting_setting->editSetting('smartcarousel', $this->request->post);		
			$this->session->data['success'] = $this->language->get('text_success');
			
			if($saveNclose == 'Y')
				$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			else
			{
				$this->session->data['success'] = $this->language->get('text_success');
				$this->redirect($this->url->link('module/smartcarousel', 'token=' . $this->session->data['token'], 'SSL'));
			}
		}
				
		$this->setDefaultText();
		$this->setTokenErrorWarning();
		$this->setBreadscrums();
		$this->setFormValues();
		$this->setModuleAndViewSetting();
	}
		
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/smartcarousel')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!isset($this->request->post['smartcarousel_setings'])) {
			$this->error['error_message'] = $this->language->get('error_no_setting_found');
		} else if($this->request->post['smartcarousel_setings']['scroll'] > $this->request->post['smartcarousel_setings']['noofprod']) {
			$this->error['error_message'] = $this->language->get('error_scroll_grt_not_allow');
		} else {
			foreach ($this->request->post['smartcarousel_setings'] as $key => $value) {

				if($key == 'image_width' || $key == 'image_height'){
					if(empty($value)){
						$this->error['error_message'] = $this->language->get('error_image_size');
						break;						
					}
					else if(!ctype_digit($value)){
						$this->error['error_message'] = $this->language->get('error_image_size_digit');
						break;
					}
				}
				
				if(!is_array($value))
					continue;
				
				if ( (!empty($value['limit']) && !ctype_digit($value['limit']))
				|| (!empty($value['position']) && !ctype_digit($value['position']))) {
					$this->error['error_message'] = strtoupper($key).': '.$this->language->get('error_limit_position_digit');
					break;
				}
				
				if (isset($value['limit']) && $value['limit'] == ''){
					$this->error['error_message'] = strtoupper($key).': '.$this->language->get('error_limit_required');
					break;
				}
				
				if (empty($value['title'])) {
					$this->error['error_message'] = strtoupper($key).': '.$this->language->get('error_tab_title_require');
					break;
				}
			}
		}
		
		if (!$this->error && isset($this->request->post['smartcarousel_module'])){
			$layoutIdArr = array();
			foreach ($this->request->post['smartcarousel_module'] as $value) {
				if(in_array($value['layout_id'], $layoutIdArr))
				{
					$this->error['error_message'] = $this->language->get('error_duplicate_layout');
					break;
				}
				else 
					$layoutIdArr[] = $value['layout_id'];
			}
		}
		
		if (!$this->error){
			if(!empty($this->request->post['smartcarousel_setings']['lastview']['display'])
			&& $this->request->post['smartcarousel_setings']['lastview']['display'] == 1){
				$layoutExist = false;
				
				if(isset($this->request->post['smartcarousel_module'])){
					foreach ($this->request->post['smartcarousel_module'] as $value) {
						if($value['layout_id'] == 2){
							$layoutExist = true;
							break;
						}
					}
				}
				
				if(!$layoutExist){
					$this->error['error_message'] = $this->language->get('text_lastview_inst');
				}
			}
		}
			
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	public function setDefaultText() {
		$this->document->setTitle($this->language->get('heading_title'));
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_content'] = $this->language->get('entry_content');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_image'] = $this->language->get('entry_image');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_savenclose'] = $this->language->get('button_savenclose');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$this->data['title_settings'] = $this->language->get('text_heading_settings');
		$this->data['entry_noofprod'] = $this->language->get('entry_pro_noofprod');
		$this->data['entry_scroll'] = $this->language->get('entry_pro_scroll');
		
		$this->data['sec_title']['featured'] = $this->language->get('text_heading_featured');
		$this->data['sec_title']['mostnew'] = $this->language->get('text_heading_mostnew');
		$this->data['sec_title']['lastview'] = $this->language->get('text_heading_lastview');
		$this->data['sec_title']['wishlist'] = $this->language->get('text_heading_wishlist');
		$this->data['lastview_inst'] = $this->language->get('text_lastview_inst');
		$this->data['entry_hide_on_product'] = $this->language->get('entry_hide_on_product');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		
		$this->data['entry_display_in_car'] = $this->language->get('entry_display_in_car');
		$this->data['entry_tab_title'] = $this->language->get('entry_tab_title');
		$this->data['entry_tab_position'] = $this->language->get('entry_tab_position');
		$this->data['entry_product_limit'] = $this->language->get('entry_product_limit');
	}
	
	public function setTokenErrorWarning() {
		$this->data['token'] = $this->session->data['token'];
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->error['error_message'])) {
			$this->data['error_message'] = $this->error['error_message'];
		} else {
			$this->data['error_code'] = '';
		}	
	}
	
	public function setBreadscrums() {
		$this->data['breadcrumbs'] = array();
		
		$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
		);
		
		$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_module'),
				'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
		);
		
		$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('module/smartcarousel', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
		);
	}
	
	public function setFormValues() {
		$this->data['sliders'] = array('featured', 'mostnew', 'lastview', 'wishlist');
		$this->data['action'] = $this->url->link('module/smartcarousel', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['smartcarousel_setings'])) {
			$this->data['scs'] = $this->request->post['smartcarousel_setings'];
		} else {
			$this->data['scs'] = $this->config->get('smartcarousel_setings');
		}
	}
	
	public function setModuleAndViewSetting() {
		$this->data['modules'] = array();
		
		if (isset($this->request->post['smartcarousel_module'])) {
			$this->data['modules'] = $this->request->post['smartcarousel_module'];
		} elseif ($this->config->get('smartcarousel_module')) {
			$this->data['modules'] = $this->config->get('smartcarousel_module');
		}
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		}
		
		$this->load->model('design/layout');
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		$this->template = 'module/smartcarousel.tpl';
		$this->children = array(
				'common/header',
				'common/footer'
		);
		
		$this->response->setOutput($this->render());
	}
	
	public function install() {
		$this->load->model('setting/setting');
		
		$settingArr = array ( 'smartcarousel_setings' => array ( 'noofprod' => 4, 'scroll' => 1, 'image_width' => 80, 'image_height' => 80,
		'featured' => array ( 'display' => 1, 'title' => 'Featured', 'limit' => 10, 'position' => 1 ),
		'mostnew' => array ( 'display' => 1, 'title' => 'Most new', 'limit' => 10, 'position' => 2 ),
		'lastview' => array ( 'display' => 1, 'title' => 'Last viewed', 'limit' => 10, 'position' => 3, 'hide' => 0 ),
		'wishlist' => array ( 'display' => 1, 'title' => 'Wishlist', 'limit' => 10, 'position' => 4 ) ),
		'smartcarousel_module' => array (array ( 'layout_id' => 2, 'position' => 'content_bottom', 'status' => 1,'sort_order' => '')));
		
		$this->model_setting_setting->editSetting('smartcarousel', $settingArr);
	}
	
	public function uninstall() {
		$this->load->model('setting/setting');
		$this->model_setting_setting->deleteSetting('smartcarousel');
	}
}
?>