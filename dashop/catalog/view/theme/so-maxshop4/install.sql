DROP TABLE IF EXISTS ?:banner;
CREATE TABLE `?:banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO ?:banner VALUES
("7","Slideshow Layout 2","1"),
("8","Manufacturers","1"),
("10","Slideshow Layout 1","1"),
("12","Slideshow Layout 3","1");


DROP TABLE IF EXISTS ?:banner_image;
CREATE TABLE `?:banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1073 DEFAULT CHARSET=utf8;

INSERT INTO ?:banner_image VALUES
("1067","7","#","catalog/cms/slider-2-2.jpg","0"),
("1068","7","#","catalog/cms/slider-2-1.jpg","1"),
("94","8","","catalog/demo/manufacturer/nfl.png","0"),
("95","8","","catalog/demo/manufacturer/redbull.png","0"),
("96","8","","catalog/demo/manufacturer/sony.png","0"),
("91","8","","catalog/demo/manufacturer/cocacola.png","0"),
("92","8","","catalog/demo/manufacturer/burgerking.png","0"),
("93","8","","catalog/demo/manufacturer/canon.png","0"),
("88","8","","catalog/demo/manufacturer/harley.png","0"),
("89","8","","catalog/demo/manufacturer/dell.png","0"),
("90","8","","catalog/demo/manufacturer/disney.png","0"),
("97","8","","catalog/demo/manufacturer/starbucks.png","0"),
("98","8","","catalog/demo/manufacturer/nintendo.png","0"),
("1069","7","#","catalog/cms/slider-2-3.jpg","2"),
("1066","10","#","catalog/cms/banner3.jpg","2"),
("1064","10","#","catalog/cms/banner1.jpg","0"),
("1065","10","#","catalog/cms/banner2.jpg","1"),
("1070","12","#","catalog/cms/banner1.jpg","0"),
("1071","12","#","catalog/cms/banner2.jpg","0"),
("1072","12","#","catalog/cms/banner3.jpg","0");


DROP TABLE IF EXISTS ?:banner_image_description;
CREATE TABLE `?:banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO ?:banner_image_description VALUES
("1069","2","7","slider2"),
("93","1","8","Canon"),
("92","1","8","Burger King"),
("91","1","8","Coca Cola"),
("90","1","8","Disney"),
("89","1","8","Dell"),
("1069","1","7","slider2"),
("88","1","8","Harley Davidson"),
("94","1","8","NFL"),
("95","1","8","RedBull"),
("96","1","8","Sony"),
("97","1","8","Starbucks"),
("98","1","8","Nintendo"),
("1068","2","7","slider3"),
("1068","1","7","slider3"),
("1067","2","7","slider1"),
("93","2","8","Canon"),
("92","2","8","Burger King"),
("91","2","8","Coca Cola"),
("90","2","8","Disney"),
("89","2","8","Dell"),
("1067","1","7","slider1"),
("88","2","8","Harley Davidson"),
("94","2","8","NFL"),
("95","2","8","RedBull"),
("96","2","8","Sony"),
("97","2","8","Starbucks"),
("98","2","8","Nintendo"),
("1066","2","10","slider3-1"),
("1066","1","10","slider3-1"),
("1065","2","10","slider2-1"),
("1065","1","10","slider2-1"),
("1064","2","10","slider1-1"),
("1064","1","10","slider1-1"),
("1070","1","12","slider1-2"),
("1070","2","12","slider1-2"),
("1071","1","12","slider2-2"),
("1071","2","12","slider2-2"),
("1072","1","12","slider3-2"),
("1072","2","12","slider3-2");

-- Extension table -- 
DELETE FROM `?:extension` WHERE `type` = 'module' AND `code` = 'soconfig';
DELETE FROM `?:extension` WHERE `type` = 'module' AND `code` = 'html';
DELETE FROM `?:extension` WHERE `type` = 'module' AND `code` = 'so_searchpro';
DELETE FROM `?:extension` WHERE `type` = 'module' AND `code` = 'so_megamenu';
DELETE FROM `?:extension` WHERE `type` = 'module' AND `code` = 'newsletters';
DELETE FROM `?:extension` WHERE `type` = 'module' AND `code` = 'so_extra_slider';
DELETE FROM `?:extension` WHERE `type` = 'module' AND `code` = 'so_basic_products';
DELETE FROM `?:extension` WHERE `type` = 'module' AND `code` = 'so_deals';
DELETE FROM `?:extension` WHERE `type` = 'module' AND `code` = 'manufacturers';
DELETE FROM `?:extension` WHERE `type` = 'module' AND `code` = 'so_super_category';
DELETE FROM `?:extension` WHERE `type` = 'module' AND `code` = 'so_listing_tabs';
DELETE FROM `?:extension` WHERE `type` = 'module' AND `code` = 'so_category_slider';
DELETE FROM `?:extension` WHERE `type` = 'module' AND `code` = 'so_categories';

INSERT INTO ?:extension VALUES
("437","module","soconfig"),
("452","module","html"),
("471","module","so_searchpro"),
("480","module","so_megamenu"),
("466","module","newsletters"),
("478","module","so_extra_slider"),
("479","module","so_basic_products"),
("481","module","so_deals"),
("483","module","manufacturers"),
("485","module","so_super_category"),
("487","module","so_listing_tabs"),
("488","module","so_category_slider"),
("489","module","so_categories");


DROP TABLE IF EXISTS ?:information;
CREATE TABLE `?:information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO ?:information VALUES
("3","1","3","1"),
("4","1","1","1"),
("5","1","4","1"),
("6","1","2","1"),
("7","0","0","1"),
("8","0","0","1"),
("9","0","0","1"),
("11","1","0","1");


