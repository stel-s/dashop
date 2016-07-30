<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    <div class="page-login">
	<div class="account-border">
      <div class="row">
        <div class="col-sm-6 new-customer">
          <div class="well">
            <h2><?php echo $text_new_customer; ?></h2>
            <p style="display:none;"><strong><?php echo $text_register; ?></strong></p>
            <p><?php echo $text_register_account; ?></p>
            
        </div>
        <div class="bottom-form">
            <a href="<?php echo $register; ?>" class="btn btn-primary creat-acc"><?php echo $button_continue; ?></a></div>
        </div>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="col-sm-6 customer-login">
          <div class="well">
            <h2><?php echo $text_returning_customer; ?></h2>
            <p><strong><?php echo $text_i_am_returning_customer; ?></strong></p>
            
              <div class="form-group">
                <label class="control-label col-lg-12 col-md-12 col-xs-12 col-sm-12" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="col-lg-6 col-md-6 col-xs-11 col-sm-11 form-control" />
              </div>
              <div class="form-group">
                <label class="control-label col-lg-12 col-md-12 col-xs-12 col-sm-12" for="input-password"><?php echo $entry_password; ?></label>
                <input type="password" name="password" value="<?php echo $password; ?>"  id="input-password" class="col-lg-6 col-md-6 col-xs-11 col-sm-11 form-control" />
                </div>
                
              <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            
          </div>
          <div class="bottom-form">
                <a href="<?php echo $forgotten; ?>" class="forgot"><?php echo $text_forgotten; ?></a>
              <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
              </div>
        </div>
        </form>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
	</div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>