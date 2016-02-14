<?php

/**
 *
 * @author AnRe //developer.lt//
 */
class ControllerModuleBannersMosaic extends Controller {
	
	private $error = array(); 
	
	public function index() {
		$this->load->language('module/banners_mosaic');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		$this->load->model('catalog/category');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('banners_mosaic', $this->request->post);		

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_size'] = $this->language->get('entry_size');
		$this->data['entry_url'] = $this->language->get('entry_url');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_timeout'] = $this->language->get('entry_timeout');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_add_block'] = $this->language->get('button_add_block');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		
		$this->load->model('tool/image');
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		$this->data['token'] = $this->session->data['token'];
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

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
			'href'      => $this->url->link('module/banners_mosaic', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/banners_mosaic', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$blocks = array();
		
		if (isset($this->request->post['banners_mosaic_block'])) {
			$blocks = $this->request->post['banners_mosaic_block'];
		} elseif ($this->config->get('banners_mosaic_block')) {
			$blocks = $this->config->get('banners_mosaic_block');
		}
		
		if ($blocks && is_array($blocks)) {
			for ($i = 0; $i < count($blocks); $i++) {
				if (isset($blocks[$i]['image1']) && !empty($blocks[$i]['image1']) && file_exists(DIR_IMAGE . $blocks[$i]['image1'])) {
					$blocks[$i]['thumb1'] = $this->model_tool_image->resize($blocks[$i]['image1'], 100, 100);
				} else {
					$blocks[$i]['thumb1'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
				}
				
				if (isset($blocks[$i]['image2']) && !empty($blocks[$i]['image2']) && file_exists(DIR_IMAGE . $blocks[$i]['image2'])) {
					$blocks[$i]['thumb2'] = $this->model_tool_image->resize($blocks[$i]['image2'], 100, 100);
				} else {
					$blocks[$i]['thumb2'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
				}
			}
		}
		
		$this->data['blocks'] = $blocks;
		
		$this->data['modules'] = array();
		
		if (isset($this->request->post['banners_mosaic_module'])) {
			$this->data['modules'] = $this->request->post['banners_mosaic_module'];
		} elseif ($this->config->get('banners_mosaic_module')) { 
			$this->data['modules'] = $this->config->get('banners_mosaic_module');
		} else {
			$this->data['modules'][] = array('layout_id' => '', 'position' => '', 'status' => 0, 'sort_order' => 1);
		}
		
		$this->load->model('design/layout');
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->template = 'module/banners_mosaic.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/banners_mosaic')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
			
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>