DROP TABLE IF EXISTS ?:information_description;
CREATE TABLE `?:information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO ?:information_description VALUES
("5","2","الشروط والأحكام","&lt;p&gt;Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.&lt;/p&gt;
\n","Terms &amp; Conditions","",""),
("9","1","About 4","&lt;div class=&quot;about-us about-demo-4&quot;&gt;	&lt;div class=&quot;row&quot;&gt;		&lt;div class=&quot;col-lg-6 col-md-6 about-us-content&quot;&gt;			&lt;div class=&quot;content-about&quot;&gt;				&lt;h2 class=&quot;about-title&quot;&gt;About Us&lt;/h2&gt;				&lt;img src=&quot;image/catalog/about/about-us-demo4.jpg&quot; alt=&quot;About Us&quot;&gt;				&lt;p class=&quot;description-about&quot;&gt;					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.&lt;br&gt;					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec vulputate				&lt;/p&gt;			&lt;/div&gt;		&lt;/div&gt;				&lt;div class=&quot;col-lg-6 col-md-6 faq-about-us&quot;&gt;			&lt;h2 class=&quot;about-title&quot;&gt;Faqs&lt;/h2&gt;			&lt;div class=&quot;content-faq&quot;&gt;				&lt;div id=&quot;accordion&quot; role=&quot;tablist&quot; aria-multiselectable=&quot;true&quot;&gt;				  &lt;div class=&quot;panel&quot;&gt;					&lt;div class=&quot;panel-head&quot; role=&quot;tab&quot; id=&quot;headingOne&quot;&gt;					  &lt;h4 class=&quot;panel-title&quot;&gt;						&lt;a role=&quot;button&quot; data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion&quot; href=&quot;#collapseOne&quot; aria-expanded=&quot;false&quot; aria-controls=&quot;collapseOne&quot; class=&quot;collapsed&quot;&gt;						  &lt;span&gt;Etharums ser quidem rerum?&lt;/span&gt;						&lt;/a&gt;					  &lt;/h4&gt;					&lt;/div&gt;					&lt;div id=&quot;collapseOne&quot; class=&quot;panel-collapse collapse&quot; role=&quot;tabpanel&quot; aria-labelledby=&quot;headingOne&quot; aria-expanded=&quot;false&quot; style=&quot;height: 0px;&quot;&gt;					  &lt;div class=&quot;panel-body&quot;&gt;						Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 					  &lt;/div&gt;					&lt;/div&gt;				  &lt;/div&gt;				  				  &lt;div class=&quot;panel&quot;&gt;					&lt;div class=&quot;panel-head&quot; role=&quot;tab&quot; id=&quot;headingTwo&quot;&gt;					  &lt;h4 class=&quot;panel-title&quot;&gt;						&lt;a class=&quot;collapsed&quot; role=&quot;button&quot; data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion&quot; href=&quot;#collapseTwo&quot; aria-expanded=&quot;false&quot; aria-controls=&quot;collapseTwo&quot;&gt;						  &lt;span&gt;Lorem ipsum dolor sit amet?&lt;/span&gt;						&lt;/a&gt;					  &lt;/h4&gt;					&lt;/div&gt;					&lt;div id=&quot;collapseTwo&quot; class=&quot;panel-collapse collapse&quot; role=&quot;tabpanel&quot; aria-labelledby=&quot;headingTwo&quot; aria-expanded=&quot;false&quot; style=&quot;height: 0px;&quot;&gt;					  &lt;div class=&quot;panel-body&quot;&gt;						Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 					  &lt;/div&gt;					&lt;/div&gt;				  &lt;/div&gt;				  				  &lt;div class=&quot;panel&quot;&gt;					&lt;div class=&quot;panel-head&quot; role=&quot;tab&quot; id=&quot;headingThree&quot;&gt;					  &lt;h4 class=&quot;panel-title&quot;&gt;						&lt;a class=&quot;collapsed&quot; role=&quot;button&quot; data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion&quot; href=&quot;#collapseThree&quot; aria-expanded=&quot;false&quot; aria-controls=&quot;collapseThree&quot;&gt;						  &lt;span&gt;Nam vitae felis pretium, euismod ipsum nec?&lt;/span&gt;						&lt;/a&gt;					  &lt;/h4&gt;					&lt;/div&gt;					&lt;div id=&quot;collapseThree&quot; class=&quot;panel-collapse collapse&quot; role=&quot;tabpanel&quot; aria-labelledby=&quot;headingThree&quot; aria-expanded=&quot;false&quot; style=&quot;height: 0px;&quot;&gt;					  &lt;div class=&quot;panel-body&quot;&gt;						Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 					  &lt;/div&gt;					&lt;/div&gt;				  &lt;/div&gt;				  				  &lt;div class=&quot;panel&quot;&gt;					&lt;div class=&quot;panel-head&quot; role=&quot;tab&quot; id=&quot;headingFour&quot;&gt;					  &lt;h4 class=&quot;panel-title&quot;&gt;						&lt;a class=&quot;collapsed&quot; role=&quot;button&quot; data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion&quot; href=&quot;#collapseFour&quot; aria-expanded=&quot;false&quot; aria-controls=&quot;collapseFour&quot;&gt;						  &lt;span&gt;Quisque posuere dolor in malesuada?&lt;/span&gt;						&lt;/a&gt;					  &lt;/h4&gt;					&lt;/div&gt;					&lt;div id=&quot;collapseFour&quot; class=&quot;panel-collapse collapse&quot; role=&quot;tabpanel&quot; aria-labelledby=&quot;headingFour&quot; aria-expanded=&quot;false&quot; style=&quot;height: 0px;&quot;&gt;					  &lt;div class=&quot;panel-body&quot;&gt;						Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 					  &lt;/div&gt;					&lt;/div&gt;				  &lt;/div&gt;				  				  &lt;div class=&quot;panel&quot;&gt;					&lt;div class=&quot;panel-head&quot; role=&quot;tab&quot; id=&quot;headingFive&quot;&gt;					  &lt;h4 class=&quot;panel-title&quot;&gt;						&lt;a class=&quot;collapsed&quot; role=&quot;button&quot; data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion&quot; href=&quot;#collapseFive&quot; aria-expanded=&quot;false&quot; aria-controls=&quot;collapseFive&quot;&gt;						  &lt;span&gt;Quisque posuere dolor in malesuada?&lt;/span&gt;						&lt;/a&gt;					  &lt;/h4&gt;					&lt;/div&gt;					&lt;div id=&quot;collapseFive&quot; class=&quot;panel-collapse collapse&quot; role=&quot;tabpanel&quot; aria-labelledby=&quot;headingFive&quot; aria-expanded=&quot;false&quot; style=&quot;height: 0px;&quot;&gt;					  &lt;div class=&quot;panel-body&quot;&gt;						Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 					  &lt;/div&gt;					&lt;/div&gt;				  &lt;/div&gt;				  				  &lt;div class=&quot;panel&quot;&gt;					&lt;div class=&quot;panel-head&quot; role=&quot;tab&quot; id=&quot;headingSix&quot;&gt;					  &lt;h4 class=&quot;panel-title&quot;&gt;						&lt;a class=&quot;&quot; role=&quot;button&quot; data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion&quot; href=&quot;#collapseSix&quot; aria-expanded=&quot;true&quot; aria-controls=&quot;collapseSix&quot;&gt;						  &lt;span&gt;Lorem ipsum dolor sit amet?&lt;/span&gt;						&lt;/a&gt;					  &lt;/h4&gt;					&lt;/div&gt;					&lt;div id=&quot;collapseSix&quot; class=&quot;panel-collapse collapse in&quot; role=&quot;tabpanel&quot; aria-labelledby=&quot;headingSix&quot; aria-expanded=&quot;true&quot;&gt;					  &lt;div class=&quot;panel-body&quot;&gt;						Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 					  &lt;/div&gt;					&lt;/div&gt;				  &lt;/div&gt;				&lt;/div&gt;			&lt;/div&gt;		&lt;/div&gt;	&lt;/div&gt;&lt;/div&gt;","About 4","",""),
("5","1","Terms &amp; Conditions","&lt;p&gt;Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.&lt;/p&gt;
\n","Terms &amp; Conditions","",""),
("4","1","About Us","&lt;div class=&quot;about-us about-demo-1&quot;&gt;	&lt;div class=&quot;row&quot;&gt;		&lt;div class=&quot;col-lg-5 col-md-5 about-image&quot;&gt;			&lt;img src=&quot;image/catalog/about/wellcometoshop.png&quot; alt=&quot;About Us&quot;&gt;		&lt;/div&gt;
\n
\n				&lt;div class=&quot;col-lg-7 col-md-7 about-info&quot;&gt;			&lt;h2 class=&quot;about-title&quot;&gt;&lt;span&gt;About Us&lt;/span&gt;&lt;/h2&gt;
\n
\n			&lt;div class=&quot;about-text&quot;&gt;				&lt;p&gt;					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.				&lt;/p&gt;
\n
\n				&lt;p&gt;					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.&lt;br&gt;					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.				&lt;/p&gt;
\n
\n			&lt;/div&gt;
\n
\n		&lt;/div&gt;
\n
\n	&lt;/div&gt;
\n
\n		&lt;div class=&quot;row&quot;&gt;		&lt;div class=&quot;col-lg-12 col-md-12 what-client-say&quot;&gt;					&lt;div class=&quot;client-say-content&quot;&gt;						&lt;h2 class=&quot;about-title line-hori&quot;&gt;&lt;span&gt;What Clients Say&lt;/span&gt;&lt;/h2&gt;
\n
\n								&lt;div class=&quot;client-say-slider&quot;&gt;												[content_slider items=\'1\' item_lg=\'1\' item_sm=\'1\' margin=\'30\' pagination=\'yes\' arrows=\'no\' loop=\'no\']					[content_slider_item]					&lt;div class=&quot;item&quot;&gt;						&lt;p class=&quot;des-member des-client&quot;&gt;“Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.”&lt;/p&gt;
\n
\n						&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n						&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;p class=&quot;des-member des-client&quot;&gt;“Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.”&lt;/p&gt;
\n
\n						&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n						&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;p class=&quot;des-member des-client&quot;&gt;“Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.”&lt;/p&gt;
\n
\n						&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n						&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;p class=&quot;des-member des-client&quot;&gt;“Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.”&lt;/p&gt;
\n
\n						&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n						&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][/content_slider]				&lt;/div&gt;
\n
\n											&lt;/div&gt;
\n
\n		&lt;/div&gt;
\n
\n	&lt;/div&gt;
\n
\n		&lt;div class=&quot;row&quot;&gt;		&lt;div class=&quot;col-lg-12 col-md-12 our-team&quot;&gt;			&lt;div class=&quot;our-team-content&quot;&gt;				&lt;h2 class=&quot;about-title line-hori&quot;&gt;&lt;span&gt;Our Team&lt;/span&gt;&lt;/h2&gt;
\n
\n								&lt;div class=&quot;our-team-slider&quot;&gt;					[content_slider items=\'4\' item_lg=\'4\' item_sm=\'2\' margin=\'30\' arrow=\'yes\' pagination=\'no\' loop=\'no\']					[content_slider_item]					&lt;div class=&quot;item&quot;&gt;						&lt;div class=&quot;member&quot;&gt;							&lt;div class=&quot;member-image&quot;&gt;								&lt;img src=&quot;image/catalog/about/ourmember01.png&quot; alt=&quot;Image Client&quot;&gt;							&lt;/div&gt;
\n
\n														&lt;div class=&quot;member-info&quot;&gt;								&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n								&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n								&lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n								&lt;ul class=&quot;social-member&quot;&gt;
\n
\n									&lt;li class=&quot;social-icon rss&quot;&gt;&lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;&lt;span&gt;RSS&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon facebook&quot;&gt;&lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;&lt;span&gt;Facebook&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon twitter&quot;&gt;&lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;&lt;span&gt;Twitter&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon google&quot;&gt;&lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;&lt;span&gt;Google&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n								&lt;/ul&gt;
\n
\n							&lt;/div&gt;
\n
\n						&lt;/div&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;div class=&quot;member&quot;&gt;							&lt;div class=&quot;member-image&quot;&gt;								&lt;img src=&quot;image/catalog/about/ourmember02.png&quot; alt=&quot;Image Client&quot;&gt;							&lt;/div&gt;
\n
\n														&lt;div class=&quot;member-info&quot;&gt;								&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n								&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n								&lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n								&lt;ul class=&quot;social-member&quot;&gt;
\n
\n									&lt;li class=&quot;social-icon rss&quot;&gt;&lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;&lt;span&gt;RSS&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon facebook&quot;&gt;&lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;&lt;span&gt;Facebook&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon twitter&quot;&gt;&lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;&lt;span&gt;Twitter&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon google&quot;&gt;&lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;&lt;span&gt;Google&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n								&lt;/ul&gt;
\n
\n							&lt;/div&gt;
\n
\n						&lt;/div&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;div class=&quot;member&quot;&gt;							&lt;div class=&quot;member-image&quot;&gt;								&lt;img src=&quot;image/catalog/about/ourmember03.png&quot; alt=&quot;Image Client&quot;&gt;							&lt;/div&gt;
\n
\n														&lt;div class=&quot;member-info&quot;&gt;								&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n								&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n								&lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n								&lt;ul class=&quot;social-member&quot;&gt;
\n
\n									&lt;li class=&quot;social-icon rss&quot;&gt;&lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;&lt;span&gt;RSS&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon facebook&quot;&gt;&lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;&lt;span&gt;Facebook&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon twitter&quot;&gt;&lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;&lt;span&gt;Twitter&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon google&quot;&gt;&lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;&lt;span&gt;Google&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n								&lt;/ul&gt;
\n
\n							&lt;/div&gt;
\n
\n						&lt;/div&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;div class=&quot;member&quot;&gt;							&lt;div class=&quot;member-image&quot;&gt;								&lt;img src=&quot;image/catalog/about/ourmember04.png&quot; alt=&quot;Image Client&quot;&gt;							&lt;/div&gt;
\n
\n														&lt;div class=&quot;member-info&quot;&gt;								&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n								&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n								&lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n								&lt;ul class=&quot;social-member&quot;&gt;
\n
\n									&lt;li class=&quot;social-icon rss&quot;&gt;&lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;&lt;span&gt;RSS&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon facebook&quot;&gt;&lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;&lt;span&gt;Facebook&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon twitter&quot;&gt;&lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;&lt;span&gt;Twitter&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon google&quot;&gt;&lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;&lt;span&gt;Google&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n								&lt;/ul&gt;
\n
\n							&lt;/div&gt;
\n
\n						&lt;/div&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;div class=&quot;member&quot;&gt;							&lt;div class=&quot;member-image&quot;&gt;								&lt;img src=&quot;image/catalog/about/ourmember01.png&quot; alt=&quot;Image Client&quot;&gt;							&lt;/div&gt;
\n
\n														&lt;div class=&quot;member-info&quot;&gt;								&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n								&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n								&lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n								&lt;ul class=&quot;social-member&quot;&gt;
\n
\n									&lt;li class=&quot;social-icon rss&quot;&gt;&lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;&lt;span&gt;RSS&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon facebook&quot;&gt;&lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;&lt;span&gt;Facebook&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon twitter&quot;&gt;&lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;&lt;span&gt;Twitter&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon google&quot;&gt;&lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;&lt;span&gt;Google&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n								&lt;/ul&gt;
\n
\n							&lt;/div&gt;
\n
\n						&lt;/div&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;div class=&quot;member&quot;&gt;							&lt;div class=&quot;member-image&quot;&gt;								&lt;img src=&quot;image/catalog/about/ourmember03.png&quot; alt=&quot;Image Client&quot;&gt;							&lt;/div&gt;
\n
\n														&lt;div class=&quot;member-info&quot;&gt;								&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n								&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n								&lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n								&lt;ul class=&quot;social-member&quot;&gt;
\n
\n									&lt;li class=&quot;social-icon rss&quot;&gt;&lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;&lt;span&gt;RSS&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon facebook&quot;&gt;&lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;&lt;span&gt;Facebook&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon twitter&quot;&gt;&lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;&lt;span&gt;Twitter&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon google&quot;&gt;&lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;&lt;span&gt;Google&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n								&lt;/ul&gt;
\n
\n							&lt;/div&gt;
\n
\n						&lt;/div&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][/content_slider]				&lt;/div&gt;
\n
\n															&lt;/div&gt;
\n
\n		&lt;/div&gt;
\n
\n	&lt;/div&gt;
\n
\n	&lt;/div&gt;","About Us","em ipsum dolor sit amet","em ipsum dolor sit amet"),
("6","1","FAQ","&lt;h3&gt;Got Questions? We’ve Got Answers!&lt;/h3&gt;
\n
\n&lt;p&gt;Asunt in anim uis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in anim id est laborum. Allamco laboris nisi ut aliquip ex ea commodo consequat. Aser velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in anim id est laborum.&lt;/p&gt;
\n
\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;
\n
\n&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;col-sm-12&quot;&gt;[accordion] [acc_item title=&quot;Lorem ipsum dolor sit amet, consectetuer adipiscing elit&quot;]&lt;p&gt;Fusce eu dui. Integer vel nibh sit amet turpis vulputate aliquet. Phasellus id nisi vitae odio pretium aliquam. Pellentesque a leo. Donec consequat lectus sed felis. Quisque vestibulum massa. Nulla ornare. Nulla libero. Donec et mi eu massa ultrices scelerisque. &lt;/p&gt;
\n
\n&lt;p&gt;Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Integer dictum est vitae sem. Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi.&lt;/p&gt;
\n
\n[/acc_item] [acc_item title=&quot;Donec eros tellus scelerisque nec rhoncus eget laoreet sit amet&quot;]&lt;p&gt;Fusce eu dui. Integer vel nibh sit amet turpis vulputate aliquet. Phasellus id nisi vitae odio pretium aliquam. Pellentesque a leo. Donec consequat lectus sed felis. Quisque vestibulum massa. Nulla ornare. Nulla libero. Donec et mi eu massa ultrices scelerisque. &lt;/p&gt;
\n
\n&lt;p&gt;Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Integer dictum est vitae sem. Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi.&lt;/p&gt;
\n
\n[/acc_item] [acc_item title=&quot;Curabitur molestie euismod erat. Proin eros odio?&quot;] &lt;p&gt;Fusce eu dui. Integer vel nibh sit amet turpis vulputate aliquet. Phasellus id nisi vitae odio pretium aliquam. Pellentesque a leo. Donec consequat lectus sed felis. Quisque vestibulum massa. Nulla ornare. Nulla libero. Donec et mi eu massa ultrices scelerisque.&lt;/p&gt;
\n
\n&lt;p&gt; Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Integer dictum est vitae sem. Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi.&lt;/p&gt;
\n
\n[/acc_item] 
\n[acc_item title=&quot;In scelerisque sem at dolor. Maecenas mattis&quot;]
\n&lt;p&gt;Fusce eu dui. Integer vel nibh sit amet turpis vulputate aliquet. Phasellus id nisi vitae odio pretium aliquam. Pellentesque a leo. Donec consequat lectus sed felis. Quisque vestibulum massa. Nulla ornare. Nulla libero. Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Integer dictum est vitae sem. Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi.&lt;/p&gt;
\n
\n[/acc_item] 
\n[acc_item title=&quot;Nunc feugiat mi a tellus consequat imperdiet&quot;]
\n&lt;p&gt;Fusce eu dui. Integer vel nibh sit amet turpis vulputate aliquet. Phasellus id nisi vitae odio pretium aliquam. Pellentesque a leo. Donec consequat lectus sed felis. Quisque vestibulum massa. Nulla ornare. Nulla libero. Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Integer dictum est vitae sem. Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi.&lt;/p&gt;
\n
\n[/acc_item]  
\n[acc_item title=&quot;Vestibulum ante ipsum primis in faucibus orci luctus &quot;]
\n&lt;p&gt;Fusce eu dui. Integer vel nibh sit amet turpis vulputate aliquet. Phasellus id nisi vitae odio pretium aliquam. Pellentesque a leo. Donec consequat lectus sed felis. Quisque vestibulum massa. Nulla ornare. Nulla libero. Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Integer dictum est vitae sem. Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi.&lt;/p&gt;
\n
\n[/acc_item]  
\n[acc_item title=&quot;SmartAddons membership fee is one-time fee, or I have to pay extra?&quot;]
\n&lt;p&gt;Fusce eu dui. Integer vel nibh sit amet turpis vulputate aliquet. Phasellus id nisi vitae odio pretium aliquam. Pellentesque a leo. Donec consequat lectus sed felis. Quisque vestibulum massa. Nulla ornare. Nulla libero. Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Integer dictum est vitae sem. Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi.&lt;/p&gt;
\n
\n[/acc_item]   
\n [/accordion]
\n &lt;/div&gt;
\n
\n&lt;/div&gt;","Delivery Information","",""),
("6","2","معلومات التوصيل","&lt;h3&gt;Got Questions? We’ve Got Answers!&lt;/h3&gt;&lt;p&gt;Asunt in anim uis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in anim id est laborum. Allamco laboris nisi ut aliquip ex ea commodo consequat. Aser velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in anim id est laborum.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;col-sm-12&quot;&gt;[accordion] [acc_item title=&quot;Lorem ipsum dolor sit amet, consectetuer adipiscing elit&quot;]&lt;p&gt;Fusce eu dui. Integer vel nibh sit amet turpis vulputate aliquet. Phasellus id nisi vitae odio pretium aliquam. Pellentesque a leo. Donec consequat lectus sed felis. Quisque vestibulum massa. Nulla ornare. Nulla libero. Donec et mi eu massa ultrices scelerisque. &lt;/p&gt;&lt;p&gt;Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Integer dictum est vitae sem. Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi.&lt;/p&gt;[/acc_item] [acc_item title=&quot;Donec eros tellus scelerisque nec rhoncus eget laoreet sit amet&quot;]&lt;p&gt;Fusce eu dui. Integer vel nibh sit amet turpis vulputate aliquet. Phasellus id nisi vitae odio pretium aliquam. Pellentesque a leo. Donec consequat lectus sed felis. Quisque vestibulum massa. Nulla ornare. Nulla libero. Donec et mi eu massa ultrices scelerisque. &lt;/p&gt;&lt;p&gt;Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Integer dictum est vitae sem. Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi.&lt;/p&gt;[/acc_item] [acc_item title=&quot;Curabitur molestie euismod erat. Proin eros odio?&quot;] &lt;p&gt;Fusce eu dui. Integer vel nibh sit amet turpis vulputate aliquet. Phasellus id nisi vitae odio pretium aliquam. Pellentesque a leo. Donec consequat lectus sed felis. Quisque vestibulum massa. Nulla ornare. Nulla libero. Donec et mi eu massa ultrices scelerisque.&lt;/p&gt;&lt;p&gt; Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Integer dictum est vitae sem. Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi.&lt;/p&gt;[/acc_item] [acc_item title=&quot;In scelerisque sem at dolor. Maecenas mattis&quot;]&lt;p&gt;Fusce eu dui. Integer vel nibh sit amet turpis vulputate aliquet. Phasellus id nisi vitae odio pretium aliquam. Pellentesque a leo. Donec consequat lectus sed felis. Quisque vestibulum massa. Nulla ornare. Nulla libero. Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Integer dictum est vitae sem. Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi.&lt;/p&gt;[/acc_item] [acc_item title=&quot;Nunc feugiat mi a tellus consequat imperdiet&quot;]&lt;p&gt;Fusce eu dui. Integer vel nibh sit amet turpis vulputate aliquet. Phasellus id nisi vitae odio pretium aliquam. Pellentesque a leo. Donec consequat lectus sed felis. Quisque vestibulum massa. Nulla ornare. Nulla libero. Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Integer dictum est vitae sem. Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi.&lt;/p&gt;[/acc_item]  [acc_item title=&quot;Vestibulum ante ipsum primis in faucibus orci luctus &quot;]&lt;p&gt;Fusce eu dui. Integer vel nibh sit amet turpis vulputate aliquet. Phasellus id nisi vitae odio pretium aliquam. Pellentesque a leo. Donec consequat lectus sed felis. Quisque vestibulum massa. Nulla ornare. Nulla libero. Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Integer dictum est vitae sem. Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi.&lt;/p&gt;[/acc_item]  [acc_item title=&quot;SmartAddons membership fee is one-time fee, or I have to pay extra?&quot;]&lt;p&gt;Fusce eu dui. Integer vel nibh sit amet turpis vulputate aliquet. Phasellus id nisi vitae odio pretium aliquam. Pellentesque a leo. Donec consequat lectus sed felis. Quisque vestibulum massa. Nulla ornare. Nulla libero. Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Integer dictum est vitae sem. Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi.&lt;/p&gt;[/acc_item]    [/accordion] &lt;/div&gt;&lt;/div&gt;","Delivery Information","",""),
("9","2","About 4","&lt;div class=&quot;about-us about-demo-4&quot;&gt;	&lt;div class=&quot;row&quot;&gt;		&lt;div class=&quot;col-lg-6 col-md-6 about-us-content&quot;&gt;			&lt;div class=&quot;content-about&quot;&gt;				&lt;h2 class=&quot;about-title&quot;&gt;About Us&lt;/h2&gt;				&lt;img src=&quot;image/catalog/about/about-us-demo4.jpg&quot; alt=&quot;About Us&quot;&gt;				&lt;p class=&quot;description-about&quot;&gt;					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.&lt;br&gt;					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec vulputate				&lt;/p&gt;			&lt;/div&gt;		&lt;/div&gt;				&lt;div class=&quot;col-lg-6 col-md-6 faq-about-us&quot;&gt;			&lt;h2 class=&quot;about-title&quot;&gt;Faqs&lt;/h2&gt;			&lt;div class=&quot;content-faq&quot;&gt;				&lt;div id=&quot;accordion&quot; role=&quot;tablist&quot; aria-multiselectable=&quot;true&quot;&gt;				  &lt;div class=&quot;panel&quot;&gt;					&lt;div class=&quot;panel-head&quot; role=&quot;tab&quot; id=&quot;headingOne&quot;&gt;					  &lt;h4 class=&quot;panel-title&quot;&gt;						&lt;a role=&quot;button&quot; data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion&quot; href=&quot;#collapseOne&quot; aria-expanded=&quot;false&quot; aria-controls=&quot;collapseOne&quot; class=&quot;collapsed&quot;&gt;						  &lt;span&gt;Etharums ser quidem rerum?&lt;/span&gt;						&lt;/a&gt;					  &lt;/h4&gt;					&lt;/div&gt;					&lt;div id=&quot;collapseOne&quot; class=&quot;panel-collapse collapse&quot; role=&quot;tabpanel&quot; aria-labelledby=&quot;headingOne&quot; aria-expanded=&quot;false&quot; style=&quot;height: 0px;&quot;&gt;					  &lt;div class=&quot;panel-body&quot;&gt;						Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 					  &lt;/div&gt;					&lt;/div&gt;				  &lt;/div&gt;				  				  &lt;div class=&quot;panel&quot;&gt;					&lt;div class=&quot;panel-head&quot; role=&quot;tab&quot; id=&quot;headingTwo&quot;&gt;					  &lt;h4 class=&quot;panel-title&quot;&gt;						&lt;a class=&quot;collapsed&quot; role=&quot;button&quot; data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion&quot; href=&quot;#collapseTwo&quot; aria-expanded=&quot;false&quot; aria-controls=&quot;collapseTwo&quot;&gt;						  &lt;span&gt;Lorem ipsum dolor sit amet?&lt;/span&gt;						&lt;/a&gt;					  &lt;/h4&gt;					&lt;/div&gt;					&lt;div id=&quot;collapseTwo&quot; class=&quot;panel-collapse collapse&quot; role=&quot;tabpanel&quot; aria-labelledby=&quot;headingTwo&quot; aria-expanded=&quot;false&quot; style=&quot;height: 0px;&quot;&gt;					  &lt;div class=&quot;panel-body&quot;&gt;						Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 					  &lt;/div&gt;					&lt;/div&gt;				  &lt;/div&gt;				  				  &lt;div class=&quot;panel&quot;&gt;					&lt;div class=&quot;panel-head&quot; role=&quot;tab&quot; id=&quot;headingThree&quot;&gt;					  &lt;h4 class=&quot;panel-title&quot;&gt;						&lt;a class=&quot;collapsed&quot; role=&quot;button&quot; data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion&quot; href=&quot;#collapseThree&quot; aria-expanded=&quot;false&quot; aria-controls=&quot;collapseThree&quot;&gt;						  &lt;span&gt;Nam vitae felis pretium, euismod ipsum nec?&lt;/span&gt;						&lt;/a&gt;					  &lt;/h4&gt;					&lt;/div&gt;					&lt;div id=&quot;collapseThree&quot; class=&quot;panel-collapse collapse&quot; role=&quot;tabpanel&quot; aria-labelledby=&quot;headingThree&quot; aria-expanded=&quot;false&quot; style=&quot;height: 0px;&quot;&gt;					  &lt;div class=&quot;panel-body&quot;&gt;						Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 					  &lt;/div&gt;					&lt;/div&gt;				  &lt;/div&gt;				  				  &lt;div class=&quot;panel&quot;&gt;					&lt;div class=&quot;panel-head&quot; role=&quot;tab&quot; id=&quot;headingFour&quot;&gt;					  &lt;h4 class=&quot;panel-title&quot;&gt;						&lt;a class=&quot;collapsed&quot; role=&quot;button&quot; data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion&quot; href=&quot;#collapseFour&quot; aria-expanded=&quot;false&quot; aria-controls=&quot;collapseFour&quot;&gt;						  &lt;span&gt;Quisque posuere dolor in malesuada?&lt;/span&gt;						&lt;/a&gt;					  &lt;/h4&gt;					&lt;/div&gt;					&lt;div id=&quot;collapseFour&quot; class=&quot;panel-collapse collapse&quot; role=&quot;tabpanel&quot; aria-labelledby=&quot;headingFour&quot; aria-expanded=&quot;false&quot; style=&quot;height: 0px;&quot;&gt;					  &lt;div class=&quot;panel-body&quot;&gt;						Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 					  &lt;/div&gt;					&lt;/div&gt;				  &lt;/div&gt;				  				  &lt;div class=&quot;panel&quot;&gt;					&lt;div class=&quot;panel-head&quot; role=&quot;tab&quot; id=&quot;headingFive&quot;&gt;					  &lt;h4 class=&quot;panel-title&quot;&gt;						&lt;a class=&quot;collapsed&quot; role=&quot;button&quot; data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion&quot; href=&quot;#collapseFive&quot; aria-expanded=&quot;false&quot; aria-controls=&quot;collapseFive&quot;&gt;						  &lt;span&gt;Quisque posuere dolor in malesuada?&lt;/span&gt;						&lt;/a&gt;					  &lt;/h4&gt;					&lt;/div&gt;					&lt;div id=&quot;collapseFive&quot; class=&quot;panel-collapse collapse&quot; role=&quot;tabpanel&quot; aria-labelledby=&quot;headingFive&quot; aria-expanded=&quot;false&quot; style=&quot;height: 0px;&quot;&gt;					  &lt;div class=&quot;panel-body&quot;&gt;						Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 					  &lt;/div&gt;					&lt;/div&gt;				  &lt;/div&gt;				  				  &lt;div class=&quot;panel&quot;&gt;					&lt;div class=&quot;panel-head&quot; role=&quot;tab&quot; id=&quot;headingSix&quot;&gt;					  &lt;h4 class=&quot;panel-title&quot;&gt;						&lt;a class=&quot;&quot; role=&quot;button&quot; data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion&quot; href=&quot;#collapseSix&quot; aria-expanded=&quot;true&quot; aria-controls=&quot;collapseSix&quot;&gt;						  &lt;span&gt;Lorem ipsum dolor sit amet?&lt;/span&gt;						&lt;/a&gt;					  &lt;/h4&gt;					&lt;/div&gt;					&lt;div id=&quot;collapseSix&quot; class=&quot;panel-collapse collapse in&quot; role=&quot;tabpanel&quot; aria-labelledby=&quot;headingSix&quot; aria-expanded=&quot;true&quot;&gt;					  &lt;div class=&quot;panel-body&quot;&gt;						Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. 					  &lt;/div&gt;					&lt;/div&gt;				  &lt;/div&gt;				&lt;/div&gt;			&lt;/div&gt;		&lt;/div&gt;	&lt;/div&gt;&lt;/div&gt;","About 4","",""),
("8","2","About 3","&lt;div class=&quot;about-us about-demo-3&quot;&gt;
\n	&lt;div class=&quot;row&quot;&gt;
\n		&lt;div class=&quot;col-lg-6 col-md-6 about-image&quot;&gt;
\n			&lt;img src=&quot;image/catalog/about/about-us-demo3.jpg&quot; alt=&quot;About Us&quot;&gt;
\n		&lt;/div&gt;
\n
\n		
\n		&lt;div class=&quot;col-lg-6 col-md-6 about-info&quot;&gt;
\n			&lt;h2 class=&quot;about-title&quot;&gt;About Us&lt;/h2&gt;
\n
\n			&lt;div class=&quot;about-text&quot;&gt;
\n				&lt;p&gt;
\n					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. 
\n				&lt;/p&gt;
\n
\n				&lt;p&gt;Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.&lt;/p&gt;
\n
\n			&lt;/div&gt;
\n
\n		&lt;/div&gt;
\n
\n	&lt;/div&gt;
\n
\n
\n	&lt;div class=&quot;row&quot;&gt;
\n		&lt;div class=&quot;col-lg-6 col-md-6 skills-description&quot;&gt;
\n			&lt;h2 class=&quot;about-title&quot;&gt;Our Skills&lt;/h2&gt;
\n
\n			&lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.&lt;br&gt; 
\n				Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,
\n			&lt;/p&gt;
\n
\n		&lt;/div&gt;
\n
\n		
\n		&lt;div class=&quot;col-lg-6 col-md-6 skills-value&quot;&gt;
\n			&lt;ul class=&quot;value-list&quot;&gt;
\n
\n				&lt;li class=&quot;item&quot;&gt;
\n					&lt;p class=&quot;label-skill&quot;&gt;Skill Lorem ipsum:&lt;/p&gt;
\n
\n					&lt;div class=&quot;range-value&quot; style=&quot;background-color:#d9d9d9&quot;&gt;
\n						&lt;span class=&quot;rating-skills skill-1&quot; style=&quot;width:85%;&quot;&gt;85%&lt;/span&gt;
\n					&lt;/div&gt;
\n
\n				&lt;/li&gt;
\n
\n				
\n				&lt;li class=&quot;item&quot;&gt;
\n					&lt;p class=&quot;label-skill&quot;&gt;Skill donec pede:&lt;/p&gt;
\n
\n					&lt;div class=&quot;range-value&quot; style=&quot;background-color:#d9d9d9&quot;&gt;
\n						&lt;span class=&quot;rating-skills skill-2&quot; style=&quot;width:74%;&quot;&gt;74%&lt;/span&gt;
\n					&lt;/div&gt;
\n
\n				&lt;/li&gt;
\n
\n				
\n				&lt;li class=&quot;item&quot;&gt;
\n					&lt;p class=&quot;label-skill&quot;&gt;Skill nulla consequat:&lt;/p&gt;
\n
\n					&lt;div class=&quot;range-value&quot; style=&quot;background-color:#d9d9d9&quot;&gt;
\n						&lt;span class=&quot;rating-skills skill-3&quot; style=&quot;width:89%;&quot;&gt;89%&lt;/span&gt;
\n					&lt;/div&gt;
\n
\n				&lt;/li&gt;
\n
\n			&lt;/ul&gt;
\n
\n		&lt;/div&gt;
\n
\n	&lt;/div&gt;
\n
\n	
\n&lt;/div&gt;","About 3","",""),
("8","1","About 3","&lt;div class=&quot;about-us about-demo-3&quot;&gt;
\n	&lt;div class=&quot;row&quot;&gt;
\n		&lt;div class=&quot;col-lg-6 col-md-6 about-image&quot;&gt;
\n			&lt;img src=&quot;image/catalog/about/about-us-demo3.jpg&quot; alt=&quot;About Us&quot;&gt;
\n		&lt;/div&gt;
\n
\n		
\n		&lt;div class=&quot;col-lg-6 col-md-6 about-info&quot;&gt;
\n			&lt;h2 class=&quot;about-title&quot;&gt;About Us&lt;/h2&gt;
\n
\n			&lt;div class=&quot;about-text&quot;&gt;
\n				&lt;p&gt;
\n					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. 
\n				&lt;/p&gt;
\n
\n				&lt;p&gt;Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.&lt;/p&gt;
\n
\n			&lt;/div&gt;
\n
\n		&lt;/div&gt;
\n
\n	&lt;/div&gt;
\n
\n
\n	&lt;div class=&quot;row&quot;&gt;
\n		&lt;div class=&quot;col-lg-6 col-md-6 skills-description&quot;&gt;
\n			&lt;h2 class=&quot;about-title&quot;&gt;Our Skills&lt;/h2&gt;
\n
\n			&lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.&lt;br&gt; 
\n				Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,
\n			&lt;/p&gt;
\n
\n		&lt;/div&gt;
\n
\n		
\n		&lt;div class=&quot;col-lg-6 col-md-6 skills-value&quot;&gt;
\n			&lt;ul class=&quot;value-list&quot;&gt;
\n
\n				&lt;li class=&quot;item&quot;&gt;
\n					&lt;p class=&quot;label-skill&quot;&gt;Skill Lorem ipsum:&lt;/p&gt;
\n
\n					&lt;div class=&quot;range-value&quot; style=&quot;background-color:#d9d9d9&quot;&gt;
\n						&lt;span class=&quot;rating-skills skill-1&quot; style=&quot;width:85%;&quot;&gt;85%&lt;/span&gt;
\n					&lt;/div&gt;
\n
\n				&lt;/li&gt;
\n
\n				
\n				&lt;li class=&quot;item&quot;&gt;
\n					&lt;p class=&quot;label-skill&quot;&gt;Skill donec pede:&lt;/p&gt;
\n
\n					&lt;div class=&quot;range-value&quot; style=&quot;background-color:#d9d9d9&quot;&gt;
\n						&lt;span class=&quot;rating-skills skill-2&quot; style=&quot;width:74%;&quot;&gt;74%&lt;/span&gt;
\n					&lt;/div&gt;
\n
\n				&lt;/li&gt;
\n
\n				
\n				&lt;li class=&quot;item&quot;&gt;
\n					&lt;p class=&quot;label-skill&quot;&gt;Skill nulla consequat:&lt;/p&gt;
\n
\n					&lt;div class=&quot;range-value&quot; style=&quot;background-color:#d9d9d9&quot;&gt;
\n						&lt;span class=&quot;rating-skills skill-3&quot; style=&quot;width:89%;&quot;&gt;89%&lt;/span&gt;
\n					&lt;/div&gt;
\n
\n				&lt;/li&gt;
\n
\n			&lt;/ul&gt;
\n
\n		&lt;/div&gt;
\n
\n	&lt;/div&gt;
\n
\n	
\n&lt;/div&gt;","About 3","",""),
("7","2","About 2","&lt;div class=&quot;about-us about-demo-2&quot;&gt;    &lt;div class=&quot;row&quot;&gt;        &lt;div class=&quot;col-lg-12 col-md-12 about-us-center&quot;&gt;            &lt;div class=&quot;about-image-slider&quot;&gt;                	[content_slider item_lg=\'1\' item_sm=\'1\' item_xs=\'1\' margin=\'\' arrow=\'yes\' pagination=\'no\' loop=\'no\']			[content_slider_item]                &lt;img src=&quot;image/catalog/about/about-1.jpg&quot; alt=&quot;About Us&quot;&gt;		[/content_slider_item][content_slider_item]                    &lt;img src=&quot;image/catalog/about/about-2.jpg&quot; alt=&quot;About Us&quot;&gt;		[/content_slider_item][content_slider_item]                        &lt;img src=&quot;image/catalog/about/about-3.jpg&quot; alt=&quot;About Us&quot;&gt;		[/content_slider_item][/content_slider]&lt;/div&gt;
\n
\n
\n                        &lt;div class=&quot;content-description&quot;&gt;                            &lt;h2 class=&quot;about-title&quot;&gt;About Us&lt;/h2&gt;
\n
\n
\n                            &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. &lt;/p&gt;
\n
\n
\n                            &lt;p&gt;Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.&lt;/p&gt;
\n
\n
\n                        &lt;/div&gt;
\n
\n
\n                    &lt;/div&gt;
\n
\n
\n                &lt;/div&gt;
\n
\n
\n                &lt;div class=&quot;row&quot;&gt;                    &lt;div class=&quot;col-lg-12 col-md-12 our-team&quot;&gt;                        &lt;div class=&quot;our-team-content&quot;&gt;                            &lt;div class=&quot;our-team-slider&quot;&gt;							[content_slider items=\'4\' item_lg=\'4\' item_sm=\'2\' margin=\'30\' arrow=\'yes\' pagination=\'no\' loop=\'no\']							[content_slider_item]                                                                &lt;div class=&quot;item&quot;&gt;                                    &lt;div class=&quot;member&quot;&gt;                                        &lt;div class=&quot;member-image&quot;&gt;                                            &lt;img src=&quot;image/catalog/about/ourmember01.png&quot; alt=&quot;Image Client&quot;&gt;                                            &lt;/div&gt;
\n
\n
\n                                            &lt;div class=&quot;member-info&quot;&gt;                                                &lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n
\n                                                &lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n
\n                                                &lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n
\n                                                &lt;ul class=&quot;social-member&quot;&gt;
\n
\n
\n                                                    &lt;li class=&quot;social-icon rss&quot;&gt;                                                        &lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;                                                            &lt;span&gt;RSS&lt;/span&gt;                                                        &lt;/a&gt;                                                    &lt;/li&gt;
\n
\n
\n                                                    &lt;li class=&quot;social-icon facebook&quot;&gt;                                                        &lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;                                                            &lt;span&gt;Facebook&lt;/span&gt;                                                        &lt;/a&gt;                                                    &lt;/li&gt;
\n
\n
\n                                                    &lt;li class=&quot;social-icon twitter&quot;&gt;                                                        &lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;                                                            &lt;span&gt;Twitter&lt;/span&gt;                                                        &lt;/a&gt;                                                    &lt;/li&gt;
\n
\n
\n                                                    &lt;li class=&quot;social-icon google&quot;&gt;                                                        &lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;                                                            &lt;span&gt;Google&lt;/span&gt;                                                        &lt;/a&gt;                                                    &lt;/li&gt;
\n
\n
\n                                                &lt;/ul&gt;
\n
\n
\n                                            &lt;/div&gt;
\n
\n
\n                                        &lt;/div&gt;
\n
\n
\n                                    &lt;/div&gt;
\n
\n
\n									[/content_slider_item][content_slider_item]                                                                        &lt;div class=&quot;item&quot;&gt;                                        &lt;div class=&quot;member&quot;&gt;                                            &lt;div class=&quot;member-image&quot;&gt;                                                &lt;img src=&quot;image/catalog/about/ourmember02.png&quot; alt=&quot;Image Client&quot;&gt;                                                &lt;/div&gt;
\n
\n
\n                                                &lt;div class=&quot;member-info&quot;&gt;                                                    &lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n
\n                                                    &lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n
\n                                                    &lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n
\n                                                    &lt;ul class=&quot;social-member&quot;&gt;
\n
\n
\n                                                        &lt;li class=&quot;social-icon rss&quot;&gt;                                                            &lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;                                                                &lt;span&gt;RSS&lt;/span&gt;                                                            &lt;/a&gt;                                                        &lt;/li&gt;
\n
\n
\n                                                        &lt;li class=&quot;social-icon facebook&quot;&gt;                                                            &lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;                                                                &lt;span&gt;Facebook&lt;/span&gt;                                                            &lt;/a&gt;                                                        &lt;/li&gt;
\n
\n
\n                                                        &lt;li class=&quot;social-icon twitter&quot;&gt;                                                            &lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;                                                                &lt;span&gt;Twitter&lt;/span&gt;                                                            &lt;/a&gt;                                                        &lt;/li&gt;
\n
\n
\n                                                        &lt;li class=&quot;social-icon google&quot;&gt;                                                            &lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;                                                                &lt;span&gt;Google&lt;/span&gt;                                                            &lt;/a&gt;                                                        &lt;/li&gt;
\n
\n
\n                                                    &lt;/ul&gt;
\n
\n
\n                                                &lt;/div&gt;
\n
\n
\n                                            &lt;/div&gt;
\n
\n
\n                                        &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                                &lt;div class=&quot;item&quot;&gt;                                            &lt;div class=&quot;member&quot;&gt;                                                &lt;div class=&quot;member-image&quot;&gt;                                                    &lt;img src=&quot;image/catalog/about/ourmember03.png&quot; alt=&quot;Image Client&quot;&gt;                                                    &lt;/div&gt;
\n
\n
\n                                                    &lt;div class=&quot;member-info&quot;&gt;                                                        &lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n
\n                                                        &lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n
\n                                                        &lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n
\n                                                        &lt;ul class=&quot;social-member&quot;&gt;
\n
\n
\n                                                            &lt;li class=&quot;social-icon rss&quot;&gt;                                                                &lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;                                                                    &lt;span&gt;RSS&lt;/span&gt;                                                                &lt;/a&gt;                                                            &lt;/li&gt;
\n
\n
\n                                                            &lt;li class=&quot;social-icon facebook&quot;&gt;                                                                &lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;                                                                    &lt;span&gt;Facebook&lt;/span&gt;                                                                &lt;/a&gt;                                                            &lt;/li&gt;
\n
\n
\n                                                            &lt;li class=&quot;social-icon twitter&quot;&gt;                                                                &lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;                                                                    &lt;span&gt;Twitter&lt;/span&gt;                                                                &lt;/a&gt;                                                            &lt;/li&gt;
\n
\n
\n                                                            &lt;li class=&quot;social-icon google&quot;&gt;                                                                &lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;                                                                    &lt;span&gt;Google&lt;/span&gt;                                                                &lt;/a&gt;                                                            &lt;/li&gt;
\n
\n
\n                                                        &lt;/ul&gt;
\n
\n
\n                                                    &lt;/div&gt;
\n
\n
\n                                                &lt;/div&gt;
\n
\n
\n                                            &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                                        &lt;div class=&quot;item&quot;&gt;                                                &lt;div class=&quot;member&quot;&gt;                                                    &lt;div class=&quot;member-image&quot;&gt;                                                        &lt;img src=&quot;image/catalog/about/ourmember04.png&quot; alt=&quot;Image Client&quot;&gt;                                                        &lt;/div&gt;
\n
\n
\n                                                        &lt;div class=&quot;member-info&quot;&gt;                                                            &lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n
\n                                                            &lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n
\n                                                            &lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n
\n                                                            &lt;ul class=&quot;social-member&quot;&gt;
\n
\n
\n                                                                &lt;li class=&quot;social-icon rss&quot;&gt;                                                                    &lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;                                                                        &lt;span&gt;RSS&lt;/span&gt;                                                                    &lt;/a&gt;                                                                &lt;/li&gt;
\n
\n
\n                                                                &lt;li class=&quot;social-icon facebook&quot;&gt;                                                                    &lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;                                                                        &lt;span&gt;Facebook&lt;/span&gt;                                                                    &lt;/a&gt;                                                                &lt;/li&gt;
\n
\n
\n                                                                &lt;li class=&quot;social-icon twitter&quot;&gt;                                                                    &lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;                                                                        &lt;span&gt;Twitter&lt;/span&gt;                                                                    &lt;/a&gt;                                                                &lt;/li&gt;
\n
\n
\n                                                                &lt;li class=&quot;social-icon google&quot;&gt;                                                                    &lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;                                                                        &lt;span&gt;Google&lt;/span&gt;                                                                    &lt;/a&gt;                                                                &lt;/li&gt;
\n
\n
\n                                                            &lt;/ul&gt;
\n
\n
\n                                                        &lt;/div&gt;
\n
\n
\n                                                    &lt;/div&gt;
\n
\n
\n                                                &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                                                &lt;div class=&quot;item&quot;&gt;                                                    &lt;div class=&quot;member&quot;&gt;                                                        &lt;div class=&quot;member-image&quot;&gt;                                                            &lt;img src=&quot;image/catalog/about/ourmember01.png&quot; alt=&quot;Image Client&quot;&gt;                                                            &lt;/div&gt;
\n
\n
\n                                                            &lt;div class=&quot;member-info&quot;&gt;                                                                &lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n
\n                                                                &lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n
\n                                                                &lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n
\n                                                                &lt;ul class=&quot;social-member&quot;&gt;
\n
\n
\n                                                                    &lt;li class=&quot;social-icon rss&quot;&gt;                                                                        &lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;                                                                            &lt;span&gt;RSS&lt;/span&gt;                                                                        &lt;/a&gt;                                                                    &lt;/li&gt;
\n
\n
\n                                                                    &lt;li class=&quot;social-icon facebook&quot;&gt;                                                                        &lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;                                                                            &lt;span&gt;Facebook&lt;/span&gt;                                                                        &lt;/a&gt;                                                                    &lt;/li&gt;
\n
\n
\n                                                                    &lt;li class=&quot;social-icon twitter&quot;&gt;                                                                        &lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;                                                                            &lt;span&gt;Twitter&lt;/span&gt;                                                                        &lt;/a&gt;                                                                    &lt;/li&gt;
\n
\n
\n                                                                    &lt;li class=&quot;social-icon google&quot;&gt;                                                                        &lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;                                                                            &lt;span&gt;Google&lt;/span&gt;                                                                        &lt;/a&gt;                                                                    &lt;/li&gt;
\n
\n
\n                                                                &lt;/ul&gt;
\n
\n
\n                                                            &lt;/div&gt;
\n
\n
\n                                                        &lt;/div&gt;
\n
\n
\n                                                    &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                                                        &lt;div class=&quot;item&quot;&gt;                                                        &lt;div class=&quot;member&quot;&gt;                                                            &lt;div class=&quot;member-image&quot;&gt;                                                                &lt;img src=&quot;image/catalog/about/ourmember03.png&quot; alt=&quot;Image Client&quot;&gt;                                                                &lt;/div&gt;
\n
\n
\n                                                                &lt;div class=&quot;member-info&quot;&gt;                                                                    &lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n
\n                                                                    &lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n
\n                                                                    &lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n
\n                                                                    &lt;ul class=&quot;social-member&quot;&gt;
\n
\n
\n                                                                        &lt;li class=&quot;social-icon rss&quot;&gt;                                                                            &lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;                                                                                &lt;span&gt;RSS&lt;/span&gt;                                                                            &lt;/a&gt;                                                                        &lt;/li&gt;
\n
\n
\n                                                                        &lt;li class=&quot;social-icon facebook&quot;&gt;                                                                            &lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;                                                                                &lt;span&gt;Facebook&lt;/span&gt;                                                                            &lt;/a&gt;                                                                        &lt;/li&gt;
\n
\n
\n                                                                        &lt;li class=&quot;social-icon twitter&quot;&gt;                                                                            &lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;                                                                                &lt;span&gt;Twitter&lt;/span&gt;                                                                            &lt;/a&gt;                                                                        &lt;/li&gt;
\n
\n
\n                                                                        &lt;li class=&quot;social-icon google&quot;&gt;                                                                            &lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;                                                                                &lt;span&gt;Google&lt;/span&gt;                                                                            &lt;/a&gt;                                                                        &lt;/li&gt;
\n
\n
\n                                                                    &lt;/ul&gt;
\n
\n
\n                                                                &lt;/div&gt;
\n
\n
\n                                                            &lt;/div&gt;
\n
\n
\n                                                        &lt;/div&gt;
\n
\n
\n[/content_slider_item][/content_slider]                                                                                                        &lt;/div&gt;
\n
\n
\n                                                &lt;/div&gt;
\n
\n
\n                                            &lt;/div&gt;
\n
\n
\n                                        &lt;/div&gt;
\n
\n
\n                                        &lt;div class=&quot;row&quot;&gt;                                            &lt;div class=&quot;col-lg-12 col-md-12 client-logo&quot;&gt;                                                &lt;div class=&quot;client-logo-content&quot;&gt;                                                    &lt;h2 class=&quot;about-title&quot;&gt;Our Happy Clients&lt;/h2&gt;
\n
\n
\n                                                    &lt;div class=&quot;client-logo-slider&quot;&gt;													[content_slider items=\'6\' item_lg=\'6\' item_sm=\'3\' margin=\'30\' arrow=\'yes\' pagination=\'no\' loop=\'no\']													[content_slider_item]                                                        &lt;div class=&quot;item&quot;&gt;                                                            &lt;a href=&quot;#&quot; title=&quot;Client&quot;&gt;                                                                &lt;img src=&quot;image/catalog/about/about-client-1.png&quot; alt=&quot;Client&quot;&gt;                                                                &lt;/a&gt;                                                            &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                            &lt;div class=&quot;item&quot;&gt;                                                                &lt;a href=&quot;#&quot; title=&quot;Client&quot;&gt;                                                                    &lt;img src=&quot;image/catalog/about/about-client-2.png&quot; alt=&quot;Client&quot;&gt;                                                                    &lt;/a&gt;                                                                &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                &lt;div class=&quot;item&quot;&gt;                                                                    &lt;a href=&quot;#&quot; title=&quot;Client&quot;&gt;                                                                        &lt;img src=&quot;image/catalog/about/about-client-3.png&quot; alt=&quot;Client&quot;&gt;                                                                        &lt;/a&gt;                                                                    &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                    &lt;div class=&quot;item&quot;&gt;                                                                        &lt;a href=&quot;#&quot; title=&quot;Client&quot;&gt;                                                                            &lt;img src=&quot;image/catalog/about/about-client-4.png&quot; alt=&quot;Client&quot;&gt;                                                                            &lt;/a&gt;                                                                        &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                        &lt;div class=&quot;item&quot;&gt;                                                                            &lt;a href=&quot;#&quot; title=&quot;Client&quot;&gt;                                                                                &lt;img src=&quot;image/catalog/about/about-client-5.png&quot; alt=&quot;Client&quot;&gt;                                                                                &lt;/a&gt;                                                                            &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                            &lt;div class=&quot;item&quot;&gt;                                                                                &lt;a href=&quot;#&quot; title=&quot;Client&quot;&gt;                                                                                    &lt;img src=&quot;image/catalog/about/about-client-6.png&quot; alt=&quot;Client&quot;&gt;                                                                                    &lt;/a&gt;                                                                                &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                                &lt;div class=&quot;item&quot;&gt;                                                                                    &lt;a href=&quot;#&quot; title=&quot;Client&quot;&gt;                                                                                        &lt;img src=&quot;image/catalog/about/about-client-1.png&quot; alt=&quot;Client&quot;&gt;                                                                                        &lt;/a&gt;                                                                                    &lt;/div&gt;
\n
\n
\n[/content_slider_item][/content_slider]                                                                                &lt;/div&gt;
\n
\n
\n                                                                            &lt;/div&gt;
\n
\n
\n                                                                        &lt;/div&gt;
\n
\n
\n                                                                    &lt;/div&gt;
\n
\n
\n                                                                &lt;/div&gt;","About 2","",""),
("3","1","Pricing Tables","&lt;h3 class=&quot;text-center&quot;&gt;Pricing Table 1&lt;/h3&gt;
\n
\n
\n
\n[pricing_tables type=&quot;style1&quot; columns=&quot;4&quot; ][pricing_tables_item title=&quot;Premium&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;Buy Now&quot; price=&quot;$39/month&quot; featured=&quot;no&quot; text=&quot;&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [pricing_tables_item title=&quot;Professional&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;Buy Now&quot; price=&quot;$59/month&quot; featured=&quot;yes&quot; text=&quot;popular&quot; background=&quot;#4BB185&quot; color=&quot;#fff&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [pricing_tables_item title=&quot;Plus&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;Buy Now&quot; price=&quot;$99/month&quot; featured=&quot;no&quot; text=&quot;&quot;  ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [pricing_tables_item title=&quot;Maximum&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;Buy Now&quot; price=&quot;$199/month&quot; featured=&quot;no&quot; text=&quot;&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [/pricing_tables]&lt;p&gt;&lt;/p&gt;
\n
\n
\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;
\n
\n
\n&lt;h3 class=&quot;text-center&quot;&gt;Pricing Table 2&lt;/h3&gt;
\n
\n[pricing_tables type=&quot;style2&quot; columns=&quot;3&quot; ] [pricing_tables_item title=&quot;Standard&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;SIGN UP NOW&quot; price=&quot;$5/month&quot; featured=&quot;yes&quot; text=&quot;Classic Plan&quot; background=&quot;#4cbf8d&quot; color=&quot;#fff&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [pricing_tables_item title=&quot;Premium&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;SIGN UP NOW&quot; price=&quot;$39/month&quot;  featured=&quot;yes&quot; text=&quot;Best choise&quot; background=&quot;#e74847&quot; color=&quot;#fff&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [pricing_tables_item title=&quot;Professional&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;SIGN UP NOW&quot; price=&quot;$59/month&quot;  featured=&quot;yes&quot; text=&quot;unlimated features&quot; background=&quot;#50c1e9&quot; color=&quot;#fff&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [/pricing_tables]
\n
\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;
\n
\n&lt;h3 class=&quot;text-center&quot;&gt;Pricing Table 3&lt;/h3&gt;
\n
\n[pricing_tables type=&quot;style3&quot; columns=&quot;3&quot; ] [pricing_tables_item title=&quot;Standard&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;SIGN UP NOW&quot; price=&quot;$5/month&quot; featured=&quot;yes&quot; text=&quot;Classic Plan&quot; background=&quot;#e74847&quot; color=&quot;#fff&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [pricing_tables_item title=&quot;Premium&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;SIGN UP NOW&quot; price=&quot;$39/month&quot;  featured=&quot;yes&quot; text=&quot;Best choise&quot; background=&quot;#e74847&quot; color=&quot;#fff&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [pricing_tables_item title=&quot;Professional&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;SIGN UP NOW&quot; price=&quot;$59/month&quot;  featured=&quot;yes&quot; text=&quot;unlimated features&quot; background=&quot;#e74847&quot; color=&quot;#fff&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [/pricing_tables]","Privacy Policy","",""),
("3","2","Pricing Tables","&lt;h3 class=&quot;text-center&quot;&gt;Pricing Table 1&lt;/h3&gt;
\n
\n
\n
\n[pricing_tables type=&quot;style1&quot; columns=&quot;4&quot; ][pricing_tables_item title=&quot;Premium&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;Buy Now&quot; price=&quot;$39/month&quot; featured=&quot;no&quot; text=&quot;&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [pricing_tables_item title=&quot;Professional&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;Buy Now&quot; price=&quot;$59/month&quot; featured=&quot;yes&quot; text=&quot;popular&quot; background=&quot;#4BB185&quot; color=&quot;#fff&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [pricing_tables_item title=&quot;Plus&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;Buy Now&quot; price=&quot;$99/month&quot; featured=&quot;no&quot; text=&quot;&quot;  ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [pricing_tables_item title=&quot;Maximum&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;Buy Now&quot; price=&quot;$199/month&quot; featured=&quot;no&quot; text=&quot;&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [/pricing_tables]&lt;p&gt;&lt;/p&gt;
\n
\n
\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;
\n
\n
\n&lt;h3 class=&quot;text-center&quot;&gt;Pricing Table 2&lt;/h3&gt;
\n
\n[pricing_tables type=&quot;style2&quot; columns=&quot;3&quot; ] [pricing_tables_item title=&quot;Standard&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;SIGN UP NOW&quot; price=&quot;$5/month&quot; featured=&quot;yes&quot; text=&quot;Classic Plan&quot; background=&quot;#4cbf8d&quot; color=&quot;#fff&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [pricing_tables_item title=&quot;Premium&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;SIGN UP NOW&quot; price=&quot;$39/month&quot;  featured=&quot;yes&quot; text=&quot;Best choise&quot; background=&quot;#e74847&quot; color=&quot;#fff&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [pricing_tables_item title=&quot;Professional&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;SIGN UP NOW&quot; price=&quot;$59/month&quot;  featured=&quot;yes&quot; text=&quot;unlimated features&quot; background=&quot;#50c1e9&quot; color=&quot;#fff&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [/pricing_tables]
\n
\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;
\n
\n&lt;h3 class=&quot;text-center&quot;&gt;Pricing Table 3&lt;/h3&gt;
\n
\n[pricing_tables type=&quot;style3&quot; columns=&quot;3&quot; ] [pricing_tables_item title=&quot;Standard&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;SIGN UP NOW&quot; price=&quot;$5/month&quot; featured=&quot;yes&quot; text=&quot;Classic Plan&quot; background=&quot;#e74847&quot; color=&quot;#fff&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [pricing_tables_item title=&quot;Premium&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;SIGN UP NOW&quot; price=&quot;$39/month&quot;  featured=&quot;yes&quot; text=&quot;Best choise&quot; background=&quot;#e74847&quot; color=&quot;#fff&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [pricing_tables_item title=&quot;Professional&quot; icon_name=&quot;icon: angle-double-right&quot; button_link=&quot;http://smartaddons.com&quot; button_label=&quot;SIGN UP NOW&quot; price=&quot;$59/month&quot;  featured=&quot;yes&quot; text=&quot;unlimated features&quot; background=&quot;#e74847&quot; color=&quot;#fff&quot; ]&lt;ul&gt;
\n
\n
\n&lt;li&gt;Disk Space 10 GB&lt;/li&gt;
\n
\n
\n&lt;li&gt;Bandwidth Unlimited&lt;/li&gt;
\n
\n
\n&lt;li&gt;Setup Free (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 Free Email Accounts (?)&lt;/li&gt;
\n
\n
\n&lt;li&gt;1 FTP Accounts&lt;/li&gt;
\n
\n
\n&lt;li&gt;Half Privacy&lt;/li&gt;
\n
\n
\n&lt;/ul&gt;
\n
\n
\n[/pricing_tables_item] [/pricing_tables]","Privacy Policy","",""),
("11","2","Gallery","[gallery columns=&quot;4&quot; width=&quot;278&quot; height=&quot;180&quot; ] [gallery_item tag=&quot;Joomla&quot; title=&quot;Title gallery 1&quot; src=&quot;catalog/about/about-1.jpg&quot; video_addr=&quot;&quot; ] Image Description 1 [/gallery_item] [gallery_item tag=&quot;Joomla&quot; title=&quot;Title gallery 2 &quot; src=&quot;catalog/about/about-2.jpg&quot; video_addr=&quot;&quot; ] Image Description 2 [/gallery_item] [gallery_item tag=&quot;Wordpress&quot; title=&quot;Title gallery 3&quot; src=&quot;catalog/about/about-3.jpg&quot; video_addr=&quot;&quot; ] Image Description 3 [/gallery_item] [gallery_item tag=&quot;Magento&quot; title=&quot;Title gallery 4 &quot; src=&quot;catalog/about/about-1.jpg&quot; video_addr=&quot;&quot; ] Image Description 4 [/gallery_item] [gallery_item tag=&quot;Magento&quot; title=&quot;Title gallery 5&quot; src=&quot;catalog/about/about-2.jpg&quot; video_addr=&quot;&quot; ] Image Description 5 [/gallery_item]   [gallery_item tag=&quot;Magento&quot; title=&quot;Title gallery 6&quot; src=&quot;catalog/about/about-1.jpg&quot; video_addr=&quot;&quot; ] Image Description 6 [/gallery_item]    [gallery_item tag=&quot;Magento&quot; title=&quot;Title gallery 7&quot; src=&quot;catalog/about/about-3.jpg&quot; video_addr=&quot;&quot; ] Image Description 7 [/gallery_item]       [gallery_item tag=&quot;Magento&quot; title=&quot;Title gallery 8&quot; src=&quot;catalog/about/about-2.jpg&quot; video_addr=&quot;&quot; ] Image Description 8 [/gallery_item]  [/gallery]","Gallery","",""),
("7","1","About 2","&lt;div class=&quot;about-us about-demo-2&quot;&gt;    &lt;div class=&quot;row&quot;&gt;        &lt;div class=&quot;col-lg-12 col-md-12 about-us-center&quot;&gt;            &lt;div class=&quot;about-image-slider&quot;&gt;                	[content_slider item_lg=\'1\' item_sm=\'1\' item_xs=\'1\' margin=\'\' arrow=\'yes\' pagination=\'no\' loop=\'no\']			[content_slider_item]                &lt;img src=&quot;image/catalog/about/about-1.jpg&quot; alt=&quot;About Us&quot;&gt;		[/content_slider_item][content_slider_item]                    &lt;img src=&quot;image/catalog/about/about-2.jpg&quot; alt=&quot;About Us&quot;&gt;		[/content_slider_item][content_slider_item]                        &lt;img src=&quot;image/catalog/about/about-3.jpg&quot; alt=&quot;About Us&quot;&gt;		[/content_slider_item][/content_slider]&lt;/div&gt;
\n
\n
\n                        &lt;div class=&quot;content-description&quot;&gt;                            &lt;h2 class=&quot;about-title&quot;&gt;About Us&lt;/h2&gt;
\n
\n
\n                            &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. &lt;/p&gt;
\n
\n
\n                            &lt;p&gt;Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.&lt;/p&gt;
\n
\n
\n                        &lt;/div&gt;
\n
\n
\n                    &lt;/div&gt;
\n
\n
\n                &lt;/div&gt;
\n
\n
\n                &lt;div class=&quot;row&quot;&gt;                    &lt;div class=&quot;col-lg-12 col-md-12 our-team&quot;&gt;                        &lt;div class=&quot;our-team-content&quot;&gt;                            &lt;div class=&quot;our-team-slider&quot;&gt;							[content_slider items=\'4\' item_lg=\'4\' item_sm=\'2\' margin=\'30\' arrow=\'yes\' pagination=\'no\' loop=\'no\']							[content_slider_item]                                                                &lt;div class=&quot;item&quot;&gt;                                    &lt;div class=&quot;member&quot;&gt;                                        &lt;div class=&quot;member-image&quot;&gt;                                            &lt;img src=&quot;image/catalog/about/ourmember01.png&quot; alt=&quot;Image Client&quot;&gt;                                            &lt;/div&gt;
\n
\n
\n                                            &lt;div class=&quot;member-info&quot;&gt;                                                &lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n
\n                                                &lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n
\n                                                &lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n
\n                                                &lt;ul class=&quot;social-member&quot;&gt;
\n
\n
\n                                                    &lt;li class=&quot;social-icon rss&quot;&gt;                                                        &lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;                                                            &lt;span&gt;RSS&lt;/span&gt;                                                        &lt;/a&gt;                                                    &lt;/li&gt;
\n
\n
\n                                                    &lt;li class=&quot;social-icon facebook&quot;&gt;                                                        &lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;                                                            &lt;span&gt;Facebook&lt;/span&gt;                                                        &lt;/a&gt;                                                    &lt;/li&gt;
\n
\n
\n                                                    &lt;li class=&quot;social-icon twitter&quot;&gt;                                                        &lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;                                                            &lt;span&gt;Twitter&lt;/span&gt;                                                        &lt;/a&gt;                                                    &lt;/li&gt;
\n
\n
\n                                                    &lt;li class=&quot;social-icon google&quot;&gt;                                                        &lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;                                                            &lt;span&gt;Google&lt;/span&gt;                                                        &lt;/a&gt;                                                    &lt;/li&gt;
\n
\n
\n                                                &lt;/ul&gt;
\n
\n
\n                                            &lt;/div&gt;
\n
\n
\n                                        &lt;/div&gt;
\n
\n
\n                                    &lt;/div&gt;
\n
\n
\n									[/content_slider_item][content_slider_item]                                                                        &lt;div class=&quot;item&quot;&gt;                                        &lt;div class=&quot;member&quot;&gt;                                            &lt;div class=&quot;member-image&quot;&gt;                                                &lt;img src=&quot;image/catalog/about/ourmember02.png&quot; alt=&quot;Image Client&quot;&gt;                                                &lt;/div&gt;
\n
\n
\n                                                &lt;div class=&quot;member-info&quot;&gt;                                                    &lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n
\n                                                    &lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n
\n                                                    &lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n
\n                                                    &lt;ul class=&quot;social-member&quot;&gt;
\n
\n
\n                                                        &lt;li class=&quot;social-icon rss&quot;&gt;                                                            &lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;                                                                &lt;span&gt;RSS&lt;/span&gt;                                                            &lt;/a&gt;                                                        &lt;/li&gt;
\n
\n
\n                                                        &lt;li class=&quot;social-icon facebook&quot;&gt;                                                            &lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;                                                                &lt;span&gt;Facebook&lt;/span&gt;                                                            &lt;/a&gt;                                                        &lt;/li&gt;
\n
\n
\n                                                        &lt;li class=&quot;social-icon twitter&quot;&gt;                                                            &lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;                                                                &lt;span&gt;Twitter&lt;/span&gt;                                                            &lt;/a&gt;                                                        &lt;/li&gt;
\n
\n
\n                                                        &lt;li class=&quot;social-icon google&quot;&gt;                                                            &lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;                                                                &lt;span&gt;Google&lt;/span&gt;                                                            &lt;/a&gt;                                                        &lt;/li&gt;
\n
\n
\n                                                    &lt;/ul&gt;
\n
\n
\n                                                &lt;/div&gt;
\n
\n
\n                                            &lt;/div&gt;
\n
\n
\n                                        &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                                &lt;div class=&quot;item&quot;&gt;                                            &lt;div class=&quot;member&quot;&gt;                                                &lt;div class=&quot;member-image&quot;&gt;                                                    &lt;img src=&quot;image/catalog/about/ourmember03.png&quot; alt=&quot;Image Client&quot;&gt;                                                    &lt;/div&gt;
\n
\n
\n                                                    &lt;div class=&quot;member-info&quot;&gt;                                                        &lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n
\n                                                        &lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n
\n                                                        &lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n
\n                                                        &lt;ul class=&quot;social-member&quot;&gt;
\n
\n
\n                                                            &lt;li class=&quot;social-icon rss&quot;&gt;                                                                &lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;                                                                    &lt;span&gt;RSS&lt;/span&gt;                                                                &lt;/a&gt;                                                            &lt;/li&gt;
\n
\n
\n                                                            &lt;li class=&quot;social-icon facebook&quot;&gt;                                                                &lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;                                                                    &lt;span&gt;Facebook&lt;/span&gt;                                                                &lt;/a&gt;                                                            &lt;/li&gt;
\n
\n
\n                                                            &lt;li class=&quot;social-icon twitter&quot;&gt;                                                                &lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;                                                                    &lt;span&gt;Twitter&lt;/span&gt;                                                                &lt;/a&gt;                                                            &lt;/li&gt;
\n
\n
\n                                                            &lt;li class=&quot;social-icon google&quot;&gt;                                                                &lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;                                                                    &lt;span&gt;Google&lt;/span&gt;                                                                &lt;/a&gt;                                                            &lt;/li&gt;
\n
\n
\n                                                        &lt;/ul&gt;
\n
\n
\n                                                    &lt;/div&gt;
\n
\n
\n                                                &lt;/div&gt;
\n
\n
\n                                            &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                                        &lt;div class=&quot;item&quot;&gt;                                                &lt;div class=&quot;member&quot;&gt;                                                    &lt;div class=&quot;member-image&quot;&gt;                                                        &lt;img src=&quot;image/catalog/about/ourmember04.png&quot; alt=&quot;Image Client&quot;&gt;                                                        &lt;/div&gt;
\n
\n
\n                                                        &lt;div class=&quot;member-info&quot;&gt;                                                            &lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n
\n                                                            &lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n
\n                                                            &lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n
\n                                                            &lt;ul class=&quot;social-member&quot;&gt;
\n
\n
\n                                                                &lt;li class=&quot;social-icon rss&quot;&gt;                                                                    &lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;                                                                        &lt;span&gt;RSS&lt;/span&gt;                                                                    &lt;/a&gt;                                                                &lt;/li&gt;
\n
\n
\n                                                                &lt;li class=&quot;social-icon facebook&quot;&gt;                                                                    &lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;                                                                        &lt;span&gt;Facebook&lt;/span&gt;                                                                    &lt;/a&gt;                                                                &lt;/li&gt;
\n
\n
\n                                                                &lt;li class=&quot;social-icon twitter&quot;&gt;                                                                    &lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;                                                                        &lt;span&gt;Twitter&lt;/span&gt;                                                                    &lt;/a&gt;                                                                &lt;/li&gt;
\n
\n
\n                                                                &lt;li class=&quot;social-icon google&quot;&gt;                                                                    &lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;                                                                        &lt;span&gt;Google&lt;/span&gt;                                                                    &lt;/a&gt;                                                                &lt;/li&gt;
\n
\n
\n                                                            &lt;/ul&gt;
\n
\n
\n                                                        &lt;/div&gt;
\n
\n
\n                                                    &lt;/div&gt;
\n
\n
\n                                                &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                                                &lt;div class=&quot;item&quot;&gt;                                                    &lt;div class=&quot;member&quot;&gt;                                                        &lt;div class=&quot;member-image&quot;&gt;                                                            &lt;img src=&quot;image/catalog/about/ourmember01.png&quot; alt=&quot;Image Client&quot;&gt;                                                            &lt;/div&gt;
\n
\n
\n                                                            &lt;div class=&quot;member-info&quot;&gt;                                                                &lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n
\n                                                                &lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n
\n                                                                &lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n
\n                                                                &lt;ul class=&quot;social-member&quot;&gt;
\n
\n
\n                                                                    &lt;li class=&quot;social-icon rss&quot;&gt;                                                                        &lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;                                                                            &lt;span&gt;RSS&lt;/span&gt;                                                                        &lt;/a&gt;                                                                    &lt;/li&gt;
\n
\n
\n                                                                    &lt;li class=&quot;social-icon facebook&quot;&gt;                                                                        &lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;                                                                            &lt;span&gt;Facebook&lt;/span&gt;                                                                        &lt;/a&gt;                                                                    &lt;/li&gt;
\n
\n
\n                                                                    &lt;li class=&quot;social-icon twitter&quot;&gt;                                                                        &lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;                                                                            &lt;span&gt;Twitter&lt;/span&gt;                                                                        &lt;/a&gt;                                                                    &lt;/li&gt;
\n
\n
\n                                                                    &lt;li class=&quot;social-icon google&quot;&gt;                                                                        &lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;                                                                            &lt;span&gt;Google&lt;/span&gt;                                                                        &lt;/a&gt;                                                                    &lt;/li&gt;
\n
\n
\n                                                                &lt;/ul&gt;
\n
\n
\n                                                            &lt;/div&gt;
\n
\n
\n                                                        &lt;/div&gt;
\n
\n
\n                                                    &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                                                        &lt;div class=&quot;item&quot;&gt;                                                        &lt;div class=&quot;member&quot;&gt;                                                            &lt;div class=&quot;member-image&quot;&gt;                                                                &lt;img src=&quot;image/catalog/about/ourmember03.png&quot; alt=&quot;Image Client&quot;&gt;                                                                &lt;/div&gt;
\n
\n
\n                                                                &lt;div class=&quot;member-info&quot;&gt;                                                                    &lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n
\n                                                                    &lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n
\n                                                                    &lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n
\n                                                                    &lt;ul class=&quot;social-member&quot;&gt;
\n
\n
\n                                                                        &lt;li class=&quot;social-icon rss&quot;&gt;                                                                            &lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;                                                                                &lt;span&gt;RSS&lt;/span&gt;                                                                            &lt;/a&gt;                                                                        &lt;/li&gt;
\n
\n
\n                                                                        &lt;li class=&quot;social-icon facebook&quot;&gt;                                                                            &lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;                                                                                &lt;span&gt;Facebook&lt;/span&gt;                                                                            &lt;/a&gt;                                                                        &lt;/li&gt;
\n
\n
\n                                                                        &lt;li class=&quot;social-icon twitter&quot;&gt;                                                                            &lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;                                                                                &lt;span&gt;Twitter&lt;/span&gt;                                                                            &lt;/a&gt;                                                                        &lt;/li&gt;
\n
\n
\n                                                                        &lt;li class=&quot;social-icon google&quot;&gt;                                                                            &lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;                                                                                &lt;span&gt;Google&lt;/span&gt;                                                                            &lt;/a&gt;                                                                        &lt;/li&gt;
\n
\n
\n                                                                    &lt;/ul&gt;
\n
\n
\n                                                                &lt;/div&gt;
\n
\n
\n                                                            &lt;/div&gt;
\n
\n
\n                                                        &lt;/div&gt;
\n
\n
\n[/content_slider_item][/content_slider]                                                                                                        &lt;/div&gt;
\n
\n
\n                                                &lt;/div&gt;
\n
\n
\n                                            &lt;/div&gt;
\n
\n
\n                                        &lt;/div&gt;
\n
\n
\n                                        &lt;div class=&quot;row&quot;&gt;                                            &lt;div class=&quot;col-lg-12 col-md-12 client-logo&quot;&gt;                                                &lt;div class=&quot;client-logo-content&quot;&gt;                                                    &lt;h2 class=&quot;about-title&quot;&gt;Our Happy Clients&lt;/h2&gt;
\n
\n
\n                                                    &lt;div class=&quot;client-logo-slider&quot;&gt;													[content_slider items=\'6\' item_lg=\'6\' item_sm=\'3\' margin=\'30\' arrow=\'yes\' pagination=\'no\' loop=\'no\']													[content_slider_item]                                                        &lt;div class=&quot;item&quot;&gt;                                                            &lt;a href=&quot;#&quot; title=&quot;Client&quot;&gt;                                                                &lt;img src=&quot;image/catalog/about/about-client-1.png&quot; alt=&quot;Client&quot;&gt;                                                                &lt;/a&gt;                                                            &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                            &lt;div class=&quot;item&quot;&gt;                                                                &lt;a href=&quot;#&quot; title=&quot;Client&quot;&gt;                                                                    &lt;img src=&quot;image/catalog/about/about-client-2.png&quot; alt=&quot;Client&quot;&gt;                                                                    &lt;/a&gt;                                                                &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                &lt;div class=&quot;item&quot;&gt;                                                                    &lt;a href=&quot;#&quot; title=&quot;Client&quot;&gt;                                                                        &lt;img src=&quot;image/catalog/about/about-client-3.png&quot; alt=&quot;Client&quot;&gt;                                                                        &lt;/a&gt;                                                                    &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                    &lt;div class=&quot;item&quot;&gt;                                                                        &lt;a href=&quot;#&quot; title=&quot;Client&quot;&gt;                                                                            &lt;img src=&quot;image/catalog/about/about-client-4.png&quot; alt=&quot;Client&quot;&gt;                                                                            &lt;/a&gt;                                                                        &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                        &lt;div class=&quot;item&quot;&gt;                                                                            &lt;a href=&quot;#&quot; title=&quot;Client&quot;&gt;                                                                                &lt;img src=&quot;image/catalog/about/about-client-5.png&quot; alt=&quot;Client&quot;&gt;                                                                                &lt;/a&gt;                                                                            &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                            &lt;div class=&quot;item&quot;&gt;                                                                                &lt;a href=&quot;#&quot; title=&quot;Client&quot;&gt;                                                                                    &lt;img src=&quot;image/catalog/about/about-client-6.png&quot; alt=&quot;Client&quot;&gt;                                                                                    &lt;/a&gt;                                                                                &lt;/div&gt;
\n
\n
\n[/content_slider_item][content_slider_item]                                                                                &lt;div class=&quot;item&quot;&gt;                                                                                    &lt;a href=&quot;#&quot; title=&quot;Client&quot;&gt;                                                                                        &lt;img src=&quot;image/catalog/about/about-client-1.png&quot; alt=&quot;Client&quot;&gt;                                                                                        &lt;/a&gt;                                                                                    &lt;/div&gt;
\n
\n
\n[/content_slider_item][/content_slider]                                                                                &lt;/div&gt;
\n
\n
\n                                                                            &lt;/div&gt;
\n
\n
\n                                                                        &lt;/div&gt;
\n
\n
\n                                                                    &lt;/div&gt;
\n
\n
\n                                                                &lt;/div&gt;","About 2","",""),
("11","1","Gallery","[gallery columns=&quot;4&quot; width=&quot;278&quot; height=&quot;180&quot; ] 
\n[gallery_item tag=&quot;Joomla&quot; title=&quot;Title gallery 1&quot; src=&quot;catalog/about/about-1.jpg&quot; video_addr=&quot;&quot; ] Image Description 1 [/gallery_item] 
\n[gallery_item tag=&quot;Joomla&quot; title=&quot;Title gallery 2 &quot; src=&quot;catalog/about/about-2.jpg&quot; video_addr=&quot;&quot; ] Image Description 2 [/gallery_item]
\n [gallery_item tag=&quot;Wordpress&quot; title=&quot;Title gallery 3&quot; src=&quot;catalog/about/about-3.jpg&quot; video_addr=&quot;&quot; ] Image Description 3 [/gallery_item]
\n [gallery_item tag=&quot;Magento&quot; title=&quot;Title gallery 4 &quot; src=&quot;catalog/about/about-1.jpg&quot; video_addr=&quot;&quot; ] Image Description 4 [/gallery_item]
\n [gallery_item tag=&quot;Magento&quot; title=&quot;Title gallery 5&quot; src=&quot;catalog/about/about-2.jpg&quot; video_addr=&quot;&quot; ] Image Description 5 [/gallery_item] 
\n  [gallery_item tag=&quot;Magento&quot; title=&quot;Title gallery 6&quot; src=&quot;catalog/about/about-1.jpg&quot; video_addr=&quot;&quot; ] Image Description 6 [/gallery_item] 
\n   [gallery_item tag=&quot;Magento&quot; title=&quot;Title gallery 7&quot; src=&quot;catalog/about/about-3.jpg&quot; video_addr=&quot;&quot; ] Image Description 7 [/gallery_item] 
\n      [gallery_item tag=&quot;Magento&quot; title=&quot;Title gallery 8&quot; src=&quot;catalog/about/about-2.jpg&quot; video_addr=&quot;&quot; ] Image Description 8 [/gallery_item] 
\n
\n [/gallery]","gallery","",""),
("4","2","عنا","&lt;div class=&quot;about-us about-demo-1&quot;&gt;	&lt;div class=&quot;row&quot;&gt;		&lt;div class=&quot;col-lg-5 col-md-5 about-image&quot;&gt;			&lt;img src=&quot;image/catalog/about/wellcometoshop.png&quot; alt=&quot;About Us&quot;&gt;		&lt;/div&gt;
\n
\n				&lt;div class=&quot;col-lg-7 col-md-7 about-info&quot;&gt;			&lt;h2 class=&quot;about-title&quot;&gt;&lt;span&gt;About Us&lt;/span&gt;&lt;/h2&gt;
\n
\n			&lt;div class=&quot;about-text&quot;&gt;				&lt;p&gt;					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.				&lt;/p&gt;
\n
\n				&lt;p&gt;					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.&lt;br&gt;					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.				&lt;/p&gt;
\n
\n			&lt;/div&gt;
\n
\n		&lt;/div&gt;
\n
\n	&lt;/div&gt;
\n
\n		&lt;div class=&quot;row&quot;&gt;		&lt;div class=&quot;col-lg-12 col-md-12 what-client-say&quot;&gt;					&lt;div class=&quot;client-say-content&quot;&gt;						&lt;h2 class=&quot;about-title line-hori&quot;&gt;&lt;span&gt;What Clients Say&lt;/span&gt;&lt;/h2&gt;
\n
\n								&lt;div class=&quot;client-say-slider&quot;&gt;												[content_slider items=\'1\' item_lg=\'1\' item_sm=\'1\' margin=\'30\' pagination=\'yes\' arrows=\'no\' loop=\'no\']					[content_slider_item]					&lt;div class=&quot;item&quot;&gt;						&lt;p class=&quot;des-member des-client&quot;&gt;“Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.”&lt;/p&gt;
\n
\n						&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n						&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;p class=&quot;des-member des-client&quot;&gt;“Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.”&lt;/p&gt;
\n
\n						&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n						&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;p class=&quot;des-member des-client&quot;&gt;“Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.”&lt;/p&gt;
\n
\n						&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n						&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;p class=&quot;des-member des-client&quot;&gt;“Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.”&lt;/p&gt;
\n
\n						&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n						&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][/content_slider]				&lt;/div&gt;
\n
\n											&lt;/div&gt;
\n
\n		&lt;/div&gt;
\n
\n	&lt;/div&gt;
\n
\n		&lt;div class=&quot;row&quot;&gt;		&lt;div class=&quot;col-lg-12 col-md-12 our-team&quot;&gt;			&lt;div class=&quot;our-team-content&quot;&gt;				&lt;h2 class=&quot;about-title line-hori&quot;&gt;&lt;span&gt;Our Team&lt;/span&gt;&lt;/h2&gt;
\n
\n								&lt;div class=&quot;our-team-slider&quot;&gt;					[content_slider items=\'4\' item_lg=\'4\' item_sm=\'2\' margin=\'30\' arrow=\'yes\' pagination=\'no\' loop=\'no\']					[content_slider_item]					&lt;div class=&quot;item&quot;&gt;						&lt;div class=&quot;member&quot;&gt;							&lt;div class=&quot;member-image&quot;&gt;								&lt;img src=&quot;image/catalog/about/ourmember01.png&quot; alt=&quot;Image Client&quot;&gt;							&lt;/div&gt;
\n
\n														&lt;div class=&quot;member-info&quot;&gt;								&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n								&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n								&lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n								&lt;ul class=&quot;social-member&quot;&gt;
\n
\n									&lt;li class=&quot;social-icon rss&quot;&gt;&lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;&lt;span&gt;RSS&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon facebook&quot;&gt;&lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;&lt;span&gt;Facebook&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon twitter&quot;&gt;&lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;&lt;span&gt;Twitter&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon google&quot;&gt;&lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;&lt;span&gt;Google&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n								&lt;/ul&gt;
\n
\n							&lt;/div&gt;
\n
\n						&lt;/div&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;div class=&quot;member&quot;&gt;							&lt;div class=&quot;member-image&quot;&gt;								&lt;img src=&quot;image/catalog/about/ourmember02.png&quot; alt=&quot;Image Client&quot;&gt;							&lt;/div&gt;
\n
\n														&lt;div class=&quot;member-info&quot;&gt;								&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n								&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n								&lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n								&lt;ul class=&quot;social-member&quot;&gt;
\n
\n									&lt;li class=&quot;social-icon rss&quot;&gt;&lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;&lt;span&gt;RSS&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon facebook&quot;&gt;&lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;&lt;span&gt;Facebook&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon twitter&quot;&gt;&lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;&lt;span&gt;Twitter&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon google&quot;&gt;&lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;&lt;span&gt;Google&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n								&lt;/ul&gt;
\n
\n							&lt;/div&gt;
\n
\n						&lt;/div&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;div class=&quot;member&quot;&gt;							&lt;div class=&quot;member-image&quot;&gt;								&lt;img src=&quot;image/catalog/about/ourmember03.png&quot; alt=&quot;Image Client&quot;&gt;							&lt;/div&gt;
\n
\n														&lt;div class=&quot;member-info&quot;&gt;								&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n								&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n								&lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n								&lt;ul class=&quot;social-member&quot;&gt;
\n
\n									&lt;li class=&quot;social-icon rss&quot;&gt;&lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;&lt;span&gt;RSS&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon facebook&quot;&gt;&lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;&lt;span&gt;Facebook&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon twitter&quot;&gt;&lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;&lt;span&gt;Twitter&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon google&quot;&gt;&lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;&lt;span&gt;Google&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n								&lt;/ul&gt;
\n
\n							&lt;/div&gt;
\n
\n						&lt;/div&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;div class=&quot;member&quot;&gt;							&lt;div class=&quot;member-image&quot;&gt;								&lt;img src=&quot;image/catalog/about/ourmember04.png&quot; alt=&quot;Image Client&quot;&gt;							&lt;/div&gt;
\n
\n														&lt;div class=&quot;member-info&quot;&gt;								&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n								&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n								&lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n								&lt;ul class=&quot;social-member&quot;&gt;
\n
\n									&lt;li class=&quot;social-icon rss&quot;&gt;&lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;&lt;span&gt;RSS&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon facebook&quot;&gt;&lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;&lt;span&gt;Facebook&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon twitter&quot;&gt;&lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;&lt;span&gt;Twitter&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon google&quot;&gt;&lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;&lt;span&gt;Google&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n								&lt;/ul&gt;
\n
\n							&lt;/div&gt;
\n
\n						&lt;/div&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;div class=&quot;member&quot;&gt;							&lt;div class=&quot;member-image&quot;&gt;								&lt;img src=&quot;image/catalog/about/ourmember01.png&quot; alt=&quot;Image Client&quot;&gt;							&lt;/div&gt;
\n
\n														&lt;div class=&quot;member-info&quot;&gt;								&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n								&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n								&lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n								&lt;ul class=&quot;social-member&quot;&gt;
\n
\n									&lt;li class=&quot;social-icon rss&quot;&gt;&lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;&lt;span&gt;RSS&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon facebook&quot;&gt;&lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;&lt;span&gt;Facebook&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon twitter&quot;&gt;&lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;&lt;span&gt;Twitter&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon google&quot;&gt;&lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;&lt;span&gt;Google&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n								&lt;/ul&gt;
\n
\n							&lt;/div&gt;
\n
\n						&lt;/div&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][content_slider_item]										&lt;div class=&quot;item&quot;&gt;						&lt;div class=&quot;member&quot;&gt;							&lt;div class=&quot;member-image&quot;&gt;								&lt;img src=&quot;image/catalog/about/ourmember03.png&quot; alt=&quot;Image Client&quot;&gt;							&lt;/div&gt;
\n
\n														&lt;div class=&quot;member-info&quot;&gt;								&lt;h3 class=&quot;name-member&quot;&gt;Jennifer lawrence&lt;/h3&gt;
\n
\n								&lt;p class=&quot;job-member&quot;&gt;Co Founder&lt;/p&gt;
\n
\n								&lt;p class=&quot;des-member&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer condimentum&lt;/p&gt;
\n
\n								&lt;ul class=&quot;social-member&quot;&gt;
\n
\n									&lt;li class=&quot;social-icon rss&quot;&gt;&lt;a class=&quot;fa fa-rss&quot; href=&quot;#&quot; title=&quot;RSS&quot;&gt;&lt;span&gt;RSS&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon facebook&quot;&gt;&lt;a class=&quot;fa fa-facebook&quot; href=&quot;#&quot; title=&quot;Facebook&quot;&gt;&lt;span&gt;Facebook&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon twitter&quot;&gt;&lt;a class=&quot;fa fa-twitter&quot; href=&quot;#&quot; title=&quot;Twitter&quot;&gt;&lt;span&gt;Twitter&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n									&lt;li class=&quot;social-icon google&quot;&gt;&lt;a class=&quot;fa fa-google&quot; href=&quot;#&quot; title=&quot;Google&quot;&gt;&lt;span&gt;Google&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
\n
\n								&lt;/ul&gt;
\n
\n							&lt;/div&gt;
\n
\n						&lt;/div&gt;
\n
\n					&lt;/div&gt;
\n
\n[/content_slider_item][/content_slider]				&lt;/div&gt;
\n
\n															&lt;/div&gt;
\n
\n		&lt;/div&gt;
\n
\n	&lt;/div&gt;
\n
\n	&lt;/div&gt;","About Us","","");


DROP TABLE IF EXISTS ?:information_to_store;
CREATE TABLE `?:information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO ?:information_to_store VALUES
("3","0"),
("3","2"),
("3","6"),
("3","7"),
("3","8"),
("3","9"),
("3","10"),
("4","0"),
("4","2"),
("4","6"),
("4","7"),
("4","8"),
("4","9"),
("4","10"),
("5","0"),
("5","2"),
("5","6"),
("5","7"),
("5","8"),
("5","9"),
("5","10"),
("6","0"),
("6","2"),
("6","6"),
("6","7"),
("6","8"),
("6","9"),
("6","10"),
("7","0"),
("7","2"),
("7","6"),
("7","7"),
("7","8"),
("7","9"),
("7","10"),
("8","0"),
("8","2"),
("8","6"),
("8","7"),
("8","8"),
("8","9"),
("8","10"),
("9","0"),
("9","2"),
("9","6"),
("9","7"),
("9","8"),
("9","9"),
("9","10"),
("11","0"),
("11","2"),
("11","6"),
("11","7"),
("11","8"),
("11","9"),
("11","10");


