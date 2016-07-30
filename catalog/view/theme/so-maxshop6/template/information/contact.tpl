<?php echo $header; ?>
<div class="container contacts">
<div class="main">
    <div class="breadcrumbs">
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><span></span></li>
        <?php } ?>
      </ul>
    </div>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6 col-xs-12'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9 col-xs-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="page-title"><h1><?php echo $heading_title; ?></h1></div>
      <h3><?php echo $text_location; ?></h3>

            <?php if ($image) { ?>
            <div class="col-sm-6"><img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>" /></div>
            <?php } ?>
				<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
               <?php if ($geocode) { ?>
				<script>
                    function initialize() {
                          var myLatlng = new google.maps.LatLng(<?php echo $geocode;?>);
                          var mapOptions = {
                            zoom: 16,
							 zoomControl: false,
							scaleControl: false,
							scrollwheel: false,
							disableDoubleClickZoom: true,
                            center: myLatlng
                          }
                          var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
                        
                          var marker = new google.maps.Marker({
                              position: myLatlng,
                              map: map,
                              title: 'Market store!'
                          });
                        }
                        
                        google.maps.event.addDomListener(window, 'load', initialize);
                    
                </script>
                <div id="map-canvas"></div>
              
              <?php } ?>

      <?php if ($locations) { ?>
      <h3><?php echo $text_store; ?></h3>
      <div class="panel-group" id="accordion">
        <?php foreach ($locations as $location) { ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
            <div class="panel-body">
              <div class="row">
              <div class="col-sm-12">
                <?php if ($location['comment']) { ?>
                  <p><strong><?php echo $text_comment; ?></strong>
                  <?php echo $location['comment']; ?></p>
                  <?php } ?>
                </div>
                <?php if ($location['image']) { ?>
                <div class="col-sm-6"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <div class="col-sm-6 info-store"><p><strong><?php echo $location['name']; ?></strong></p>
                  <address>
                  <p><i class="fa fa-home"></i><?php echo $location['address']; ?></p>
                  <p><i class="fa fa-phone"></i><?php echo $location['telephone']; ?></p>
                  <?php if ($location['fax']) { ?>
                  <p><i class="fa fa-fax"></i><?php echo $location['fax']; ?></p>
                  <?php } ?>
                  <?php if ($location['open']) { ?>
                  <p><strong><?php echo $text_open; ?></strong>
                  <?php echo $location['open']; ?></p>
                  <?php } ?>
                  
                  </address>
                </div>
                
                
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
     
      <div class="info-contact">
        <div class="col-lg-4 col-sm-4 col-xs-12 info-store">
          <div class="row">
           <div class="name-store"><h3><?php echo $store; ?></h3></div>
            <address>
            <div class="address clearfix form-group"><div class="icon"><i class="fa fa-home"></i></div><div class="text"><?php echo $address; ?></div></div>
            <div class="phone form-group"><div class="icon"><i class="fa fa-phone"></i></div><div class="text"><?php echo $telephone; ?></div></div>
            <?php if ($fax) { ?>
            <div class="fax"><div class="icon"><i class="fa fa-fax"></i></div><div class="text"><?php echo $fax; ?></div></div>
            <?php } ?>
            <?php if ($open) { ?>
            <div><strong><?php echo $text_open; ?></strong>
            <?php echo $open; ?></div>
            <?php } ?>
            <?php if ($comment) { ?>
              <div class="comment"><?php //echo $text_comment; ?>
              <?php echo $comment; ?></div>
              
              <?php } ?>
            
            </address>
          </div>
        </div>
        <div class="col-lg-8 col-sm-8 col-xs-12 contact-form">
           <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
            <fieldset>
              <legend><?php echo $text_contact; ?></h2></legend>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
                  <?php if ($error_name) { ?>
                  <div class="text-danger"><?php echo $error_name; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                  <?php if ($error_email) { ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
                <div class="col-sm-10">
                  <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
                  <?php if ($error_enquiry) { ?>
                  <div class="text-danger"><?php echo $error_enquiry; ?></div>
                  <?php } ?>
                </div>
              </div>
              <?php echo $captcha; ?>
            </fieldset>
            <div class="buttons">
              <div class="pull-right">
                <button class="button-acc" type="submit"><span><?php echo $button_submit; ?></span></button>
              </div>
            </div>
          </form>
        </div>
     
      </div>
</div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
