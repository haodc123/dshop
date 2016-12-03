<?php

class ControllerSeoTag extends Controller {

    private $error = array();

    public function index() {
        $this->language->load('seo/tag');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('catalog/tag');
        $this->getList();
    }

    public function insert() {
        $this->language->load('seo/tag');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('catalog/tag');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_tag->addTag($this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->redirect($this->url->link('seo/tag', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function update() {
        $this->language->load('seo/tag');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/tag');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_tag->editTag($this->request->get['tag_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->redirect($this->url->link('seo/tag', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getForm();
    }

    public function delete() {
        $this->language->load('seo/tag');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('catalog/tag');
        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $tag_id) {
                $this->model_catalog_tag->deleteTag($tag_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }
            $this->redirect($this->url->link('seo/tag', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

        $this->getList();
    }

    protected function getList() {

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('seo/tag', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        $this->data['insert'] = $this->url->link('seo/tag/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['delete'] = $this->url->link('seo/tag/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $this->data['repair'] = $this->url->link('seo/tag/repair', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $this->data['tags'] = array();

        $data = array(
            'start' => ($page - 1) * $this->config->get('config_admin_limit'),
            'limit' => $this->config->get('config_admin_limit')
        );

        $tag_total = $this->model_catalog_tag->getTotalTags();
        $results = $this->model_catalog_tag->getTags($data);

        foreach ($results as $result) {
            $action = array();

            $action[] = array(
                'text' => $this->language->get('text_edit'),
                'href' => $this->url->link('seo/tag/update', 'token=' . $this->session->data['token'] . '&tag_id=' . $result['tag_id'] . $url, 'SSL')
            );

            $this->data['tags'][] = array(
                'tag_id' => $result['tag_id'],
                'name' => $result['name'],
                'keyword' => $result['keyword'],
                'meta_keyword' => $result['meta_keyword'],
                'meta_description' => $result['meta_description'],
                'selected' => isset($this->request->post['selected']) && in_array($result['tag_id'], $this->request->post['selected']),
                'action' => $action
            );
        }
        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['text_no_results'] = $this->language->get('text_no_results');
        $this->data['column_name'] = $this->language->get('column_name');
        $this->data['column_keyword'] = $this->language->get('column_keyword');
        $this->data['column_meta_keyword'] = $this->language->get('column_meta_keyword');
        $this->data['column_meta_description'] = $this->language->get('column_meta_description');
        $this->data['column_action'] = $this->language->get('column_action');

        $this->data['button_insert'] = $this->language->get('button_insert');
        $this->data['button_delete'] = $this->language->get('button_delete');
        $this->data['button_repair'] = $this->language->get('button_repair');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }

        $pagination = new Pagination();
        $pagination->total = $tag_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('seo/tag', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $this->data['pagination'] = $pagination->render();

        $this->template = 'seo/tag_list.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    protected function getForm() {
        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['text_none'] = $this->language->get('text_none');
        $this->data['text_default'] = $this->language->get('text_default');
        $this->data['entry_name'] = $this->language->get('entry_name');
        $this->data['entry_keyword'] = $this->language->get('entry_keyword');
        $this->data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
        $this->data['entry_meta_description'] = $this->language->get('entry_meta_description');
        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $this->data['error_name'] = $this->error['name'];
        } else {
            $this->data['error_name'] = '';
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('seo/tag', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        if (!isset($this->request->get['tag_id'])) {
            $this->data['action'] = $this->url->link('seo/tag/insert', 'token=' . $this->session->data['token'], 'SSL');
        } else {
            $this->data['action'] = $this->url->link('seo/tag/update', 'token=' . $this->session->data['token'] . '&tag_id=' . $this->request->get['tag_id'], 'SSL');
        }

        $this->data['cancel'] = $this->url->link('seo/tag', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->get['tag_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $tag_info = $this->model_catalog_tag->getTag($this->request->get['tag_id']);
        }

        $this->data['token'] = $this->session->data['token'];

        if (isset($this->request->post['name'])) {
            $this->data['name'] = $this->request->post['name'];
        } elseif (!empty($tag_info)) {
            $this->data['name'] = $tag_info['name'];
        } else {
            $this->data['name'] = '';
        }
        if (isset($this->request->post['keyword'])) {
            $this->data['keyword'] = $this->request->post['keyword'];
        } elseif (!empty($tag_info)) {
            $this->data['keyword'] = $tag_info['keyword'];
        } else {
            $this->data['keyword'] = '';
        }
        if (isset($this->request->post['meta_keyword'])) {
            $this->data['meta_keyword'] = $this->request->post['meta_keyword'];
        } elseif (!empty($tag_info)) {
            $this->data['meta_keyword'] = $tag_info['meta_keyword'];
        } else {
            $this->data['meta_keyword'] = '';
        }

        if (isset($this->request->post['meta_description'])) {
            $this->data['meta_description'] = $this->request->post['meta_description'];
        } elseif (!empty($tag_info)) {
            $this->data['meta_description'] = $tag_info['meta_description'];
        } else {
            $this->data['meta_description'] = '';
        }


        $this->load->model('design/layout');

        //  $this->data['layouts'] = $this->model_design_layout->getLayouts();

        $this->template = 'seo/tag_form.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );
        $this->response->setOutput($this->render());
    }

    protected function validateForm() {
        if (!$this->user->hasPermission('modify', 'seo/tag')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }


        if ((utf8_strlen($this->request->post['name']) < 2) || (utf8_strlen($this->request->post['name']) > 255)) {
            $this->error['name'] = $this->language->get('error_name');
        }


        if ($this->error && !isset($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'seo/tag')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
    public function autocomplete() {
		$json = array();
		
		if (isset($this->request->get['tag_name'])) {
			$this->load->model('catalog/tag');
			
			$data = array(
				'filter_name' => $this->request->get['tag_name'],
				'start'       => 0,
				'limit'       => 20
			);
			
			$tags = $this->model_catalog_tag->getTags($data);
			
			foreach ($tags as $tag) {				
				$json[] = array(
					'tag_id' => $tag['tag_id'],
					'name'      => $tag['name']
				);
			}
		}

		$sort_order = array();
	  
		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);
				
		$this->response->setOutput(json_encode($json));
	}

}

?>