DROP TABLE IF EXISTS ?:layout_module;
CREATE TABLE `?:layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3837 DEFAULT CHARSET=utf8;

INSERT INTO ?:layout_module VALUES
("3046","2","so_searchpro.94","content_search","0"),
("3047","2","so_basic_products.108","content_bottom","0"),
("3045","2","so_megamenu.119","content_menu","0"),
("3044","2","newsletters","content_block4","1"),
("3043","2","html.87","content_block4","0"),
("3048","2","so_megamenu.124","content_block1","0"),
("3056","3","html.148","column_left","2"),
("3050","3","html.87","content_block4","0"),
("3055","3","so_megamenu.119","content_menu","0"),
("3051","3","so_searchpro.94","content_search","0"),
("3054","3","so_extra_slider.125","column_left","1"),
("3049","3","so_megamenu.124","content_block1","0"),
("3053","3","category","column_left","0"),
("3052","3","newsletters","content_block4","1"),
("2935","4","so_searchpro.94","content_search","0"),
("2937","4","so_megamenu.124","content_block1","0"),
("2933","4","newsletters","content_block4","1"),
("2936","4","so_megamenu.119","content_menu","0"),
("2934","4","html.87","content_block4","0"),
("2998","6","so_megamenu.119","content_menu","0"),
("2999","6","so_megamenu.124","content_block1","0"),
("2995","6","html.87","content_block4","0"),
("2996","6","newsletters","content_block4","1"),
("2997","6","so_searchpro.94","content_search","0"),
("2585","31","so_extra_slider.125","column_left","1"),
("2583","31","so_searchpro.94","content_search","0"),
("2581","31","html.87","content_block4","0"),
("2586","31","newsletters","content_block4","1"),
("2584","31","so_megamenu.119","content_menu","0"),
("2582","31","simple_blog_category","column_left","0"),
("2950","41","so_searchpro.94","content_search","0"),
("2949","41","html.87","content_block4","0"),
("2951","41","so_megamenu.119","content_menu","0"),
("2953","41","so_megamenu.124","content_block1","0"),
("2952","41","newsletters","content_block4","1"),
("2942","42","so_megamenu.124","content_block1","0"),
("2938","42","so_megamenu.119","content_menu","0"),
("2939","42","so_searchpro.94","content_search","0"),
("2940","42","html.87","content_block4","0"),
("2941","42","newsletters","content_block4","1"),
("2954","43","so_megamenu.119","content_menu","0"),
("2956","43","html.87","content_block4","0"),
("2957","43","newsletters","content_block4","1"),
("2955","43","so_searchpro.94","content_search","0"),
("2958","43","so_megamenu.124","content_block1","0"),
("2963","44","so_megamenu.124","content_block1","0"),
("2962","44","newsletters","content_block4","1"),
("2959","44","so_megamenu.119","content_menu","0"),
("2960","44","so_searchpro.94","content_search","0"),
("2961","44","html.87","content_block4","0"),
("2967","45","newsletters","content_block4","1"),
("2968","45","so_megamenu.124","content_block1","0"),
("2966","45","html.87","content_block4","0"),
("2964","45","so_megamenu.119","content_menu","0"),
("2965","45","so_searchpro.94","content_search","0"),
("3004","46","newsletters","content_block4","1"),
("3003","46","so_megamenu.119","content_menu","0"),
("3002","46","so_searchpro.94","content_search","0"),
("3000","46","html.87","content_block4","0"),
("3001","46","so_megamenu.124","content_block1","0"),
("2976","47","so_searchpro.94","content_search","0"),
("2977","47","html.87","content_block4","0"),
("2979","47","so_megamenu.124","content_block1","0"),
("2978","47","newsletters","content_block4","1"),
("2975","47","so_megamenu.119","content_menu","0"),
("2984","48","so_megamenu.124","content_block1","0"),
("2983","48","newsletters","content_block4","1"),
("2982","48","html.87","content_block4","0"),
("2981","48","so_searchpro.94","content_search","0"),
("2980","48","so_megamenu.119","content_menu","0"),
("2994","49","so_megamenu.124","content_block1","0"),
("2990","49","so_megamenu.119","content_menu","0"),
("2991","49","so_searchpro.94","content_search","0"),
("2992","49","html.87","content_block4","0"),
("2993","49","newsletters","content_block4","1"),
("3733","28","so_extra_slider.177","column_left","1"),
("3732","28","so_category_slider.133","content_block1","4"),
("3729","28","banner.135","content_top","0"),
("3730","28","so_category_slider.130","content_block1","2"),
("3727","28","html.87","content_block4","0"),
("3728","28","html.81","content_block2","0"),
("3731","28","newsletters","content_block4","1"),
("3734","28","so_megamenu.119","content_menu","0"),
("3735","28","html.40","column_left","3"),
("3736","28","manufacturers","column_left","5"),
("3737","28","html.128","column_left","4"),
("3739","28","so_category_slider.132","content_block1","3"),
("3738","28","so_deals.129","content_block1","1"),
("3741","28","so_searchpro.94","content_search","0"),
("3726","28","html.180","content_top","1");


DROP TABLE IF EXISTS ?:mega_menu;
CREATE TABLE `?:mega_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `rang` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL DEFAULT '',
  `name` text,
  `type_link` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `link` text,
  `description` text,
  `new_window` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `submenu_width` text,
  `submenu_type` int(11) NOT NULL DEFAULT '0',
  `content_width` int(11) NOT NULL DEFAULT '12',
  `content_type` int(11) NOT NULL DEFAULT '0',
  `content` text,
  `label_item` varchar(255) NOT NULL DEFAULT '',
  `icon_font` varchar(255) NOT NULL DEFAULT '',
  `class_menu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

INSERT INTO ?:mega_menu VALUES
("90","89","1","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:12:\"Theme Colors\";i:2;s:12:\"Theme Colors\";}","0","119","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","6","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:809:\"&lt;div class=&quot;column layout-color&quot;&gt; &lt;a&gt;Theme Colors&lt;/a&gt;
\n	&lt;div&gt;	
\n		&lt;ul class=&quot;row-list&quot;&gt;
\n			&lt;li class=&quot;color orange&quot;&gt;&lt;a href=&quot;index.php?scheme=default&quot;&gt;Orange Color&lt;/a&gt;&lt;/li&gt;
\n			&lt;li class=&quot;color green&quot;&gt;&lt;a href=&quot;index.php?scheme=green&quot;&gt;Green Color&lt;/a&gt;&lt;/li&gt;
\n			&lt;li class=&quot;color boocdo&quot;&gt;&lt;a href=&quot;index.php?scheme=boocdo&quot;&gt;Red Color&lt;/a&gt;&lt;/li&gt;
\n			&lt;li class=&quot;color blue&quot;&gt;&lt;a href=&quot;index.php?scheme=blue&quot;&gt;Blue Color&lt;/a&gt;&lt;/li&gt;
\n			&lt;li class=&quot;color cyan&quot;&gt;&lt;a href=&quot;index.php?scheme=cyan&quot;&gt;Blue Color&lt;/a&gt;&lt;/li&gt;
\n		&lt;/ul&gt;
\n	&lt;/div&gt;
\n&lt;/div&gt;\";i:2;s:809:\"&lt;div class=&quot;column layout-color&quot;&gt; &lt;a&gt;Theme Colors&lt;/a&gt;
\n	&lt;div&gt;	
\n		&lt;ul class=&quot;row-list&quot;&gt;
\n			&lt;li class=&quot;color orange&quot;&gt;&lt;a href=&quot;index.php?scheme=default&quot;&gt;Orange Color&lt;/a&gt;&lt;/li&gt;
\n			&lt;li class=&quot;color green&quot;&gt;&lt;a href=&quot;index.php?scheme=green&quot;&gt;Green Color&lt;/a&gt;&lt;/li&gt;
\n			&lt;li class=&quot;color boocdo&quot;&gt;&lt;a href=&quot;index.php?scheme=boocdo&quot;&gt;Red Color&lt;/a&gt;&lt;/li&gt;
\n			&lt;li class=&quot;color blue&quot;&gt;&lt;a href=&quot;index.php?scheme=blue&quot;&gt;Blue Color&lt;/a&gt;&lt;/li&gt;
\n			&lt;li class=&quot;color cyan&quot;&gt;&lt;a href=&quot;index.php?scheme=cyan&quot;&gt;Blue Color&lt;/a&gt;&lt;/li&gt;
\n		&lt;/ul&gt;
\n	&lt;/div&gt;
\n&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","hot","fa fa-camera-retro",""),
("128","0","8","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:11:\"Accessories\";i:2;s:11:\"Accessories\";}","0","119","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","Hot",""," item-style2"),
("127","89","2","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:7:\"Layouts\";i:2;s:7:\"Layouts\";}","0","119","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","6","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:1311:\"&lt;div class=&quot;column&quot;&gt;		
\n	&lt;a&gt;Layouts&lt;/a&gt;	
\n	&lt;div&gt;	
\n	&lt;div class=&quot;row&quot;&gt;
\n		&lt;div class=&quot;col-md-6&quot;&gt;
\n			&lt;ul class=&quot;row-list&quot;&gt;
\n				&lt;li&gt;&lt;a href=&quot;http://opencart.magentech.com/themes/so_maxshop/&quot;&gt;Home Style 1&lt;/a&gt;&lt;/li&gt;
\n				&lt;li&gt;&lt;a href=&quot;http://opencart.magentech.com/themes/so_maxshop/layout2/&quot;&gt;Home Style 2&lt;/a&gt;&lt;/li&gt;
\n				&lt;li&gt;&lt;a href=&quot;http://opencart.magentech.com/themes/so_maxshop/layout3/&quot;&gt;Home Style 3&lt;/a&gt;&lt;/li&gt;
\n				&lt;li&gt;&lt;a href=&quot;http://opencart.magentech.com/themes/so_maxshop/layout4/&quot;&gt;Home Style 4&lt;/a&gt;&lt;/li&gt;
\n			&lt;/ul&gt;
\n		&lt;/div&gt;
\n		&lt;div class=&quot;col-md-6&quot;&gt;
\n			&lt;ul class=&quot;row-list&quot;&gt;
\n				&lt;li&gt;&lt;a href=&quot;http://opencart.magentech.com/themes/so_maxshop/layout5/&quot;&gt;Home Style 5&lt;/a&gt;&lt;/li&gt;
\n				&lt;li&gt;&lt;a href=&quot;http://opencart.magentech.com/themes/so_maxshop/layout6/&quot;&gt;Home Style 6&lt;/a&gt;&lt;/li&gt;
\n				&lt;li&gt;&lt;a href=&quot;http://opencart.magentech.com/themes/so_maxshop/layout7/&quot;&gt;Home Style 7&lt;/a&gt;&lt;/li&gt;
\n			&lt;/ul&gt;
\n		&lt;/div&gt;
\n	&lt;/div&gt;
\n	&lt;/div&gt;
\n&lt;/div&gt;\";i:2;s:1311:\"&lt;div class=&quot;column&quot;&gt;		
\n	&lt;a&gt;Layouts&lt;/a&gt;	
\n	&lt;div&gt;	
\n	&lt;div class=&quot;row&quot;&gt;
\n		&lt;div class=&quot;col-md-6&quot;&gt;
\n			&lt;ul class=&quot;row-list&quot;&gt;
\n				&lt;li&gt;&lt;a href=&quot;http://opencart.magentech.com/themes/so_maxshop/&quot;&gt;Home Style 1&lt;/a&gt;&lt;/li&gt;
\n				&lt;li&gt;&lt;a href=&quot;http://opencart.magentech.com/themes/so_maxshop/layout2/&quot;&gt;Home Style 2&lt;/a&gt;&lt;/li&gt;
\n				&lt;li&gt;&lt;a href=&quot;http://opencart.magentech.com/themes/so_maxshop/layout3/&quot;&gt;Home Style 3&lt;/a&gt;&lt;/li&gt;
\n				&lt;li&gt;&lt;a href=&quot;http://opencart.magentech.com/themes/so_maxshop/layout4/&quot;&gt;Home Style 4&lt;/a&gt;&lt;/li&gt;
\n			&lt;/ul&gt;
\n		&lt;/div&gt;
\n		&lt;div class=&quot;col-md-6&quot;&gt;
\n			&lt;ul class=&quot;row-list&quot;&gt;
\n				&lt;li&gt;&lt;a href=&quot;http://opencart.magentech.com/themes/so_maxshop/layout5/&quot;&gt;Home Style 5&lt;/a&gt;&lt;/li&gt;
\n				&lt;li&gt;&lt;a href=&quot;http://opencart.magentech.com/themes/so_maxshop/layout6/&quot;&gt;Home Style 6&lt;/a&gt;&lt;/li&gt;
\n				&lt;li&gt;&lt;a href=&quot;http://opencart.magentech.com/themes/so_maxshop/layout7/&quot;&gt;Home Style 7&lt;/a&gt;&lt;/li&gt;
\n			&lt;/ul&gt;
\n		&lt;/div&gt;
\n	&lt;/div&gt;
\n	&lt;/div&gt;
\n&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("134","128","10","http://dev.ytcvn.com/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:12:\"Best sellers\";i:2;s:25:\"أفضل البائعين\";}","0","119","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","6","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:2:\"33\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"0\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:1:\"3\";s:4:\"type\";s:10:\"bestseller\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"2\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("130","128","9","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:10:\"Automotive\";i:2;s:10:\"Automotive\";}","0","119","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","8","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:2:\"33\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"0\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:4:{i:0;a:3:{s:4:\"name\";s:10:\"Automotive\";s:2:\"id\";i:33;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:42:\"Automotive  >  Car Alarms and Security\";s:2:\"id\";i:61;}i:1;a:2:{s:4:\"name\";s:39:\"Automotive  >  Car Audio & Speakers\";s:2:\"id\";i:62;}i:2;a:2:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;}}}i:1;a:3:{s:4:\"name\";s:20:\"Smartphone & Tablets\";s:2:\"id\";i:34;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:50:\"Smartphone & Tablets  >  Accessories for i Pad\";s:2:\"id\";i:44;}i:1;a:2:{s:4:\"name\";s:7:\"Apparel\";s:2:\"id\";i:78;}i:2;a:2:{s:4:\"name\";s:51:\"Smartphone & Tablets  >  Accessories for iPhone\";s:2:\"id\";i:43;}}}i:2;a:3:{s:4:\"name\";s:17:\"Sports & Outdoors\";s:2:\"id\";i:25;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:42:\"Sports & Outdoors  >  Camping & Hiking\";s:2:\"id\";i:35;}i:1;a:2:{s:4:\"name\";s:15:\"Cameras & Photo\";s:2:\"id\";i:82;}i:2;a:2:{s:4:\"name\";s:19:\"Cables & Connectors\";s:2:\"id\";i:77;}}}i:3;a:3:{s:4:\"name\";s:11:\"Electronics\";s:2:\"id\";i:18;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:42:\"Electronics  >  Battereries & Chargers\";s:2:\"id\";i:46;}i:1;a:2:{s:4:\"name\";s:35:\"Health & Beauty  >  Bath & Body\";s:2:\"id\";i:64;}i:2;a:2:{s:4:\"name\";s:45:\"Sports & Outdoors  >  Outdoor & Traveling\";s:2:\"id\";i:28;}}}}s:7:\"columns\";s:1:\"2\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("100","0","3","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:10:\"Electronic\";i:2;s:10:\"Electronic\";}","0","119","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","70%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","New","fa fa-taxi","item-style1"),
("102","0","11","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:4:\"Blog\";i:2;s:10:\"مدونة\";}","0","119","a:2:{s:3:\"url\";s:66:\"index.php?route=simple_blog/category&amp;simple_blog_category_id=1\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","fa fa-camera-retro",""),
("115","114","14","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:8:\"About us\";i:2;s:8:\"About us\";}","0","119","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","6","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:720:\"&lt;ul class=&quot;row-list&quot;&gt;	&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/information&amp;amp;information_id=4&quot;&gt;About Us 1&lt;/a&gt;&lt;/li&gt;	&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/information&amp;amp;information_id=7&quot;&gt;About Us 2&lt;/a&gt;&lt;/li&gt;	&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/information&amp;amp;information_id=8&quot;&gt;About Us 3&lt;/a&gt;&lt;/li&gt;	&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/information&amp;amp;information_id=9&quot;&gt;About Us 4&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;\";i:2;s:720:\"&lt;ul class=&quot;row-list&quot;&gt;	&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/information&amp;amp;information_id=4&quot;&gt;About Us 1&lt;/a&gt;&lt;/li&gt;	&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/information&amp;amp;information_id=7&quot;&gt;About Us 2&lt;/a&gt;&lt;/li&gt;	&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/information&amp;amp;information_id=8&quot;&gt;About Us 3&lt;/a&gt;&lt;/li&gt;	&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/information&amp;amp;information_id=9&quot;&gt;About Us 4&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:21:\"catalog/demo/hp_1.jpg\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("89","0","0","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:8:\"Features\";i:2;s:8:\"Features\";}","0","119","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","60%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","fa fa-camera-retro",""),
("104","100","6","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:13:\"Product types\";i:2;s:13:\"Product types\";}","0","119","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:2:\"45\";s:4:\"name\";s:11:\"MacBook Pro\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:2:\"20\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"0\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:1:{i:0;a:3:{s:2:\"id\";i:18;s:4:\"name\";s:11:\"Electronics\";s:8:\"children\";a:6:{i:0;a:2:{s:2:\"id\";i:76;s:4:\"name\";s:33:\"Jewelry & Watches  >  Earings\";}i:1;a:2:{s:2:\"id\";i:24;s:4:\"name\";s:15:\"Health & Beauty\";}i:2;a:2:{s:2:\"id\";i:75;s:4:\"name\";s:42:\"Toys & Hobbies  >  Helicopters & Parts\";}i:3;a:2:{s:2:\"id\";i:64;s:4:\"name\";s:35:\"Health & Beauty  >  Bath & Body\";}i:4;a:2:{s:2:\"id\";i:45;s:4:\"name\";s:26:\"Electronics  >  Tablet\";}i:5;a:2:{s:2:\"id\";i:30;s:4:\"name\";s:31:\"Electronics  >  Memory Card\";}}}}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","hot","fa fa-camera-retro","sub3"),
("105","100","5","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:13:\"Sub category2\";i:2;s:13:\"Sub category2\";}","0","119","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","2","a:7:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:11:\"manufacture\";a:2:{s:4:\"name\";a:6:{i:0;s:4:\"Acer\";i:1;s:4:\"Asus\";i:2;s:4:\"Dell\";i:3;s:3:\"HTC\";i:4;s:2:\"Hp\";i:5;s:7:\"Samsung\";}s:2:\"id\";a:6:{i:0;s:1:\"5\";i:1;s:1:\"6\";i:2;s:1:\"8\";i:3;s:2:\"11\";i:4;s:1:\"7\";i:5;s:1:\"9\";}}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:2:\"18\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"0\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:1:{i:0;a:3:{s:2:\"id\";i:24;s:4:\"name\";s:15:\"Health & Beauty\";s:8:\"children\";a:6:{i:0;a:2:{s:2:\"id\";i:24;s:4:\"name\";s:13:\"Phones & PDAs\";}i:1;a:2:{s:2:\"id\";i:27;s:4:\"name\";s:14:\"Desktops > Mac\";}i:2;a:2:{s:2:\"id\";i:46;s:4:\"name\";s:26:\"Laptops & Notebooks > Macs\";}i:3;a:2:{s:2:\"id\";i:34;s:4:\"name\";s:11:\"MP3 Players\";}i:4;a:2:{s:2:\"id\";i:24;s:4:\"name\";s:13:\"Phones & PDAs\";}i:5;a:2:{s:2:\"id\";i:24;s:4:\"name\";s:13:\"Phones & PDAs\";}}}}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","hot","fa fa-camera-retro",""),
("106","100","4","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:13:\"Sub category1\";i:2;s:13:\"Sub category1\";}","0","119","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:2:\"33\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"0\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:1:{i:0;a:3:{s:4:\"name\";s:10:\"Automotive\";s:2:\"id\";i:33;s:8:\"children\";a:6:{i:0;a:2:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;}i:1;a:2:{s:4:\"name\";s:55:\"Bags, Holiday Supplies  >  Gift & Lifestyle Gadgets\";s:2:\"id\";i:68;}i:2;a:2:{s:4:\"name\";s:39:\"Sports & Outdoors  >  Golf Supplies\";s:2:\"id\";i:29;}i:3;a:2:{s:4:\"name\";s:51:\"Smartphone & Tablets  >  Accessories for iPhone\";s:2:\"id\";i:43;}i:4;a:2:{s:4:\"name\";s:45:\"Bags, Holiday Supplies  >  Gift for Woman\";s:2:\"id\";i:70;}i:5;a:2:{s:4:\"name\";s:43:\"Bags, Holiday Supplies  >  Gift for Man\";s:2:\"id\";i:69;}}}}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","hot","fa fa-camera-retro",""),
("114","0","12","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:5:\"Pages\";i:2;s:5:\"Pages\";}","0","119","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","40%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","fa fa-picture-o","style-page"),
("119","114","13","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:10:\"List pages\";i:2;s:10:\"List pages\";}","0","119","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","2","6","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:701:\"&lt;ul class=&quot;row-list&quot;&gt;
\n		&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/information&amp;amp;information_id=6&quot;&gt;FAQ&lt;/a&gt;&lt;/li&gt;
\n	&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/information&amp;amp;information_id=3&quot;&gt;Pricing Tables&lt;/a&gt;&lt;/li&gt;
\n		&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/information&amp;amp;information_id=11&quot;&gt;Gallery&lt;/a&gt;&lt;/li&gt;
\n		&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/contact&quot;&gt;Contact us&lt;/a&gt;&lt;/li&gt;
\n		&lt;/ul&gt;\";i:2;s:701:\"&lt;ul class=&quot;row-list&quot;&gt;
\n		&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/information&amp;amp;information_id=6&quot;&gt;FAQ&lt;/a&gt;&lt;/li&gt;
\n	&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/information&amp;amp;information_id=3&quot;&gt;Pricing Tables&lt;/a&gt;&lt;/li&gt;
\n		&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/information&amp;amp;information_id=11&quot;&gt;Gallery&lt;/a&gt;&lt;/li&gt;
\n		&lt;li&gt;&lt;a class=&quot;subcategory_item&quot; href=&quot;index.php?route=information/contact&quot;&gt;Contact us&lt;/a&gt;&lt;/li&gt;
\n		&lt;/ul&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:21:\"catalog/demo/hp_2.jpg\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("126","100","7","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:6:\"Banner\";i:2;s:6:\"Banner\";}","0","119","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","12","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:243:\"&lt;div class=&quot;col-xs-12 img-bottom&quot;&gt;			&lt;div class=&quot;row&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/static-image-h-2.png&quot; alt=&quot;banner1&quot;&gt;&lt;/a&gt; &lt;/div&gt;
\n
\n&lt;/div&gt;\";i:2;s:243:\"&lt;div class=&quot;col-xs-12 img-bottom&quot;&gt;			&lt;div class=&quot;row&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/static-image-h-2.png&quot; alt=&quot;banner1&quot;&gt;&lt;/a&gt; &lt;/div&gt;
\n
\n&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:2:\"33\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"0\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"3\";}}","","","item-banner"),
("121","0","15","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:10:\"Contact us\";i:2;s:10:\"Contact us\";}","0","119","a:2:{s:3:\"url\";s:35:\"index.php?route=information/contact\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("135","0","0","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:27:\"Automotive &amp; Motocrycle\";i:2;s:27:\"Automotive &amp; Motocrycle\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"33\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon icon1"," style1"),
("136","137","5","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:7:\"Submenu\";i:2;s:7:\"Submenu\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"18\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","40%","0","6","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:3:{i:0;a:3:{s:4:\"name\";s:18:\"Mobile Accessories\";s:2:\"id\";i:81;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;}i:1;a:2:{s:4:\"name\";s:35:\"Health & Beauty  >  Bath & Body\";s:2:\"id\";i:64;}i:2;a:2:{s:4:\"name\";s:22:\"Bags, Holiday Supplies\";s:2:\"id\";i:17;}}}i:1;a:3:{s:4:\"name\";s:42:\"Electronics  >  Battereries & Chargers\";s:2:\"id\";i:46;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:45:\"Sports & Outdoors  >  Outdoor & Traveling\";s:2:\"id\";i:28;}i:1;a:2:{s:4:\"name\";s:19:\"Flashlights & Lamps\";s:2:\"id\";i:80;}i:2;a:2:{s:4:\"name\";s:34:\"Health & Beauty  >  Fragrances\";s:2:\"id\";i:66;}}}i:2;a:3:{s:4:\"name\";s:33:\"Sports & Outdoors  >  Fishing\";s:2:\"id\";i:31;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:41:\"Toys & Hobbies  >  FPV System & Parts\";s:2:\"id\";i:73;}i:1;a:2:{s:4:\"name\";s:11:\"Electronics\";s:2:\"id\";i:18;}i:2;a:2:{s:4:\"name\";s:33:\"Jewelry & Watches  >  Earings\";s:2:\"id\";i:76;}i:3;a:2:{s:4:\"name\";s:39:\"Automotive  >  More Car Accessories\";s:2:\"id\";i:60;}}}}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("137","0","4","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:21:\"Sports &amp; Outdoors\";i:2;s:21:\"Sports &amp; Outdoors\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"25\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","60%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon3"," item-style3"),
("138","0","9","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:24:\"Smartphone &amp; Tablets\";i:2;s:24:\"Smartphone &amp; Tablets\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"34\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","25%","0","4","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:4:{i:0;a:3:{s:4:\"name\";s:40:\"Electronics  >  Headphones, Headsets\";s:2:\"id\";i:45;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:30:\"Electronics  >  Home Audio\";s:2:\"id\";i:30;}i:1;a:2:{s:4:\"name\";s:15:\"Health & Beauty\";s:2:\"id\";i:24;}i:2;a:2:{s:4:\"name\";s:42:\"Toys & Hobbies  >  Helicopters & Parts\";s:2:\"id\";i:75;}i:3;a:2:{s:4:\"name\";s:42:\"Toys & Hobbies  >  Helicopters & Parts\";s:2:\"id\";i:75;}}}i:1;a:3:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:55:\"Bags, Holiday Supplies  >  Gift & Lifestyle Gadgets\";s:2:\"id\";i:68;}i:1;a:2:{s:4:\"name\";s:24:\"Computer  >  Fishing\";s:2:\"id\";i:31;}i:2;a:2:{s:4:\"name\";s:19:\"Flashlights & Lamps\";s:2:\"id\";i:80;}i:3;a:2:{s:4:\"name\";s:34:\"Health & Beauty  >  Fragrances\";s:2:\"id\";i:66;}}}i:2;a:3:{s:4:\"name\";s:43:\"Bags, Holiday Supplies  >  Gift for Man\";s:2:\"id\";i:69;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:43:\"Bags, Holiday Supplies  >  Gift for Man\";s:2:\"id\";i:69;}i:1;a:2:{s:4:\"name\";s:30:\"Computer  >  Golf Supplies\";s:2:\"id\";i:29;}i:2;a:2:{s:4:\"name\";s:33:\"Mobiles & Tablets  >  Earings\";s:2:\"id\";i:76;}i:3;a:2:{s:4:\"name\";s:30:\"Electronics  >  Smartphone\";s:2:\"id\";i:46;}}}i:3;a:2:{s:4:\"name\";s:41:\"Toys & Hobbies  >  FPV System & Parts\";s:2:\"id\";i:73;}}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon4"," css-menu"),
("139","0","7","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:19:\"Health &amp; Beauty\";i:2;s:19:\"Health &amp; Beauty\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"24\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon5",""),
("140","0","11","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:23:\"Flashlights &amp; Lamps\";i:2;s:23:\"Flashlights &amp; Lamps\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"80\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}",""," icon icon6",""),
("141","0","18","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:22:\"Bags, Holiday Supplies\";i:2;s:22:\"Bags, Holiday Supplies\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"17\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon icon7",""),
("142","0","12","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:18:\"Camera &amp; Photo\";i:2;s:18:\"Camera &amp; Photo\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"82\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon8",""),
("143","0","14","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:32:\"Outdoor &amp; Traveling Supplies\";i:2;s:32:\"Outdoor &amp; Traveling Supplies\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"72\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon icon9",""),
("144","0","15","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:19:\"Health &amp; Beauty\";i:2;s:19:\"Health &amp; Beauty\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"24\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon icon10",""),
("145","0","16","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:19:\"Toys &amp; Hobbies \";i:2;s:19:\"Toys &amp; Hobbies \";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"57\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon icon11",""),
("146","0","17","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:21:\"Jewelry &amp; Watches\";i:2;s:21:\"Jewelry &amp; Watches\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"20\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon icon12",""),
("147","135","1","http://dev.ytcvn.com/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:12:\"Sub category\";i:2;s:12:\"Sub category\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"33\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","","0","8","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:4:{i:0;a:3:{s:4:\"name\";s:7:\"Apparel\";s:2:\"id\";i:78;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:54:\"Smartphone & Tablets  >  Accessories for Tablet PC\";s:2:\"id\";i:47;}i:1;a:2:{s:4:\"name\";s:50:\"Smartphone & Tablets  >  Accessories for i Pad\";s:2:\"id\";i:44;}i:2;a:2:{s:4:\"name\";s:51:\"Smartphone & Tablets  >  Accessories for iPhone\";s:2:\"id\";i:43;}i:3;a:2:{s:4:\"name\";s:22:\"Bags, Holiday Supplies\";s:2:\"id\";i:17;}}}i:1;a:3:{s:4:\"name\";s:19:\"Cables & Connectors\";s:2:\"id\";i:77;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:15:\"Cameras & Photo\";s:2:\"id\";i:82;}i:1;a:2:{s:4:\"name\";s:11:\"Electronics\";s:2:\"id\";i:18;}i:2;a:2:{s:4:\"name\";s:45:\"Sports & Outdoors  >  Outdoor & Traveling\";s:2:\"id\";i:28;}}}i:2;a:3:{s:4:\"name\";s:42:\"Sports & Outdoors  >  Camping & Hiking\";s:2:\"id\";i:35;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:42:\"Automotive  >  Car Alarms and Security\";s:2:\"id\";i:61;}i:1;a:2:{s:4:\"name\";s:33:\"Jewelry & Watches  >  Earings\";s:2:\"id\";i:76;}i:2;a:2:{s:4:\"name\";s:46:\"Health & Beauty  >  Shaving & Hair Removal\";s:2:\"id\";i:65;}i:3;a:2:{s:4:\"name\";s:45:\"Health & Beauty  >  Salon & Spa Equipment\";s:2:\"id\";i:67;}}}i:3;a:3:{s:4:\"name\";s:20:\"Smartphone & Tablets\";s:2:\"id\";i:34;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:17:\"Sports & Outdoors\";s:2:\"id\";i:25;}i:1;a:2:{s:4:\"name\";s:35:\"Health & Beauty  >  Bath & Body\";s:2:\"id\";i:64;}i:2;a:2:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;}i:3;a:2:{s:4:\"name\";s:39:\"Automotive  >  Car Audio & Speakers\";s:2:\"id\";i:62;}}}}s:7:\"columns\";s:1:\"2\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("148","0","3","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:10:\"Electronic\";i:2;s:10:\"Electronic\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"25\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon icon2",""),
("149","137","6","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:4:\"HTML\";i:2;s:4:\"HTML\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"18\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","40%","0","6","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:172:\"&lt;div class=&quot;row banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/menu_bg2.jpg&quot; alt=&quot;banner1&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";i:2;s:172:\"&lt;div class=&quot;row banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/menu_bg2.jpg&quot; alt=&quot;banner1&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("150","138","10","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:7:\"Submenu\";i:2;s:7:\"Submenu\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"34\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","","0","12","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:8:{i:0;a:3:{s:4:\"name\";s:40:\"Electronics  >  Headphones, Headsets\";s:2:\"id\";i:45;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:30:\"Electronics  >  Home Audio\";s:2:\"id\";i:30;}i:1;a:2:{s:4:\"name\";s:15:\"Health & Beauty\";s:2:\"id\";i:24;}i:2;a:2:{s:4:\"name\";s:42:\"Toys & Hobbies  >  Helicopters & Parts\";s:2:\"id\";i:75;}i:3;a:2:{s:4:\"name\";s:42:\"Toys & Hobbies  >  Helicopters & Parts\";s:2:\"id\";i:75;}}}i:1;a:3:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:55:\"Bags, Holiday Supplies  >  Gift & Lifestyle Gadgets\";s:2:\"id\";i:68;}i:1;a:2:{s:4:\"name\";s:43:\"Bags, Holiday Supplies  >  Gift for Man\";s:2:\"id\";i:69;}i:2;a:2:{s:4:\"name\";s:45:\"Bags, Holiday Supplies  >  Gift for Woman\";s:2:\"id\";i:70;}i:3;a:2:{s:4:\"name\";s:30:\"Computer  >  Golf Supplies\";s:2:\"id\";i:29;}}}i:2;a:2:{s:4:\"name\";s:15:\"Health & Beauty\";s:2:\"id\";i:24;}i:3;a:2:{s:4:\"name\";s:42:\"Toys & Hobbies  >  Helicopters & Parts\";s:2:\"id\";i:75;}i:4;a:3:{s:4:\"name\";s:45:\"Health & Beauty  >  Salon & Spa Equipment\";s:2:\"id\";i:67;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:46:\"Health & Beauty  >  Shaving & Hair Removal\";s:2:\"id\";i:65;}i:1;a:2:{s:4:\"name\";s:22:\"Bags, Holiday Supplies\";s:2:\"id\";i:17;}i:2;a:2:{s:4:\"name\";s:35:\"Health & Beauty  >  Bath & Body\";s:2:\"id\";i:64;}}}i:5;a:2:{s:4:\"name\";s:26:\"Electronics  >  Tablet\";s:2:\"id\";i:45;}i:6;a:3:{s:4:\"name\";s:24:\"Computer  >  Fishing\";s:2:\"id\";i:31;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:19:\"Flashlights & Lamps\";s:2:\"id\";i:80;}i:1;a:2:{s:4:\"name\";s:34:\"Health & Beauty  >  Fragrances\";s:2:\"id\";i:66;}i:2;a:2:{s:4:\"name\";s:41:\"Toys & Hobbies  >  FPV System & Parts\";s:2:\"id\";i:73;}i:3;a:2:{s:4:\"name\";s:30:\"Electronics  >  Smartphone\";s:2:\"id\";i:46;}}}i:7;a:2:{s:4:\"name\";s:14:\"Toys & Hobbies\";s:2:\"id\";i:57;}}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("151","0","13","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:24:\"Smartphone &amp; Tablets\";i:2;s:24:\"Smartphone &amp; Tablets\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"34\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","3","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon icon13","css-menu"),
("152","139","8","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:9:\"Sub menu1\";i:2;s:9:\"Sub menu1\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"24\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","12","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:6:{i:0;a:3:{s:4:\"name\";s:42:\"Automotive  >  Car Alarms and Security\";s:2:\"id\";i:61;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:39:\"Automotive  >  Car Audio & Speakers\";s:2:\"id\";i:62;}i:1;a:2:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;}i:2;a:2:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;}i:3;a:2:{s:4:\"name\";s:40:\"Electronics  >  Headphones, Headsets\";s:2:\"id\";i:45;}}}i:1;a:3:{s:4:\"name\";s:15:\"Health & Beauty\";s:2:\"id\";i:24;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:30:\"Electronics  >  Home Audio\";s:2:\"id\";i:30;}i:1;a:2:{s:4:\"name\";s:42:\"Toys & Hobbies  >  Helicopters & Parts\";s:2:\"id\";i:75;}i:2;a:2:{s:4:\"name\";s:45:\"Sports & Outdoors  >  Outdoor & Traveling\";s:2:\"id\";i:28;}i:3;a:2:{s:4:\"name\";s:14:\"Toys & Hobbies\";s:2:\"id\";i:57;}}}i:2;a:3:{s:4:\"name\";s:11:\"Electronics\";s:2:\"id\";i:18;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:33:\"Jewelry & Watches  >  Earings\";s:2:\"id\";i:76;}i:1;a:2:{s:4:\"name\";s:45:\"Health & Beauty  >  Salon & Spa Equipment\";s:2:\"id\";i:67;}i:2;a:2:{s:4:\"name\";s:46:\"Health & Beauty  >  Shaving & Hair Removal\";s:2:\"id\";i:65;}i:3;a:2:{s:4:\"name\";s:20:\"Smartphone & Tablets\";s:2:\"id\";i:34;}}}i:3;a:3:{s:4:\"name\";s:17:\"Sports & Outdoors\";s:2:\"id\";i:25;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:19:\"Flashlights & Lamps\";s:2:\"id\";i:80;}i:1;a:2:{s:4:\"name\";s:34:\"Health & Beauty  >  Fragrances\";s:2:\"id\";i:66;}i:2;a:2:{s:4:\"name\";s:33:\"Sports & Outdoors  >  Fishing\";s:2:\"id\";i:31;}i:3;a:2:{s:4:\"name\";s:41:\"Toys & Hobbies  >  FPV System & Parts\";s:2:\"id\";i:73;}}}i:4;a:3:{s:4:\"name\";s:39:\"Automotive  >  More Car Accessories\";s:2:\"id\";i:60;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:55:\"Bags, Holiday Supplies  >  Lighter & Cigar Supplies\";s:2:\"id\";i:71;}i:1;a:2:{s:4:\"name\";s:45:\"Electronics  >  Mp3 Players & Accessories\";s:2:\"id\";i:32;}i:2;a:2:{s:4:\"name\";s:37:\"Jewelry & Watches  >  Men Watches\";s:2:\"id\";i:27;}i:3;a:2:{s:4:\"name\";s:18:\"Mobile Accessories\";s:2:\"id\";i:81;}}}i:5;a:3:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:55:\"Bags, Holiday Supplies  >  Gift & Lifestyle Gadgets\";s:2:\"id\";i:68;}i:1;a:2:{s:4:\"name\";s:43:\"Bags, Holiday Supplies  >  Gift for Man\";s:2:\"id\";i:69;}i:2;a:2:{s:4:\"name\";s:45:\"Bags, Holiday Supplies  >  Gift for Woman\";s:2:\"id\";i:70;}i:3;a:2:{s:4:\"name\";s:45:\"Bags, Holiday Supplies  >  Gift for Woman\";s:2:\"id\";i:70;}}}}s:7:\"columns\";s:1:\"3\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("153","0","0","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:27:\"Automotive &amp; Motocrycle\";i:2;s:27:\"Automotive &amp; Motocrycle\";}","0","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon1"," style1"),
("154","0","2","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:10:\"Electronic\";i:2;s:10:\"Electronic\";}","1","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"18\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon2",""),
("155","0","3","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:21:\"Sports &amp; Outdoors\";i:2;s:21:\"Sports &amp; Outdoors\";}","1","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"25\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","60%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon3",""),
("156","0","6","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:24:\"Smartphone &amp; Tablets\";i:2;s:24:\"Smartphone &amp; Tablets\";}","1","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"34\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","30%","0","12","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon4",""),
("157","0","8","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:23:\"Flashlights &amp; Lamps\";i:2;s:23:\"Flashlights &amp; Lamps\";}","1","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"80\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon5",""),
("158","0","10","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:18:\"Camera &amp; Photo\";i:2;s:18:\"Camera &amp; Photo\";}","1","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"82\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon8",""),
("159","0","11","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:32:\"Outdoor &amp; Traveling Supplies\";i:2;s:32:\"Outdoor &amp; Traveling Supplies\";}","1","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"28\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon9",""),
("160","0","12","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:19:\"Health &amp; Beauty\";i:2;s:19:\"Health &amp; Beauty\";}","1","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"24\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon10",""),
("161","0","13","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:19:\"Toys &amp; Hobbies \";i:2;s:19:\"Toys &amp; Hobbies \";}","1","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"57\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon11",""),
("162","0","14","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:21:\"Jewelry &amp; Watches\";i:2;s:21:\"Jewelry &amp; Watches\";}","1","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"20\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon12",""),
("163","0","15","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:22:\"Bags, Holiday Supplies\";i:2;s:22:\"Bags, Holiday Supplies\";}","1","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"17\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon13",""),
("166","153","1","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:12:\"Sub category\";i:2;s:12:\"Sub category\";}","0","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","12","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:5:{i:0;a:3:{s:4:\"name\";s:7:\"Apparel\";s:2:\"id\";i:78;s:8:\"children\";a:6:{i:0;a:2:{s:4:\"name\";s:10:\"Automotive\";s:2:\"id\";i:33;}i:1;a:2:{s:4:\"name\";s:54:\"Smartphone & Tablets  >  Accessories for Tablet PC\";s:2:\"id\";i:47;}i:2;a:2:{s:4:\"name\";s:50:\"Smartphone & Tablets  >  Accessories for i Pad\";s:2:\"id\";i:44;}i:3;a:2:{s:4:\"name\";s:51:\"Smartphone & Tablets  >  Accessories for iPhone\";s:2:\"id\";i:43;}i:4;a:2:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;}i:5;a:2:{s:4:\"name\";s:55:\"Bags, Holiday Supplies  >  Gift & Lifestyle Gadgets\";s:2:\"id\";i:68;}}}i:1;a:3:{s:4:\"name\";s:43:\"Bags, Holiday Supplies  >  Gift for Man\";s:2:\"id\";i:69;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:45:\"Bags, Holiday Supplies  >  Gift for Woman\";s:2:\"id\";i:70;}i:1;a:2:{s:4:\"name\";s:39:\"Sports & Outdoors  >  Golf Supplies\";s:2:\"id\";i:29;}i:2;a:2:{s:4:\"name\";s:42:\"Automotive  >  Car Alarms and Security\";s:2:\"id\";i:61;}}}i:2;a:3:{s:4:\"name\";s:19:\"Cables & Connectors\";s:2:\"id\";i:77;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:42:\"Automotive  >  Car Alarms and Security\";s:2:\"id\";i:61;}i:1;a:2:{s:4:\"name\";s:39:\"Automotive  >  Car Audio & Speakers\";s:2:\"id\";i:62;}i:2;a:2:{s:4:\"name\";s:15:\"Cameras & Photo\";s:2:\"id\";i:82;}}}i:3;a:3:{s:4:\"name\";s:42:\"Sports & Outdoors  >  Camping & Hiking\";s:2:\"id\";i:35;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:45:\"Health & Beauty  >  Salon & Spa Equipment\";s:2:\"id\";i:67;}i:1;a:2:{s:4:\"name\";s:46:\"Health & Beauty  >  Shaving & Hair Removal\";s:2:\"id\";i:65;}i:2;a:2:{s:4:\"name\";s:20:\"Smartphone & Tablets\";s:2:\"id\";i:34;}i:3;a:2:{s:4:\"name\";s:17:\"Sports & Outdoors\";s:2:\"id\";i:25;}}}i:4;a:3:{s:4:\"name\";s:22:\"Bags, Holiday Supplies\";s:2:\"id\";i:17;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:42:\"Electronics  >  Battereries & Chargers\";s:2:\"id\";i:46;}i:1;a:2:{s:4:\"name\";s:42:\"Automotive  >  Car Alarms and Security\";s:2:\"id\";i:61;}i:2;a:2:{s:4:\"name\";s:39:\"Automotive  >  Car Audio & Speakers\";s:2:\"id\";i:62;}i:3;a:2:{s:4:\"name\";s:15:\"Cameras & Photo\";s:2:\"id\";i:82;}}}}s:7:\"columns\";s:1:\"3\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("169","155","4","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:12:\"Sub category\";i:2;s:12:\"Sub category\";}","0","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","6","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:3:{i:0;a:3:{s:4:\"name\";s:18:\"Mobile Accessories\";s:2:\"id\";i:81;s:8:\"children\";a:1:{i:0;a:3:{s:4:\"name\";s:39:\"Automotive  >  More Car Accessories\";s:2:\"id\";i:60;s:8:\"children\";a:2:{i:0;a:2:{s:4:\"name\";s:45:\"Electronics  >  Mp3 Players & Accessories\";s:2:\"id\";i:32;}i:1;a:2:{s:4:\"name\";s:37:\"Jewelry & Watches  >  Men Watches\";s:2:\"id\";i:27;}}}}}i:1;a:3:{s:4:\"name\";s:22:\"Bags, Holiday Supplies\";s:2:\"id\";i:17;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:42:\"Electronics  >  Battereries & Chargers\";s:2:\"id\";i:46;}i:1;a:2:{s:4:\"name\";s:35:\"Health & Beauty  >  Bath & Body\";s:2:\"id\";i:64;}i:2;a:2:{s:4:\"name\";s:19:\"Flashlights & Lamps\";s:2:\"id\";i:80;}}}i:2;a:3:{s:4:\"name\";s:34:\"Health & Beauty  >  Fragrances\";s:2:\"id\";i:66;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:33:\"Sports & Outdoors  >  Fishing\";s:2:\"id\";i:31;}i:1;a:2:{s:4:\"name\";s:41:\"Toys & Hobbies  >  FPV System & Parts\";s:2:\"id\";i:73;}i:2;a:2:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;}}}}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("170","155","5","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:12:\"HTML Content\";i:2;s:12:\"HTML Content\";}","1","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"25\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","6","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:172:\"&lt;div class=&quot;row banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/menu_bg2.jpg&quot; alt=&quot;banner1&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";i:2;s:172:\"&lt;div class=&quot;row banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/menu_bg2.jpg&quot; alt=&quot;banner1&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("172","156","7","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:8:\"Sub menu\";i:2;s:8:\"Sub menu\";}","1","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"34\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","12","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:4:{i:0;a:2:{s:4:\"name\";s:15:\"Health & Beauty\";s:2:\"id\";i:24;}i:1;a:2:{s:4:\"name\";s:40:\"Electronics  >  Headphones, Headsets\";s:2:\"id\";i:45;}i:2;a:2:{s:4:\"name\";s:30:\"Electronics  >  Home Audio\";s:2:\"id\";i:30;}i:3;a:2:{s:4:\"name\";s:42:\"Toys & Hobbies  >  Helicopters & Parts\";s:2:\"id\";i:75;}}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("173","157","9","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:8:\"Sub menu\";i:2;s:8:\"Sub menu\";}","1","123","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"34\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","12","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:6:{i:0;a:3:{s:4:\"name\";s:10:\"Automotive\";s:2:\"id\";i:33;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:54:\"Smartphone & Tablets  >  Accessories for Tablet PC\";s:2:\"id\";i:47;}i:1;a:2:{s:4:\"name\";s:50:\"Smartphone & Tablets  >  Accessories for i Pad\";s:2:\"id\";i:44;}i:2;a:2:{s:4:\"name\";s:51:\"Smartphone & Tablets  >  Accessories for iPhone\";s:2:\"id\";i:43;}i:3;a:2:{s:4:\"name\";s:22:\"Bags, Holiday Supplies\";s:2:\"id\";i:17;}}}i:1;a:3:{s:4:\"name\";s:42:\"Electronics  >  Battereries & Chargers\";s:2:\"id\";i:46;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:35:\"Health & Beauty  >  Bath & Body\";s:2:\"id\";i:64;}i:1;a:2:{s:4:\"name\";s:19:\"Flashlights & Lamps\";s:2:\"id\";i:80;}i:2;a:2:{s:4:\"name\";s:34:\"Health & Beauty  >  Fragrances\";s:2:\"id\";i:66;}i:3;a:2:{s:4:\"name\";s:33:\"Sports & Outdoors  >  Fishing\";s:2:\"id\";i:31;}}}i:2;a:3:{s:4:\"name\";s:19:\"Flashlights & Lamps\";s:2:\"id\";i:80;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:41:\"Toys & Hobbies  >  FPV System & Parts\";s:2:\"id\";i:73;}i:1;a:2:{s:4:\"name\";s:55:\"Bags, Holiday Supplies  >  Gift & Lifestyle Gadgets\";s:2:\"id\";i:68;}i:2;a:2:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;}i:3;a:2:{s:4:\"name\";s:43:\"Bags, Holiday Supplies  >  Gift for Man\";s:2:\"id\";i:69;}}}i:3;a:3:{s:4:\"name\";s:45:\"Bags, Holiday Supplies  >  Gift for Woman\";s:2:\"id\";i:70;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:39:\"Sports & Outdoors  >  Golf Supplies\";s:2:\"id\";i:29;}i:1;a:2:{s:4:\"name\";s:39:\"Automotive  >  More Car Accessories\";s:2:\"id\";i:60;}i:2;a:2:{s:4:\"name\";s:45:\"Electronics  >  Mp3 Players & Accessories\";s:2:\"id\";i:32;}i:3;a:2:{s:4:\"name\";s:37:\"Jewelry & Watches  >  Men Watches\";s:2:\"id\";i:27;}}}i:4;a:3:{s:4:\"name\";s:18:\"Mobile Accessories\";s:2:\"id\";i:81;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:45:\"Health & Beauty  >  Salon & Spa Equipment\";s:2:\"id\";i:67;}i:1;a:2:{s:4:\"name\";s:46:\"Health & Beauty  >  Shaving & Hair Removal\";s:2:\"id\";i:65;}i:2;a:2:{s:4:\"name\";s:55:\"Bags, Holiday Supplies  >  Lighter & Cigar Supplies\";s:2:\"id\";i:71;}i:3;a:2:{s:4:\"name\";s:55:\"Bags, Holiday Supplies  >  Lighter & Cigar Supplies\";s:2:\"id\";i:71;}}}i:5;a:3:{s:4:\"name\";s:17:\"Sports & Outdoors\";s:2:\"id\";i:25;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:45:\"Sports & Outdoors  >  Outdoor & Traveling\";s:2:\"id\";i:28;}i:1;a:2:{s:4:\"name\";s:38:\"Toys & Hobbies  >  RC Cars & Parts\";s:2:\"id\";i:74;}i:2;a:2:{s:4:\"name\";s:33:\"Jewelry & Watches  >  Earings\";s:2:\"id\";i:76;}i:3;a:2:{s:4:\"name\";s:17:\"Jewelry & Watches\";s:2:\"id\";i:20;}}}}s:7:\"columns\";s:1:\"3\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("174","0","0","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:27:\"Automotive &amp; Motocrycle\";i:2;s:27:\"Automotive &amp; Motocrycle\";}","1","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"33\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon icon1"," style1"),
("175","174","1","http://dev.ytcvn.com/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:12:\"Sub category\";i:2;s:12:\"Sub category\";}","0","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","8","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:4:{i:0;a:3:{s:4:\"name\";s:7:\"Apparel\";s:2:\"id\";i:78;s:8:\"children\";a:5:{i:0;a:2:{s:4:\"name\";s:10:\"Automotive\";s:2:\"id\";i:33;}i:1;a:2:{s:4:\"name\";s:54:\"Smartphone & Tablets  >  Accessories for Tablet PC\";s:2:\"id\";i:47;}i:2;a:2:{s:4:\"name\";s:50:\"Smartphone & Tablets  >  Accessories for i Pad\";s:2:\"id\";i:44;}i:3;a:2:{s:4:\"name\";s:51:\"Smartphone & Tablets  >  Accessories for iPhone\";s:2:\"id\";i:43;}i:4;a:2:{s:4:\"name\";s:40:\"Electronics  >  Headphones, Headsets\";s:2:\"id\";i:45;}}}i:1;a:3:{s:4:\"name\";s:15:\"Health & Beauty\";s:2:\"id\";i:24;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:42:\"Toys & Hobbies  >  Helicopters & Parts\";s:2:\"id\";i:75;}i:1;a:2:{s:4:\"name\";s:42:\"Automotive  >  Car Alarms and Security\";s:2:\"id\";i:61;}i:2;a:2:{s:4:\"name\";s:39:\"Automotive  >  Car Audio & Speakers\";s:2:\"id\";i:62;}}}i:2;a:3:{s:4:\"name\";s:43:\"Bags, Holiday Supplies  >  Gift for Man\";s:2:\"id\";i:69;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:55:\"Bags, Holiday Supplies  >  Gift & Lifestyle Gadgets\";s:2:\"id\";i:68;}i:1;a:2:{s:4:\"name\";s:45:\"Bags, Holiday Supplies  >  Gift for Woman\";s:2:\"id\";i:70;}i:2;a:2:{s:4:\"name\";s:39:\"Sports & Outdoors  >  Golf Supplies\";s:2:\"id\";i:29;}i:3;a:2:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;}}}i:3;a:3:{s:4:\"name\";s:19:\"Flashlights & Lamps\";s:2:\"id\";i:80;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:34:\"Health & Beauty  >  Fragrances\";s:2:\"id\";i:66;}i:1;a:2:{s:4:\"name\";s:33:\"Sports & Outdoors  >  Fishing\";s:2:\"id\";i:31;}i:2;a:2:{s:4:\"name\";s:41:\"Toys & Hobbies  >  FPV System & Parts\";s:2:\"id\";i:73;}i:3;a:2:{s:4:\"name\";s:22:\"Bags, Holiday Supplies\";s:2:\"id\";i:17;}}}}s:7:\"columns\";s:1:\"2\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("200","174","2","http://dev.ytcvn.com/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:12:\"HTML Content\";i:2;s:12:\"HTML Content\";}","1","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"33\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:188:\"&lt;div class=&quot;row img-banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/img-static-megamenu-h.png&quot; alt=&quot;banner&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";i:2;s:188:\"&lt;div class=&quot;row img-banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/img-static-megamenu-h.png&quot; alt=&quot;banner&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("176","0","3","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:10:\"Electronic\";i:2;s:10:\"Electronic\";}","0","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon2",""),
("177","0","9","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:24:\"Smartphone &amp; Tablets\";i:2;s:24:\"Smartphone &amp; Tablets\";}","0","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","30%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon5"," css-menu"),
("178","177","10","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:7:\"Submenu\";i:2;s:7:\"Submenu\";}","0","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","12","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:6:{i:0;a:3:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:55:\"Bags, Holiday Supplies  >  Gift & Lifestyle Gadgets\";s:2:\"id\";i:68;}i:1;a:2:{s:4:\"name\";s:43:\"Bags, Holiday Supplies  >  Gift for Man\";s:2:\"id\";i:69;}i:2;a:2:{s:4:\"name\";s:45:\"Bags, Holiday Supplies  >  Gift for Woman\";s:2:\"id\";i:70;}i:3;a:2:{s:4:\"name\";s:39:\"Sports & Outdoors  >  Golf Supplies\";s:2:\"id\";i:29;}}}i:1;a:2:{s:4:\"name\";s:24:\"Computer  >  Fishing\";s:2:\"id\";i:31;}i:2;a:3:{s:4:\"name\";s:19:\"Flashlights & Lamps\";s:2:\"id\";i:80;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:34:\"Health & Beauty  >  Fragrances\";s:2:\"id\";i:66;}i:1;a:2:{s:4:\"name\";s:41:\"Toys & Hobbies  >  FPV System & Parts\";s:2:\"id\";i:73;}i:2;a:2:{s:4:\"name\";s:30:\"Electronics  >  Smartphone\";s:2:\"id\";i:46;}i:3;a:2:{s:4:\"name\";s:45:\"Health & Beauty  >  Salon & Spa Equipment\";s:2:\"id\";i:67;}}}i:3;a:2:{s:4:\"name\";s:46:\"Health & Beauty  >  Shaving & Hair Removal\";s:2:\"id\";i:65;}i:4;a:2:{s:4:\"name\";s:20:\"Smartphone & Tablets\";s:2:\"id\";i:34;}i:5;a:3:{s:4:\"name\";s:36:\"Computer  >  Outdoor & Traveling\";s:2:\"id\";i:28;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:55:\"Bags, Holiday Supplies  >  Lighter & Cigar Supplies\";s:2:\"id\";i:71;}i:1;a:2:{s:4:\"name\";s:33:\"Mobiles & Tablets  >  Earings\";s:2:\"id\";i:76;}i:2;a:2:{s:4:\"name\";s:11:\"Electronics\";s:2:\"id\";i:18;}}}}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("179","0","4","http://localhost/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:21:\"Sports &amp; Outdoors\";i:2;s:21:\"Sports &amp; Outdoors\";}","1","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"33\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","60%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon3","  item-style3"),
("180","179","5","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:12:\"Sub category\";i:2;s:12:\"Sub category\";}","0","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","6","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:3:{i:0;a:3:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:55:\"Bags, Holiday Supplies  >  Gift & Lifestyle Gadgets\";s:2:\"id\";i:68;}i:1;a:2:{s:4:\"name\";s:43:\"Bags, Holiday Supplies  >  Gift for Man\";s:2:\"id\";i:69;}i:2;a:2:{s:4:\"name\";s:45:\"Bags, Holiday Supplies  >  Gift for Woman\";s:2:\"id\";i:70;}}}i:1;a:3:{s:4:\"name\";s:39:\"Sports & Outdoors  >  Golf Supplies\";s:2:\"id\";i:29;s:8:\"children\";a:3:{i:0;a:2:{s:4:\"name\";s:42:\"Automotive  >  Car Alarms and Security\";s:2:\"id\";i:61;}i:1;a:2:{s:4:\"name\";s:39:\"Automotive  >  Car Audio & Speakers\";s:2:\"id\";i:62;}i:2;a:2:{s:4:\"name\";s:19:\"Cables & Connectors\";s:2:\"id\";i:77;}}}i:2;a:3:{s:4:\"name\";s:15:\"Cameras & Photo\";s:2:\"id\";i:82;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:42:\"Sports & Outdoors  >  Camping & Hiking\";s:2:\"id\";i:35;}i:1;a:2:{s:4:\"name\";s:45:\"Health & Beauty  >  Salon & Spa Equipment\";s:2:\"id\";i:67;}i:2;a:2:{s:4:\"name\";s:46:\"Health & Beauty  >  Shaving & Hair Removal\";s:2:\"id\";i:65;}i:3;a:2:{s:4:\"name\";s:20:\"Smartphone & Tablets\";s:2:\"id\";i:34;}}}}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("181","0","7","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:19:\"Health &amp; Beauty\";i:2;s:19:\"Health &amp; Beauty\";}","1","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"33\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon4",""),
("182","181","8","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:12:\"Sub category\";i:2;s:12:\"Sub category\";}","0","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","12","2","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:6:{i:0;a:3:{s:4:\"name\";s:7:\"Apparel\";s:2:\"id\";i:78;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:10:\"Automotive\";s:2:\"id\";i:33;}i:1;a:2:{s:4:\"name\";s:54:\"Smartphone & Tablets  >  Accessories for Tablet PC\";s:2:\"id\";i:47;}i:2;a:2:{s:4:\"name\";s:50:\"Smartphone & Tablets  >  Accessories for i Pad\";s:2:\"id\";i:44;}i:3;a:2:{s:4:\"name\";s:51:\"Smartphone & Tablets  >  Accessories for iPhone\";s:2:\"id\";i:43;}}}i:1;a:3:{s:4:\"name\";s:42:\"Automotive  >  Car Alarms and Security\";s:2:\"id\";i:61;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:39:\"Automotive  >  Car Audio & Speakers\";s:2:\"id\";i:62;}i:1;a:2:{s:4:\"name\";s:19:\"Cables & Connectors\";s:2:\"id\";i:77;}i:2;a:2:{s:4:\"name\";s:15:\"Cameras & Photo\";s:2:\"id\";i:82;}i:3;a:2:{s:4:\"name\";s:42:\"Sports & Outdoors  >  Camping & Hiking\";s:2:\"id\";i:35;}}}i:2;a:3:{s:4:\"name\";s:45:\"Health & Beauty  >  Salon & Spa Equipment\";s:2:\"id\";i:67;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:46:\"Health & Beauty  >  Shaving & Hair Removal\";s:2:\"id\";i:65;}i:1;a:2:{s:4:\"name\";s:20:\"Smartphone & Tablets\";s:2:\"id\";i:34;}i:2;a:2:{s:4:\"name\";s:17:\"Sports & Outdoors\";s:2:\"id\";i:25;}i:3;a:2:{s:4:\"name\";s:39:\"Automotive  >  Gadgets & Auto Parts\";s:2:\"id\";i:63;}}}i:3;a:3:{s:4:\"name\";s:55:\"Bags, Holiday Supplies  >  Gift & Lifestyle Gadgets\";s:2:\"id\";i:68;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:43:\"Bags, Holiday Supplies  >  Gift for Man\";s:2:\"id\";i:69;}i:1;a:2:{s:4:\"name\";s:45:\"Bags, Holiday Supplies  >  Gift for Woman\";s:2:\"id\";i:70;}i:2;a:2:{s:4:\"name\";s:39:\"Sports & Outdoors  >  Golf Supplies\";s:2:\"id\";i:29;}i:3;a:2:{s:4:\"name\";s:19:\"Flashlights & Lamps\";s:2:\"id\";i:80;}}}i:4;a:3:{s:4:\"name\";s:34:\"Health & Beauty  >  Fragrances\";s:2:\"id\";i:66;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:33:\"Sports & Outdoors  >  Fishing\";s:2:\"id\";i:31;}i:1;a:2:{s:4:\"name\";s:41:\"Toys & Hobbies  >  FPV System & Parts\";s:2:\"id\";i:73;}i:2;a:2:{s:4:\"name\";s:22:\"Bags, Holiday Supplies\";s:2:\"id\";i:17;}i:3;a:2:{s:4:\"name\";s:42:\"Electronics  >  Battereries & Chargers\";s:2:\"id\";i:46;}}}i:5;a:3:{s:4:\"name\";s:35:\"Health & Beauty  >  Bath & Body\";s:2:\"id\";i:64;s:8:\"children\";a:4:{i:0;a:2:{s:4:\"name\";s:14:\"Toys & Hobbies\";s:2:\"id\";i:57;}i:1;a:2:{s:4:\"name\";s:11:\"Electronics\";s:2:\"id\";i:18;}i:2;a:2:{s:4:\"name\";s:33:\"Jewelry & Watches  >  Earings\";s:2:\"id\";i:76;}i:3;a:2:{s:4:\"name\";s:39:\"Jewelry & Watches  >  Wedding Rings\";s:2:\"id\";i:26;}}}}s:7:\"columns\";s:1:\"3\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("183","179","6","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:12:\"HTML Content\";i:2;s:12:\"HTML Content\";}","0","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","6","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:172:\"&lt;div class=&quot;row banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/menu_bg2.jpg&quot; alt=&quot;banner1&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";i:2;s:172:\"&lt;div class=&quot;row banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/menu_bg2.jpg&quot; alt=&quot;banner1&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("184","0","11","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:23:\"Flashlights &amp; Lamps\";i:2;s:23:\"Flashlights &amp; Lamps\";}","1","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"80\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon6",""),
("185","0","12","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:19:\"RC Cars &amp; Parts\";i:2;s:19:\"RC Cars &amp; Parts\";}","1","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"24\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon7",""),
("186","0","13","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:19:\"Toys &amp; Hobbies \";i:2;s:19:\"Toys &amp; Hobbies \";}","1","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"57\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon8",""),
("187","0","14","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:26:\"Battereries &amp; Chargers\";i:2;s:26:\"Battereries &amp; Chargers\";}","1","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"46\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon9",""),
("188","0","15","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:25:\"Salon &amp; Spa Equipment\";i:2;s:25:\"Salon &amp; Spa Equipment\";}","1","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"74\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon10",""),
("189","0","16","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:13:\"Wedding Rings\";i:2;s:13:\"Wedding Rings\";}","1","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"29\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon11",""),
("190","0","17","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:20:\"Camping &amp; Hiking\";i:2;s:20:\"Camping &amp; Hiking\";}","1","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"31\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon12",""),
("191","0","18","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:23:\"Helicopters &amp; Parts\";i:2;s:23:\"Helicopters &amp; Parts\";}","1","124","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"64\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","icon  icon13",""),
("192","0","19","http://localhost/ytc_templates/opencart/so_market/image/cache/no_image-100x100.png","a:2:{i:1;s:20:\"More Car Accessories\";i:2;s:20:\"More Car Accessories\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"60\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","100%","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}","","",""),
("196","135","2","http://dev.ytcvn.com/ytc_templates/opencart/so_maxshop/image/cache/no_image-100x100.png","a:2:{i:1;s:4:\"HTML\";i:2;s:4:\"HTML\";}","1","121","a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"33\";}","a:2:{i:1;s:0:\"\";i:2;s:0:\"\";}","0","0","0","","0","4","0","a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:1;s:188:\"&lt;div class=&quot;row img-banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/img-static-megamenu-h.png&quot; alt=&quot;banner&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";i:2;s:188:\"&lt;div class=&quot;row img-banner&quot;&gt;&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;image/catalog/cms/img-static-megamenu-h.png&quot; alt=&quot;banner&quot;&gt;&lt;/a&gt;&lt;/div&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:2:\"30\";s:4:\"name\";s:12:\"Canon EOS 5D\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:1:\"1\";s:4:\"type\";s:7:\"popular\";s:10:\"show_title\";s:1:\"0\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"3\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}","","","");


DROP TABLE IF EXISTS ?:module;
CREATE TABLE `?:module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;

