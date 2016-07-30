<?php
/******************************************************
 * @package	SO Theme Framework for Opencart 2.0.x
 * @author	http://www.magentech.com
 * @license	GNU General Public License
 * @copyright(C) 2008-2015 Magentech.com. All rights reserved.
*******************************************************/
global $config, $loader, $registry, $db, $session,$soconfig_general2;
$store_id = $config->get('config_store_id');
$lang = $config->get('config_language_id');
$template = $config->get('config_template');
$loader->model('custom/general');
$model = $registry->get('model_custom_general');
$layout_id = $model->getCurrentLayout();

if ($store_id == 0) {
    $soconfig_general = $config->get('soconfig_general');
	$soconfig_layout = $config->get('soconfig_layout');
    $soconfig_fonts = $config->get('soconfig_fonts');
    $soconfig_products = $config->get('soconfig_products');
    $soconfig_custom = $config->get('soconfig_custom');
    $soconfig_cssfile = $config->get('soconfig_cssfile');
    $soconfig_jsfile = $config->get('soconfig_jsfile');
    $soconfig_contentbg = $config->get('soconfig_contentbg');

} else {
    $soconfig_general = $config->get('soconfig_general_store');
	$soconfig_layout = $config->get('soconfig_layout_store');
    $soconfig_fonts = $config->get('soconfig_fonts_store');
    $soconfig_products = $config->get('soconfig_products_store');
    $soconfig_custom = $config->get('soconfig_custom_store');
    $soconfig_cssfile = $config->get('soconfig_cssfile_store');
    $soconfig_jsfile = $config->get('soconfig_jsfile_store');
	
/* GENERAL */	
	$text_general = array(
		'themelayout',
		'themecolor',
		'layouts',
		'logo_position',
		'searchbox',
		'phone_status',
		'welcome_message_status',
		'wishlist_status',
		'checkout_status',
		'lang_status',
		'socials_status',
		
		'menu_align',
		'homebutton',
		'servicesMenu',
		'menu_style',
		'brands_status',
		'brands_display_style',
		'custom_link1_right_status',
		'custom_link1_right_url',
		'custom_link1_right_target',
		'link_account_status',
		'link_contact_status',
		'custom_block1_status',
		'custom_block2_status',
		
	);
	foreach ($text_general as $text) {
		if (isset($soconfig_general[$store_id][$text])){$soconfig_general[$text] = $soconfig_general[$store_id][$text];}
	}
	
	for ($i = 1; $i <= 5; $i++){
		if (isset($soconfig_general[$store_id]["custom_link".$i."_status"])) 	{$soconfig_general["custom_link".$i."_status"] = $soconfig_general[$store_id]["custom_link".$i."_status"];}
		if (isset($soconfig_general[$store_id]["custom_link".$i."_url"])) 		{$soconfig_general["custom_link".$i."_url"] = $soconfig_general[$store_id]["custom_link".$i."_url"];}
		if (isset($soconfig_general[$store_id]["custom_link".$i."_target"])) 	{$soconfig_general["custom_link".$i."_target"] = $soconfig_general[$store_id]["custom_link".$i."_target"];}
		if (isset($soconfig_general[$lang][$store_id]["custom_link".$i."_title"])) 		{$soconfig_general[$lang]["custom_link".$i."_title"]  = $soconfig_general[$lang][$store_id]["custom_link".$i."_title"];}
	}
	if (isset($soconfig_general[$lang][$store_id]["contact_number"])) 		{$soconfig_general[$lang]["contact_number"]  = $soconfig_general[$lang][$store_id]["contact_number"];}
	if (isset($soconfig_general[$lang][$store_id]["welcome_message"])) 		{$soconfig_general[$lang]["welcome_message"]  = $soconfig_general[$lang][$store_id]["welcome_message"];}
	if (isset($soconfig_general[$lang][$store_id]["menu_categories_title"])) 	{$soconfig_general[$lang]["menu_categories_title"]  = $soconfig_general[$lang][$store_id]["menu_categories_title"];}
	if (isset($soconfig_general[$lang][$store_id]["menu_brands_title"])) 				{$soconfig_general[$lang]["menu_brands_title"]  = $soconfig_general[$lang][$store_id]["menu_brands_title"];}
	if (isset($soconfig_general[$lang][$store_id]["custom_link1_right_title"])) 		{$soconfig_general[$lang]["custom_link1_right_title"]  = $soconfig_general[$lang][$store_id]["custom_link1_right_title"];}
	if (isset($soconfig_general[$lang][$store_id]["custom_block1_title"])) 				{$soconfig_general[$lang]["custom_block1_title"]  = $soconfig_general[$lang][$store_id]["custom_block1_title"];}
	if (isset($soconfig_general[$lang][$store_id]["custom_block1_content"])) 			{$soconfig_general[$lang]["custom_block1_content"]  = $soconfig_general[$lang][$store_id]["custom_block1_content"];}
	if (isset($soconfig_general[$lang][$store_id]["custom_block2_title"])) 				{$soconfig_general[$lang]["custom_block2_title"]  = $soconfig_general[$lang][$store_id]["custom_block2_title"];}
	if (isset($soconfig_general[$lang][$store_id]["custom_block2_content"])) 			{$soconfig_general[$lang]["custom_block2_content"]  = $soconfig_general[$lang][$store_id]["custom_block2_content"];}
	
/* LAYOUT */
	$text_layout = array(
		'layoutstyle',
		'general_bgcolor',
		'pattern',
		'soconfig_contentbg',
		'content_bg_mode',
		'content_attachment',
	);
	foreach ($text_layout as $text) {
		if (isset($soconfig_layout[$store_id][$text])) 		{$soconfig_layout[$text] = $soconfig_layout[$store_id][$text];}
	}
	$soconfig_contentbg = $soconfig_layout['soconfig_contentbg'];
	
/* FONTS */
	$text_fonts = array(
		'body_status',
		'normal_body',
		'url_body',
		'family_body',
		'selector_body',
		'menu_status',
		'normal_menu',
		'url_menu',
		'family_menu',
		'selector_menu',
		'heading_status',
		'normal_heading',
		'url_heading',
		'family_heading',
		'selector_heading',
	);
	foreach ($text_fonts as $text) {
		if (isset($soconfig_fonts[$store_id][$text])) 		{$soconfig_fonts[$text] = $soconfig_fonts[$store_id][$text];}
	}
}

