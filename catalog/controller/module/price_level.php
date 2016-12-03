<?php  
class ControllerModulePriceLevel extends Controller {
    protected function index($setting) {
        $this->language->load('module/price_level');
          $this->load->model('catalog/price_level');
        $this->data['heading_title'] = $this->language->get('heading_title');
      
        $price_level = $this->model_catalog_price_level->getPriceLevel($setting['price_level_id']);
        
        $last=0;
        foreach ($price_level as $price) {
            $this->data['menu_price'][] = array(
                //'group_price_id' => $category['group_price_id'],
                'name' => $price['name'],
                // 'name'        => $category['name'],
                //'children'    => $children_data,
                'href' => $this->url->link('product/price_level', '&min=' . $price['min'] . '&max=' . $price['max'])
            );
            $last++;
        }
        $this->data['last']=$last;
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/price_level.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/price_level.tpl';
        } else {
            $this->template = 'default/template/module/price_level.tpl';
        }
        $this->render();
    }

}
?>