INSERT INTO ?:module VALUES
("125","Best Sellers","so_extra_slider","{\"action\":\"\",\"moduleid\":\"125\",\"name\":\"Best Sellers\",\"module_description\":{\"1\":{\"head_name\":\"Best Sellers\"},\"2\":{\"head_name\":\"\\u0627\\u0644\\u0623\\u0643\\u062b\\u0631 \\u0645\\u0628\\u064a\\u0639\\u0627\"}},\"head_name\":\"Best Sellers\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"best-seller\",\"item_link_target\":\"_blank\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"nb_row\":\"3\",\"category\":[\"78\",\"33\",\"63\",\"61\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"8\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"85\",\"height\":\"85\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"5\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"0\",\"navs\":\"1\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\"}"),
("124","So Verticalmenu Layout 1","so_megamenu","{\"button-save\":\"\",\"moduleid\":\"124\",\"name\":\"So Verticalmenu Layout 1\",\"head_name\":{\"1\":\"So Verticalmenu Layout 1\",\"2\":\"So Verticalmenu Layout 1\"},\"disp_title_module\":\"0\",\"status\":\"1\",\"orientation\":\"1\",\"show_itemver\":\"10\",\"navigation_text\":{\"1\":\"Categories\",\"2\":\"\\u0627\\u0644\\u0641\\u0626\\u0627\\u062a\"},\"full_width\":\"0\",\"home_item\":\"disabled\",\"home_text\":{\"1\":\"\",\"2\":\"\"},\"animation\":\"slide\",\"animation_time\":\"\",\"layout_id\":100,\"position\":\"menu\",\"sort_order\":0,\"label_item\":\"hot\",\"icon_font\":\"fa fa-camera-retro\",\"class_menu\":\"\",\"search_bar\":0}"),
("119","So Megamenu","so_megamenu","{\"button-save\":\"\",\"moduleid\":\"119\",\"name\":\"So Megamenu\",\"head_name\":{\"1\":\"\",\"2\":\"\"},\"disp_title_module\":\"1\",\"status\":\"1\",\"orientation\":\"0\",\"show_itemver\":\"5\",\"navigation_text\":{\"1\":\"\",\"2\":\"\"},\"full_width\":\"1\",\"home_item\":\"text\",\"home_text\":{\"1\":\"Home\",\"2\":\"Home\"},\"animation\":\"slide\",\"animation_time\":\"500\",\"layout_id\":100,\"position\":\"menu\",\"sort_order\":0,\"label_item\":\"hot\",\"icon_font\":\"fa fa-camera-retro\",\"class_menu\":\"\",\"search_bar\":0}"),
("87"," Content Bottom - Socical - Home Layout 2,4,5,6","html","{\"name\":\" Content Bottom - Socical - Home Layout 2,4,5,6\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;ul class=&quot;social-block &quot;&gt;\\r\\n\\t\\t&lt;li class=&quot;rss&quot;&gt;&lt;a class=&quot;_blank&quot; href=&quot;#&quot; target=&quot;_blank&quot;&gt;&lt;i class=&quot;fa fa-rss&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t\\t&lt;li class=&quot;twitter&quot;&gt;&lt;a class=&quot;_blank&quot; href=&quot;https:\\/\\/twitter.com\\/smartaddons&quot; target=&quot;_blank&quot;&gt;&lt;i class=&quot;fa fa-twitter&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li class=&quot;facebook&quot;&gt;&lt;a class=&quot;_blank&quot; href=&quot;https:\\/\\/www.facebook.com\\/MagenTech&quot; target=&quot;_blank&quot;&gt;&lt;i class=&quot;fa fa-facebook&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t\\t&lt;li class=&quot;google_plus&quot;&gt;&lt;a class=&quot;_blank&quot; href=&quot;https:\\/\\/plus.google.com\\/u\\/0\\/+Smartaddons\\/posts&quot; target=&quot;_blank&quot;&gt;&lt;i class=&quot;fa  fa-google-plus&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li class=&quot;pinterest&quot;&gt;&lt;a class=&quot;_blank&quot; href=&quot;https:\\/\\/www.pinterest.com\\/smartaddons\\/&quot; target=&quot;_blank&quot;&gt;&lt;i class=&quot;fa fa-pinterest&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;\\/ul&gt;\"},\"2\":{\"title\":\"\",\"description\":\"&lt;ul class=&quot;social-block &quot;&gt;\\r\\n\\t\\t&lt;li class=&quot;rss&quot;&gt;&lt;a class=&quot;_blank&quot; href=&quot;#&quot; target=&quot;_blank&quot;&gt;&lt;i class=&quot;fa fa-rss&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t\\t&lt;li class=&quot;twitter&quot;&gt;&lt;a class=&quot;_blank&quot; href=&quot;https:\\/\\/twitter.com\\/smartaddons&quot; target=&quot;_blank&quot;&gt;&lt;i class=&quot;fa fa-twitter&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li class=&quot;facebook&quot;&gt;&lt;a class=&quot;_blank&quot; href=&quot;https:\\/\\/www.facebook.com\\/MagenTech&quot; target=&quot;_blank&quot;&gt;&lt;i class=&quot;fa fa-facebook&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t\\t&lt;li class=&quot;google_plus&quot;&gt;&lt;a class=&quot;_blank&quot; href=&quot;https:\\/\\/plus.google.com\\/u\\/0\\/+Smartaddons\\/posts&quot; target=&quot;_blank&quot;&gt;&lt;i class=&quot;fa  fa-google-plus&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li class=&quot;pinterest&quot;&gt;&lt;a class=&quot;_blank&quot; href=&quot;https:\\/\\/www.pinterest.com\\/smartaddons\\/&quot; target=&quot;_blank&quot;&gt;&lt;i class=&quot;fa fa-pinterest&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;\\/ul&gt;\"}},\"class_suffix\":\"social_block col-md-3 col-sm-12 col-xs-12\",\"status\":\"1\"}"),
("94","Search Pro","so_searchpro","{\"moduleid\":\"94\",\"name\":\"Search Pro\",\"module_description\":{\"1\":{\"head_name\":\"Search Pro\"},\"2\":{\"head_name\":\"Search Pro\"}},\"head_name\":\"Search Pro\",\"disp_title_module\":\"0\",\"class\":\"so-search\",\"width\":\"60\",\"height\":\"60\",\"limit\":\"5\",\"character\":\"3\",\"showcategory\":\"1\",\"showimage\":\"1\",\"showprice\":\"1\",\"showaddtocart\":\"0\",\"showaddtowishlist\":\"0\",\"showaddtocompare\":\"0\",\"status\":\"1\"}"),
("108","Up-sell Products","so_basic_products","{\"action\":\"save_edit\",\"name\":\"Up-sell Products\",\"module_description\":{\"1\":{\"head_name\":\"Up-sell Products\"},\"2\":{\"head_name\":\"\\u0645\\u0627 \\u064a\\u0635\\u0644 \\u0628\\u064a\\u0639 \\u0627\\u0644\\u0645\\u0646\\u062a\\u062c\\u0627\\u062a\"}},\"head_name\":\"Up-sell Products\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"up-sell\",\"item_link_target\":\"_self\",\"nb_column0\":\"4\",\"nb_column1\":\"4\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"category\":[\"78\",\"33\",\"61\",\"62\",\"63\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"sales\",\"product_ordering\":\"ASC\",\"limitation\":\"8\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"270\",\"height\":\"270\",\"product_placeholder_path\":\"nophoto.jpg\",\"moduleid\":\"108\"}"),
("148","Banner Left","html","{\"name\":\"Banner Left\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;static-image-home-left&quot;&gt;&lt;a title=&quot;Static Image&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/left-image-static.png&quot; alt=&quot;Static Image&quot;&gt;&lt;\\/a&gt;&lt;\\/div&gt;\"},\"2\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;static-image-home-left&quot;&gt;&lt;a title=&quot;Static Image&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/left-image-static.png&quot; alt=&quot;Static Image&quot;&gt;&lt;\\/a&gt;&lt;\\/div&gt;\"}},\"class_suffix\":\"banner-left\",\"status\":\"1\"}"),
("129","Hot Deals - Home Layout 1,2,3,4,5,6","so_deals","{\"action\":\"save_edit\",\"name\":\"Hot Deals - Home Layout 1,2,3,4,5,6\",\"module_description\":{\"1\":{\"head_name\":\"Hot Deals\"},\"2\":{\"head_name\":\"\\u0639\\u0631\\u0648\\u0636 \\u0633\\u0627\\u062e\\u0646\\u0629\"}},\"head_name\":\"Hot Deals\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"so-deals\",\"item_link_target\":\"_self\",\"nb_column0\":\"4\",\"nb_column1\":\"3\",\"nb_column2\":\"2\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"category\":[\"78\",\"33\",\"61\",\"62\",\"63\",\"68\",\"69\",\"70\",\"29\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"4\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"200\",\"height\":\"200\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"25\",\"slideBy\":\"4\",\"autoplay\":\"0\",\"autoplayTimeout\":\"4000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"button_page\":\"top\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"navs\":\"1\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"1000\",\"delay\":\"1000\",\"moduleid\":\"129\"}"),
("132","Electronic - Home Layout 3,4,6","so_category_slider","{\"action\":\"save_edit\",\"moduleid\":\"132\",\"name\":\"Electronic - Home Layout 3,4,6\",\"module_description\":{\"1\":{\"head_name\":\"Electronic\"},\"2\":{\"head_name\":\"Electronic\"}},\"head_name\":\"Electronic\",\"disp_title_module\":\"0\",\"status\":\"1\",\"class_suffix\":\" item-2\",\"item_link_target\":\"_self\",\"nb_column0\":\"4\",\"nb_column1\":\"3\",\"nb_column2\":\"2\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"category\":\"18\",\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"6\",\"cat_title_display\":\"1\",\"cat_title_maxcharacs\":\"25\",\"cat_image_display\":\"1\",\"width_cat\":\"870\",\"height_cat\":\"100\",\"placeholder_path\":\"catalog\\/view\\/javascript\\/so_category_slider\\/images\\/nophoto.jpg\",\"child_category_cat\":\"1\",\"source_limit_cat\":\"3\",\"cat_sub_title_maxcharacs\":\"25\",\"cat_all_product\":\"0\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"product_image\":\"1\",\"width\":\"250\",\"height\":\"220\",\"display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"margin\":\"5\",\"slideBy\":\"4\",\"autoplay\":\"0\",\"autoplay_timeout\":\"5000\",\"pausehover\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"navs\":\"1\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"800\",\"delay\":\"500\"}"),
("128","Testimonial","html","{\"name\":\"Testimonial\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;h3 class=&quot;modtitle&quot;&gt;&lt;span&gt;TESTIMONIAL&lt;\\/span&gt;&lt;\\/h3&gt;\\r\\n\\r\\n&lt;div class=&quot;block clients_say&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;owl2-carousel  slider-clients-say&quot;&gt;&lt;div class=&quot;block_content&quot;&gt;&lt;div class=&quot;text&quot;&gt;&quot;Duis aliquam, magna ac fermentum are we finibus, orci viverra risus, into varius telluso tortor sed eros. Sedion pharetra ante sit amet suscipit ornare. Integer et auctor diam sit dolor.&quot;&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;info&quot;&gt;&lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/clients_say.png&quot; alt=&quot;banner&quot; &gt;&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;author&quot;&gt;Aliquam Tellus&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;p&gt;Vitae Ornare Mauris&lt;\\/p&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;block_content&quot;&gt;&lt;div class=&quot;text&quot;&gt;&quot;Duis aliquam, magna ac fermentum are we finibus, orci viverra risus, into varius telluso tortor sed eros. Integer et auctor diam sit dolor. Sedion pharetra ante sit amet suscipit ornare. &quot;&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;info&quot;&gt;&lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/clients_say.png&quot; alt=&quot;banner&quot; &gt;&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;author&quot;&gt;Aliquam Tellus&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;p&gt;Vitae Ornare Mauris&lt;\\/p&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;block_content&quot;&gt;&lt;div class=&quot;text&quot;&gt;&quot; Integer et auctor diam sit dolor. Duis aliquam, magna ac fermentum are we finibus, orci viverra risus, into varius telluso tortor sed eros. Sedion pharetra ante sit amet suscipit ornare. &quot;&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;info&quot;&gt;&lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/clients_say.png&quot; alt=&quot;banner&quot; &gt;&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;author&quot;&gt;Aliquam Tellus&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;p&gt;Vitae Ornare Mauris&lt;\\/p&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\"},\"2\":{\"title\":\"\",\"description\":\"&lt;h3 class=&quot;modtitle&quot;&gt;&lt;span&gt;TESTIMONIAL&lt;\\/span&gt;&lt;\\/h3&gt;\\r\\n\\r\\n&lt;div class=&quot;block clients_say&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;owl2-carousel  slider-clients-say&quot;&gt;&lt;div class=&quot;block_content&quot;&gt;&lt;div class=&quot;text&quot;&gt;&quot;Duis aliquam, magna ac fermentum are we finibus, orci viverra risus, into varius telluso tortor sed eros. Sedion pharetra ante sit amet suscipit ornare. Integer et auctor diam sit dolor.&quot;&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;info&quot;&gt;&lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/clients_say.png&quot; alt=&quot;banner&quot; &gt;&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;author&quot;&gt;Aliquam Tellus&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;p&gt;Vitae Ornare Mauris&lt;\\/p&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;block_content&quot;&gt;&lt;div class=&quot;text&quot;&gt;&quot;Duis aliquam, magna ac fermentum are we finibus, orci viverra risus, into varius telluso tortor sed eros. Integer et auctor diam sit dolor. Sedion pharetra ante sit amet suscipit ornare. &quot;&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;info&quot;&gt;&lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/clients_say.png&quot; alt=&quot;banner&quot; &gt;&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;author&quot;&gt;Aliquam Tellus&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;p&gt;Vitae Ornare Mauris&lt;\\/p&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;block_content&quot;&gt;&lt;div class=&quot;text&quot;&gt;&quot; Integer et auctor diam sit dolor. Duis aliquam, magna ac fermentum are we finibus, orci viverra risus, into varius telluso tortor sed eros. Sedion pharetra ante sit amet suscipit ornare. &quot;&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;info&quot;&gt;&lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/clients_say.png&quot; alt=&quot;banner&quot; &gt;&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;div class=&quot;author&quot;&gt;Aliquam Tellus&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;p&gt;Vitae Ornare Mauris&lt;\\/p&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\"}},\"class_suffix\":\"cus-testimo\",\"status\":\"1\"}"),
("40","FQA","html","{\"name\":\"FQA\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;fqas&quot;&gt;&lt;h3 class=&quot;modtitle&quot;&gt;&lt;span&gt;FAQs&lt;\\/span&gt;&lt;\\/h3&gt;\\r\\n&lt;div class=&quot;accordion&quot;&gt;&lt;div class=&quot;accordion-section&quot;&gt;&lt;a class=&quot;accordion-section-title active&quot; href=&quot;#accordion-1&quot;&gt;Pellentesque vitae imperdiet in?&lt;\\/a&gt;&lt;div id=&quot;accordion-1&quot; class=&quot;accordion-section-content open&quot; style=&quot;display: block;&quot;&gt;&lt;p&gt;Mauris interdum fringilla augue vitae tincidunt. Curabitur vitae tortor id eros euismod ultrices.Mauris interdum fringilla augue vitae.&lt;\\/p&gt;\\r\\n&lt;\\/div&gt;\\r\\n&lt;!--end .accordion-section-content--&gt;&lt;\\/div&gt;\\r\\n&lt;!--end .accordion-section--&gt;&lt;div class=&quot;accordion-section&quot;&gt;&lt;a class=&quot;accordion-section-title&quot; href=&quot;#accordion-2&quot;&gt;Hendrerit eu nunc massa?&lt;\\/a&gt;&lt;div id=&quot;accordion-2&quot; class=&quot;accordion-section-content&quot;&gt;&lt;p&gt;Mauris interdum fringilla augue vitae tincidunt. Curabitur vitae tortor id eros euismod ultrices.Mauris interdum fringilla augue vitae.&lt;\\/p&gt;\\r\\n&lt;\\/div&gt;\\r\\n&lt;!--end .accordion-section-content--&gt;&lt;\\/div&gt;\\r\\n&lt;!--end .accordion-section--&gt;&lt;div class=&quot;accordion-section&quot;&gt;&lt;a class=&quot;accordion-section-title&quot; href=&quot;#accordion-3&quot;&gt;Mauris interdum fringilla augue?&lt;\\/a&gt;&lt;div id=&quot;accordion-3&quot; class=&quot;accordion-section-content&quot;&gt;&lt;p&gt;Mauris interdum fringilla augue vitae tincidunt. Curabitur vitae tortor id eros euismod ultrices.Mauris interdum fringilla augue vitae.&lt;\\/p&gt;\\r\\n&lt;\\/div&gt;\\r\\n&lt;!--end .accordion-section-content--&gt;&lt;\\/div&gt;\\r\\n&lt;div class=&quot;accordion-section&quot;&gt;&lt;a class=&quot;accordion-section-title&quot; href=&quot;#accordion-4&quot;&gt;Curabitur vitae tortor id eros?&lt;\\/a&gt;&lt;div id=&quot;accordion-4&quot; class=&quot;accordion-section-content&quot;&gt;&lt;p&gt;Mauris interdum fringilla augue vitae tincidunt. Curabitur vitae tortor id eros euismod ultrices.Mauris interdum fringilla augue vitae.&lt;\\/p&gt;\\r\\n&lt;\\/div&gt;\\r\\n&lt;!--end .accordion-section-content--&gt;&lt;\\/div&gt;\\r\\n&lt;!--end .accordion-section--&gt;&lt;\\/div&gt;\\r\\n&lt;!--end .accordion--&gt;&lt;\\/div&gt;\"},\"2\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;fqas&quot;&gt;&lt;h3 class=&quot;modtitle&quot;&gt;&lt;span&gt;FAQs&lt;\\/span&gt;&lt;\\/h3&gt;&lt;div class=&quot;accordion&quot;&gt;&lt;div class=&quot;accordion-section&quot;&gt;&lt;a class=&quot;accordion-section-title active&quot; href=&quot;#accordion-1&quot;&gt;Pellentesque vitae imperdiet in?&lt;\\/a&gt;&lt;div id=&quot;accordion-1&quot; class=&quot;accordion-section-content open&quot; style=&quot;display: block;&quot;&gt;&lt;p&gt;Mauris interdum fringilla augue vitae tincidunt. Curabitur vitae tortor id eros euismod ultrices.Mauris interdum fringilla augue vitae.&lt;\\/p&gt;&lt;\\/div&gt;&lt;!--end .accordion-section-content--&gt;&lt;\\/div&gt;&lt;!--end .accordion-section--&gt;&lt;div class=&quot;accordion-section&quot;&gt;&lt;a class=&quot;accordion-section-title&quot; href=&quot;#accordion-2&quot;&gt;Hendrerit eu nunc massa?&lt;\\/a&gt;&lt;div id=&quot;accordion-2&quot; class=&quot;accordion-section-content&quot;&gt;&lt;p&gt;Mauris interdum fringilla augue vitae tincidunt. Curabitur vitae tortor id eros euismod ultrices.Mauris interdum fringilla augue vitae.&lt;\\/p&gt;&lt;\\/div&gt;&lt;!--end .accordion-section-content--&gt;&lt;\\/div&gt;&lt;!--end .accordion-section--&gt;&lt;div class=&quot;accordion-section&quot;&gt;&lt;a class=&quot;accordion-section-title&quot; href=&quot;#accordion-3&quot;&gt;Mauris interdum fringilla augue?&lt;\\/a&gt;&lt;div id=&quot;accordion-3&quot; class=&quot;accordion-section-content&quot;&gt;&lt;p&gt;Mauris interdum fringilla augue vitae tincidunt. Curabitur vitae tortor id eros euismod ultrices.Mauris interdum fringilla augue vitae.&lt;\\/p&gt;&lt;\\/div&gt;&lt;!--end .accordion-section-content--&gt;&lt;\\/div&gt;&lt;div class=&quot;accordion-section&quot;&gt;&lt;a class=&quot;accordion-section-title&quot; href=&quot;#accordion-4&quot;&gt;Curabitur vitae tortor id eros?&lt;\\/a&gt;&lt;div id=&quot;accordion-4&quot; class=&quot;accordion-section-content&quot;&gt;&lt;p&gt;Mauris interdum fringilla augue vitae tincidunt. Curabitur vitae tortor id eros euismod ultrices.Mauris interdum fringilla augue vitae.&lt;\\/p&gt;&lt;\\/div&gt;&lt;!--end .accordion-section-content--&gt;&lt;\\/div&gt;&lt;!--end .accordion-section--&gt;&lt;\\/div&gt;&lt;!--end .accordion--&gt;&lt;\\/div&gt;\"}},\"class_suffix\":\"fqa\",\"status\":\"1\"}"),
("177","Best Sellers - Home Layout 4","so_extra_slider","{\"action\":\"\",\"moduleid\":\"125\",\"name\":\"Best Sellers\",\"module_description\":{\"1\":{\"head_name\":\"Best Sellers\"},\"2\":{\"head_name\":\"\\u0627\\u0644\\u0623\\u0643\\u062b\\u0631 \\u0645\\u0628\\u064a\\u0639\\u0627\"}},\"head_name\":\"Best Sellers\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"best-seller\",\"item_link_target\":\"_blank\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"nb_row\":\"4\",\"category\":[\"78\",\"33\",\"61\",\"62\",\"63\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"8\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"72\",\"height\":\"72\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"5\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"0\",\"navs\":\"1\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\"}"),
("133","Computer - Home Layout 3,4,6","so_category_slider","{\"action\":\"save_edit\",\"moduleid\":\"133\",\"name\":\"Computer - Home Layout 3,4,6\",\"module_description\":{\"1\":{\"head_name\":\"Computer\"},\"2\":{\"head_name\":\"Computer\"}},\"head_name\":\"Computer\",\"disp_title_module\":\"0\",\"status\":\"1\",\"class_suffix\":\" item-3\",\"item_link_target\":\"_self\",\"nb_column0\":\"4\",\"nb_column1\":\"3\",\"nb_column2\":\"2\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"category\":\"18\",\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"6\",\"cat_title_display\":\"1\",\"cat_title_maxcharacs\":\"25\",\"cat_image_display\":\"1\",\"width_cat\":\"870\",\"height_cat\":\"100\",\"placeholder_path\":\"catalog\\/view\\/javascript\\/so_category_slider\\/images\\/nophoto.jpg\",\"child_category_cat\":\"1\",\"source_limit_cat\":\"4\",\"cat_sub_title_maxcharacs\":\"25\",\"cat_all_product\":\"0\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"product_image\":\"1\",\"width\":\"250\",\"height\":\"220\",\"display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"margin\":\"5\",\"slideBy\":\"4\",\"autoplay\":\"0\",\"autoplay_timeout\":\"5000\",\"pausehover\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"navs\":\"1\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"800\",\"delay\":\"500\"}"),
("135","Slideshow - Home Layout 2,4","banner","{\"name\":\"Slideshow - Home Layout 2,4\",\"banner_id\":\"7\",\"width\":\"1170\",\"height\":\"433\",\"status\":\"1\"}"),
("130","Mobiles &amp; Tablets - Home Layout 3,4,6","so_category_slider","{\"action\":\"save_edit\",\"moduleid\":\"130\",\"name\":\"Mobiles &amp; Tablets - Home Layout 3,4,6\",\"module_description\":{\"1\":{\"head_name\":\"Mobiles &amp; Tablets\"},\"2\":{\"head_name\":\"Mobiles &amp; Tablets\"}},\"head_name\":\"Mobiles &amp; Tablets\",\"disp_title_module\":\"0\",\"status\":\"1\",\"class_suffix\":\" item-1\",\"item_link_target\":\"_self\",\"nb_column0\":\"4\",\"nb_column1\":\"3\",\"nb_column2\":\"2\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"category\":\"20\",\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"pd.name\",\"product_ordering\":\"ASC\",\"source_limit\":\"8\",\"cat_title_display\":\"1\",\"cat_title_maxcharacs\":\"25\",\"cat_image_display\":\"1\",\"width_cat\":\"870\",\"height_cat\":\"100\",\"placeholder_path\":\"catalog\\/view\\/javascript\\/so_category_slider\\/images\\/nophoto.jpg\",\"child_category_cat\":\"1\",\"source_limit_cat\":\"3\",\"cat_sub_title_maxcharacs\":\"25\",\"cat_all_product\":\"0\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"product_image\":\"1\",\"width\":\"250\",\"height\":\"220\",\"display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"margin\":\"5\",\"slideBy\":\"4\",\"autoplay\":\"0\",\"autoplay_timeout\":\"5000\",\"pausehover\":\"1\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"navs\":\"1\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"600\",\"delay\":\"300\"}"),
("81","Content Block1- Block Service - Home Layout 2,4,5,6","html","{\"name\":\"Content Block1- Block Service - Home Layout 2,4,5,6\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;ul class=&quot;list-services&quot;&gt;\\r\\n&lt;li class=&quot;item-service col-lg-4 col-md-4 col-sm-4 col-xs-12&quot;&gt;&lt;a title=&quot;Free Shipping&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/free-shipping.png&quot; alt=&quot;Free Shipping&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n&lt;li class=&quot;item-service col-lg-4 col-md-4 col-sm-4 col-xs-12&quot;&gt;&lt;a title=&quot;Guaranteed&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/guaranteed.png&quot; alt=&quot;Guaranteed&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n&lt;li class=&quot;item-service col-lg-4 col-md-4 col-sm-4 col-xs-12&quot;&gt;&lt;a title=&quot;Deal&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/deal.png&quot; alt=&quot;Deal&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n&lt;\\/ul&gt;\"},\"2\":{\"title\":\"\",\"description\":\"&lt;ul class=&quot;list-services&quot;&gt;\\r\\n&lt;li class=&quot;item-service col-lg-4 col-md-4 col-sm-4 col-xs-12&quot;&gt;&lt;a title=&quot;Free Shipping&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/free-shipping.png&quot; alt=&quot;Free Shipping&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n&lt;li class=&quot;item-service col-lg-4 col-md-4 col-sm-4 col-xs-12&quot;&gt;&lt;a title=&quot;Guaranteed&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/guaranteed.png&quot; alt=&quot;Guaranteed&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n&lt;li class=&quot;item-service col-lg-4 col-md-4 col-sm-4 col-xs-12&quot;&gt;&lt;a title=&quot;Deal&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/deal.png&quot; alt=&quot;Deal&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n&lt;\\/ul&gt;\"}},\"class_suffix\":\"\",\"status\":\"1\"}"),
("180","Content Top - Banner Middle - Home Layout 4","html","{\"name\":\"Content Top - Banner Middle - Home Layout 4\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;static-home-2&quot;&gt;&lt;ul&gt;\\r\\n&lt;li class=&quot;col-s-1&quot;&gt;&lt;a title=&quot;Static Image&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/st-img-1-home-2.png&quot; alt=&quot;Static Image&quot;&gt;&lt;\\/a&gt; &lt;a title=&quot;Static Image&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/st-img-2-home-2.png&quot; alt=&quot;Static Image&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n&lt;li class=&quot;col-s-2&quot;&gt;&lt;a title=&quot;Static Image&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/st-img-3-home-2.png&quot; alt=&quot;Static Image&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n&lt;li class=&quot;col-s-3&quot;&gt;&lt;a title=&quot;Static Image&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/st-img-4-home-2.png&quot; alt=&quot;Static Image&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n&lt;li class=&quot;col-s-4&quot;&gt;&lt;a title=&quot;Static Image&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/st-img-5-home-2.png&quot; alt=&quot;Static Image&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n&lt;\\/ul&gt;\\r\\n&lt;\\/div&gt;\"},\"2\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;static-home-2&quot;&gt;&lt;ul&gt;&lt;li class=&quot;col-s-1&quot;&gt;&lt;a title=&quot;Static Image&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/st-img-1-home-2.png&quot; alt=&quot;Static Image&quot;&gt;&lt;\\/a&gt; &lt;a title=&quot;Static Image&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/st-img-2-home-2.png&quot; alt=&quot;Static Image&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;&lt;li class=&quot;col-s-2&quot;&gt;&lt;a title=&quot;Static Image&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/st-img-3-home-2.png&quot; alt=&quot;Static Image&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;&lt;li class=&quot;col-s-3&quot;&gt;&lt;a title=&quot;Static Image&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/st-img-4-home-2.png&quot; alt=&quot;Static Image&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;&lt;li class=&quot;col-s-4&quot;&gt;&lt;a title=&quot;Static Image&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/st-img-5-home-2.png&quot; alt=&quot;Static Image&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;&lt;\\/ul&gt;&lt;\\/div&gt;\"}},\"class_suffix\":\" banner-middle\",\"status\":\"1\"}");


