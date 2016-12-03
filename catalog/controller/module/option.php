<?php

class ControllerModuleOption extends Controller {

    protected function index($setting) {

        $this->language->load('module/option');
        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->load->model('catalog/option');
        $this->load->model('tool/image');
        $this->data['options'] = array();
        $options = $this->model_catalog_option->getOption($setting['option_id']);

        foreach ($options as $option) {
            $this->data['options'][] = array(
                'name' => $option['name'],
                'image' => $this->model_tool_image->resize($option['image'], $setting['image_width'], $setting['image_height']),
                'href' => $this->url->link('product/option', 'option_value_id=' . $option['option_value_id'])
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