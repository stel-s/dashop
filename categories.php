<?php
$xml=simplexml_load_file("./categories.xml") or die("Error: Cannot create object");
$connect = mysql_connect('localhost','root','');

if (!$connect) { echo 'Server error. Please try again sometime. CON'; }
mysql_query("SET NAMES 'utf8'");
mysql_query("SET CHARACTER SET 'utf8'");
if (!$connect)
{
   die('Could not <span id="IL_AD1" class="IL_AD">
    connect to</span> MySQL: ' . mysql_error());
}

$cid =mysql_select_db('mydb',$connect); //specify db name

$blocks  = $xml->xpath('//category'); //gets all <block/> tags
$i = 0;
function throw_ex($er){  
  throw new Exception($er);  
} 
//print_r($blocks[0]->category_id);
foreach($blocks as $block){
 $categoryId = $blocks[$i]->category_id;
 $categoryParentId = $blocks[$i]->parent_id;
 $categoryTitle =$blocks[$i]->title;
$data = array();
$data['parent_id'] = $categoryParentId ;
$data['column'] = 3;
$data['status'] = 1;
$data['sort_order'] =1;
$language_id = 4;
//  $query = "INSERT INTO oc_category_description(category_id,language_id, title)
//      VALUES('".$categoryId."','1','".$categoryTitle."')";

$query = "INSERT INTO oc_category SET category_id ='" . (int)$categoryId . "', parent_id = '" . (int)$data['parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW(), date_added = NOW()";
$query2 = "INSERT INTO oc_category_description SET category_id = '" . (int)$categoryId . "', language_id = '" . (int)$language_id . "', name = '" .$categoryTitle . "', description = '" . $categoryTitle . "', meta_title = '" . $categoryTitle . "', meta_description = '" . $categoryTitle. "', meta_keyword = '" .$categoryTitle. "'";
 $query3 = "INSERT INTO oc_category_to_store(category_id,store_id)
     VALUES('".$categoryId."','0')";
	

// $query = "INSERT INTO csvdata(category_id,language_id, name,)
//     VALUES('".$categoryId."','1','".$categoryParentId."','".$categoryTitle."')";
 
 
try {  
mysql_query("SET NAMES 'utf8'");
 mysql_query($query) or throw_ex(mysql_error());  
mysql_query($query2) or throw_ex(mysql_error());  
 mysql_query($query3) or throw_ex(mysql_error());  
}  
catch(exception $e) {
  echo "ex: ".$e; 
}
   

   $i++;
}
mysql_close($connect); // closing connection

$blocks2 = $xml->xpath('//layout/block'); //gets all <block/> which parent are   <layout/>  t
