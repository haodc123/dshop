<?php
class ControllerUserUserPermission extends Controller {
	private $error = array();
 
	public function index() {
		$this->language->load('user/user_group');
 
		$this->document->setTitle($this->language->get('heading_title'));
 		
		$this->load->model('user/user_group');
		
		$this->getList();
	}

	public function insert() {
		$this->language->load('user/user_group');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('user/user_group');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_user_user_group->addUserGroup($this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->redirect($this->url->link('user/user_permission', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('user/user_group');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('user/user_group');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_user_user_group->editUserGroup($this->request->get['user_group_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->redirect($this->url->link('user/user_permission', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() { 
		$this->language->load('user/user_group');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('user/user_group');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
      		foreach ($this->request->post['selected'] as $user_group_id) {
				$this->model_user_user_group->deleteUserGroup($user_group_id);	
			}
						
			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->redirect($this->url->link('user/user_permission', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}
		 
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		$url = '';
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}	
	
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
			
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('user/user_permission', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		$this->data['insert'] = $this->url->link('user/user_permission/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('user/user_permission/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');	
	
		$this->data['user_groups'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		
		$user_group_total = $this->model_user_user_group->getTotalUserGroups();
		
		$results = $this->model_user_user_group->getUserGroups($data);

		foreach ($results as $result) {
			$action = array();
			
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('user/user_permission/update', 'token=' . $this->session->data['token'] . '&user_group_id=' . $result['user_group_id'] . $url, 'SSL')
			);		
		
			$this->data['user_groups'][] = array(
				'user_group_id' => $result['user_group_id'],
				'name'          => $result['name'],
				'selected'      => isset($this->request->post['selected']) && in_array($result['user_group_id'], $this->request->post['selected']),
				'action'        => $action
			);
		}	
	
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
 
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
		
		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['sort_name'] = $this->url->link('user/user_permission', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
				
		$pagination = new Pagination();
		$pagination->total = $user_group_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('user/user_permission', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
		
		$this->data['pagination'] = $pagination->render();				

		$this->data['sort'] = $sort; 
		$this->data['order'] = $order;

		$this->template = 'user/user_group_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
 	}

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_select_all'] = $this->language->get('text_select_all');
		$this->data['text_unselect_all'] = $this->language->get('text_unselect_all');
				
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_access'] = $this->language->get('entry_access');
		$this->data['entry_modify'] = $this->language->get('entry_modify');
                $this->data['entry_insert'] = $this->language->get('entry_insert');
                $this->data['entry_update'] = $this->language->get('entry_update');
                $this->data['entry_delete'] = $this->language->get('entry_delete');
                $this->data['entry_barcode'] = $this->language->get('entry_barcode');
                $this->data['entry_view'] = $this->language->get('entry_view');
                $this->data['entry_coppy'] = $this->language->get('entry_coppy');
                $this->data['entry_export'] = $this->language->get('entry_export');
                $this->data['entry_edit'] = $this->language->get('entry_edit');
                $this->data['entry_display'] = $this->language->get('entry_display');
                $this->data['entry_status'] = $this->language->get('entry_status');
                $this->data['entry_invoice'] = $this->language->get('entry_invoice');
                $this->data['entry_comfirm'] = $this->language->get('entry_comfirm');
		
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

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
			
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('user/user_permission', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
			
		if (!isset($this->request->get['user_group_id'])) {
			$this->data['action'] = $this->url->link('user/user_permission/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('user/user_permission/update', 'token=' . $this->session->data['token'] . '&user_group_id=' . $this->request->get['user_group_id'] . $url, 'SSL');
		}
		  
    	$this->data['cancel'] = $this->url->link('user/user_permission', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['user_group_id']) && $this->request->server['REQUEST_METHOD'] != 'POST') {
			$user_group_info = $this->model_user_user_group->getUserGroup($this->request->get['user_group_id']);
		}

		if (isset($this->request->post['name'])) {
			$this->data['name'] = $this->request->post['name'];
		} elseif (!empty($user_group_info)) {
			$this->data['name'] = $user_group_info['name'];
		} else {
			$this->data['name'] = '';
		}
		
		$ignore = array(
			'common/home',
			'common/startup',
			'common/login',
			'common/logout',
			'common/forgotten',
			'common/reset',			
			'error/not_found',
			'error/permission',
			'common/footer',
			'common/header'
		);
//                $delete = array(
//			
//                        'catalog/product',
//                        'purchase/delivery',
//                        'purchase/receipt',
//                        'purchase/purchase',
//		);
//                $insert = array(
//			
//                        'catalog/product',
//                        'purchase/delivery',
//                        'purchase/receipt',
//                        'purchase/purchase',
//		);
//                 $update = array(
//			
//                        'catalog/product',
//                        'purchase/delivery',
//                        'purchase/receipt',
//                        'purchase/purchase',
//		);
                $display = array(
			
                        'catalog/product',
                         'purchase/delivery',
                        'purchase/receipt',
                        'purchase/purchase'
		);
                $status = array(
			
                        'catalog/product',
                        'purchase/delivery',
                        'purchase/receipt',
                        'purchase/purchase'
		);
                 $comfirm = array(
			
                        'purchase/delivery',
                        'purchase/receipt'
                     
		);
                 $coppy = array(
			
                        'catalog/product'
//                        'purchase/delivery',
//                        'purchase/receipt',
//                        'purchase/purchase',
		);
                $view = array(
			
                        'catalog/product',
                        'purchase/delivery',
                        'purchase/receipt',
                        'purchase/purchase'
		);
                $export = array(
			
                        'catalog/product'
                       
		);
                $import = array(
			
                        'catalog/product'
               );
                 $barcode = array(
			
                        'catalog/product'
                       
		);
                  $invoice = array(
			
                        'catalog/product',
                         'purchase/delivery',
                        'purchase/receipt',
                        'purchase/purchase'
                       
		);
                
				
		$this->data['permissions'] = array();
                $this->data['inserts'] = array();
                $this->data['edits'] = array();
                $this->data['coppies'] = array();
                $this->data['views'] = array();
                $this->data['exports'] = array();
                $this->data['barcodes'] = array();
                $this->data['imports'] = array();
                $this->data['displaies'] = array();
                $this->data['statuss'] = array();
                $this->data['invoices'] = array();
                $this->data['comfirms'] = array();
		
		$files = glob(DIR_APPLICATION . 'controller/*/*.php');
		
		foreach ($files as $file) {
			$data = explode('/', dirname($file));
			
			$permission = end($data) . '/' . basename($file, '.php');
			
			if (!in_array($permission, $ignore)) {
                           
				$this->data['permissions'][] = $permission;
//                                if(in_array($permission, $insert)){
//                                    $this->data['inserts'][] = $permission;
//                                }
//                                if(in_array($permission, $update)){
//                                    $this->data['updates'][] = $permission;
//                                }
//                                if(in_array($permission, $delete)){
//                                    $this->data['deletes'][] = $permission;
//                                }
                                if(in_array($permission, $view)){
                                    $this->data['views'][] = $permission;
                                }
                                if(in_array($permission, $export)){
                                    $this->data['exports'][] = $permission;
                                }
                                  if(in_array($permission, $import)){
                                    $this->data['imports'][] = $permission;
                                }
                                if(in_array($permission, $barcode)){
                                    $this->data['barcodes'][] = $permission;
                                }
                                 if(in_array($permission, $coppy)){
                                    $this->data['coppies'][] = $permission;
                                }
                                 if(in_array($permission, $display)){
                                    $this->data['displaies'][] = $permission;
                                }
                                 if(in_array($permission, $status)){
                                    $this->data['statuss'][] = $permission;
                                }
                                if(in_array($permission, $invoice)){
                                    $this->data['invoices'][] = $permission;
                                }
                                if(in_array($permission, $comfirm)){
                                    $this->data['comfirms'][] = $permission;
                                }
                               
			}
		}
		
		if (isset($this->request->post['permission']['access'])) {
			$this->data['access'] = $this->request->post['permission']['access'];
		} elseif (isset($user_group_info['permission']['access'])) {
			$this->data['access'] = $user_group_info['permission']['access'];
		} else { 
			$this->data['access'] = array();
		}

		if (isset($this->request->post['permission']['modify'])) {
			$this->data['modify'] = $this->request->post['permission']['modify'];
		} elseif (isset($user_group_info['permission']['modify'])) {
			$this->data['modify'] = $user_group_info['permission']['modify'];
		} else { 
			$this->data['modify'] = array();
		}
                if (isset($this->request->post['permission']['insert'])) {
			$this->data['insert'] = $this->request->post['permission']['insert'];
		} elseif (isset($user_group_info['permission']['insert'])) {
			$this->data['insert'] = $user_group_info['permission']['insert'];
		} else { 
			$this->data['insert'] = array();
		}
               
                if (isset($this->request->post['permission']['delete'])) {
			$this->data['delete'] = $this->request->post['permission']['delete'];
		} elseif (isset($user_group_info['permission']['delete'])) {
			$this->data['delete'] = $user_group_info['permission']['delete'];
		} else { 
			$this->data['delete'] = array();
		}
               
                if (isset($this->request->post['permission']['edit'])) {
			$this->data['edit'] = $this->request->post['permission']['edit'];
		} elseif (isset($user_group_info['permission']['edit'])) {
			$this->data['edit'] = $user_group_info['permission']['edit'];
		} else { 
			$this->data['edit'] = array();
		}
                if (isset($this->request->post['permission']['coppy'])) {
			$this->data['coppy'] = $this->request->post['permission']['coppy'];
		} elseif (isset($user_group_info['permission']['coppy'])) {
			$this->data['coppy'] = $user_group_info['permission']['coppy'];
		} else { 
			$this->data['coppy'] = array();
		}
                if (isset($this->request->post['permission']['view'])) {
			$this->data['view'] = $this->request->post['permission']['view'];
		} elseif (isset($user_group_info['permission']['view'])) {
			$this->data['view'] = $user_group_info['permission']['view'];
		} else { 
			$this->data['view'] = array();
		}
                   if (isset($this->request->post['permission']['export'])) {
			$this->data['export'] = $this->request->post['permission']['export'];
		} elseif (isset($user_group_info['permission']['export'])) {
			$this->data['export'] = $user_group_info['permission']['export'];
		} else { 
			$this->data['export'] = array();
		}
                  if (isset($this->request->post['permission']['barcode'])) {
			$this->data['barcode'] = $this->request->post['permission']['barcode'];
		} elseif (isset($user_group_info['permission']['barcode'])) {
			$this->data['barcode'] = $user_group_info['permission']['barcode'];
		} else { 
			$this->data['barcode'] = array();
		}
                 if (isset($this->request->post['permission']['invoice'])) {
			$this->data['invoice'] = $this->request->post['permission']['invoice'];
		} elseif (isset($user_group_info['permission']['invoice'])) {
			$this->data['invoice'] = $user_group_info['permission']['invoice'];
		} else { 
			$this->data['invoice'] = array();
		}
                if (isset($this->request->post['permission']['display'])) {
			$this->data['display'] = $this->request->post['permission']['display'];
		} elseif (isset($user_group_info['permission']['display'])) {
			$this->data['display'] = $user_group_info['permission']['display'];
		} else { 
			$this->data['display'] = array();
		}
                if (isset($this->request->post['permission']['status'])) {
			$this->data['status'] = $this->request->post['permission']['status'];
		} elseif (isset($user_group_info['permission']['status'])) {
			$this->data['status'] = $user_group_info['permission']['status'];
		} else { 
			$this->data['status'] = array();
		}
                 if (isset($this->request->post['permission']['comfirm'])) {
			$this->data['comfirm'] = $this->request->post['permission']['comfirm'];
		} elseif (isset($user_group_info['permission']['comfirm'])) {
			$this->data['comfirm'] = $user_group_info['permission']['comfirm'];
		} else { 
			$this->data['comfirm'] = array();
		}
               $this->template = 'user/user_group_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'user/user_permission')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'user/user_permission')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		$this->load->model('user/user');
      	
		foreach ($this->request->post['selected'] as $user_group_id) {
			$user_total = $this->model_user_user->getTotalUsersByGroupId($user_group_id);

			if ($user_total) {
				$this->error['warning'] = sprintf($this->language->get('error_user'), $user_total);
			}
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>