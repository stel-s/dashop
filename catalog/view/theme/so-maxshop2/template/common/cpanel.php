<?php 
global $config;
$store_id = $config->get('config_store_id');
$template = $config->get('config_template');

if ($store_id == 0) {
    $soconfig_general = $config->get('soconfig_general');
    $soconfig_layout = $config->get('soconfig_layout');
} else {
	$soconfig_general = $config->get('soconfig_general_store');
    $soconfig_layout = $config->get('soconfig_layout_store');
	if (isset($soconfig_general[$store_id]['themecolor']))  {$soconfig_general['themecolor'] = $soconfig_general[$store_id]['themecolor'];}
	if (isset($soconfig_layout[$store_id]['layoutstyle'])) 	{$soconfig_layout['layoutstyle'] = $soconfig_layout[$store_id]['layoutstyle'];}
	if (isset($soconfig_layout[$store_id]['pattern'])) 	 	{$soconfig_layout['pattern'] = $soconfig_layout[$store_id]['pattern'];}
}

?>
<div id="sp-cpanel_btn" class="isDown visible-lg">
	<i class="fa fa-cog"></i>
</div>		

<div id="sp-cpanel" class="sp-delay">
	<h2 class="sp-cpanel-title"> Demo Options <span class="sp-cpanel-close"> <i class="fa fa-times"> </i></span></h2>
	<div id="sp-cpanel_settings">
		<div class="panel-group">
			<label>Color Scheme</label>
			<div class="group-schemes" >
				<span data-scheme="red"  class="item_scheme <?php echo (isset($soconfig_general["themecolor"]) && $soconfig_general["themecolor"]=="red") ? 'selected' : ''?>"><span style="background: #ea3a3c;"></span></span>
				<span data-scheme="blue" class="item_scheme <?php echo (isset($soconfig_general["themecolor"]) && $soconfig_general["themecolor"]=="blue") ? 'selected' : ''?>"><span style="background: #5f87d1;"></span></span>
				<span data-scheme="green" class="item_scheme <?php echo (isset($soconfig_general["themecolor"]) && $soconfig_general["themecolor"]=="green") ? 'selected' : ''?>"><span style="background: #20bc5a;"></span></span>
				<span data-scheme="orange" class="item_scheme <?php echo (isset($soconfig_general["themecolor"]) && $soconfig_general["themecolor"]=="orange") ? 'selected' : ''?>"><span style="background: #f8ab16;"></span></span>
				<span data-scheme="cyan" class="item_scheme <?php echo (isset($soconfig_general["themecolor"]) && $soconfig_general["themecolor"]=="cyan") ? 'selected' : ''?>"><span style="background: #009688;"></span></span>
			 </div>
		</div>
		
		<div class="panel-group ">
			<label>Layout Box</label>
			<div class="group-boxed">
				<select id="cp-layoutbox" name="cplayoutbox" class="form-control" onchange="changeLayoutBox(this.value);">
					<option <?php echo (isset($soconfig_layout["layoutstyle"]) && $soconfig_layout["layoutstyle"]=="full") ? 'selected' : ''?>  value="full">Wide</option>
					<option <?php echo (isset($soconfig_layout["layoutstyle"]) && $soconfig_layout["layoutstyle"]=="boxed") ? 'selected' : ''?> value="boxed">Boxed</option>
					<option <?php echo (isset($soconfig_layout["layoutstyle"]) && $soconfig_layout["layoutstyle"]=="iframed") ? 'selected' : ''?> value="iframed">Iframed</option>
					<option <?php echo (isset($soconfig_layout["layoutstyle"]) && $soconfig_layout["layoutstyle"]=="rounded") ? 'selected' : ''?> value="rounded">Rounded</option>
				</select>
			</div>
		</div>
		
        <div class="panel-group">
			<label>Body Image</label>
			
			<div class="group-pattern">
				<?php for ($i = 28; $i <= 45; $i++) { ?>
				<div data-pattern="<?php echo $i?>"  class="img-pattern <?php echo (isset($soconfig_general["pattern"]) &&  $soconfig_general["pattern"]== $i) ? 'selected' : ''?>"><img src="catalog/view/theme/<?php echo $template?>/images/patterns/<?php echo $i?>.png" alt="pattern <?php echo $i?>"></div>
				<?php } ?>
			</div>
			<p class="label-sm">Background only applies for Boxed,Framed, Rounded Layout</p>
		</div>
		
		<div class="reset-group">
		    <a href="index.php" class="btn btn-success " onclick="ResetAll()">Reset</a>
		</div>
		
	</div>

</div>
<script type="text/javascript"><!--
var themes = '<?php echo $template;?>';
var selected = '<?php echo $soconfig_general["themecolor"];?>';
//--></script>

<link rel='stylesheet' property='stylesheet'  href='catalog/view/theme/<?php echo $template ?>/css/cpanel.css' type='text/css' media='all' />
<script type="text/javascript" src="catalog/view/theme/<?php echo $template ?>/js/cpanel.js"></script>