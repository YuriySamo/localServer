<?php  

/**
 *
 * @author AnRe //developer.lt//
 */
class ControllerModuleBannersMosaic extends Controller {
	
	protected function index($setting) {
		$this->load->model('tool/image');
		
		$blocks = array();
		$cblocks = $this->getParam('block');
		
		if ($cblocks && !empty($cblocks) && is_array($cblocks)) {
			$this->document->addScript('catalog/view/javascript/jquery/jquery.cycle.js');
			
			foreach ($cblocks as $block) {
				$has_image = false;
				$index = (int)$block['sort'];
				$b = array(
					'url'	=> $block['url'],
					'alt'	=> '',
					'title'	=> '',
					'width'	=> (int)$block['width'],
					'height'=> (int)$block['height'],
					'timeout' => (int)$block['timeout'] > 100 ? (int)$block['timeout'] : 100
				);
				
				if (isset($block['image1']) && !empty($block['image1']) && file_exists(DIR_IMAGE . $block['image1'])) {
					$b['image1'] = $this->model_tool_image->resize($block['image1'], (int)$block['width'], (int)$block['height']);
					$has_image = true;
				}
				
				if (isset($block['image2']) && !empty($block['image2']) && file_exists(DIR_IMAGE . $block['image2'])) {
					$b['image2'] = $this->model_tool_image->resize($block['image2'], (int)$block['width'], (int)$block['height']);
					$has_image = true;
				}
				
				$blocks[$index] = $b;
			}
			
			ksort($blocks);
		}
		
		$this->data['blocks'] = $blocks;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/banners_mosaic.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/banners_mosaic.tpl';
		} else {
			$this->template = 'default/template/module/banners_mosaic.tpl';
		}
		
		$this->render();
	}
	
	protected function getParam($name) {
		return $this->config->get('banners_mosaic_' . $name);
	}
}
?>