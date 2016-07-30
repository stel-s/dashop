<div id="content">
<div class="breadcrumb">
<?php foreach ($breadcrumbs as $breadcrumb) { ?>
<?php echo $breadcrumb['separator']; ?>
<a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
<?php } ?>
 
</div>
<?php if ($success) { ?>
 <div class="success"><?php echo $success; ?></div>
 <?php } ?>
 
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
 
<div class="box">
<div class="heading">
<h1>
<img src="view/image/product.png" alt="" />
 <?php echo $heading_title; ?>
</h1>
 
<div class="buttons">
<a onclick="$('#form').submit();" class="button">Import</a>
<a onclick="location = '<?php echo $cancel; ?>';" class="button">Cancel</a></div>
</div>
<div class="content">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
<table class="form">
<tr>
<td><span class="required">*</span> CSV</td>
<td><input type="file" name="csv" value="" />
<?php if ($error_csv) { ?>
<span class="error"><?php echo $error_csv; ?></span>
<?php } ?>
</td>
</tr>
</table>
</form>
</div>
</div>