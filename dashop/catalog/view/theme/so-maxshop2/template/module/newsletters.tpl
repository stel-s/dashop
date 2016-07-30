<script>
		function subscribe()
		{
			var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			var email = $('#txtemail').val();
			if(email != "")
			{
				if(!emailpattern.test(email))
				{
					alert("Invalid Email");
					return false;
				}
				else
				{
					$.ajax({
						url: 'index.php?route=module/newsletters/news',
						type: 'post',
						data: 'email=' + $('#txtemail').val(),
						dataType: 'json',
						
									
						success: function(json) {
						
						alert(json.message);
						
						}
						
					});
					return false;
				}
			}
			else
			{
				alert("Email Is Require");
				$(email).focus();
				return false;
			}
			

		}
	</script>
<div class="news-letter col-lg-9 col-md-9 col-sm-12" > 
		<div class="newsletter">
				<div class="title-block">
						<div class="page-heading"><?php echo $heading_title; ?></div>
						<div class="pre-text" data-scroll-reveal="enter bottom and move 40px over 0.6s">
								<?php echo $description; ?>
												
						</div>
				</div>
				
				<div class="block_content">
						<form method="post">
								<div class="form-group required">
										<div class="input-box">
										  <input type="email" name="txtemail" id="txtemail" value="" placeholder="Enter your email" class="form-control input-lg"  /> 
										</div>
										<div class="subcribe">
												<button type="submit" class="btn btn-default btn-lg" onclick="return subscribe();"><?php echo $text_subscribe; ?></button>  
												
										</div>
								</div>
				
						</form>
				</div>
				
			  
		
		</div>
</div>
