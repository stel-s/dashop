<?php 
	global $config;
	$soconfig_general = $config->get('soconfig_general');
	if (isset($soconfig_general['logo_position'])) $header_type = $soconfig_general['logo_position'];
	$col_search = ($header_type =='center') ? 'col-md-3 col-sm-3' : 'col-md-12 col-sm-12 col-xs-12';
	
?>
<div class="navbar-search <?php echo $col_search?>">
    <div id="search" class="form-group">
        <input onclick="this.value = '';" name="search" type="text" class="form-control" placeholder="Enter Your Keyword" />
        <button type="submit" class="button-search btn btn-default"><span class="fa fa-search"></span></button>
    </div>
</div>