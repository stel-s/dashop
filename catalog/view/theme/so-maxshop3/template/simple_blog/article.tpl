<?php echo $header; ?>
    <div class="container">
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
        
        <div class="form-group">
            <?php echo $column_left; ?>
            <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-md-9 col-sm-8'; ?>
            <?php } else { ?>
                <?php $class = 'col-sm-12'; ?>
            <?php } ?>
            
            <div id="content" class="<?php echo $class; ?>">
                <?php echo $content_top; ?>
                <div class="blog-header">
				<h2><?php echo $heading_title; ?></h2>
				 <?php echo (isset($description) && !empty($description)) ? $description: ''; ?>
			 </div>
                
                <div class="blog-listitem">
                    <?php if($articles) { ?>
                        <?php foreach($articles as $article) { ?>                            
                            <div class="blog-item">
						  <div class="itemBlogImg col-md-4 col-sm-12">
							  <?php if($article['image']) { ?>
        							<?php if($article['featured_found']) { ?>
        								<div class="article-image">
        									<a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['image']; ?>" alt="<?php echo $article['article_title']; ?>" /></a>
        								</div>
        							<?php } else { ?>
        								<div class="article-thumbnail-image">
        									<img src="<?php echo $article['image']; ?>" alt="<?php echo $article['article_title']; ?>" />
        									<span class="article-description">
        										<?php echo $article['description']; ?>
        									</span>
        								</div>
        							<?php } ?>
        						<?php } ?>
                                
						  </div>
						  <div class="itemBlogContent col-md-8 col-sm-12">
							  <div class="article-title">
								<h4><a href="<?php echo $article['href']; ?>"><?php echo ucwords($article['article_title']); ?></a><h4>
							 </div>
							  
							  <div class="article-sub-title">
        							
        							<!-- <span class="article-author"><?php echo $article['author_name']; ?></span> -->
        							<span class="article-date">
								    <?php $datetotime = strtotime($article['date_added']); ?>
								    <i class="fa fa-calendar"></i><?php echo date("D, M j, Y" , $datetotime);?>
								</span>
        							
        						 </div>
							 
							 <?php if($article['featured_found']) { ?>						
								    <div class="article-description">
									     <?php echo utf8_substr( $article['description'],0, 250 );?>
								    </div>
							    <?php } else { ?>
        							<div class="article-description">
        								<?php echo utf8_substr( $article['description'],0, 250 );?>
        							</div>
        						<?php } ?>
							
							<div class="blog-meta">
								<?php if($article['allow_comment']) { ?>
									<span class="comment_count"><a href="<?php echo $article['comment_href']; ?>#comment-section"><?php echo $article['total_comment']; ?></a></span>
								<?php } ?>
								
								<span class="author"><span>Post by </span><?php echo $article['author_name']; ?></span>
								
							 </div>
							
							 <!-- <div align="right">
								<a class="btn btn-success btn-large" href="<?php //echo $article['href']; ?>"><b><?php //echo $button_continue_reading; ?></b></a>
							 </div> -->
							 
							 <?php if(!$article['featured_found']) { ?>
								    <div class="article-thumbnail-found"></div>
        						<?php } ?>    
						  </div>
                               
                                
                                
                                
                               
                                
                                                            
                            </div>
                        <?php } ?>
                        
                        <div class="row">
                            <div class="col-xs-12"><?php echo $pagination; ?></div>
                            <!-- <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right"><?php echo $results; ?></div> -->
                        </div>
                           
                    <?php } else { ?>
                        <h3 class="text-center"><?php echo $text_no_found; ?></h3>
                    <?php } ?>
                </div>               
                
                <?php echo $content_bottom; ?>
            </div>            
            
            <?php echo $column_right; ?>
        </div>        
    </div>    
<?php echo $footer; ?>