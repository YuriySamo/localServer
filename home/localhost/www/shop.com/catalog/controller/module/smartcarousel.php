<?php  
class ControllerModuleSmartcarousel extends Controller {
	protected function index($setting) {
		
		$this->loadScriptCss();
		$this->data['custome_section_content'] = '';
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/smartcarousel.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/smartcarousel.tpl';
		} else {
			$this->template = 'default/template/module/smartcarousel.tpl';
		}
		
		$modSetting = $this->config->get('smartcarousel_setings');
		if($setting['layout_id'] != 2 || $modSetting['lastview']['hide'] != 1){
			$this->getProductArr($modSetting);
			$this->addToLastViewed();
			$this->render();
		} else {
			$this->addToLastViewed();
		}
  	}
  	
  	private function loadScriptCss(){
  		$hostname = HTTP_SERVER;
  		
  		if(isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
  			$hostname = HTTPS_SERVER;
  		}
  		
  		$this->document->addStyle('catalog/view/smartcarousel/smartcarousel.css');
  		$this->document->addScript('catalog/view/smartcarousel/smartcarousel.js');
  		
  		$this->document->addScript('catalog/view/smartcarousel/jquery.jcarousel.min.js');
  		$this->document->addStyle('catalog/view/smartcarousel/carousel.css');
  	}
  	
  	private function getProductArr($modSetting){
  		/** carousel js setting */
  		$carouselSetting = array('vertical' => false,
  				'visible' => (int)$modSetting['noofprod'],
  				'scroll' => (int)$modSetting['scroll']);
  		
  		$this->data['carousel_setting'] = json_encode($carouselSetting);
  		
  		$this->data['button_cart'] = $this->language->get('button_cart');
  		$this->data['MS'] = $modSetting;
  		
  		$this->data['orderArr'] = $tempArr = array();

  		$this->load->model('catalog/product');		
  		$this->load->model('tool/image');

  		$modSetting['image_width'] = !empty($modSetting['image_width']) ? $modSetting['image_width'] : 80;
  		$modSetting['image_height'] = !empty($modSetting['image_height']) ? $modSetting['image_height'] : 80;
  		$imageSize = array('W' => $modSetting['image_width'], 'H' => $modSetting['image_height']);
  		
  		/** prepare featured product array --------------------------*/
  		if($modSetting['featured']['display'] == 1)
  		{	
	  		$setting['limit'] = !empty($modSetting['featured']['limit']) ? $modSetting['featured']['limit'] : 10;
	  		$products = explode(',', $this->config->get('featured_product'));
	  		$products = array_slice($products, 0, (int)$setting['limit']);

	  		foreach ($products as $product_id) {
	  			$product_info = $this->model_catalog_product->getProduct($product_id);
	  			
	  			if ($product_info)
	  				$tempArr[] = $product_info;
	  		}
	  		
	  		$this->data['f_products'] = $this->getProductInfoArr($tempArr, $imageSize);
	  		
	  		if($modSetting['featured']['display'] == 1 && count($this->data['f_products']) > 0)
	  			$this->data['orderArr']['featured'] = $modSetting['featured']['position'];
  		}
  		/** prepare featured product array --------------------------*/
  		
  		/** prepare latest product array ----------------------------*/
  		if($modSetting['mostnew']['display'] == 1)
  		{
  			$setting['limit'] = !empty($modSetting['mostnew']['limit']) ? $modSetting['mostnew']['limit'] : 10;
	  		$this->language->load('module/latest');
	  		$data = array(
	  				'sort'  => 'p.date_added',
	  				'order' => 'DESC',
	  				'start' => 0,
	  				'limit' => $setting['limit']
	  		);
	  		
	  		$tempArr = $this->model_catalog_product->getProducts($data);
	  		$this->data['m_products'] = $this->getProductInfoArr($tempArr, $imageSize);
	  		
	  		if($modSetting['mostnew']['display'] == 1 && count($tempArr) > 0)
	  			$this->data['orderArr']['mostnew'] = $modSetting['mostnew']['position'];
  		}
  		/** prepare latest product array ----------------------------*/
  		
  		/** prepare lastviewed product array ------------------------*/
  		if($modSetting['lastview']['display'] == 1)
  		{
  			$products = $tempArr = array();
  			
	  		if (isset($this->request->cookie['sc_last_viewed'])) {
	  			$products = explode(',', $this->request->cookie['sc_last_viewed']);
	  		} else if (isset($this->session->data['sc_last_viewed'])) {
	  			$products = $this->session->data['sc_last_viewed'];
	  		}
	  		
	  		if (isset($this->request->get['route']) && $this->request->get['route'] == 'product/product')
	  			$currPid = $this->request->get['product_id'];
	  		
	  		foreach ($products as $product_id) {
	  			if(isset($currPid) && $currPid == $product_id)
	  				continue;
	  			
	  			$product_info = $this->model_catalog_product->getProduct($product_id);
	  				
	  			if ($product_info)
	  				$tempArr[] = $product_info;
	  			
	  			if(!empty($modSetting['lastview']['limit']) && $modSetting['lastview']['limit'] <= count($tempArr) )
	  				break;
	  		}
	  		
	  		$this->data['l_products'] = $this->getProductInfoArr($tempArr, $imageSize);
	  		
	  		if($modSetting['lastview']['display'] == 1 && count($tempArr) > 0)
	  			$this->data['orderArr']['lastview'] = $modSetting['lastview']['position'];
  		}
  		/** prepare lastviewed product array ------------------------*/
  		
  		/** prepare wishlist product array --------------------------*/
  		if($this->customer->isLogged()
  		&& $modSetting['wishlist']['display'] == 1
  		&& isset($this->session->data['wishlist'])
  		&& count($this->session->data['wishlist']))
  		{
	  		$products = $tempArr = array();
	  		
	  		if(isset($this->session->data['wishlist']) && count($this->session->data['wishlist']))
	  		{
	  			foreach($this->session->data['wishlist'] as $key => $product_id) {
	  				$product_info = $this->model_catalog_product->getProduct($product_id);
	  					
	  				if($product_info)
	  					$tempArr[] = $product_info;	
	  				else
	  					unset($this->session->data['wishlist'][$key]);
	  				
	  				if(!empty($modSetting['wishlist']['limit']) && $modSetting['wishlist']['limit'] <= count($tempArr) )
	  					break;
	  			}
	  		}
	  		
	  		$this->data['w_products'] = $this->getProductInfoArr($tempArr, $imageSize);
	  		
	  		if($this->customer->isLogged()
  			&& $modSetting['wishlist']['display'] == 1
  			&& isset($this->session->data['wishlist'])
  			&& count($this->session->data['wishlist']) > 0)
	  			$this->data['orderArr']['wishlist'] = $modSetting['wishlist']['position'];
  		}
  		/** prepare wishlist product array --------------------------*/
  		
  		asort($this->data['orderArr']);
  		$this->data['activeTitle'] = key($this->data['orderArr']);
  		
  		$cssWidthArr = array('0' => '', '1' => 'per50', '2' => 'per48', '3' => 'per32', '4' => 'per24');
  		$this->data['widthClass'] = $cssWidthArr[count($this->data['orderArr'])];
  	}
  	
  	/** function for prepare product detail array */
  	private function getProductInfoArr($results, $imageSize){
  		$productArr = array();
  		foreach ($results as $result) {
  			if ($result['image']) {
  				$image = $this->model_tool_image->resize($result['image'], $imageSize['W'], $imageSize['H']);
  			} else {
  				$image = false;
  			}
  		
  			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
  				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
  			} else {
  				$price = false;
  			}
  				
  			if ((float)$result['special']) {
  				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
  			} else {
  				$special = false;
  			}
  				
  			if ($this->config->get('config_review_status')) {
  				$rating = $result['rating'];
  			} else {
  				$rating = false;
  			}
  				
  			$productArr[] = array(
  					'product_id' => $result['product_id'],
  					'thumb'   	 => $image,
  					'name'    	 => $result['name'],
  					'price'   	 => $price,
  					'special' 	 => $special,
  					'rating'     => $rating,
  					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
  					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
  			);
  		}
  		
  		return $productArr;
  	}
  	
  	/** Function for set cookie if product page */
  	private function addToLastViewed()
  	{
  		if (isset($this->request->get['route']) && $this->request->get['route'] == 'product/product') {
  			$lastViewedProducts = array();
  			
  			if (isset($this->request->cookie['sc_last_viewed'])) {
  				$lastViewedProducts = explode(',', $this->request->cookie['sc_last_viewed']);
  			} else if (isset($this->session->data['sc_last_viewed'])) {
  				$lastViewedProducts = $this->session->data['sc_last_viewed'];
  			}
  			
  			$productId = $this->request->get['product_id']; 
  			
  			$lastViewedProducts = array_diff($lastViewedProducts, array($productId));
  			array_unshift($lastViewedProducts, $productId);
  			
  			setcookie('sc_last_viewed', implode(',',$lastViewedProducts), time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);
  			
  			if (!isset($this->session->data['sc_last_viewed']) || $this->session->data['sc_last_viewed'] != $lastViewedProducts) {
  				$this->session->data['sc_last_viewed'] = $lastViewedProducts;
  			}
  		}
  	}
}
?>