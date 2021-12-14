ï»¿<%@page import="model.Sale"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.Product"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- Meta -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
	    <meta name="keywords" content="MediaCenter, Template, eCommerce">
	    <meta name="robots" content="all">

	    <title>Flipmart premium HTML5 & CSS3 Template</title>

	    <!-- Bootstrap Core CSS -->
	    <link rel="stylesheet" href="assets\css\bootstrap.min.css">
	    
	    <!-- Customizable CSS -->
	    <link rel="stylesheet" href="assets\css\main.css">
	    <link rel="stylesheet" href="assets\css\blue.css">
	    <link rel="stylesheet" href="assets\css\owl.carousel.css">
		<link rel="stylesheet" href="assets\css\owl.transitions.css">
		<link rel="stylesheet" href="assets\css\animate.min.css">
		<link rel="stylesheet" href="assets\css\rateit.css">
		<link rel="stylesheet" href="assets\css\bootstrap-select.min.css">
        <link href="assets\css\lightbox.css" rel="stylesheet">
		

		
		<!-- Icons/Glyphs -->
		<link rel="stylesheet" href="assets\css\font-awesome.css">

        <!-- Fonts --> 
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,600italic,700,700italic,800' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>


	</head>
    <body class="cnt-home">
		<!-- ============================================== HEADER ============================================== -->
<%@include file="header.jsp" %>
<!-- ============================================== HEADER : END ============================================== -->
<div class="breadcrumb">
	<div class="container">
		<div class="breadcrumb-inner">
			<ul class="list-inline list-unstyled">
				<li><a href="#">Home</a></li>
				<li><a href="#">Clothing</a></li>
				<li class='active'>Floral Print Buttoned</li>
			</ul>
		</div><!-- /.breadcrumb-inner -->
	</div><!-- /.container -->
</div><!-- /.breadcrumb -->
<div class="body-content outer-top-xs">
	<div class='container'>
		<div class='row single-product'>
			<div class='col-md-3 sidebar'>
				<div class="sidebar-module-container">
				<div class="home-banner outer-top-n">

</div>		
  
    
    
    	<!-- ============================================== HOT DEALS ============================================== -->
                        <div class="sidebar-widget hot-deals wow fadeInUp outer-bottom-xs">
                            <h3 class="section-title">hot deals</h3>
                            <div class="owl-carousel sidebar-carousel custom-carousel owl-theme outer-top-ss">
                                <% ArrayList<Sale> hotdeals = (ArrayList<Sale>) getServletContext().getAttribute("hotdeals");
                                    ArrayList<Product> products = (ArrayList<Product>) getServletContext().getAttribute("products");
                                    NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
                                    for (Sale s : hotdeals) {

                                        for (Product p : products) {
                                            if (s.getProduct().equals(p.getId())) {
                                %>
                                <div class="item">
                                    <div class="products">
                                        <div class="hot-deal-wrapper">
                                            <div class="image"> <img src="<%=p.getImagie()%>" height="190" width="200" alt=""> </div>
                                            <div class="sale-offer-tag"><span><%=s.getPercentage()%>%<br>
                                                    off</span></div>

                                        </div>
                                        <!-- /.hot-deal-wrapper -->

                                        <div class="product-info text-left m-t-20">
                                            <h3 class="name"><a href="detail.html"><%=p.getName()%></a></h3>
                                            <div class="description">Unit: <a style="color:red"><%= p.getUnit()%></a></div>
                                            <div class="product-price"> <span class="price"> <%= currencyFormatter.format(p.getPrice() / 100 * (100 - s.getPercentage()))%> </span> <span class="price-before-discount"><%= currencyFormatter.format(p.getPrice())%></span> </div>
                                            <!-- /.product-price --> 

                                        </div>
                                        <!-- /.product-info -->

                                        <div class="cart clearfix animate-effect">
                                            <div class="action">
                                                <div class="add-cart-button btn-group">
                                                    <button class="btn btn-primary icon" data-toggle="dropdown" type="button"> <i class="fa fa-shopping-cart"></i> </button>
                                                    <button class="btn btn-primary cart-btn" type="button">Add to cart</button>
                                                </div>
                                            </div>
                                            <!-- /.action --> 
                                        </div>
                                        <!-- /.cart --> 
                                    </div>
                                </div>
                                <% }
                                        }
                                    } %>

                            </div>
                            <!-- /.sidebar-widget --> 
                        </div>
