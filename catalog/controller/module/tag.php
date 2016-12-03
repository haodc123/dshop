<?php

class ControllerModuleTag extends Controller {

    protected function index($setting) {
        $this->language->load('module/tag');
        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->load->model('catalog/tag');
        
        $data = array(
           'limit' =>(int)$setting['limit']
        );
        $tags = $this->model_catalog_tag->getTags($data);
        $this->data['tags'] = array();
        foreach ($tags as $tag){
            $this->data['tags'][] = array(
                'tag_id' => $tag['tag_id'],
                'name' => $tag['name'],
                'href' => $this->url->link('product/tag', '&tag=' . $tag['tag_id'])
            );
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/tag.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/tag.tpl';
        } else {
            $this->template = 'default/template/module/tag.tpl';
        }

        $this->render();
    }

}

?>