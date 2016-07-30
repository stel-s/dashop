<?php
$xml=simplexml_load_file("./category216.xml") or die("Error: Cannot create object");
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

$blocks  = $xml->xpath('//product'); //gets all <block/> tags
$i = 0;
function throw_ex($er){  
  throw new Exception($er);  
} 
$DB_PREFIX ='oc_';
foreach($blocks as $block){
 $productId = $blocks[$i]->product_id;
 $categoryId = $blocks[$i]->category_id;
 $description =$blocks[$i]->title;
 $quantity =$blocks[$i]->posotita;
 $image = $blocks[$i]->image;
$data['price'] = $blocks[$i]->price;
 $data['image'] =$image;
$data['model'] = $productId;
$data['name'] = $description;
$data['description'] = $description;
$language_id = 4;
// $data = array();
// $data['parent_id'] = $categoryParentId ;
// $data['column'] = 3;
// $data['status'] = 1;
// $data['sort_order'] =1;
// $language_id = 4;
// //  $query = "INSERT INTO oc_category_description(category_id,language_id, title)
// //      VALUES('".$categoryId."','1','".$categoryTitle."')";

// $query = "INSERT INTO oc_category SET category_id ='" . (int)$categoryId . "', parent_id = '" . (int)$data['parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW(), date_added = NOW()";
// $query2 = "INSERT INTO oc_category_description SET category_id = '" . (int)$categoryId . "', language_id = '" . (int)$language_id . "', name = '" .$categoryTitle . "', description = '" . $categoryTitle . "', meta_title = '" . $categoryTitle . "', meta_description = '" . $categoryTitle. "', meta_keyword = '" .$categoryTitle. "'";
//  $query3 = "INSERT INTO oc_category_to_store(category_id,store_id)
//      VALUES('".$categoryId."','0')";

$data['sku'] = $productId;


$query0 = "SELECT * 
FROM  `oc_product_description` 
WHERE  `product_id` = ( 
SELECT MAX(  `product_id` ) 
FROM  `oc_product_description` )";


// $query = "INSERT INTO csvdata(category_id,language_id, name,)
//     VALUES('".$categoryId."','1','".$categoryParentId."','".$categoryTitle."')";
 
 				

try {  
mysql_query("SET NAMES 'utf8'");
 $query = "INSERT INTO " . $DB_PREFIX . "product SET  image = '" . $data['image'] . "' ,model = '" . $data['model'] . "', sku = '" . $data['sku'] . "', upc = '" . $data['upc'] . "', ean = '" . $data['ean'] . "', jan = '" . $data['jan']. "', isbn = '" . $data['isbn'] . "', mpn = '" . $data['mpn'] . "', location = '" . $data['location'] . "', quantity = '" . (int)$quantity . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $data['date_available'] . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '1', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW()";

  mysql_query($query) or throw_ex(mysql_error());  

  	$query1 = "INSERT INTO " . $DB_PREFIX . "product_to_category SET product_id = '" . (int)  mysql_insert_id() . "', category_id = '" . (int)$categoryId . "'";
	$query3 = "INSERT INTO " . $DB_PREFIX . "product_description SET product_id = '" . (int)mysql_insert_id() . "', language_id = '" . (int)$language_id . "', name = '" . $data['name'] . "', description = '" . $data['description'] . "', tag = '" . $data['tag'] . "', meta_title = '" . $data['meta_title'] . "', meta_description = '" . $data['meta_description'] . "', meta_keyword = '" . $data['meta_keyword'] . "'";
 $query4 = "INSERT INTO " . $DB_PREFIX . "product_to_store SET product_id = '" . (int)mysql_insert_id() . "', store_id = '" . (int)$store_id . "'";
$query5 = "INSERT INTO " . $DB_PREFIX . "product_image SET product_id = '" . (int)mysql_insert_id()  . "', image = '" . $data['image'] . "', sort_order = '" . (int)$product_image['sort_order'] . "'";
  // $d = mysql_query($query0) or throw_ex(mysql_error());  
    // $query2 = "UPDATE " . $DB_PREFIX . "product SET image = '" . $data['image'] . "' WHERE product_id = '" . (int)mysql_insert_id() . "'";
printf(mysql_insert_id());  
  // $row = mysql_fetch_row($d);
  // print_r($row[0]); 
  // $product_id = $row[0];

 mysql_query($query4) or throw_ex(mysql_error());  
  mysql_query($query3) or throw_ex(mysql_error());  
    mysql_query($query1) or throw_ex(mysql_error());  
    mysql_query($query5) or throw_ex(mysql_error());  
}  
catch(exception $e) {
  echo "ex: ".$e; 
}
   

   $i++;
}
mysql_close($connect); // closing connection

$blocks2 = $xml->xpath('//layout/block'); //gets all <block/> which parent are   <layout/>  t
