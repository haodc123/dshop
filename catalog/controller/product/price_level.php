<?php

class ControllerProductPriceLevel extends Controller {

    public function index() {

           $this->load->model('catalog/product');
           $this->load->model('catalog/price_level');
         $this->language->load('product/price_level');
        if (isset($this->request->get['filter'])) {
            $filter = $this->request->get['filter'];
        } else {
            $filter = '';
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'p.sort_order';
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

        if (isset($this->request->get['limit'])) {
            $limit = $this->request->get['limit'];
        } else {
            $limit = $this->config->get('config_catalog_limit');
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
        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        if (isset($this->request->get['limit'])) {
            $url .= '&limit=' . $this->request->get['limit'];
        }
        $data = array(
            'filter_min' => $min_price,
            'filter_max' => $max_price,
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $limit,
            'limit' => $limit
        );
        $results = $this->model_catalog_product->getProducts($data);
        $priceText = $this->model_catalog_price_level->getPriceText($this->request->get['min'], $this->request->get['max']);
        if ($results && $priceText) {
            $this->data['heading_title'] = $priceText;
            $this->data['empty_product'] = $this->language->get('empty_product');
            $this->data['button_continue'] = $this->language->get('button_continue');
            $this->data['text_sort'] = $this->language->get('text_sort');
             $this->data['text_model'] = $this->language->get('text_model');
            $this->data['text_limit'] = $this->language->get('text_limit');
            $this->data['continue'] = $this->url->link('common/home');
            $product_total = $this->model_catalog_product->getTotalProducts($data);

            $this->data['breadcrumbs'] = array();

            $this->data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_home'),
                'href' => $this->url->link('common/home'),
                'separator' => false
            );

            $this->data['breadcrumbs'][] = array(
                'text' => $this->model_catalog_price_level->getPriceText($this->request->get['min'], $this->request->get['max']) ? $this->model_catalog_price_level->getPriceText($this->request->get['min'], $this->request->get['max']) : '',
                'href' => $this->url->link('product/price_level', 'min=' . $this->request->get['min'] . '&max=' . $this->request->get['max']),
                'separator' => $this->language->get('text_separator')
            );

            $this->load->model('tool/image');
            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
                } else {
                    $image = false;
                }

                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $price = false;
                }

                if ((float) $result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $special = false;
                }

                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float) $result['special'] ? $result['special'] : $result['price']);
                } else {
                    $tax = false;
                }

                if ($this->config->get('config_review_status')) {
                    $rating = (int) $result['rating'];
                } else {
                    $rating = false;
                }

                $this->data['products'][] = array(
                    'product_id' => $result['product_id'],
                    'model'=>$result['model'],
                    'thumb' => $image,
                    'name' => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
                    'price' => $price,
                    'special' => $special,
                    'tax' => $tax,
                    'rating' => $result['rating'],
                    'reviews' => sprintf($this->language->get('text_reviews'), (int) $result['reviews']),
                    'href' => $this->url->link('product/product', 'product_id=' . $result['product_id'])
                );
            }


            $url = '';

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $this->data['sorts'] = array();

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_default'),
                'value' => 'p.sort_order-ASC',
                'href' => $this->url->link('product/price_level', 'min=' . $this->request->get['min'] . '&max=' . $this->request->get['max'] . '&sort=p.sort_order&order=ASC' . $url)
            );

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_name_asc'),
                'value' => 'pd.name-ASC',
                'href' => $this->url->link('product/price_level', 'min=' . $this->request->get['min'] . '&max=' . $this->request->get['max'] . '&sort=pd.name&order=ASC' . $url)
            );

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_name_desc'),
                'value' => 'pd.name-DESC',
                'href' => $this->url->link('product/price_level', 'min=' . $this->request->get['min'] . '&max=' . $this->request->get['max'] . '&sort=pd.name&order=DESC' . $url)
            );

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_price_asc'),
                'value' => 'p.price-ASC',
                'href' => $this->url->link('product/price_level', 'min=' . $this->request->get['min'] . '&max=' . $this->request->get['max'] . '&sort=p.price&order=ASC' . $url)
            );

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_price_desc'),
                'value' => 'p.price-DESC',
                'href' => $this->url->link('product/price_level', 'min=' . $this->request->get['min'] . '&max=' . $this->request->get['max'] . '&sort=p.price&order=DESC' . $url)
            );

            if ($this->config->get('config_review_status')) {
                $this->data['sorts'][] = array(
                    'text' => $this->language->get('text_rating_desc'),
                    'value' => 'rating-DESC',
                    'href' => $this->url->link('product/price_level', 'min=' . $this->request->get['min'] . '&max=' . $this->request->get['max'] . '&sort=rating&order=DESC' . $url)
                );

                $this->data['sorts'][] = array(
                    'text' => $this->language->get('text_rating_asc'),
                    'value' => 'rating-ASC',
                    'href' => $this->url->link('product/price_level', 'min=' . $this->request->get['min'] . '&max=' . $this->request->get['max'] . '&sort=rating&order=ASC' . $url)
                );
            }

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_model_asc'),
                'value' => 'p.model-ASC',
                'href' => $this->url->link('product/price_level', 'min=' . $this->request->get['min'] . '&max=' . $this->request->get['max'] . '&sort=p.model&order=ASC' . $url)
            );

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_model_desc'),
                'value' => 'p.model-DESC',
                'href' => $this->url->link('product/price_level', 'min=' . $this->request->get['min'] . '&max=' . $this->request->get['max'] . '&sort=p.model&order=DESC' . $url)
            );

            $url = '';

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            $this->data['limits'] = array();

            $limits = array_unique(array($this->config->get('config_catalog_limit'), 25, 50, 75, 100));

            sort($limits);

            foreach ($limits as $limits) {
                $this->data['limits'][] = array(
                    'text' => $limits,
                    'value' => $limits,
                    'href' => $this->url->link('product/price_level', 'min=' . $this->request->get['min'] . '&max=' . $this->request->get['max'] . '&limit=' . $limits)
                );
            }

            $url = '';

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $pagination = new Pagination();
            $pagination->total = $product_total;
            $pagination->page = $page;
            $pagination->limit = $limit;
            $pagination->text = $this->language->get('text_pagination');
            $pagination->url = $this->url->link('product/price_level', 'min=' . $this->request->get['min'] . '&max=' . $this->request->get['max'] . '&page={page}');

            $this->data['pagination'] = $pagination->render();

            $this->data['sort'] = $sort;
            $this->data['order'] = $order;
            $this->data['limit'] = $limit;

            $this->data['continue'] = $this->url->link('common/home');

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/price_level.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/product/price_level.tpl';
            } else {
                $this->template = 'default/template/product/price_level.tpl';
            }

            $this->children = array(
                'common/column_left',
                'common/column_right',
                'common/content_top',
                'common/content_bottom',
                'common/footer',
                'common/header'
            );
            $this->response->setOutput($this->render());
        } else {
            $this->document->setTitle($this->language->get('text_error'));

            $this->data['heading_title'] = $this->language->get('text_error');

            $this->data['text_error'] = $this->language->get('text_error');

            $this->data['button_continue'] = $this->language->get('button_continue');

            $this->data['continue'] = $this->url->link('common/home');
            $this->data['breadcrumbs'] = array();

            $this->data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_home'),
                'href' => $this->url->link('common/home'),
                'separator' => false
            );

            $this->data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('product/price_level', 'min=' . $this->request->get['min'] . '&max=' . $this->request->get['max']),
                'separator' => $this->language->get('text_separator')
            );

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
            } else {
                $this->template = 'default/template/error/not_found.tpl';
            }

            $this->children = array(
                'common/column_left',
                'common/column_right',
                'common/content_top',
                'common/content_bottom',
                'common/footer',
                'common/header',
                'common/fleximage'
            );

            $this->response->setOutput($this->render());
        }
    }

}

?>