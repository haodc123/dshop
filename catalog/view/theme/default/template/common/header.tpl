<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <head>
        <meta charset="UTF-8" />
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
        <meta name="keywords" content="<?php echo $keywords; ?>" />
        <?php } ?>
        <?php if ($icon) { ?>
        <link href="<?php echo $icon; ?>" rel="icon" />
        <?php } ?>
        <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
      
        <?php foreach ($styles as $style) { ?>
        <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>
       <link rel="stylesheet" href="catalog/view/theme/default/App_Themes/Deal14/font-awesome/css/font-awesome.min.css">
       <link rel="stylesheet" href="catalog/view/theme/default/App_Themes/Deal14/dialog.css">
       <!--[if IE 7]>
        <link rel="stylesheet" href="catalog/view/theme/default/App_Themes/Deal14/font-awesome/css/font-awesome-ie7.min.css">
        <![endif]-->
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/screen_gen.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
        <script language="javascript" type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.2.min.js"></script>
        <script language="javascript" type="text/javascript" src="catalog/view/javascript/jquery/jquery.elevatezoom.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/common.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/App_Themes/Deal14/vi_style_v3.css" />
        <script language="javascript" type="text/javascript" src="catalog/view/javascript/js/up.js"></script>
   
        <!-- lazyload image -->
        <script language="javascript" type="text/javascript" src="catalog/view/javascript/js/jquery.lazyload.pack.js"></script>
         <script type="text/javascript">
              $(function () {
              $(".item_image img").lazyload({
              effect: "fadeIn",
              threshold: 100,
              placeholder: "catalog/view/theme/default/Images/Deal14/loading-big.png",
              failure_limit: 10
          });
      });
          </script>
        <!-- flexslider -->
        <script language="javascript" type="text/javascript" src="catalog/view/javascript/js/flexslider/jquery.flexslider-min.js"></script>


        <!--End-->   
        <?php foreach ($scripts as $script) { ?>
        <script type="text/javascript" src="<?php echo $script; ?>"></script>
        <?php } ?>
        <!--[if IE 7]> 
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
        <![endif]-->
        <!--[if lt IE 7]>
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
        <script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
        <script type="text/javascript">
        DD_belatedPNG.fix('#logo img');
        </script>
        <![endif]-->
        <?php if ($stores) { ?>
        <script type="text/javascript"><!--
            $(document).ready(function() {
                <?php foreach ($stores as $store) { ?>
                $('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
                <?php } ?>
        });
    //--></script>
        <?php } ?>
        <?php echo $google_analytics; ?>
    </head>
    <body>
        <!-- header-begin -->
        <div class="header_line">
                <div class="header_top">
                    <div class="header_top_left">
					 <div class="header_search">
                            <div id="search">
                                <div class="button-search fa-search fa"></div>
                                <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>">
                                    
                            </div>
                                            
                        </div>	
                    </div>
                    <div class="header_top_center">
                        				
                    </div>

                    <ul class="header_top_right">
                        <?php if (!$logged) { ?>
                        <li>
                            <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a> 
                        </li>
                        <li>
                            · 
                        </li>
                        <li>
                            <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a> 
                        </li>
                        <?php }  else { ?>
                        <li>
                            <a href="<?php echo $account;?>"><?php echo $name;?></a>(<a href="<?php echo $logout;?>"><?php echo $text_logged; ?></a>)
                            
                        </li>
                        <?php } ?>

                    </ul>
                </div>

            </div>
        <div class="header_outer">
            <div class="header_inner">
                <!-- head-begin -->
                <div class="header">
                    
                    <?php if ($logo) { ?>
                    <div class="header_logo">
                        <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
                    </div>
                    <?php } else { ?>
                    <div class="header_logo">
                        <a href="javascript:void(0);" title="mitadress.com"></a>
                    </div>
                    <?php } ?>
                     <!--<div class="header_search">
        
                        <div class="header_search_keyword">
                            <input type="text" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" name="search" id="header_search_keyword" title="Váy, giày, túi xách, ..." />
                        </div>
                        <div class="header_search_submit">
                            <input type="submit" value="." name="header_search_submit" class="button-search" id="header_search_submit" title="Tìm kiếm" />
                        </div>					
                    </div>-->
        
                    <div class="header_fanpage">
                        
                        <ul>
                            <li>
                                Fanpage:
                            </li>
                            <li>
                                <iframe src="http://www.facebook.com/plugins/like.php?href=http://thoitrangdshop.vn&amp;layout=button_count&amp;show_faces=true&amp;width=450&amp;action=like&amp;font=arial&amp;colorscheme=light&amp;height=80" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:85px; height:25px; overflow:hidden;" allowTransparency="true"></iframe>
                            </li>
                        </ul> 	
                    </div>
                   
                </div>
                <!-- head-end -->
    
                <!-- menu-main-begin -->
                <div class="menu_main">
                    <script type="text/javascript">
        $(document).ready(function () {
        
        $('.menu_main').scrollToFixed({
        marginTop: 0,
        minWidth: 1000,
        zIndex: 999,
        fixed: function () { }
});

});
 </script>
                   
                    <ul class="menu">
                        <li><a title="Home" href="http://mitadress.com/"> Home</a></li>
                        <?php foreach ($categories as $category) { ?>
                        <li><a  <?php if($category['href']==$url){ ?>class="active"<?php } ?> title="<?php echo $category['name']; ?>" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                        <?php } ?>
                    </ul>
                    <div class="menu_main_cart">
                        <div class="minicart">
                            <a href="<?php echo $shopping_cart;?>" id="cart">
                                <span class="fa fa-shopping-cart fa-lg"></span>
                                <span id="cart-quantity"><?php echo $total_quantity;?></span>

                            </a>
                        </div>
                       <div class="minicart">
                            <a href="<?php echo $wishlist;?>" >
                                <span class="fa fa-heart fa-lg"></span>
                                <span id="wishlist-total"><?php echo $text_wishlist;?></span>

                            </a>
                        </div>
                    <!--    <a class="checkout_button" href="<?php echo $checkout;?>"></a>-->
                        <!-- <div class="checkout-cart">
                             <a href="<?php echo $checkout;?>"></a>
                         </div>-->
                    </div>
                    
                </div>
                <!-- menu-main-end -->
                 <!-- banner-header-begin -->
                <div class="banner_header">
                </div>
                <!-- banner-header-end -->
               
            </div>
           
        </div>  
       
       
			

	
 