<!-- ============================================== HOT DEALS: END ============================================== -->					

<!-- ============================================== Testimonials============================================== -->
                        <div class="sidebar-widget  wow fadeInUp outer-top-vs ">
                            <div id="advertisement" class="advertisement">
                                <div class="item">
                                    <div class="image"><img src="https://i.pinimg.com/736x/81/0b/0a/810b0a0aa4335d2b1cbd00a3ec5d9546.jpg" height="200" width="220"></div>
                                    <br>
                                    <div class="testimonials"><em>"</em>We are pleased to serve you. All contributions please send to our email or hotline.<em>"</em></div>
                                    <!-- /.container-fluid --> 
                                </div> 

                            </div>
                            <!-- /.owl-carousel --> 
                        </div>

                        <!-- ============================================== Testimonials: END ============================================== -->



 

				</div>
			</div><!-- /.sidebar -->
			<div class='col-md-9'>
            <div class="detail-block">
				<div class="row  wow fadeInUp">
                		
					<div class='col-sm-6 col-md-7 product-info-block'>
						<div class="product-info">
							<h1 class="name">Floral Print Buttoned</h1>
							
							<div class="rating-reviews m-t-20">
								<div class="row">
									<div class="col-sm-3">
										<div class="rating rateit-small"></div>
									</div>
									<div class="col-sm-8">
										<div class="reviews">
											<a href="#" class="lnk">(13 Reviews)</a>
										</div>
									</div>
								</div><!-- /.row -->		
							</div><!-- /.rating-reviews -->

							<div class="stock-container info-container m-t-10">
								<div class="row">
									<div class="col-sm-2">
										<div class="stock-box">
											<span class="label">Availability :</span>
										</div>	
									</div>
									<div class="col-sm-9">
										<div class="stock-box">
											<span class="value">In Stock</span>
										</div>	
									</div>
								</div><!-- /.row -->	
							</div><!-- /.stock-container -->

							<div class="description-container m-t-20">
								Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
							</div><!-- /.description-container -->

							<div class="price-container info-container m-t-20">
								<div class="row">
									

									<div class="col-sm-6">
										<div class="price-box">
											<span class="price">$800.00</span>
											<span class="price-strike">$900.00</span>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="favorite-button m-t-10">
											<a class="btn btn-primary" data-toggle="tooltip" data-placement="right" title="Wishlist" href="#">
											    <i class="fa fa-heart"></i>
											</a>
											<a class="btn btn-primary" data-toggle="tooltip" data-placement="right" title="Add to Compare" href="#">
											   <i class="fa fa-signal"></i>
											</a>
											<a class="btn btn-primary" data-toggle="tooltip" data-placement="right" title="E-mail" href="#">
											    <i class="fa fa-envelope"></i>
											</a>
										</div>
									</div>

								</div><!-- /.row -->
							</div><!-- /.price-container -->

							<div class="quantity-container info-container">
								<div class="row">
									
									<div class="col-sm-2">
										<span class="label">Qty :</span>
									</div>
									
									<div class="col-sm-2">
										<div class="cart-quantity">
											<div class="quant-input">
								                <div class="arrows">
								                  <div class="arrow plus gradient"><span class="ir"><i class="icon fa fa-sort-asc"></i></span></div>
								                  <div class="arrow minus gradient"><span class="ir"><i class="icon fa fa-sort-desc"></i></span></div>
								                </div>
								                <input type="text" value="1">
							              </div>
							            </div>
									</div>

									<div class="col-sm-7">
										<a href="#" class="btn btn-primary"><i class="fa fa-shopping-cart inner-right-vs"></i> ADD TO CART</a>
									</div>

									
								</div><!-- /.row -->
							</div><!-- /.quantity-container -->

							

							

							
						</div><!-- /.product-info -->
					</div><!-- /.col-sm-7 -->
				</div><!-- /.row -->
                </div>
