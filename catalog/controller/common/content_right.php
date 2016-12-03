<?php  
class ControllerCommonContentRight extends Controller {
	public function index() {
        $this->load->model('common/content');
        //  $this->language->load('catalog/product');
        $this->language->load('common/content');
        $this->data['empty_product']=$this->language->get('empty_product');
          if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }
        // Tim kiếm theo mức giá
         if (isset($this->request->get['min'])) {
            $min_price = $this->request->get['min'];
        } else {
            $min_price = 0;
        }
        if (isset($this->request->get['max'])) {
            $max_price = $this->request->get['max'];
        } else {
            $max_price = 0;
        }
         $url = '';

        if (isset($this->request->get['min'])) {
            $url .= '&min=' . urlencode(html_entity_decode($this->request->get['min'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['max'])) {
            $url .= '&max=' . urlencode(html_entity_decode($this->request->get['max'], ENT_QUOTES, 'UTF-8'));
        }
         $data = array(
//			'filter_name'	  => $filter_name, 
//			'filter_model'	  => $filter_model,
//			'filter_price'	  => $filter_price,
//			'filter_quantity' => $filter_quantity,
//			'filter_status'   => $filter_status,
//			'sort'            => $sort,
//			'order'           => $order,
                        'min' => $min_price,
                        'max' => $max_price,
//			'start'           => ($page - 1) * $this->config->get('config_admin_limit'),
//			'limit'           => $this->config->get('config_admin_limit')
                        'start'           => ($page - 1) * 5,
			'limit'           => 5
                        
		);
        $products = $this->model_common_content->getProducts($data);
//		$this->dat['text_name']=$this->language->get('text_name');
//                $this->dat['text_code']=$this->language->get('text_code');
//                $this->dat['text_price']=$this->language->get('text_price');
        $this->load->model('tool/image');
       if(!empty( $products)){
        foreach ($products as $product) {
               
            if ($product['image']) {
                $image = $this->model_tool_image->resize($product['image'],$this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
            } else {
                $image = false;
            }

            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }
                $this->data['products'][] = array(
                'product_id' => $product['product_id'],
                'thumb' => $image,
                'name' => $product['name'],
                'price' => $price,
                //'special' 	 => $special,
                'sort_order' => $product['sort_order'],
               // 'reviews' => sprintf($this->language->get('text_reviews'), (int) $product['reviews']),
                'href' => $this->url->link('product/product', 'product_id=' . $product['product_id'])
            );
        }
        
        }
      
       
        $this->data['seemore']= $this->url->link('common/home', $url .'&page='.($page+1), 'SSL');
        $product_total = $this->model_common_content->getTotalProducts($data);
        $pagination = new Pagination();
        $pagination->total = $product_total;
        $pagination->page = $page;
       // $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->limit = 5;
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('common/home', $url .'&page={page}', 'SSL');
       // $pagination->url = $this->url->link('common/home','&page={page}', 'SSL');
       // $pagination->url = $this->url->link('common/home&page={page}');
        
        $this->data['pagination'] = $pagination->render();

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/content_right.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/common/content_right.tpl';
        } else {
            $this->template = 'default/template/common/content_right.tpl';
        }

        $this->render();
    }
}
?>