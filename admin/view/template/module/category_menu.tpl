<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-banner" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
		  
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_max_cat; ?></label>
            <div class="col-sm-10">
              <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_max_cat; ?>" id="input-name" class="form-control" />
             
            </div>
          </div>
		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner"><?php echo $entry_levels; ?></label>
            <div class="col-sm-10">
				<select name="level">
                  <?php if ($level == '1') { ?>
                  <option value="1" selected="selected"><?php echo $entry_category; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $entry_category; ?></option>
                  <?php } ?>
                  <?php if ($level == '2') { ?>
                  <option value="2" selected="selected"><?php echo $entry_child; ?></option>
                  <?php } else { ?>
                  <option value="2"><?php echo $entry_child; ?></option>
                  <?php } ?>
                  <?php if ($level == '3') { ?>
                  <option value="3" selected="selected"><?php echo $entry_subchild; ?></option>
                  <?php } else { ?>
                  <option value="3"><?php echo $entry_subchild; ?></option>
                  <?php } ?>
                </select>
				<select name="style">
                  <?php if ($style == '1') { ?>
                  <option value="1" selected="selected"><?php echo $entry_horisontal; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $entry_horisontal; ?></option>
                  <?php } ?>
                  <?php if ($style == '2') { ?>
                  <option value="2" selected="selected"><?php echo $entry_vertical; ?></option>
                  <?php } else { ?>
                  <option value="2"><?php echo $entry_vertical; ?></option>
                  <?php } ?>
                </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_count; ?></label>
            <div class="col-sm-10">

              	<table>
              		<tr>
              			<td><?php echo $entry_category; ?></td>
              			<td>
			              	<select name="category_count">
			                  <?php if ($category_count) { ?>
			                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
			                  <option value="0"><?php echo $text_disabled; ?></option>
			                  <?php } else { ?>
			                  <option value="1"><?php echo $text_enabled; ?></option>
			                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
			                  <?php } ?>
			                </select>
              			</td>
              		</tr>
              		<tr>
              			<td><?php echo $entry_child; ?></td>
              			<td>
			              	<select name="child_count">
			                  <?php if ($child_count) { ?>
			                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
			                  <option value="0"><?php echo $text_disabled; ?></option>
			                  <?php } else { ?>
			                  <option value="1"><?php echo $text_enabled; ?></option>
			                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
			                  <?php } ?>
			                </select>
              			</td>
              		</tr>
              		<tr>
              			<td><?php echo $entry_subchild; ?></td>
              			<td>
			              	<select name="subchild_count">
			                  <?php if ($subchild_count) { ?>
			                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
			                  <option value="0"><?php echo $text_disabled; ?></option>
			                  <?php } else { ?>
			                  <option value="1"><?php echo $text_enabled; ?></option>
			                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
			                  <?php } ?>
			                </select>
              			</td>
              		</tr>
              	</table>

            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_images; ?></label>
            <div class="col-sm-10">


              	<table>
              		<tr>
              			<td><?php echo $entry_category; ?></td>
              			<td>
			              	<select name="category_images[status]">
			                  <?php if ($category_images['status']) { ?>
			                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
			                  <option value="0"><?php echo $text_disabled; ?></option>
			                  <?php } else { ?>
			                  <option value="1"><?php echo $text_enabled; ?></option>
			                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
			                  <?php } ?>
			                </select>
			            </td>
			            <td>
			                <input type="text" name="category_images[width]" value="<?php echo $category_images['width']; ?>" size="3" />px X
			                <input type="text" name="category_images[height]" value="<?php echo $category_images['height']; ?>" size="3" />px
              			</td>
              		</tr>
              		<tr>
              			<td><?php echo $entry_child; ?></td>
              			<td>
			              	<select name="child_images[status]">
			                  <?php if ($child_images['status']) { ?>
			                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
			                  <option value="0"><?php echo $text_disabled; ?></option>
			                  <?php } else { ?>
			                  <option value="1"><?php echo $text_enabled; ?></option>
			                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
			                  <?php } ?>
			                </select>
			            </td>
			            <td>
   			                <input type="text" name="child_images[width]" value="<?php echo $child_images['width']; ?>" size="3" />px X
			                <input type="text" name="child_images[height]" value="<?php echo $child_images['height']; ?>" size="3" />px
              			</td>
              		</tr>
              		<tr>
              			<td><?php echo $entry_subchild; ?></td>
              			<td>
			              	<select name="subchild_images[status]">
			                  <?php if ($subchild_images['status']) { ?>
			                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
			                  <option value="0"><?php echo $text_disabled; ?></option>
			                  <?php } else { ?>
			                  <option value="1"><?php echo $text_enabled; ?></option>
			                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
			                  <?php } ?>
			                </select>
			       		</td>
			       		<td>
			                <input type="text" name="subchild_images[width]" value="<?php echo $subchild_images['width']; ?>" size="3" />px X
			                <input type="text" name="subchild_images[height]" value="<?php echo $subchild_images['height']; ?>" size="3" />px
              			</td>
              		</tr>
              	</table>


            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div>
    </div>
	<div style="margin-top:25px;border-top:1px dashed #ccc;padding-top:15px;text-align:center;"><? echo $text_help; ?></div>
  </div>
</div>
<?php echo $footer; ?>