/*Variables*/
$responsive = $soconfig_general['layouts'] ;
$header_type = $soconfig_general['logo_position'];

if (isset($soconfig_general['menu_type'])) $menu_type = $soconfig_general['menu_type'];
else $menu_type = 1;

?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>">
<!--<![endif]-->
<head>


<title><?php echo $title; ?></title>
<meta charset="UTF-8" />
<base href="<?php echo $base; ?>" />
<meta name="format-detection" content="telephone=no" />
<?php if($responsive){?><meta name="viewport" content="width=device-width, initial-scale=1"> <?php }?>
<?php if ($description) { ?><meta name="description" content="<?php echo $description; ?>" /><?php } ?>
<?php if ($keywords) { ?><meta name="keywords" content="<?php echo $keywords; ?>" /><?php } ?>

<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->

<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

<?php // Begin General CSS ----- ?>
	<?php if($direction=='ltr'):?> <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet"/> <?php endif;?>
	<?php if($direction=='rtl'):?> <link href="catalog/view/theme/<?php echo $template;?>/css/bootstrap/bootstrap.rtl.min.css" rel="stylesheet" /> <?php endif;?>
	<?php if(!$responsive): ?><link href="catalog/view/theme/<?php echo $template;?>/css/bootstrap/bootstrap.none.css" rel="stylesheet"  media="screen"/><?php endif; ?>

	<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
	<link href="catalog/view/theme/<?php echo $template ?>/css/lib.css" rel="stylesheet">
	<?php if (isset($soconfig_general["themecolor"]) && $soconfig_general["themecolor"] =='default'):?>
		<link id="color_scheme" href="catalog/view/theme/<?php echo $template ?>/css/theme-default.css" rel="stylesheet">
	<?php else : ?>
		<link id="color_scheme" href="catalog/view/theme/<?php echo $template ?>/css/theme-<?php echo $soconfig_general["themecolor"]?>.css" rel="stylesheet">
	<?php endif;?>
		
	<?php foreach ($styles as $style) { ?>
		<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>
	
	<?php if(isset($soconfig_custom["cssfile_status"]) && $soconfig_custom["cssfile_status"] == 1 ):
	foreach ($soconfig_cssfile as $file_css) { ?>
		<link href="<?php echo $file_css?>" rel="stylesheet" />
	<?php } endif; ?>
	
    <?php if($direction=='rtl'):?> <link href="catalog/view/theme/<?php echo $template;?>/css/rtl.css"  rel="stylesheet"  media="screen"/><?php endif;?>
    <?php if($responsive):?> 
		<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $template;?>/css/responsive.css" media="screen"/>
	<?php endif;?>
    
	<!--[if gt IE 9]><!-->
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $template;?>/css/ie9-and-up.css" />
	<!--<![endif]-->
<?php // End General CSS ----- ?>

<?php 
	// Begin Google Fonts 
	if(isset($soconfig_fonts)):
	foreach ($soconfig_fonts as $font => $selector_fonts) { 
		if(strpos($font,'selector')!==false){
		$font_array = explode("selector_",$font)[1];
?>
	
		<?php if (isset($soconfig_fonts[$font_array."_status"]) && $soconfig_fonts[$font_array."_status"] == 'google') : ?>
			<link href='<?php echo $soconfig_fonts["url_".$font_array] ?>' rel='stylesheet' type='text/css'>
		<?php endif; ?>
		
		<?php if (!empty($selector_fonts)) :?>
		<style type="text/css">
			<?php 
			if ($soconfig_fonts[$font_array."_status"] =='google') echo $soconfig_fonts["selector_".$font_array].'{font-family:'. $soconfig_fonts["family_".$font_array].'}';
			else echo $selector_fonts.'{font-family:'. $soconfig_fonts["normal_".$font_array].'}';
			?>
		</style>
<?php 	endif;
		}
	}
	endif;
	// End Google Fonts 
?>

<?php // Begin Themes Scripts ----?>
	<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="catalog/view/javascript/jquery/accordion.js"></script>
	<script type="text/javascript" src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="catalog/view/theme/<?php echo $config->get('config_template'); ?>/js/libs.js"></script>
	<script type="text/javascript" src="catalog/view/theme/<?php echo $config->get('config_template'); ?>/js/jquery.jcarousellite.js"></script>
	
	<script type="text/javascript" src="catalog/view/javascript/jquery/countdown/jquery.countdown.js"></script>
	<script type="text/javascript" src="catalog/view/theme/<?php echo $config->get('config_template'); ?>/js/common.js"></script>
	<script type="text/javascript" src="catalog/view/theme/<?php echo $config->get('config_template'); ?>/js/so.custom.js"></script>
	
	<?php if (!isset($soconfig_general["scroll_animation"]) || $soconfig_general["scroll_animation"] != 0) { ?>
	<script type="text/javascript" src="catalog/view/theme/<?php echo $config->get('config_template'); ?>/js/scrollreveal.min.js"></script>
	<script type="text/javascript" src="catalog/view/theme/<?php echo $config->get('config_template'); ?>/js/jquery.unveil.js"></script>
	<?php } ?>
	
	<?php if(!defined('OWL_CAROUSEL')){ ?>
	<link href="catalog/view/theme/<?php echo $template ?>/css/owl.carousel.css" rel="stylesheet">
    <script type="text/javascript" src="catalog/view/theme/<?php echo $config->get('config_template'); ?>/js/owl.carousel.js"></script>
	<?php define('OWL_CAROUSEL', 1);} ?>
	
	<?php foreach ($scripts as $script) { ?>
		<script type="text/javascript" src="<?php echo $script; ?>"></script>
	<?php } ?>
	
	<?php if(isset($soconfig_custom["jsfile_status"]) && $soconfig_custom["jsfile_status"]):
	foreach ($soconfig_jsfile as $file_js) { ?>
		<script  type="text/javascript" src="<?php echo $file_js?>"></script>
	<?php } endif;?>
<?php // End Themes Scripts ----?>

<?php // Begin Custom Code ----?>
<?php if(isset($soconfig_custom["cssinput_status"]) && $soconfig_custom["cssinput_status"]){?><style type="text/css"><?php echo $soconfig_custom["custom_css"];?></style><?php } ?>
<?php if(isset($soconfig_custom["jsinput_status"]) && $soconfig_custom["jsinput_status"]){?><script type="text/javascript"><?php echo $soconfig_custom["custom_js"];?></script><?php } ?>
<?php ?>
	<style type="text/css">
	body {
			background-color:<?php echo (!empty($soconfig_layout["general_bgcolor"]) ? $soconfig_layout["general_bgcolor"] : 'inherit'); ?>;
		<?php if (isset($soconfig_contentbg) && $soconfig_contentbg != '') : ?>
            background-image: url("image/<?php echo $soconfig_contentbg; ?>");
            background-repeat:<?php echo (!empty($soconfig_layout["content_bg_mode"]) ? $soconfig_layout["content_bg_mode"] : ''); ?>;
            background-attachment:<?php echo (!empty($soconfig_layout["content_attachment"]) ? $soconfig_layout["content_attachment"] : ''); ?>;
			background-position:top center; 
		<?php endif?>
	}
	</style>
<?php // End Custom Code ----- ?>


</head>

<?php
	//Render a class Body
	$cls_body  =  $class .' ';
	$cls_body .=  $direction.' ' ;
	$cls_body .= (($responsive) ? 'res'.'':'no-res').' ';
	$cls_body .='layout-'.(isset($layout_id) ? $layout_id : 'maintenance').' ';
	if( $soconfig_layout["layoutstyle"] !='full' && $soconfig_contentbg=='' && $soconfig_layout["pattern"] !='none' ){
	$cls_body .='pattern-'. $soconfig_layout["pattern"];
	}else{ $cls_body .='no-bgbody';}
	
	$cls_wrapper = 'wrapper-'.$soconfig_layout["layoutstyle"];
?>
<body class="<?php echo $cls_body; ?> ">
<div id="wrapper" class="<?php echo $cls_wrapper; ?>">
          
	<header id="header" class=" variant<?php echo $header_type; ?>">
	   
		<!-- Header Top -->
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="header-top-left form-inline col-lg-4 col-md-5 hidden-sm hidden-xs ">
						
						
						
						
						<?php if($soconfig_general["welcome_message_status"]):?>
						<div class="form-group navbar-welcome hidden-xs">
							<?php
								if (isset($soconfig_general[$lang]["welcome_message"]) && is_string($soconfig_general[$lang]["welcome_message"])) {
								echo html_entity_decode($soconfig_general[$lang]["welcome_message"], ENT_QUOTES, 'UTF-8');
								} else {echo 'Default welcome msg!';}
							?>
						</div>
						<?php endif; ?>
						
						 
					</div>
					<div class="header-top-right collapsed-block col-lg-8 col-md-7 col-xs-12 ">
						<h5 class="tabBlockTitle visible-sm visible-xs"><?php echo $text_more; ?><a class="expander " href="#TabBlock-1"><i class="fa fa-angle-down"></i></a></h5>
						<div  class="tabBlock" id="TabBlock-1">
						<?php if (!isset($soconfig_general["header_account"]) || $soconfig_general["header_account"] ) : ?>
						   
						<?php endif; ?>
						<ul class="top-link list-inline">
							<li class="account" id="my_account"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="btn btn-xs dropdown-toggle" data-toggle="dropdown"> <span><?php echo $text_account; ?></span> <span class="fa fa-angle-down"></span></a>
								<ul class="dropdown-menu ">
									<?php if ($logged) { ?>
									<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
									<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
									<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
									<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
									<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
									<?php if($soconfig_general["checkout_status"]):?><li><a href="<?php echo $checkout; ?>"  title="<?php echo $text_checkout; ?>"><span><?php echo $text_checkout; ?></span></a></li><?php endif; ?>
									<?php } else { ?>
									<li><a href="<?php echo $register; ?>"><i class="fa fa-user"></i> <?php echo $text_register; ?></a></li>
									<li><a href="<?php echo $login; ?>"><i class="fa fa-pencil-square-o"></i> <?php echo $text_login; ?></a></li>
									<?php } ?>
								</ul>
							</li>
							<?php if($soconfig_general["wishlist_status"]):?><li class="wishlist"><a href="<?php echo $wishlist; ?>" id="wishlist-total" class="top-link-wishlist" title="<?php echo $text_wishlist; ?>"><span><?php echo $text_wishlist; ?></span></a></li><?php endif; ?>
							
							<!-- <li class="login"><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li> -->
							
						</ul>
						<?php if($soconfig_general["lang_status"]):?>
							<?php echo $currency; ?>
							<?php echo $language; ?>							
						<?php endif; ?>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<!-- container for top line of header -->
		
		<div class="header-center <?php echo $header_type;?>">
			<div class="container">
				<div class="row">
				    <!--header variant center-->
			   <?php if ($header_type == 'center') { ?>
						<div class="block-cart ">
								<div class="shopping_cart pull-right">
								 <!--cart desktop-->
								 <?php
									if (!isset($soconfig_products['product_catalog_mode']) || $soconfig_products['product_catalog_mode'] != 1) :
									 echo $cart;
									endif;
								 ?>
								 <!--//cart-->
								</div>
						</div>
						
					<div class="navbar-logo col-sm-4 col-xs-12 text-center">
						<?php if ($logo) { ?>
						<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } else { ?>
						<h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
						<?php } ?>
					</div>
			   <!--end header variant center-->

				    <?php } else { ?>
				    <!-- Logo -->
				    <div class="navbar-logo col-md-3 col-sm-3 col-xs-12">
					   <?php if ($logo) { ?>
					   <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
					   <?php } else { ?>
					   <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
					   <?php } ?>
				    </div>
						 <!-- //end Logo -->
						  
						 <!-- Secondary menu -->
				    <div class="header-center-right col-md-9 col-sm-9 col-xs-12">
										
					<?php
					    if($soconfig_general['phone_status']){
						    if (isset($soconfig_general[$lang]["contact_number"]) && is_string($soconfig_general[$lang]["contact_number"])) {
						     echo '<div class="phone-contact hidden-xs"><div class="inner-info"><h2>Hotline:</h2><p>'.html_entity_decode($soconfig_general[$lang]["contact_number"], ENT_QUOTES, 'UTF-8').'</p></div></div>';
						    } 
					    }
					?>
				    <div class="block-cart">
								<div class="shopping_cart pull-right">
								 <!--cart desktop-->
								 <?php
									if (!isset($soconfig_products['product_catalog_mode']) || $soconfig_products['product_catalog_mode'] != 1) :
									 echo $cart;
									endif;
								 ?>
								 <!--//cart-->
								</div>
						</div>
						 <!-- //end Search -->
				    
				    </div>
							
						
				     <?php }  ?>
	 
				   
				    
				</div>
				
			  
			</div>
		</div>
		<!-- end container for top line of header -->
		
		<!-- Header Bottom -->
		<div class="header-bottom">
			<div class="container">
				<div class="row">
						<div class="header-bottom-inner">
								<!-- Main menu -->
						<div class="header-bottom-menu col-md-8 col-sm-6 col-xs-2">
								 <?php if (trim($content_menu)) :
										echo $content_menu;
								endif; ?>
								<!-- //end Navbar -->
						</div>
						<!-- Search -->
							<?php if ($soconfig_general['searchbox'])?>
							<div class="col-md-4 col-sm-6 col-xs-10 header_search">
							<?php  echo $content_search; ?>
							</div>
						</div>			
				</div>
			</div>
		  
		</div>

	</header>
		