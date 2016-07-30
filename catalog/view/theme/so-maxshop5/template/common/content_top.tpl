<?php
    global $config;
    $store_id = $config->get('config_store_id');
    $lang = $config->get('config_language_id');

    if ($modules) : foreach ($modules as $module) : echo $module; endforeach; endif;
?>