<!-- ============================================== UPSELL PRODUCTS ============================================== -->
<section class="section featured-product wow fadeInUp">
	<h3 class="section-title">upsell products</h3>
	<div class="owl-carousel home-owl-carousel upsell-product custom-carousel owl-theme outer-top-xs">
	    	
		<div class="item item-carousel">
			<div class="products">
				
	<div class="product">		
		<div class="product-image">
			<div class="image">
				<a href="detail.html"><img src="assets\images\products\p1.jpg" alt=""></a>
			</div><!-- /.image -->			

			            <div class="tag sale"><span>sale</span></div>            		   
		</div><!-- /.product-image -->
			
		
		<div class="product-info text-left">
			<h3 class="name"><a href="detail.html">Floral Print Buttoned</a></h3>
			<div class="rating rateit-small"></div>
			<div class="description"></div>

			<div class="product-price">	
				<span class="price">
					$650.99				</span>
										     <span class="price-before-discount">$ 800</span>
									
			</div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary cart-btn" type="button">Add to cart</button>
													
						</li>
	                   
		                <li class="lnk wishlist">
							<a class="add-to-cart" href="detail.html" title="Wishlist">
								 <i class="icon fa fa-heart"></i>
							</a>
						</li>

						<li class="lnk">
							<a class="add-to-cart" href="detail.html" title="Compare">
							    <i class="fa fa-signal"></i>
							</a>
						</li>
					</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
		</div><!-- /.item -->
	
		<div class="item item-carousel">
			<div class="products">
				
	<div class="product">		
		<div class="product-image">
			<div class="image">
				<a href="detail.html"><img src="assets\images\products\p2.jpg" alt=""></a>
			</div><!-- /.image -->			

			            <div class="tag sale"><span>sale</span></div>            		   
		</div><!-- /.product-image -->
			
		
		<div class="product-info text-left">
			<h3 class="name"><a href="detail.html">Floral Print Buttoned</a></h3>
			<div class="rating rateit-small"></div>
			<div class="description"></div>

			<div class="product-price">	
				<span class="price">
					$650.99				</span>
										     <span class="price-before-discount">$ 800</span>
									
			</div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary cart-btn" type="button">Add to cart</button>
													
						</li>
	                   
		                <li class="lnk wishlist">
							<a class="add-to-cart" href="detail.html" title="Wishlist">
								 <i class="icon fa fa-heart"></i>
							</a>
						</li>

						<li class="lnk">
							<a class="add-to-cart" href="detail.html" title="Compare">
							    <i class="fa fa-signal"></i>
							</a>
						</li>
					</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
		</div><!-- /.item -->
	
		<div class="item item-carousel">
			<div class="products">
				
	<div class="product">		
		<div class="product-image">
			<div class="image">
				<a href="detail.html"><img src="assets\images\products\p3.jpg" alt=""></a>
			</div><!-- /.image -->			

			                        <div class="tag hot"><span>hot</span></div>		   
		</div><!-- /.product-image -->
			
		
		<div class="product-info text-left">
			<h3 class="name"><a href="detail.html">Floral Print Buttoned</a></h3>
			<div class="rating rateit-small"></div>
			<div class="description"></div>

			<div class="product-price">	
				<span class="price">
					$650.99				</span>
										     <span class="price-before-discount">$ 800</span>
									
			</div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary cart-btn" type="button">Add to cart</button>
													
						</li>
	                   
		                <li class="lnk wishlist">
							<a class="add-to-cart" href="detail.html" title="Wishlist">
								 <i class="icon fa fa-heart"></i>
							</a>
						</li>

						<li class="lnk">
							<a class="add-to-cart" href="detail.html" title="Compare">
							    <i class="fa fa-signal"></i>
							</a>
						</li>
					</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
		</div><!-- /.item -->
	
		<div class="item item-carousel">
			<div class="products">
				
	<div class="product">		
		<div class="product-image">
			<div class="image">
				<a href="detail.html"><img src="assets\images\products\p4.jpg" alt=""></a>
			</div><!-- /.image -->			

			<div class="tag new"><span>new</span></div>                        		   
		</div><!-- /.product-image -->
			
		
		<div class="product-info text-left">
			<h3 class="name"><a href="detail.html">Floral Print Buttoned</a></h3>
			<div class="rating rateit-small"></div>
			<div class="description"></div>

			<div class="product-price">	
				<span class="price">
					$650.99				</span>
										     <span class="price-before-discount">$ 800</span>
									
			</div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary cart-btn" type="button">Add to cart</button>
													
						</li>
	                   
		                <li class="lnk wishlist">
							<a class="add-to-cart" href="detail.html" title="Wishlist">
								 <i class="icon fa fa-heart"></i>
							</a>
						</li>

						<li class="lnk">
							<a class="add-to-cart" href="detail.html" title="Compare">
							    <i class="fa fa-signal"></i>
							</a>
						</li>
					</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
		</div><!-- /.item -->
	
		<div class="item item-carousel">
			<div class="products">
				
	<div class="product">		
		<div class="product-image">
			<div class="image">
				<a href="detail.html"><img src="assets\images\blank.gif" data-echo="assets/images/products/p5.jpg" alt=""></a>
			</div><!-- /.image -->			

			                        <div class="tag hot"><span>hot</span></div>		   
		</div><!-- /.product-image -->
			
		
		<div class="product-info text-left">
			<h3 class="name"><a href="detail.html">Floral Print Buttoned</a></h3>
			<div class="rating rateit-small"></div>
			<div class="description"></div>

			<div class="product-price">	
				<span class="price">
					$650.99				</span>
										     <span class="price-before-discount">$ 800</span>
									
			</div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary cart-btn" type="button">Add to cart</button>
													
						</li>
	                   
		                <li class="lnk wishlist">
							<a class="add-to-cart" href="detail.html" title="Wishlist">
								 <i class="icon fa fa-heart"></i>
							</a>
						</li>

						<li class="lnk">
							<a class="add-to-cart" href="detail.html" title="Compare">
							    <i class="fa fa-signal"></i>
							</a>
						</li>
					</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
		</div><!-- /.item -->
	
		<div class="item item-carousel">
			<div class="products">
				
	<div class="product">		
		<div class="product-image">
			<div class="image">
				<a href="detail.html"><img src="assets\images\blank.gif" data-echo="assets/images/products/p6.jpg" alt=""></a>
			</div><!-- /.image -->			

			<div class="tag new"><span>new</span></div>                        		   
		</div><!-- /.product-image -->
			
		
		<div class="product-info text-left">
			<h3 class="name"><a href="detail.html">Floral Print Buttoned</a></h3>
			<div class="rating rateit-small"></div>
			<div class="description"></div>

			<div class="product-price">	
				<span class="price">
					$650.99				</span>
										     <span class="price-before-discount">$ 800</span>
									
			</div><!-- /.product-price -->
			
		</div><!-- /.product-info -->
					<div class="cart clearfix animate-effect">
				<div class="action">
					<ul class="list-unstyled">
						<li class="add-cart-button btn-group">
							<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<button class="btn btn-primary cart-btn" type="button">Add to cart</button>
													
						</li>
	                   
		                <li class="lnk wishlist">
							<a class="add-to-cart" href="detail.html" title="Wishlist">
								 <i class="icon fa fa-heart"></i>
							</a>
						</li>

						<li class="lnk">
							<a class="add-to-cart" href="detail.html" title="Compare">
							    <i class="fa fa-signal"></i>
							</a>
						</li>
					</ul>
				</div><!-- /.action -->
			</div><!-- /.cart -->
			</div><!-- /.product -->
      
			</div><!-- /.products -->
		</div><!-- /.item -->
			</div><!-- /.home-owl-carousel -->