DROP TABLE IF EXISTS ?:setting;
CREATE TABLE `?:setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` longtext NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44416 DEFAULT CHARSET=utf8;

INSERT INTO ?:setting VALUES
("28992","0","newsletters","newsletters_status","1","0"),
("41516","0","config","config_file_mime_allowed","text/plain
\nimage/png
\nimage/jpeg
\nimage/gif
\nimage/bmp
\nimage/tiff
\nimage/svg+xml
\napplication/zip
\n&quot;application/zip&quot;
\napplication/x-zip
\n&quot;application/x-zip&quot;
\napplication/x-zip-compressed
\n&quot;application/x-zip-compressed&quot;
\napplication/rar
\n&quot;application/rar&quot;
\napplication/x-rar
\n&quot;application/x-rar&quot;
\napplication/x-rar-compressed
\n&quot;application/x-rar-compressed&quot;
\napplication/octet-stream
\n&quot;application/octet-stream&quot;
\naudio/mpeg
\nvideo/quicktime
\napplication/pdf","0"),
("41517","0","config","config_error_display","1","0"),
("41518","0","config","config_error_log","1","0"),
("41519","0","config","config_error_filename","error.log","0"),
("41515","0","config","config_file_ext_allowed","zip
\ntxt
\npng
\njpe
\njpeg
\njpg
\ngif
\nbmp
\nico
\ntiff
\ntif
\nsvg
\nsvgz
\nzip
\nrar
\nmsi
\ncab
\nmp3
\nqt
\nmov
\npdf
\npsd
\nai
\neps
\nps
\ndoc","0"),
("41514","0","config","config_file_max_size","300000","0"),
("41509","0","config","config_compression","6","0"),
("41510","0","config","config_secure","0","0"),
("41511","0","config","config_password","1","0"),
("41512","0","config","config_shared","0","0"),
("41513","0","config","config_encryption","PVEYqpkyNmZJIsLrOksaykahH2M82d1doqe2LmONbv63yKpoi1c4BPXZCwUiPgCWQKimxGBepuzdJ126MQ30smozR3BwvuvefSMtsEqV3G0NzRZSAwVtNouuqlXx25AlW5gSiK9rSVefoUEzf7WQAszwk9Q9Lf7sleLbB7zCmhTU10fbdnihpwLLuqrGCiGdeIr7LNWaqsHIfMPIfb6HjAqQLF4w0LPBnr5EZ0F7qds0B8KAuvXh537BXA1Kf4kfpJBDiOUArGE6ocYi2ufSxh7vmrcFugKV7f7HckPQWuBfo4KwSLrALyusTMXErPWMsfBE3iUx88yHrGATrkAN7Ww85uE9klWOvXHTwnLT0k9gDhhaQWH1l4zThIk8x7Ht8LmqkhVhKUD8lcvnDlM8Ge2zqxo9vB05J6vPmAzRfO5sis0r1VhLuAdpZWug5LEfymezkhq1RorCTwEX6fd0brkE0SKRx9orjCsFMpdJnkqH1xoLr9xkIUWPK8fs9eJwneeOd2T5g4jD6Yk2hb0t733gQQK8suW4jtXD3K64vqEI20twC1jOdUi8VQ3W4q9NDay9lbBYszFfSmKmbiRpT6lJb8HA1lEQ4FmwD40ULqrP8hH87dzl954c65Z8u1QEraFnku9URler0JhvYzI9xZT3rRi0zCDwwz4WgsvDROprQEBaZKQVuBh5RMSrNsOXuj0HPkkI3r1NkUZedo8gR1GWuTLVFjqxUEpG5fcCM2q2jj6QRwodLPRKqYcPAmkgCwW8Q8BsDLPuZYIkU4xVeDZ207tanP2RrqrITtFKASV41nsUbHGgOoIAJPmHwUIFncNUWGyIDAqrkqeds8zheoNrTILZxTYpIvD2spcj3CVmgZMxtLqVJaHUcevfUaIDx9q9hUtSdIvHSNqxMoldwGGPGdnuWnUte8LIRVXHkHQks6XxVBw0fMI190Yn1mvqIcULDBCpicBNwAQtuyrmA1F4IQcXILyfeoXvz4Ah2WEw5FmZqRWvErYkrWF1DfkC","0"),
("41446","0","config","config_login_attempts","5","0"),
("41447","0","config","config_account_id","3","0"),
("41448","0","config","config_account_mail","0","0"),
("41449","0","config","config_invoice_prefix","INV-2013-00","0"),
("41450","0","config","config_cart_weight","1","0"),
("41451","0","config","config_checkout_guest","1","0"),
("41452","0","config","config_checkout_id","5","0"),
("41453","0","config","config_order_status_id","1","0"),
("41454","0","config","config_processing_status","[\"2\"]","1"),
("41455","0","config","config_complete_status","[\"5\"]","1"),
("41456","0","config","config_fraud_status_id","7","0"),
("41457","0","config","config_order_mail","0","0"),
("41458","0","config","config_api_id","4","0"),
("41459","0","config","config_stock_display","0","0"),
("41460","0","config","config_stock_warning","0","0"),
("41461","0","config","config_stock_checkout","0","0"),
("41462","0","config","config_affiliate_approval","0","0"),
("41463","0","config","config_affiliate_auto","0","0"),
("41464","0","config","config_affiliate_commission","5","0"),
("41465","0","config","config_affiliate_id","4","0"),
("41466","0","config","config_affiliate_mail","0","0"),
("41467","0","config","config_return_id","0","0"),
("41468","0","config","config_return_status_id","2","0"),
("41469","0","config","config_captcha","","0"),
("41470","0","config","config_logo","catalog/theme_logo.png","0"),
("41471","0","config","config_icon","catalog/favicon.png","0"),
("44240","0","config","config_image_location_height","50","0"),
("44239","0","config","config_image_location_width","268","0"),
("44238","0","config","config_image_cart_height","74","0"),
("44237","0","config","config_image_cart_width","74","0"),
("44236","0","config","config_image_wishlist_height","47","0"),
("44235","0","config","config_image_wishlist_width","47","0"),
("44234","0","config","config_image_compare_height","90","0"),
("44233","0","config","config_image_compare_width","90","0"),
("44232","0","config","config_image_related_height","270","0"),
("44231","0","config","config_image_related_width","270","0"),
("44230","0","config","config_image_additional_height","460","0"),
("44229","0","config","config_image_additional_width","460","0"),
("44228","0","config","config_image_product_height","270","0"),
("44227","0","config","config_image_product_width","270","0"),
("44226","0","config","config_image_popup_height","1000","0"),
("44225","0","config","config_image_popup_width","1000","0"),
("44224","0","config","config_image_thumb_height","460","0"),
("44223","0","config","config_image_thumb_width","460","0"),
("44222","0","config","config_image_category_height","75","0"),
("44163","0","config","config_image_category_width","133","0"),
("41492","0","config","config_ftp_hostname","localhost","0"),
("41493","0","config","config_ftp_port","21","0"),
("41494","0","config","config_ftp_username","","0"),
("41495","0","config","config_ftp_password","","0"),
("41496","0","config","config_ftp_root","","0"),
("41497","0","config","config_ftp_status","0","0"),
("41498","0","config","config_mail_protocol","mail","0"),
("41499","0","config","config_mail_parameter","","0"),
("41500","0","config","config_mail_smtp_hostname","","0"),
("41501","0","config","config_mail_smtp_username","","0"),
("41502","0","config","config_mail_smtp_password","","0"),
("41503","0","config","config_mail_smtp_port","25","0"),
("41504","0","config","config_mail_smtp_timeout","5","0"),
("41505","0","config","config_mail_alert","","0"),
("41506","0","config","config_maintenance","0","0"),
("41507","0","config","config_seo_url","0","0"),
("41508","0","config","config_robots","abot
\ndbot
\nebot
\nhbot
\nkbot
\nlbot
\nmbot
\nnbot
\nobot
\npbot
\nrbot
\nsbot
\ntbot
\nvbot
\nybot
\nzbot
\nbot.
\nbot/
\n_bot
\n.bot
\n/bot
\n-bot
\n:bot
\n(bot
\ncrawl
\nslurp
\nspider
\nseek
\naccoona
\nacoon
\nadressendeutschland
\nah-ha.com
\nahoy
\naltavista
\nananzi
\nanthill
\nappie
\narachnophilia
\narale
\naraneo
\naranha
\narchitext
\naretha
\narks
\nasterias
\natlocal
\natn
\natomz
\naugurfind
\nbackrub
\nbannana_bot
\nbaypup
\nbdfetch
\nbig brother
\nbiglotron
\nbjaaland
\nblackwidow
\nblaiz
\nblog
\nblo.
\nbloodhound
\nboitho
\nbooch
\nbradley
\nbutterfly
\ncalif
\ncassandra
\nccubee
\ncfetch
\ncharlotte
\nchurl
\ncienciaficcion
\ncmc
\ncollective
\ncomagent
\ncombine
\ncomputingsite
\ncsci
\ncurl
\ncusco
\ndaumoa
\ndeepindex
\ndelorie
\ndepspid
\ndeweb
\ndie blinde kuh
\ndigger
\nditto
\ndmoz
\ndocomo
\ndownload express
\ndtaagent
\ndwcp
\nebiness
\nebingbong
\ne-collector
\nejupiter
\nemacs-w3 search engine
\nesther
\nevliya celebi
\nezresult
\nfalcon
\nfelix ide
\nferret
\nfetchrover
\nfido
\nfindlinks
\nfireball
\nfish search
\nfouineur
\nfunnelweb
\ngazz
\ngcreep
\ngenieknows
\ngetterroboplus
\ngeturl
\nglx
\ngoforit
\ngolem
\ngrabber
\ngrapnel
\ngralon
\ngriffon
\ngromit
\ngrub
\ngulliver
\nhamahakki
\nharvest
\nhavindex
\nhelix
\nheritrix
\nhku www octopus
\nhomerweb
\nhtdig
\nhtml index
\nhtml_analyzer
\nhtmlgobble
\nhubater
\nhyper-decontextualizer
\nia_archiver
\nibm_planetwide
\nichiro
\niconsurf
\niltrovatore
\nimage.kapsi.net
\nimagelock
\nincywincy
\nindexer
\ninfobee
\ninformant
\ningrid
\ninktomisearch.com
\ninspector web
\nintelliagent
\ninternet shinchakubin
\nip3000
\niron33
\nisraeli-search
\nivia
\njack
\njakarta
\njavabee
\njetbot
\njumpstation
\nkatipo
\nkdd-explorer
\nkilroy
\nknowledge
\nkototoi
\nkretrieve
\nlabelgrabber
\nlachesis
\nlarbin
\nlegs
\nlibwww
\nlinkalarm
\nlink validator
\nlinkscan
\nlockon
\nlwp
\nlycos
\nmagpie
\nmantraagent
\nmapoftheinternet
\nmarvin/
\nmattie
\nmediafox
\nmediapartners
\nmercator
\nmerzscope
\nmicrosoft url control
\nminirank
\nmiva
\nmj12
\nmnogosearch
\nmoget
\nmonster
\nmoose
\nmotor
\nmultitext
\nmuncher
\nmuscatferret
\nmwd.search
\nmyweb
\nnajdi
\nnameprotect
\nnationaldirectory
\nnazilla
\nncsa beta
\nnec-meshexplorer
\nnederland.zoek
\nnetcarta webmap engine
\nnetmechanic
\nnetresearchserver
\nnetscoop
\nnewscan-online
\nnhse
\nnokia6682/
\nnomad
\nnoyona
\nnutch
\nnzexplorer
\nobjectssearch
\noccam
\nomni
\nopen text
\nopenfind
\nopenintelligencedata
\norb search
\nosis-project
\npack rat
\npageboy
\npagebull
\npage_verifier
\npanscient
\nparasite
\npartnersite
\npatric
\npear.
\npegasus
\nperegrinator
\npgp key agent
\nphantom
\nphpdig
\npicosearch
\npiltdownman
\npimptrain
\npinpoint
\npioneer
\npiranha
\nplumtreewebaccessor
\npogodak
\npoirot
\npompos
\npoppelsdorf
\npoppi
\npopular iconoclast
\npsycheclone
\npublisher
\npython
\nrambler
\nraven search
\nroach
\nroad runner
\nroadhouse
\nrobbie
\nrobofox
\nrobozilla
\nrules
\nsalty
\nsbider
\nscooter
\nscoutjet
\nscrubby
\nsearch.
\nsearchprocess
\nsemanticdiscovery
\nsenrigan
\nsg-scout
\nshai\'hulud
\nshark
\nshopwiki
\nsidewinder
\nsift
\nsilk
\nsimmany
\nsite searcher
\nsite valet
\nsitetech-rover
\nskymob.com
\nsleek
\nsmartwit
\nsna-
\nsnappy
\nsnooper
\nsohu
\nspeedfind
\nsphere
\nsphider
\nspinner
\nspyder
\nsteeler/
\nsuke
\nsuntek
\nsupersnooper
\nsurfnomore
\nsven
\nsygol
\nszukacz
\ntach black widow
\ntarantula
\ntempleton
\n/teoma
\nt-h-u-n-d-e-r-s-t-o-n-e
\ntheophrastus
\ntitan
\ntitin
\ntkwww
\ntoutatis
\nt-rex
\ntutorgig
\ntwiceler
\ntwisted
\nucsd
\nudmsearch
\nurl check
\nupdated
\nvagabondo
\nvalkyrie
\nverticrawl
\nvictoria
\nvision-search
\nvolcano
\nvoyager/
\nvoyager-hc
\nw3c_validator
\nw3m2
\nw3mir
\nwalker
\nwallpaper
\nwanderer
\nwauuu
\nwavefire
\nweb core
\nweb hopper
\nweb wombat
\nwebbandit
\nwebcatcher
\nwebcopy
\nwebfoot
\nweblayers
\nweblinker
\nweblog monitor
\nwebmirror
\nwebmonkey
\nwebquest
\nwebreaper
\nwebsitepulse
\nwebsnarf
\nwebstolperer
\nwebvac
\nwebwalk
\nwebwatch
\nwebwombat
\nwebzinger
\nwhizbang
\nwhowhere
\nwild ferret
\nworldlight
\nwwwc
\nwwwster
\nxenu
\nxget
\nxift
\nxirq
\nyandex
\nyanga
\nyeti
\nyodao
\nzao
\nzippp
\nzyborg","0"),
("41445","0","config","config_customer_price","0","0"),
("41443","0","config","config_customer_group_id","1","0"),
("41444","0","config","config_customer_group_display","[\"1\"]","1"),
("41441","0","config","config_tax_customer","shipping","0"),
("41442","0","config","config_customer_online","0","0"),
("41440","0","config","config_tax_default","shipping","0"),
("43716","0","soconfig","soconfig_social_store","{\"2\":{\"social_status\":\"0\",\"facebook\":\"envato\",\"twitter\":\"envato\",\"video_code\":\"LHdVkPrdRYg\"},\"6\":{\"social_status\":\"0\",\"facebook\":\"\",\"twitter\":\"\",\"video_code\":\"\"},\"7\":{\"social_status\":\"0\",\"facebook\":\"\",\"twitter\":\"\",\"video_code\":\"\"},\"8\":{\"social_status\":\"0\",\"facebook\":\"\",\"twitter\":\"\",\"video_code\":\"\"},\"9\":{\"social_status\":\"0\",\"facebook\":\"\",\"twitter\":\"\",\"video_code\":\"\"},\"10\":{\"social_status\":\"0\",\"facebook\":\"\",\"twitter\":\"\",\"video_code\":\"\"}}","1"),
("43717","0","soconfig","soconfig_custom_store","{\"2\":{\"cssinput_status\":\"0\",\"cssfile_status\":\"0\",\"jsinput_status\":\"0\",\"jsfile_status\":\"0\"},\"custom_css\":\"\",\"custom_js\":\"\",\"6\":{\"cssinput_status\":\"0\",\"cssfile_status\":\"0\",\"jsinput_status\":\"0\",\"jsfile_status\":\"0\"},\"7\":{\"cssinput_status\":\"0\",\"cssfile_status\":\"0\",\"jsinput_status\":\"0\",\"jsfile_status\":\"0\"},\"8\":{\"cssinput_status\":\"0\",\"cssfile_status\":\"0\",\"jsinput_status\":\"0\",\"jsfile_status\":\"0\"},\"9\":{\"cssinput_status\":\"0\",\"cssfile_status\":\"0\",\"jsinput_status\":\"0\",\"jsfile_status\":\"0\"},\"10\":{\"cssinput_status\":\"0\",\"cssfile_status\":\"0\",\"jsinput_status\":\"0\",\"jsfile_status\":\"0\"}}","1"),
("43712","0","soconfig","soconfig_lang_store","{\"1\":{\"2\":{\"view_details\":\"Add To Cart\",\"tags_tab_title\":\"Tags\",\"brands_title\":\"\",\"countdown_title\":\"\",\"countdown_title_day\":\"\",\"countdown_title_hour\":\"\",\"countdown_title_minute\":\"\",\"countdown_title_second\":\"\"},\"6\":{\"view_details\":\"\",\"tags_tab_title\":\"\",\"brands_title\":\"\",\"countdown_title\":\"\",\"countdown_title_day\":\"\",\"countdown_title_hour\":\"\",\"countdown_title_minute\":\"\",\"countdown_title_second\":\"\"},\"7\":{\"view_details\":\"\",\"tags_tab_title\":\"\",\"brands_title\":\"\",\"countdown_title\":\"\",\"countdown_title_day\":\"\",\"countdown_title_hour\":\"\",\"countdown_title_minute\":\"\",\"countdown_title_second\":\"\"},\"8\":{\"view_details\":\"\",\"tags_tab_title\":\"\",\"brands_title\":\"\",\"countdown_title\":\"\",\"countdown_title_day\":\"\",\"countdown_title_hour\":\"\",\"countdown_title_minute\":\"\",\"countdown_title_second\":\"\"},\"9\":{\"view_details\":\"\",\"tags_tab_title\":\"\",\"brands_title\":\"\",\"countdown_title\":\"\",\"countdown_title_day\":\"\",\"countdown_title_hour\":\"\",\"countdown_title_minute\":\"\",\"countdown_title_second\":\"\"},\"10\":{\"view_details\":\"\",\"tags_tab_title\":\"\",\"brands_title\":\"\",\"countdown_title\":\"\",\"countdown_title_day\":\"\",\"countdown_title_hour\":\"\",\"countdown_title_minute\":\"\",\"countdown_title_second\":\"\"}},\"2\":{\"2\":{\"view_details\":\"Add To Cart\",\"tags_tab_title\":\"Tags\",\"brands_title\":\"\",\"countdown_title\":\"\",\"countdown_title_day\":\"\",\"countdown_title_hour\":\"\",\"countdown_title_minute\":\"\",\"countdown_title_second\":\"\"},\"6\":{\"view_details\":\"\",\"tags_tab_title\":\"\",\"brands_title\":\"\",\"countdown_title\":\"\",\"countdown_title_day\":\"\",\"countdown_title_hour\":\"\",\"countdown_title_minute\":\"\",\"countdown_title_second\":\"\"},\"7\":{\"view_details\":\"\",\"tags_tab_title\":\"\",\"brands_title\":\"\",\"countdown_title\":\"\",\"countdown_title_day\":\"\",\"countdown_title_hour\":\"\",\"countdown_title_minute\":\"\",\"countdown_title_second\":\"\"},\"8\":{\"view_details\":\"\",\"tags_tab_title\":\"\",\"brands_title\":\"\",\"countdown_title\":\"\",\"countdown_title_day\":\"\",\"countdown_title_hour\":\"\",\"countdown_title_minute\":\"\",\"countdown_title_second\":\"\"},\"9\":{\"view_details\":\"\",\"tags_tab_title\":\"\",\"brands_title\":\"\",\"countdown_title\":\"\",\"countdown_title_day\":\"\",\"countdown_title_hour\":\"\",\"countdown_title_minute\":\"\",\"countdown_title_second\":\"\"},\"10\":{\"view_details\":\"\",\"tags_tab_title\":\"\",\"brands_title\":\"\",\"countdown_title\":\"\",\"countdown_title_day\":\"\",\"countdown_title_hour\":\"\",\"countdown_title_minute\":\"\",\"countdown_title_second\":\"\"}}}","1"),
("43713","0","soconfig","soconfig_layout_store","{\"2\":{\"layoutstyle\":\"full\",\"general_bgcolor\":\"\",\"pattern\":\"none\",\"soconfig_contentbg\":\"\",\"content_bg_mode\":\"repeat\",\"content_attachment\":\"scroll\"},\"6\":{\"layoutstyle\":\"full\",\"general_bgcolor\":\"&lt;b&gt;Notice&lt;\\/b&gt;: Undefined offset: 6 in &lt;b&gt;D:\\\\xampp\\\\htdocs\\\\ytc_templates\\\\opencart\\\\so_maxshop\\\\admin\\\\view\\\\template\\\\module\\\\options_stores.php&lt;\\/b&gt; on line &lt;b&gt;422&lt;\\/b&gt;\",\"pattern\":\"none\",\"soconfig_contentbg\":\"\",\"content_bg_mode\":\"repeat\",\"content_attachment\":\"scroll\"},\"7\":{\"layoutstyle\":\"full\",\"general_bgcolor\":\"&lt;b&gt;Notice&lt;\\/b&gt;: Undefined offset: 7 in &lt;b&gt;D:\\\\xampp\\\\htdocs\\\\ytc_templates\\\\opencart\\\\so_maxshop\\\\admin\\\\view\\\\template\\\\module\\\\options_stores.php&lt;\\/b&gt; on line &lt;b&gt;422&lt;\\/b&gt;\",\"pattern\":\"none\",\"soconfig_contentbg\":\"\",\"content_bg_mode\":\"repeat\",\"content_attachment\":\"scroll\"},\"8\":{\"layoutstyle\":\"full\",\"general_bgcolor\":\"&lt;b&gt;Notice&lt;\\/b&gt;: Undefined offset: 8 in &lt;b&gt;D:\\\\xampp\\\\htdocs\\\\ytc_templates\\\\opencart\\\\so_maxshop\\\\admin\\\\view\\\\template\\\\module\\\\options_stores.php&lt;\\/b&gt; on line &lt;b&gt;422&lt;\\/b&gt;\",\"pattern\":\"none\",\"soconfig_contentbg\":\"\",\"content_bg_mode\":\"repeat\",\"content_attachment\":\"scroll\"},\"9\":{\"layoutstyle\":\"full\",\"general_bgcolor\":\"&lt;b&gt;Notice&lt;\\/b&gt;: Undefined offset: 9 in &lt;b&gt;D:\\\\xampp\\\\htdocs\\\\ytc_templates\\\\opencart\\\\so_maxshop\\\\admin\\\\view\\\\template\\\\module\\\\options_stores.php&lt;\\/b&gt; on line &lt;b&gt;422&lt;\\/b&gt;\",\"pattern\":\"none\",\"soconfig_contentbg\":\"\",\"content_bg_mode\":\"repeat\",\"content_attachment\":\"scroll\"},\"10\":{\"layoutstyle\":\"full\",\"general_bgcolor\":\"&lt;b&gt;Notice&lt;\\/b&gt;: Undefined offset: 10 in &lt;b&gt;D:\\\\xampp\\\\htdocs\\\\ytc_templates\\\\opencart\\\\so_maxshop\\\\admin\\\\view\\\\template\\\\module\\\\options_stores.php&lt;\\/b&gt; on line &lt;b&gt;422&lt;\\/b&gt;\",\"pattern\":\"45\",\"soconfig_contentbg\":\"\",\"content_bg_mode\":\"repeat\",\"content_attachment\":\"scroll\"}}","1"),
("43714","0","soconfig","soconfig_pages_store","{\"2\":{\"product_catalog_refine\":\"2\",\"product_catalog_refine_col_md\":\"4\",\"product_catalog_refine_col_sm\":\"3\",\"product_catalog_refine_col_xs\":\"1\",\"lsttitle_cate_status\":\"0\",\"lstimg_cate_status\":\"0\",\"lstcompare_status\":\"0\",\"product_catalog_mode\":\"0\",\"product_catalog_column_md\":\"4\",\"product_catalog_column_sm\":\"3\",\"product_catalog_column_xs\":\"2\",\"secondimg\":\"1\",\"rating_status\":\"1\",\"lstdescription_status\":\"0\",\"sale_status\":\"1\",\"2\":{\"sale_text\":\"\\u0628\\u064a\\u0639\",\"new_text\":\"\\u062c\\u062f\\u064a\\u062f\",\"quick_view_text\":\"\\u0646\\u0638\\u0631\\u0629 \\u0633\\u0631\\u064a\\u0639\\u0629\"},\"new_status\":\"0\",\"days\":\"10\",\"quick_status\":\"1\",\"discount_status\":\"0\",\"countdown_status\":\"1\",\"thumbnails_position\":\"left\",\"product_enablezoom\":\"1\",\"product_zoommode\":\"inner\",\"product_zoomlenssize\":\"200\",\"tabs_position\":\"2\",\"related_status\":\"1\",\"product_page_button\":\"&lt;!-- Go to www.addthis.com\\/dashboard to customize your tools --&gt;\\r\\n&lt;script type=&quot;text\\/javascript&quot; src=&quot;\\/\\/s7.addthis.com\\/js\\/300\\/addthis_widget.js#pubid=ra-4f89a9d74637536f&quot; async=&quot;async&quot;&gt;&lt;\\/script&gt;\\r\\n&lt;!-- Go to www.addthis.com\\/dashboard to customize your tools --&gt;\\r\\n&lt;div class=&quot;addthis_native_toolbox&quot;&gt;&lt;\\/div&gt;\",\"6\":{\"sale_text\":\"\",\"new_text\":\"\",\"quick_view_text\":\"\"},\"7\":{\"sale_text\":\"\",\"new_text\":\"\",\"quick_view_text\":\"\"},\"8\":{\"sale_text\":\"\",\"new_text\":\"\",\"quick_view_text\":\"\"},\"9\":{\"sale_text\":\"\",\"new_text\":\"\",\"quick_view_text\":\"\"},\"10\":{\"sale_text\":\"\",\"new_text\":\"\",\"quick_view_text\":\"\"}},\"1\":{\"2\":{\"sale_text\":\"Sale\",\"new_text\":\"New\",\"quick_view_text\":\"Quick View\"},\"6\":{\"sale_text\":\"\",\"new_text\":\"\",\"quick_view_text\":\"\"},\"7\":{\"sale_text\":\"\",\"new_text\":\"\",\"quick_view_text\":\"\"},\"8\":{\"sale_text\":\"\",\"new_text\":\"\",\"quick_view_text\":\"\"},\"9\":{\"sale_text\":\"\",\"new_text\":\"\",\"quick_view_text\":\"\"},\"10\":{\"sale_text\":\"\",\"new_text\":\"\",\"quick_view_text\":\"\"}},\"6\":{\"product_catalog_refine\":\"2\",\"product_catalog_refine_col_md\":\"4\",\"product_catalog_refine_col_sm\":\"2\",\"product_catalog_refine_col_xs\":\"1\",\"lsttitle_cate_status\":\"0\",\"lstimg_cate_status\":\"0\",\"lstcompare_status\":\"0\",\"product_catalog_mode\":\"0\",\"product_catalog_column_md\":\"4\",\"product_catalog_column_sm\":\"2\",\"product_catalog_column_xs\":\"1\",\"secondimg\":\"1\",\"rating_status\":\"0\",\"lstdescription_status\":\"0\",\"sale_status\":\"0\",\"new_status\":\"0\",\"days\":\"\",\"quick_status\":\"0\",\"discount_status\":\"0\",\"countdown_status\":\"0\",\"thumbnails_position\":\"bottom\",\"product_enablezoom\":\"0\",\"product_zoommode\":\"basic\",\"product_zoomlenssize\":\"\",\"tabs_position\":\"1\",\"related_status\":\"0\",\"product_page_button\":\"\"},\"7\":{\"product_catalog_refine\":\"2\",\"product_catalog_refine_col_md\":\"4\",\"product_catalog_refine_col_sm\":\"3\",\"product_catalog_refine_col_xs\":\"1\",\"lsttitle_cate_status\":\"0\",\"lstimg_cate_status\":\"0\",\"lstcompare_status\":\"0\",\"product_catalog_mode\":\"0\",\"product_catalog_column_md\":\"4\",\"product_catalog_column_sm\":\"2\",\"product_catalog_column_xs\":\"1\",\"secondimg\":\"1\",\"rating_status\":\"1\",\"lstdescription_status\":\"0\",\"sale_status\":\"0\",\"new_status\":\"0\",\"days\":\"\",\"quick_status\":\"0\",\"discount_status\":\"0\",\"countdown_status\":\"0\",\"thumbnails_position\":\"bottom\",\"product_enablezoom\":\"0\",\"product_zoommode\":\"basic\",\"product_zoomlenssize\":\"\",\"tabs_position\":\"1\",\"related_status\":\"0\",\"product_page_button\":\"\"},\"8\":{\"product_catalog_refine\":\"0\",\"product_catalog_refine_col_md\":\"1\",\"product_catalog_refine_col_sm\":\"1\",\"product_catalog_refine_col_xs\":\"1\",\"lsttitle_cate_status\":\"0\",\"lstimg_cate_status\":\"0\",\"lstcompare_status\":\"0\",\"product_catalog_mode\":\"0\",\"product_catalog_column_md\":\"4\",\"product_catalog_column_sm\":\"2\",\"product_catalog_column_xs\":\"1\",\"secondimg\":\"1\",\"rating_status\":\"1\",\"lstdescription_status\":\"0\",\"sale_status\":\"0\",\"new_status\":\"0\",\"days\":\"\",\"quick_status\":\"0\",\"discount_status\":\"0\",\"countdown_status\":\"0\",\"thumbnails_position\":\"bottom\",\"product_enablezoom\":\"0\",\"product_zoommode\":\"basic\",\"product_zoomlenssize\":\"\",\"tabs_position\":\"1\",\"related_status\":\"0\",\"product_page_button\":\"\"},\"9\":{\"product_catalog_refine\":\"2\",\"product_catalog_refine_col_md\":\"1\",\"product_catalog_refine_col_sm\":\"1\",\"product_catalog_refine_col_xs\":\"1\",\"lsttitle_cate_status\":\"0\",\"lstimg_cate_status\":\"0\",\"lstcompare_status\":\"0\",\"product_catalog_mode\":\"0\",\"product_catalog_column_md\":\"4\",\"product_catalog_column_sm\":\"2\",\"product_catalog_column_xs\":\"1\",\"secondimg\":\"1\",\"rating_status\":\"1\",\"lstdescription_status\":\"0\",\"sale_status\":\"0\",\"new_status\":\"0\",\"days\":\"\",\"quick_status\":\"0\",\"discount_status\":\"0\",\"countdown_status\":\"0\",\"thumbnails_position\":\"bottom\",\"product_enablezoom\":\"0\",\"product_zoommode\":\"basic\",\"product_zoomlenssize\":\"\",\"tabs_position\":\"1\",\"related_status\":\"0\",\"product_page_button\":\"\"},\"10\":{\"product_catalog_refine\":\"2\",\"product_catalog_refine_col_md\":\"1\",\"product_catalog_refine_col_sm\":\"1\",\"product_catalog_refine_col_xs\":\"1\",\"lsttitle_cate_status\":\"0\",\"lstimg_cate_status\":\"0\",\"lstcompare_status\":\"0\",\"product_catalog_mode\":\"0\",\"product_catalog_column_md\":\"4\",\"product_catalog_column_sm\":\"2\",\"product_catalog_column_xs\":\"1\",\"secondimg\":\"1\",\"rating_status\":\"1\",\"lstdescription_status\":\"0\",\"sale_status\":\"0\",\"new_status\":\"0\",\"days\":\"\",\"quick_status\":\"0\",\"discount_status\":\"0\",\"countdown_status\":\"0\",\"thumbnails_position\":\"bottom\",\"product_enablezoom\":\"0\",\"product_zoommode\":\"basic\",\"product_zoomlenssize\":\"\",\"tabs_position\":\"1\",\"related_status\":\"0\",\"product_page_button\":\"\"}}","1"),
("43715","0","soconfig","soconfig_fonts_store","{\"2\":{\"body_status\":\"google\",\"normal_body\":\"inherit\",\"url_body\":\"https:\\/\\/fonts.googleapis.com\\/css?family=Roboto:400,500,300,700,900\",\"family_body\":\"Roboto, sans-serif\",\"selector_body\":\"body , .h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6\",\"menu_status\":\"standard\",\"normal_menu\":\"inherit\",\"url_menu\":\"\",\"family_menu\":\"\",\"selector_menu\":\"\",\"heading_status\":\"standard\",\"normal_heading\":\"inherit\",\"url_heading\":\"\",\"family_heading\":\"\",\"selector_heading\":\"\"},\"6\":{\"body_status\":\"google\",\"normal_body\":\"inherit\",\"url_body\":\"http:\\/\\/fonts.googleapis.com\\/css?family=Open+Sans\",\"family_body\":\"Open Sans, sans-serif \",\"selector_body\":\"body,.about-us .client-say-content .about-title,.about-us .about-title, .about-demo-1 .our-team .about-title,\\r\\n.article-description,.article-title a\",\"menu_status\":\"google\",\"normal_menu\":\"inherit\",\"url_menu\":\"\",\"family_menu\":\"\",\"selector_menu\":\"\",\"heading_status\":\"google\",\"normal_heading\":\"inherit\",\"url_heading\":\"\",\"family_heading\":\"\",\"selector_heading\":\"\"},\"7\":{\"body_status\":\"google\",\"normal_body\":\"inherit\",\"url_body\":\"http:\\/\\/fonts.googleapis.com\\/css?family=Open+Sans\",\"family_body\":\"Open Sans, sans-serif \",\"selector_body\":\"body,.about-us .client-say-content .about-title,.about-us .about-title, .about-demo-1 .our-team .about-title,\\r\\n.article-description,.article-title a\",\"menu_status\":\"google\",\"normal_menu\":\"inherit\",\"url_menu\":\"\",\"family_menu\":\"\",\"selector_menu\":\"\",\"heading_status\":\"google\",\"normal_heading\":\"inherit\",\"url_heading\":\"\",\"family_heading\":\"\",\"selector_heading\":\"\"},\"8\":{\"body_status\":\"google\",\"normal_body\":\"inherit\",\"url_body\":\"http:\\/\\/fonts.googleapis.com\\/css?family=Open+Sans\",\"family_body\":\"Open Sans, sans-serif \",\"selector_body\":\"body\",\"menu_status\":\"google\",\"normal_menu\":\"inherit\",\"url_menu\":\"\",\"family_menu\":\"\",\"selector_menu\":\"\",\"heading_status\":\"google\",\"normal_heading\":\"inherit\",\"url_heading\":\"\",\"family_heading\":\"\",\"selector_heading\":\"\"},\"9\":{\"body_status\":\"google\",\"normal_body\":\"inherit\",\"url_body\":\"http:\\/\\/fonts.googleapis.com\\/css?family=Open+Sans\",\"family_body\":\"Open Sans, sans-serif \",\"selector_body\":\"body,.about-us .client-say-content .about-title,.about-us .about-title, .about-demo-1 .our-team .about-title,\\r\\n.article-description,.article-title a\",\"menu_status\":\"google\",\"normal_menu\":\"inherit\",\"url_menu\":\"\",\"family_menu\":\"\",\"selector_menu\":\"\",\"heading_status\":\"google\",\"normal_heading\":\"inherit\",\"url_heading\":\"\",\"family_heading\":\"\",\"selector_heading\":\"\"},\"10\":{\"body_status\":\"google\",\"normal_body\":\"inherit\",\"url_body\":\"http:\\/\\/fonts.googleapis.com\\/css?family=Open+Sans\",\"family_body\":\"Open Sans, sans-serif \",\"selector_body\":\"body,.about-us .client-say-content .about-title,.about-us .about-title, .about-demo-1 .our-team .about-title,\\r\\n.article-description,.article-title a\",\"menu_status\":\"google\",\"normal_menu\":\"inherit\",\"url_menu\":\"\",\"family_menu\":\"\",\"selector_menu\":\"\",\"heading_status\":\"google\",\"normal_heading\":\"inherit\",\"url_heading\":\"\",\"family_heading\":\"\",\"selector_heading\":\"\"}}","1"),
("41439","0","config","config_tax","1","0"),
("41438","0","config","config_voucher_max","1000","0"),
("41437","0","config","config_voucher_min","1","0"),
("41436","0","config","config_review_mail","0","0"),
("41434","0","config","config_review_status","1","0"),
("41435","0","config","config_review_guest","1","0"),
("41428","0","config","config_length_class_id","1","0"),
("41429","0","config","config_weight_class_id","1","0"),
("41430","0","config","config_product_count","0","0"),
("41431","0","config","config_product_limit","16","0"),
("41432","0","config","config_product_description_length","200","0"),
("41433","0","config","config_limit_admin","20","0"),
("41427","0","config","config_currency_auto","1","0");
INSERT INTO ?:setting VALUES
("41426","0","config","config_currency","USD","0"),
("41425","0","config","config_admin_language","en","0"),
("41423","0","config","config_zone_id","","0"),
("41424","0","config","config_language","en","0"),
("41422","0","config","config_country_id","222","0"),
("41416","0","config","config_email","tinhpv@ytcvn.com","0"),
("41417","0","config","config_telephone","Phone : 0123456789","0"),
("41418","0","config","config_fax","","0"),
("41419","0","config","config_image","catalog/market.png","0"),
("41420","0","config","config_open","","0"),
("41421","0","config","config_comment","Maecenas euismod felis et purus consectetur, quis fermentum velition. Aenean egestas quis turpis vehicula.Maecenas euismod felis et purus consectetur, quis fermentum velition. Aenean egestas quis turpis vehicula.
\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. ","0"),
("41415","0","config","config_geocode","40.705423,-74.008616","0"),
("41411","0","config","config_layout_id","4","0"),
("41412","0","config","config_name","SO Maxshop","0"),
("41413","0","config","config_owner","SO Maxshop","0"),
("41414","0","config","config_address","My Company, 42 avenue des Champs Elysées 75000 Paris France","0"),
("41409","0","config","config_cookie","dark-bottom","0"),
("41410","0","config","config_template","so-maxshop4","0"),
("41408","0","config","config_meta_keyword","opencart theme, responsive opencart theme, market store, clean design theme, multipurpose theme, opencart responsive theme, opencart themes","0"),
("41406","0","config","config_meta_title","SO Maxshop- Responsive Multipurpose OpenCart Theme","0"),
("41407","0","config","config_meta_description","SO Maxshop is a professional responsive OpenCart theme with clean and modern design. It supports dozen of powerful features to create any online stores.","0"),
("43701","0","soconfig","soconfig_toppanel","","0"),
("43702","0","soconfig","soconfig_lang","{\"1\":{\"view_details\":\"Add To Cart\",\"tags_tab_title\":\"Tabs\",\"brands_title\":\"\",\"countdown_title\":\"This limited offer ends\",\"countdown_title_day\":\"Days\",\"countdown_title_hour\":\"Hour\",\"countdown_title_minute\":\"Min\",\"countdown_title_second\":\"Sec\"},\"2\":{\"view_details\":\"\\u0623\\u0636\\u0641 \\u0625\\u0644\\u0649 \\u0627\\u0644\\u0633\\u0644\\u0629\",\"tags_tab_title\":\"\\u0639\\u0644\\u0627\\u0645\\u0627\\u062a \\u0627\\u0644\\u062a\\u0628\\u0648\\u064a\\u0628\",\"brands_title\":\"\",\"countdown_title\":\"\",\"countdown_title_day\":\"\",\"countdown_title_hour\":\"\",\"countdown_title_minute\":\"\",\"countdown_title_second\":\"\"}}","1"),
("43703","0","soconfig","soconfig_layout","{\"layoutstyle\":\"full\",\"general_bgcolor\":\"\",\"pattern\":\"45\",\"content_bg_mode\":\"repeat\",\"content_attachment\":\"scroll\"}","1"),
("43704","0","soconfig","soconfig_contentbg","","0"),
("43705","0","soconfig","soconfig_pages","{\"product_catalog_refine\":\"2\",\"product_catalog_refine_col_md\":\"4\",\"product_catalog_refine_col_sm\":\"2\",\"product_catalog_refine_col_xs\":\"1\",\"lsttitle_cate_status\":\"0\",\"lstimg_cate_status\":\"0\",\"lstcompare_status\":\"0\",\"product_catalog_mode\":\"0\",\"product_catalog_column_md\":\"4\",\"product_catalog_column_sm\":\"2\",\"product_catalog_column_xs\":\"2\",\"secondimg\":\"1\",\"rating_status\":\"1\",\"lstdescription_status\":\"0\",\"sale_status\":\"1\",\"1\":{\"sale_text\":\"Sale\",\"new_text\":\"New\",\"quick_view_text\":\"Quick View\"},\"2\":{\"sale_text\":\"Sale\",\"new_text\":\"New\",\"quick_view_text\":\"\\u0646\\u0638\\u0631\\u0629 \\u0633\\u0631\\u064a\\u0639\\u0629\"},\"new_status\":\"1\",\"days\":\"30\",\"quick_status\":\"1\",\"discount_status\":\"1\",\"countdown_status\":\"1\",\"thumbnails_position\":\"left\",\"product_enablezoom\":\"1\",\"product_zoommode\":\"inner\",\"product_zoomlenssize\":\"200\",\"tabs_position\":\"2\",\"related_status\":\"1\",\"product_page_button\":\"&lt;!-- Go to www.addthis.com\\/dashboard to customize your tools --&gt;\\r\\n&lt;script type=&quot;text\\/javascript&quot; src=&quot;\\/\\/s7.addthis.com\\/js\\/300\\/addthis_widget.js#pubid=ra-4f89a9d74637536f&quot; async=&quot;async&quot;&gt;&lt;\\/script&gt;\\r\\n&lt;!-- Go to www.addthis.com\\/dashboard to customize your tools --&gt;\\r\\n&lt;div class=&quot;addthis_native_toolbox&quot;&gt;&lt;\\/div&gt;\"}","1"),
("43706","0","soconfig","soconfig_fonts","{\"body_status\":\"google\",\"normal_body\":\"Arial, Helvetica, sans-serif\",\"url_body\":\"https:\\/\\/fonts.googleapis.com\\/css?family=Roboto:400,500,300,700,900\",\"family_body\":\"Roboto, sans-serif\",\"selector_body\":\"body , .h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6\",\"menu_status\":\"standard\",\"normal_menu\":\"inherit\",\"url_menu\":\"\",\"family_menu\":\"\",\"selector_menu\":\"\",\"heading_status\":\"standard\",\"normal_heading\":\"inherit\",\"url_heading\":\"http:\\/\\/fonts.googleapis.com\\/css?family=Lobster+Two\",\"family_heading\":\"Lobster Two\",\"selector_heading\":\"\"}","1"),
("43707","0","soconfig","soconfig_social","{\"social_status\":\"0\",\"facebook\":\"envato\",\"twitter\":\"envato\",\"video_code\":\"LHdVkPrdRYg\"}","1"),
("43708","0","soconfig","soconfig_custom","{\"cssinput_status\":\"0\",\"custom_css\":\"\",\"cssfile_status\":\"0\",\"jsinput_status\":\"0\",\"custom_js\":\"\",\"jsfile_status\":\"0\"}","1"),
("43709","0","soconfig","soconfig_cssfile","[\"catalog\\/view\\/theme\\/so-market\\/css\\/custom.css\"]","1"),
("43710","0","soconfig","soconfig_jsfile","[\"catalog\\/view\\/theme\\/so-market\\/js\\/custom.js\"]","1"),
("43711","0","soconfig","soconfig_general_store","{\"2\":{\"themecolor\":\"red\",\"layouts\":\"1\",\"cpanel\":\"1\",\"backtop\":\"1\",\"scroll_animation\":\"0\",\"copyright\":\"\\u00a9 2016 SO Maxshop. All Rights Reserved.\",\"logo_position\":\"center\",\"searchbox\":\"1\",\"toppanel_status\":\"0\",\"toppanel_type\":\"1\",\"phone_status\":\"1\",\"2\":{\"contact_number\":\"(801) 2345 - 6789\",\"welcome_message\":\"&lt;div class=&quot;welcome-msg&quot;&gt; &lt;ul class=&quot;list-msg&quot;&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;This week&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Sale special too good to miss in every gear category&lt;\\/a&gt;&lt;\\/li&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;Tomorrow&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Laten ipsum dolor sit amet. In gravida pellentesque&lt;\\/a&gt;&lt;\\/li&gt; &lt;\\/ul&gt; &lt;\\/div&gt;\",\"footer_socials_title\":\"\",\"footer_socials\":\"\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;div class=&quot;content-block-footer&quot;&gt;&lt;div class=&quot;footer-logo&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/logo-footer.png&quot; alt=&quot;&quot;&gt; &lt;\\/div&gt;\\r\\n&lt;p&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.&lt;\\/p&gt;\\r\\n&lt;\\/div&gt;\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\",\"custom_html_title\":\"\\u0627\\u062a\\u0635\\u0644 \\u0628\\u0646\\u0627\",\"customblock_html\":\"&lt;ul class=&quot;contact-address&quot;&gt;\\t&lt;li&gt;&lt;span class=&quot;fa fa-home&quot;&gt;&lt;\\/span&gt; My Company, 42 avenue des Champs&lt;\\/li&gt;&lt;li&gt;&lt;span class=&quot;fa fa-envelope&quot;&gt;&lt;\\/span&gt; Email: &lt;a href=&quot;#&quot;&gt; sales@yourcompany.com&lt;\\/a&gt;&lt;\\/li&gt;\\t&lt;li&gt;&lt;span class=&quot;fa fa-phone&quot;&gt;&amp;nbsp;&lt;\\/span&gt; Phone 1: 0123456789&lt;\\/li&gt;\\t&lt;\\/ul&gt;&lt;ul class=&quot;payment-method&quot;&gt;\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-1.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-2.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-3.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-4.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-5.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\t&lt;\\/ul&gt;\"},\"welcome_message_status\":\"1\",\"wishlist_status\":\"0\",\"checkout_status\":\"1\",\"lang_status\":\"1\",\"socials_status\":\"1\",\"footerpayment_status\":\"0\",\"footerpayment\":\"&lt;div class=&quot;block-payment&quot;&gt;&lt;a class=&quot;payment1&quot; href=&quot;#&quot;&gt;payment1&lt;\\/a&gt; &lt;a class=&quot;payment2&quot; href=&quot;#&quot;&gt;payment2&lt;\\/a&gt; &lt;a class=&quot;payment3&quot; href=&quot;#&quot;&gt;payment3&lt;\\/a&gt; &lt;a class=&quot;payment4&quot; href=&quot;#&quot;&gt;payment4&lt;\\/a&gt;&lt;a class=&quot;payment5&quot; href=&quot;#&quot;&gt;payment5&lt;\\/a&gt;&lt;a class=&quot;payment6&quot; href=&quot;#&quot;&gt;payment6&lt;\\/a&gt;&lt;\\/div&gt;\",\"customblock_status\":\"1\",\"6\":{\"contact_number\":\"(801) 2345 - 6789\",\"welcome_message\":\"&lt;div class=&quot;welcome-msg&quot;&gt; &lt;ul class=&quot;list-msg&quot;&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;This week&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Sale special too good to miss in every gear category&lt;\\/a&gt;&lt;\\/li&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;Tomorrow&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Laten ipsum dolor sit amet. In gravida pellentesque&lt;\\/a&gt;&lt;\\/li&gt; &lt;\\/ul&gt; &lt;\\/div&gt;\",\"footer_socials_title\":\"\",\"footer_socials\":\"\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;div class=&quot;content-block-footer&quot;&gt;&lt;div class=&quot;footer-logo&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/logo-footer.png&quot; alt=&quot;&quot;&gt; &lt;\\/div&gt;\\r\\n\\r\\n\\r\\n&lt;p&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.&lt;\\/p&gt;\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\",\"custom_html_title\":\"Contact Us\",\"customblock_html\":\"&lt;ul class=&quot;contact-address&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-home&quot;&gt;&lt;\\/span&gt; My Company, 42 avenue des Champs&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;li&gt;&lt;span class=&quot;fa fa-envelope&quot;&gt;&lt;\\/span&gt; Email: &lt;a href=&quot;#&quot;&gt; sales@yourcompany.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-phone&quot;&gt;&amp;nbsp;&lt;\\/span&gt; Phone 1: 0123456789&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;\\/ul&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;ul class=&quot;payment-method&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-1.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-2.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-3.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-4.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-5.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;\\/ul&gt;\"},\"7\":{\"contact_number\":\"(801) 2345 - 6789\",\"welcome_message\":\"&lt;div class=&quot;welcome-msg&quot;&gt; &lt;ul class=&quot;list-msg&quot;&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;This week&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Sale special too good to miss in every gear category&lt;\\/a&gt;&lt;\\/li&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;Tomorrow&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Laten ipsum dolor sit amet. In gravida pellentesque&lt;\\/a&gt;&lt;\\/li&gt; &lt;\\/ul&gt; &lt;\\/div&gt;\",\"footer_socials_title\":\"\",\"footer_socials\":\"\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;div class=&quot;content-block-footer&quot;&gt;&lt;div class=&quot;footer-logo&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/logo-footer.png&quot; alt=&quot;&quot;&gt; &lt;\\/div&gt;\\r\\n\\r\\n\\r\\n&lt;p&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.&lt;\\/p&gt;\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\",\"custom_html_title\":\"Contact Us\",\"customblock_html\":\"&lt;ul class=&quot;contact-address&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-home&quot;&gt;&lt;\\/span&gt; My Company, 42 avenue des Champs&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;li&gt;&lt;span class=&quot;fa fa-envelope&quot;&gt;&lt;\\/span&gt; Email: &lt;a href=&quot;#&quot;&gt; sales@yourcompany.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-phone&quot;&gt;&amp;nbsp;&lt;\\/span&gt; Phone 1: 0123456789&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;\\/ul&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;ul class=&quot;payment-method&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-1.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-2.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-3.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-4.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-5.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;\\/ul&gt;\"},\"8\":{\"contact_number\":\"(801) 2345 - 6789\",\"welcome_message\":\"&lt;div class=&quot;welcome-msg&quot;&gt; &lt;ul class=&quot;list-msg&quot;&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;This week&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Sale special too good to miss in every gear category&lt;\\/a&gt;&lt;\\/li&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;Tomorrow&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Laten ipsum dolor sit amet. In gravida pellentesque&lt;\\/a&gt;&lt;\\/li&gt; &lt;\\/ul&gt; &lt;\\/div&gt;\",\"footer_socials_title\":\"\",\"footer_socials\":\"\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;div class=&quot;content-block-footer&quot;&gt;&lt;div class=&quot;footer-logo&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/logo-footer-blue.png&quot; alt=&quot;&quot;&gt; &lt;\\/div&gt;\\r\\n\\r\\n\\r\\n&lt;p&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.&lt;\\/p&gt;\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\",\"custom_html_title\":\"Contact Us\",\"customblock_html\":\"&lt;ul class=&quot;contact-address&quot;&gt;\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-home&quot;&gt;&lt;\\/span&gt; My Company, 42 avenue des Champs&lt;\\/li&gt;\\r\\n&lt;li&gt;&lt;span class=&quot;fa fa-envelope&quot;&gt;&lt;\\/span&gt; Email: &lt;a href=&quot;#&quot;&gt; sales@yourcompany.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-phone&quot;&gt;&amp;nbsp;&lt;\\/span&gt; Phone 1: 0123456789&lt;\\/li&gt;\\r\\n\\t&lt;\\/ul&gt;\\r\\n&lt;ul class=&quot;payment-method&quot;&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-1.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-2.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-3.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-4.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-5.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t&lt;\\/ul&gt;\"},\"9\":{\"contact_number\":\"(801) 2345 - 6789\",\"welcome_message\":\"&lt;div class=&quot;welcome-msg&quot;&gt; &lt;ul class=&quot;list-msg&quot;&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;This week&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Sale special too good to miss in every gear category&lt;\\/a&gt;&lt;\\/li&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;Tomorrow&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Laten ipsum dolor sit amet. In gravida pellentesque&lt;\\/a&gt;&lt;\\/li&gt; &lt;\\/ul&gt; &lt;\\/div&gt;\",\"footer_socials_title\":\"\",\"footer_socials\":\"\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;div class=&quot;content-block-footer&quot;&gt;&lt;div class=&quot;footer-logo&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/logo-footer-green.png&quot; alt=&quot;&quot;&gt; &lt;\\/div&gt;\\r\\n\\r\\n\\r\\n&lt;p&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.&lt;\\/p&gt;\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\",\"custom_html_title\":\"Contact Us\",\"customblock_html\":\"&lt;ul class=&quot;contact-address&quot;&gt;\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-home&quot;&gt;&lt;\\/span&gt; My Company, 42 avenue des Champs&lt;\\/li&gt;\\r\\n&lt;li&gt;&lt;span class=&quot;fa fa-envelope&quot;&gt;&lt;\\/span&gt; Email: &lt;a href=&quot;#&quot;&gt; sales@yourcompany.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-phone&quot;&gt;&amp;nbsp;&lt;\\/span&gt; Phone 1: 0123456789&lt;\\/li&gt;\\r\\n\\t&lt;\\/ul&gt;\\r\\n&lt;ul class=&quot;payment-method&quot;&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-1.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-2.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-3.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-4.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-5.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t&lt;\\/ul&gt;\"},\"10\":{\"contact_number\":\"(801) 2345 - 6789\",\"welcome_message\":\"&lt;div class=&quot;welcome-msg&quot;&gt; &lt;ul class=&quot;list-msg&quot;&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;This week&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Sale special too good to miss in every gear category&lt;\\/a&gt;&lt;\\/li&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;Tomorrow&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Laten ipsum dolor sit amet. In gravida pellentesque&lt;\\/a&gt;&lt;\\/li&gt; &lt;\\/ul&gt; &lt;\\/div&gt;\",\"footer_socials_title\":\"\",\"footer_socials\":\"\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\",\"custom_html_title\":\"Contact Us\",\"customblock_html\":\"&lt;ul class=&quot;contact-address&quot;&gt;\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-home&quot;&gt;&lt;\\/span&gt; My Company, 42 avenue des Champs&lt;\\/li&gt;\\r\\n&lt;li&gt;&lt;span class=&quot;fa fa-envelope&quot;&gt;&lt;\\/span&gt; Email: &lt;a href=&quot;#&quot;&gt; sales@yourcompany.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-phone&quot;&gt;&amp;nbsp;&lt;\\/span&gt; Phone 1: 0123456789&lt;\\/li&gt;\\r\\n\\t&lt;\\/ul&gt;\\r\\n&lt;ul class=&quot;payment-method&quot;&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-1.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-2.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-3.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-4.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-5.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t&lt;\\/ul&gt;\"}},\"soconfig_toppanel\":\"\",\"1\":{\"2\":{\"contact_number\":\"(801) 2345 - 6789\",\"welcome_message\":\"&lt;div class=&quot;welcome-msg&quot;&gt; &lt;ul class=&quot;list-msg&quot;&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;This week&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Sale special too good to miss in every gear category&lt;\\/a&gt;&lt;\\/li&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;Tomorrow&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Laten ipsum dolor sit amet. In gravida pellentesque&lt;\\/a&gt;&lt;\\/li&gt; &lt;\\/ul&gt; &lt;\\/div&gt;\",\"footer_socials_title\":\"\",\"footer_socials\":\"\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;div class=&quot;content-block-footer&quot;&gt;&lt;div class=&quot;footer-logo&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/logo-footer.png&quot; alt=&quot;&quot;&gt; &lt;\\/div&gt;\\r\\n\\r\\n&lt;p&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.&lt;\\/p&gt;\\r\\n\\r\\n&lt;\\/div&gt;\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\",\"custom_html_title\":\"Contact Us\",\"customblock_html\":\"&lt;ul class=&quot;contact-address&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-home&quot;&gt;&lt;\\/span&gt; My Company, 42 avenue des Champs&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;li&gt;&lt;span class=&quot;fa fa-envelope&quot;&gt;&lt;\\/span&gt; Email: &lt;a href=&quot;#&quot;&gt; sales@yourcompany.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-phone&quot;&gt;&amp;nbsp;&lt;\\/span&gt; Phone 1: 0123456789&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;\\/ul&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;ul class=&quot;payment-method&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-1.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-2.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-3.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-4.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-5.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;\\/ul&gt;\"},\"6\":{\"contact_number\":\"(801) 2345 - 6789\",\"welcome_message\":\"&lt;div class=&quot;welcome-msg&quot;&gt; &lt;ul class=&quot;list-msg&quot;&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;This week&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Sale special too good to miss in every gear category&lt;\\/a&gt;&lt;\\/li&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;Tomorrow&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Laten ipsum dolor sit amet. In gravida pellentesque&lt;\\/a&gt;&lt;\\/li&gt; &lt;\\/ul&gt; &lt;\\/div&gt;\",\"footer_socials_title\":\"\",\"footer_socials\":\"\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;div class=&quot;content-block-footer&quot;&gt;&lt;div class=&quot;footer-logo&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/logo-footer.png&quot; alt=&quot;&quot;&gt; &lt;\\/div&gt;\\r\\n\\r\\n\\r\\n&lt;p&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.&lt;\\/p&gt;\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\",\"custom_html_title\":\"Contact Us\",\"customblock_html\":\"&lt;ul class=&quot;contact-address&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-home&quot;&gt;&lt;\\/span&gt; My Company, 42 avenue des Champs&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;li&gt;&lt;span class=&quot;fa fa-envelope&quot;&gt;&lt;\\/span&gt; Email: &lt;a href=&quot;#&quot;&gt; sales@yourcompany.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-phone&quot;&gt;&amp;nbsp;&lt;\\/span&gt; Phone 1: 0123456789&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;\\/ul&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;ul class=&quot;payment-method&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-1.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-2.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-3.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-4.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-5.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;\\/ul&gt;\"},\"7\":{\"contact_number\":\"(801) 2345 - 6789\",\"welcome_message\":\"&lt;div class=&quot;welcome-msg&quot;&gt; &lt;ul class=&quot;list-msg&quot;&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;This week&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Sale special too good to miss in every gear category&lt;\\/a&gt;&lt;\\/li&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;Tomorrow&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Laten ipsum dolor sit amet. In gravida pellentesque&lt;\\/a&gt;&lt;\\/li&gt; &lt;\\/ul&gt; &lt;\\/div&gt;\",\"footer_socials_title\":\"\",\"footer_socials\":\"\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;div class=&quot;content-block-footer&quot;&gt;&lt;div class=&quot;footer-logo&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/logo-footer.png&quot; alt=&quot;&quot;&gt; &lt;\\/div&gt;\\r\\n\\r\\n\\r\\n&lt;p&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.&lt;\\/p&gt;\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\",\"custom_html_title\":\"Contact Us\",\"customblock_html\":\"&lt;ul class=&quot;contact-address&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-home&quot;&gt;&lt;\\/span&gt; My Company, 42 avenue des Champs&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;li&gt;&lt;span class=&quot;fa fa-envelope&quot;&gt;&lt;\\/span&gt; Email: &lt;a href=&quot;#&quot;&gt; sales@yourcompany.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-phone&quot;&gt;&amp;nbsp;&lt;\\/span&gt; Phone 1: 0123456789&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;\\/ul&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;ul class=&quot;payment-method&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-1.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-2.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-3.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-4.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-5.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;\\/ul&gt;\"},\"8\":{\"contact_number\":\"(801) 2345 - 6789\",\"welcome_message\":\"&lt;div class=&quot;welcome-msg&quot;&gt; &lt;ul class=&quot;list-msg&quot;&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;This week&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Sale special too good to miss in every gear category&lt;\\/a&gt;&lt;\\/li&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;Tomorrow&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Laten ipsum dolor sit amet. In gravida pellentesque&lt;\\/a&gt;&lt;\\/li&gt; &lt;\\/ul&gt; &lt;\\/div&gt;\",\"footer_socials_title\":\"\",\"footer_socials\":\"\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;div class=&quot;content-block-footer&quot;&gt;&lt;div class=&quot;footer-logo&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/logo-footer-blue.png&quot; alt=&quot;&quot;&gt; &lt;\\/div&gt;\\r\\n\\r\\n\\r\\n&lt;p&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.&lt;\\/p&gt;\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\",\"custom_html_title\":\"Contact Us\",\"customblock_html\":\"&lt;ul class=&quot;contact-address&quot;&gt;\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-home&quot;&gt;&lt;\\/span&gt; My Company, 42 avenue des Champs&lt;\\/li&gt;\\r\\n&lt;li&gt;&lt;span class=&quot;fa fa-envelope&quot;&gt;&lt;\\/span&gt; Email: &lt;a href=&quot;#&quot;&gt; sales@yourcompany.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-phone&quot;&gt;&amp;nbsp;&lt;\\/span&gt; Phone 1: 0123456789&lt;\\/li&gt;\\r\\n\\t&lt;\\/ul&gt;\\r\\n&lt;ul class=&quot;payment-method&quot;&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-1.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-2.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-3.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-4.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-5.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t&lt;\\/ul&gt;\"},\"9\":{\"contact_number\":\"(801) 2345 - 6789\",\"welcome_message\":\"&lt;div class=&quot;welcome-msg&quot;&gt; &lt;ul class=&quot;list-msg&quot;&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;This week&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Sale special too good to miss in every gear category&lt;\\/a&gt;&lt;\\/li&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;Tomorrow&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Laten ipsum dolor sit amet. In gravida pellentesque&lt;\\/a&gt;&lt;\\/li&gt; &lt;\\/ul&gt; &lt;\\/div&gt;\",\"footer_socials_title\":\"\",\"footer_socials\":\"\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;div class=&quot;content-block-footer&quot;&gt;&lt;div class=&quot;footer-logo&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/logo-footer-green.png&quot; alt=&quot;&quot;&gt; &lt;\\/div&gt;\\r\\n\\r\\n\\r\\n&lt;p&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.&lt;\\/p&gt;\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\",\"custom_html_title\":\"Contact Us\",\"customblock_html\":\"&lt;ul class=&quot;contact-address&quot;&gt;\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-home&quot;&gt;&lt;\\/span&gt; My Company, 42 avenue des Champs&lt;\\/li&gt;\\r\\n&lt;li&gt;&lt;span class=&quot;fa fa-envelope&quot;&gt;&lt;\\/span&gt; Email: &lt;a href=&quot;#&quot;&gt; sales@yourcompany.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-phone&quot;&gt;&amp;nbsp;&lt;\\/span&gt; Phone 1: 0123456789&lt;\\/li&gt;\\r\\n\\t&lt;\\/ul&gt;\\r\\n&lt;ul class=&quot;payment-method&quot;&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-1.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-2.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-3.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-4.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-5.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t&lt;\\/ul&gt;\"},\"10\":{\"contact_number\":\"(801) 2345 - 6789\",\"welcome_message\":\"&lt;div class=&quot;welcome-msg&quot;&gt; &lt;ul class=&quot;list-msg&quot;&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;This week&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Sale special too good to miss in every gear category&lt;\\/a&gt;&lt;\\/li&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;Tomorrow&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Laten ipsum dolor sit amet. In gravida pellentesque&lt;\\/a&gt;&lt;\\/li&gt; &lt;\\/ul&gt; &lt;\\/div&gt;\",\"footer_socials_title\":\"\",\"footer_socials\":\"\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;div class=&quot;content-block-footer&quot;&gt;&lt;div class=&quot;footer-logo&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/logo-cyan.png&quot; alt=&quot;&quot;&gt; &lt;\\/div&gt;\\r\\n\\r\\n\\r\\n&lt;p&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.&lt;\\/p&gt;\\r\\n\\r\\n\\r\\n&lt;\\/div&gt;\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\",\"custom_html_title\":\"Contact Us\",\"customblock_html\":\"&lt;ul class=&quot;contact-address&quot;&gt;\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-home&quot;&gt;&lt;\\/span&gt; My Company, 42 avenue des Champs&lt;\\/li&gt;\\r\\n&lt;li&gt;&lt;span class=&quot;fa fa-envelope&quot;&gt;&lt;\\/span&gt; Email: &lt;a href=&quot;#&quot;&gt; sales@yourcompany.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-phone&quot;&gt;&amp;nbsp;&lt;\\/span&gt; Phone 1: 0123456789&lt;\\/li&gt;\\r\\n\\t&lt;\\/ul&gt;\\r\\n&lt;ul class=&quot;payment-method&quot;&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-1.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-2.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-3.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-4.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-5.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t&lt;\\/ul&gt;\"}},\"6\":{\"themecolor\":\"red\",\"layouts\":\"1\",\"cpanel\":\"1\",\"backtop\":\"1\",\"scroll_animation\":\"0\",\"copyright\":\"\\u00a9 2016 SO Maxshop. All Rights Reserved.\",\"logo_position\":\"center\",\"searchbox\":\"0\",\"toppanel_status\":\"1\",\"toppanel_type\":\"1\",\"phone_status\":\"1\",\"welcome_message_status\":\"1\",\"wishlist_status\":\"1\",\"checkout_status\":\"1\",\"lang_status\":\"1\",\"socials_status\":\"1\",\"footerpayment_status\":\"0\",\"footerpayment\":\"&lt;div class=&quot;block-payment&quot;&gt;&lt;a class=&quot;payment1&quot; href=&quot;#&quot;&gt;payment1&lt;\\/a&gt; &lt;a class=&quot;payment2&quot; href=&quot;#&quot;&gt;payment2&lt;\\/a&gt; &lt;a class=&quot;payment3&quot; href=&quot;#&quot;&gt;payment3&lt;\\/a&gt; &lt;a class=&quot;payment4&quot; href=&quot;#&quot;&gt;payment4&lt;\\/a&gt;&lt;a class=&quot;payment5&quot; href=&quot;#&quot;&gt;payment5&lt;\\/a&gt;&lt;a class=&quot;payment6&quot; href=&quot;#&quot;&gt;payment6&lt;\\/a&gt;&lt;\\/div&gt;\",\"customblock_status\":\"1\"},\"7\":{\"themecolor\":\"red\",\"layouts\":\"1\",\"cpanel\":\"1\",\"backtop\":\"1\",\"scroll_animation\":\"0\",\"copyright\":\"\\u00a9 2016 SO Maxshop. All Rights Reserved.\",\"logo_position\":\"left\",\"searchbox\":\"1\",\"toppanel_status\":\"1\",\"toppanel_type\":\"1\",\"phone_status\":\"1\",\"welcome_message_status\":\"1\",\"wishlist_status\":\"1\",\"checkout_status\":\"1\",\"lang_status\":\"1\",\"socials_status\":\"1\",\"footerpayment_status\":\"1\",\"footerpayment\":\"&lt;br&gt;\",\"customblock_status\":\"1\"},\"8\":{\"themecolor\":\"blue\",\"layouts\":\"1\",\"cpanel\":\"1\",\"backtop\":\"1\",\"scroll_animation\":\"0\",\"copyright\":\"\\u00a9 2016 SO Maxshop. All Rights Reserved.\",\"logo_position\":\"left\",\"searchbox\":\"1\",\"toppanel_status\":\"0\",\"toppanel_type\":\"1\",\"phone_status\":\"1\",\"welcome_message_status\":\"1\",\"wishlist_status\":\"1\",\"checkout_status\":\"1\",\"lang_status\":\"1\",\"socials_status\":\"1\",\"footerpayment_status\":\"0\",\"footerpayment\":\"&lt;b&gt;&lt;\\/b&gt;&lt;br&gt;\",\"customblock_status\":\"1\"},\"9\":{\"themecolor\":\"green\",\"layouts\":\"1\",\"cpanel\":\"1\",\"backtop\":\"1\",\"scroll_animation\":\"0\",\"copyright\":\"\\u00a9 2016 SO Maxshop. All Rights Reserved.\",\"logo_position\":\"left\",\"searchbox\":\"1\",\"toppanel_status\":\"0\",\"toppanel_type\":\"1\",\"phone_status\":\"0\",\"welcome_message_status\":\"1\",\"wishlist_status\":\"1\",\"checkout_status\":\"1\",\"lang_status\":\"1\",\"socials_status\":\"1\",\"footerpayment_status\":\"0\",\"footerpayment\":\"&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;\",\"customblock_status\":\"1\"},\"10\":{\"themecolor\":\"cyan\",\"layouts\":\"1\",\"cpanel\":\"1\",\"backtop\":\"1\",\"scroll_animation\":\"0\",\"copyright\":\"\\u00a9 2016 SO Maxshop. All Rights Reserved.\",\"logo_position\":\"left\",\"searchbox\":\"1\",\"toppanel_status\":\"1\",\"toppanel_type\":\"1\",\"phone_status\":\"1\",\"welcome_message_status\":\"1\",\"wishlist_status\":\"1\",\"checkout_status\":\"1\",\"lang_status\":\"1\",\"socials_status\":\"1\",\"footerpayment_status\":\"0\",\"footerpayment\":\"&lt;b&gt;&lt;\\/b&gt;&lt;br&gt;\",\"customblock_status\":\"1\"}}","1"),
("43700","0","soconfig","soconfig_general","{\"themecolor\":\"red\",\"layouts\":\"1\",\"cpanel\":\"1\",\"backtop\":\"1\",\"scroll_animation\":\"0\",\"copyright\":\"\\u00a9 2016 SO Maxshop. All Rights Reserved.\",\"logo_position\":\"left\",\"searchbox\":\"1\",\"toppanel_status\":\"0\",\"toppanel_type\":\"1\",\"phone_status\":\"0\",\"1\":{\"contact_number\":\"(801) 2345 - 6789\",\"welcome_message\":\"&lt;div class=&quot;welcome-msg&quot;&gt; &lt;ul class=&quot;list-msg&quot;&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;This week&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Sale special too good to miss in every gear category&lt;\\/a&gt;&lt;\\/li&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;Tomorrow&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Laten ipsum dolor sit amet. In gravida pellentesque&lt;\\/a&gt;&lt;\\/li&gt; &lt;\\/ul&gt; &lt;\\/div&gt;\",\"footer_socials_title\":\"\",\"footer_socials\":\"&lt;div class=&quot;content-block-footer&quot;&gt;&lt;div class=&quot;footer-logo&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/logo-footer.png&quot; alt=&quot;&quot;&gt; &lt;\\/div&gt;\\r\\n\\r\\n&lt;p&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.&lt;\\/p&gt;\\r\\n\\r\\n&lt;\\/div&gt;\",\"custom_html_title\":\"Contact Us\",\"customblock_html\":\"&lt;ul class=&quot;contact-address&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-home&quot;&gt;&lt;\\/span&gt; My Company, 42 avenue des Champs&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;li&gt;&lt;span class=&quot;fa fa-envelope&quot;&gt;&lt;\\/span&gt; Email: &lt;a href=&quot;#&quot;&gt; sales@yourcompany.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-phone&quot;&gt;&amp;nbsp;&lt;\\/span&gt; Phone 1: 0123456789&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;\\/ul&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;ul class=&quot;payment-method&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-1.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-2.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-3.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-4.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-5.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;\\/ul&gt;\"},\"2\":{\"contact_number\":\"(801) 2345 - 6789\",\"welcome_message\":\"&lt;div class=&quot;welcome-msg&quot;&gt; &lt;ul class=&quot;list-msg&quot;&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;This week&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Sale special too good to miss in every gear category&lt;\\/a&gt;&lt;\\/li&gt; &lt;li&gt;&lt;label class=&quot;label-msg&quot;&gt;Tomorrow&lt;\\/label&gt; &lt;a href=&quot;#&quot;&gt;Laten ipsum dolor sit amet. In gravida pellentesque&lt;\\/a&gt;&lt;\\/li&gt; &lt;\\/ul&gt; &lt;\\/div&gt;\",\"footer_socials_title\":\"\",\"footer_socials\":\"&lt;div class=&quot;content-block-footer&quot;&gt;&lt;div class=&quot;footer-logo&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/logo-footer.png&quot; alt=&quot;&quot;&gt; &lt;\\/div&gt;\\r\\n\\r\\n&lt;p&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.&lt;\\/p&gt;\\r\\n\\r\\n&lt;\\/div&gt;\",\"custom_html_title\":\"\\u0627\\u062a\\u0635\\u0644 \\u0628\\u0646\\u0627\",\"customblock_html\":\"&lt;ul class=&quot;contact-address&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-home&quot;&gt;&lt;\\/span&gt; My Company, 42 avenue des Champs&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n&lt;li&gt;&lt;span class=&quot;fa fa-envelope&quot;&gt;&lt;\\/span&gt; Email: &lt;a href=&quot;#&quot;&gt; sales@yourcompany.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;li&gt;&lt;span class=&quot;fa fa-phone&quot;&gt;&amp;nbsp;&lt;\\/span&gt; Phone 1: 0123456789&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;\\/ul&gt;\\r\\n\\r\\n\\r\\n\\r\\n&lt;ul class=&quot;payment-method&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-1.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-2.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-3.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-4.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;a title=&quot;Payment Method&quot; href=&quot;#&quot;&gt;&lt;img src=&quot;image\\/catalog\\/cms\\/payment\\/payment-5.png&quot; alt=&quot;Payment&quot;&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\t&lt;\\/ul&gt;\"},\"welcome_message_status\":\"1\",\"wishlist_status\":\"1\",\"checkout_status\":\"1\",\"lang_status\":\"1\",\"socials_status\":\"1\",\"footerpayment_status\":\"0\",\"footerpayment\":\"&lt;div class=&quot;block-payment&quot;&gt;&lt;a class=&quot;payment1&quot; href=&quot;#&quot;&gt;payment1&lt;\\/a&gt; &lt;a class=&quot;payment2&quot; href=&quot;#&quot;&gt;payment2&lt;\\/a&gt; &lt;a class=&quot;payment3&quot; href=&quot;#&quot;&gt;payment3&lt;\\/a&gt; &lt;a class=&quot;payment4&quot; href=&quot;#&quot;&gt;payment4&lt;\\/a&gt;&lt;a class=&quot;payment5&quot; href=&quot;#&quot;&gt;payment5&lt;\\/a&gt;&lt;a class=&quot;payment6&quot; href=&quot;#&quot;&gt;payment6&lt;\\/a&gt;&lt;\\/div&gt;\",\"customblock_status\":\"1\"}","1"),
("43718","0","soconfig","soconfig_cssfile_store","{\"2\":\"catalog\\/view\\/theme\\/so-maxshop\\/css\\/custom.css\"}","1"),
("43719","0","soconfig","soconfig_jsfile_store","{\"2\":\"catalog\\/view\\/theme\\/so-market\\/js\\/custom.js\"}","1");


