<div class="module block_filter">
    <h3 class="modtitle"><?php echo $heading_title; ?></h3>
	<div class="modcontent list-group simple-list">
    <?php foreach ($filter_groups as $filter_group) : ?>
      <div class="title-filter"><?php echo $filter_group['name']; ?></div>


        <div class="simple-list">
          <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
            <?php foreach ($filter_group['filter'] as $filter) : ?>
                <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
                    <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
                  <?php echo $filter['name']; ?></label>
                <?php } else { ?>
                    <label class="checkbox">
                  <input name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>" />
                  <?php echo $filter['name']; ?></label>
                <?php } ?>
              <?php endforeach; ?>
          </div>
        </div>
        <?php endforeach; ?>
      </div>

    <button id="button-filter" class="btn btn-mega" type="button"><?php echo $button_filter; ?></button>
</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	filter = [];
	
	$('input[name^=\'filter\']:checked').each(function(element) {
		filter.push(this.value);
	});
	
	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script> 