</section><!-- /.section -->
<!-- ============================================== UPSELL PRODUCTS : END ============================================== -->
			
			</div><!-- /.col -->
			<div class="clearfix"></div>
		</div><!-- /.row -->
		<!-- ============================================== BRANDS CAROUSEL ============================================== -->
<div id="brands-carousel" class="logo-slider wow fadeInUp">

		<div class="logo-slider-inner">	
			<div id="brand-slider" class="owl-carousel brand-slider custom-carousel owl-theme">
				<div class="item m-t-15">
					<a href="#" class="image">
						<img data-echo="assets/images/brands/brand1.png" src="assets\images\blank.gif" alt="">
					</a>	
				</div><!--/.item-->

				<div class="item m-t-10">
					<a href="#" class="image">
						<img data-echo="assets/images/brands/brand2.png" src="assets\images\blank.gif" alt="">
					</a>	
				</div><!--/.item-->

				<div class="item">
					<a href="#" class="image">
						<img data-echo="assets/images/brands/brand3.png" src="assets\images\blank.gif" alt="">
					</a>	
				</div><!--/.item-->

				<div class="item">
					<a href="#" class="image">
						<img data-echo="assets/images/brands/brand4.png" src="assets\images\blank.gif" alt="">
					</a>	
				</div><!--/.item-->

				<div class="item">
					<a href="#" class="image">
						<img data-echo="assets/images/brands/brand5.png" src="assets\images\blank.gif" alt="">
					</a>	
				</div><!--/.item-->

				<div class="item">
					<a href="#" class="image">
						<img data-echo="assets/images/brands/brand6.png" src="assets\images\blank.gif" alt="">
					</a>	
				</div><!--/.item-->

				<div class="item">
					<a href="#" class="image">
						<img data-echo="assets/images/brands/brand2.png" src="assets\images\blank.gif" alt="">
					</a>	
				</div><!--/.item-->

				<div class="item">
					<a href="#" class="image">
						<img data-echo="assets/images/brands/brand4.png" src="assets\images\blank.gif" alt="">
					</a>	
				</div><!--/.item-->

				<div class="item">
					<a href="#" class="image">
						<img data-echo="assets/images/brands/brand1.png" src="assets\images\blank.gif" alt="">
					</a>	
				</div><!--/.item-->

				<div class="item">
					<a href="#" class="image">
						<img data-echo="assets/images/brands/brand5.png" src="assets\images\blank.gif" alt="">
					</a>	
				</div><!--/.item-->
		    </div><!-- /.owl-carousel #logo-slider -->
		</div><!-- /.logo-slider-inner -->
	
