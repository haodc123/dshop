<?php

class ControllerModuleColor extends Controller {

    protected function index() {

        $this->language->load('module/color');
        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->load->model('catalog/color');
        $this->data['colors'] = array();
        $colors = $this->model_catalog_color->getColor();

        foreach ($colors as $color) {
            $this->data['colors'][] = array(
                'name' => $color['name'],
                'code' =>  $color['code'],
                'color' =>  $color['color'],
                'href' => $this->url->link('product/color', 'color=' .strtolower($color['code']) )
            );
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/color.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/color.tpl';
        } else {
            $this->template = 'default/template/module/color.tpl';
        }

        $this->render();
    }

}

?>