</div><!-- /.logo-slider -->
<!-- ============================================== BRANDS CAROUSEL : END ============================================== -->	</div><!-- /.container -->
</div><!-- /.body-content -->

<!-- ============================================================= FOOTER ============================================================= -->
<%@include file="footer.jsp" %>
<!-- ============================================================= FOOTER : END============================================================= -->


	<!-- For demo purposes â can be removed on production -->
	
	
	<!-- For demo purposes â can be removed on production : End -->

	<!-- JavaScripts placed at the end of the document so the pages load faster -->
	<script src="assets\js\jquery-1.11.1.min.js"></script>
	
	<script src="assets\js\bootstrap.min.js"></script>
	
	<script src="assets\js\bootstrap-hover-dropdown.min.js"></script>
	<script src="assets\js\owl.carousel.min.js"></script>
	
	<script src="assets\js\echo.min.js"></script>
	<script src="assets\js\jquery.easing-1.3.min.js"></script>
	<script src="assets\js\bootstrap-slider.min.js"></script>
    <script src="assets\js\jquery.rateit.min.js"></script>
    <script type="text/javascript" src="assets\js\lightbox.min.js"></script>
    <script src="assets\js\bootstrap-select.min.js"></script>
    <script src="assets\js\wow.min.js"></script>
	<script src="assets\js\scripts.js"></script>

	

	

</body>
</html>
