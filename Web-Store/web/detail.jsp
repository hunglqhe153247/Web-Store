<%@page import="model.Sale"%>
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
        <% Product pro = (Product) request.getAttribute("productdetail");
            Category c = (Category) request.getAttribute("category");
        %>
        <div class="breadcrumb">
            <div class="container">
                <div class="breadcrumb-inner">
                    <ul class="list-inline list-unstyled">
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="CategoryController?id=<%= c.getId()%>"><%=c.getName()%></a></li>
                        <li class='active'><%=pro.getName()%></li>
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
                                        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("en", "US"));
                                        for (Sale s : hotdeals) {

                                            for (Product p : products) {
                                                if (s.getProduct().equals(p.getId())) {
                                    %>
                                    <div class="item">
                                        <div class="products">
                                            <div class="hot-deal-wrapper">
                                                <div class="image"> <a href="DetailController?id=<%=p.getId()%>"><img src="<%=p.getImagie()%>" height="190" width="200" alt=""> </a></div>
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
                                                        <button class="btn btn-primary cart-btn" type="button" onclick="location.href='CartController?id=<%=p.getId()%>&quantity=1';">Add to cart</button>
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


                            <%
                                ArrayList<Sale> sales = (ArrayList<Sale>) getServletContext().getAttribute("sales");
                                int sale_percentage = 0;
                                boolean hasSale = false;
                                for (Sale s : sales) {
                                    if (pro.getId().equals(s.getProduct())) {
                                        sale_percentage = s.getPercentage();
                                        hasSale = true;
                                    }
                                }

                            %>


                        </div>
                    </div><!-- /.sidebar -->
                    <div class='col-md-9'>
                        <div class="detail-block">
                            <div class="row  wow fadeInUp">

                                <div class="col-xs-12 col-sm-6 col-md-5 gallery-holder">
                                    <div class="product-item-holder size-big single-product-gallery small-gallery">

                                        <div id="owl-single-product">
                                            <div class="single-product-gallery-item" id="slide1">
                                                <a data-lightbox="image-1" data-title="Gallery" href="<%= pro.getImagie()%>">
                                                    <img class="img-responsive" alt="" src="<%= pro.getImagie()%>" data-echo="<%= pro.getImagie()%>">
                                                </a>
                                            </div><!-- /.single-product-gallery-item -->



                                        </div><!-- /.single-product-slider -->




                                    </div><!-- /.single-product-gallery -->
                                </div><!-- /.gallery-holder -->        			

                                <div class='col-sm-6 col-md-7 product-info-block'>
                                    <div class="product-info">
                                        <h1 class="name"><%= pro.getName()%></h1>

                                        <div class="rating-reviews m-t-20">
                                            <div>Unit: <a style="color:red"><%= pro.getUnit()%></a></div>	
                                        </div><!-- /.rating-reviews -->



                                        <div class="description-container m-t-20">
                                            <%=pro.getDescription()%>
                                        </div><!-- /.description-container -->

                                        <div class="price-container info-container m-t-20">
                                            <div class="row">


                                                <div class="col-sm-6">
                                                    <div class="price-box">
                                                        <span class="price"><%= currencyFormatter.format(pro.getPrice() / 100 * (100 - sale_percentage))%></span>
                                                        <% if (hasSale == true) {%>
                                                        <span class="price-strike"><%= currencyFormatter.format(pro.getPrice())%></span>
                                                        <% }%>
                                                    </div>
                                                </div>



                                            </div><!-- /.row -->
                                        </div><!-- /.price-container -->
                                        <form action="CartController" method="GET">
                                        <div class="quantity-container info-container">
                                            <div class="row">

                                                <div class="col-sm-2">
                                                    <span class="label">Quantity :</span>
                                                </div>

                                                <div class="col-sm-2">
                                                    <div class="cart-quantity">
                                                        <div class="quant-input">
                                                            
                                                            
                                                            <input type="number" value="1" min = '1' name="quantity">
                                                            <input type="hidden" name="id" value="<%=pro.getId()%>" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-sm-7">
                                                    
                                                    <button class="btn btn-primary cart-btn" type="submit" >Add to cart</button>
                                                </div>
                                        </form>



                                            </div><!-- /.row -->
                                        </div><!-- /.quantity-container -->






                                    </div><!-- /.product-info -->
                                </div><!-- /.col-sm-7 -->
                            </div><!-- /.row -->
                        </div>
                        <!-- ============================================== UPSELL PRODUCTS ============================================== -->
                        <section class="section featured-product wow fadeInUp">
                            <h3 class="section-title">Products of the same category</h3>
                            <div class="owl-carousel home-owl-carousel upsell-product custom-carousel owl-theme outer-top-xs">
                                <% ArrayList<Product> productsWithCategory = (ArrayList<Product>) request.getAttribute("productsWithCategory");
                                    for (Product pr : productsWithCategory) {
                                        int sale_percentage1 = 0;
                                        boolean hasSale1 = false;
                                        for (Sale s : sales) {
                                            if (pr.getId().equals(s.getProduct())) {
                                                sale_percentage1 = s.getPercentage();
                                                hasSale1 = true;
                                            }
                                        }

                                %>
                                <div class="item item-carousel">
                                    <div class="products">

                                        <div class="product">		
                                            <div class="product-image">
                                                <div class="image">
                                                    <a href="DetailController?id=<%=pr.getId()%>"><img src="<%=pr.getImagie()%>" height="190" width="200" alt=""></a>
                                                </div><!-- /.image -->			
                                                <% if(hasSale1==true){ %>
                                                <div class="tag sale"><span>sale</span></div> 
<% } %>                                                
                                            </div><!-- /.product-image -->


                                            <div class="product-info text-left">
                                                <h3 class="name"><a href="DetailController?id=<%=pr.getId()%>"><%=pr.getName()%></a></h3>
                                                <div>Unit: <a style="color:red"><%= pr.getUnit()%></a></div>

                                                <div class="product-price"> <span class="price"> <%= currencyFormatter.format(pr.getPrice() / 100 * (100 - sale_percentage1))%> </span>
                                                    <% if (hasSale == true) {%>
                                                    <span class="price-before-discount"><%= currencyFormatter.format(pr.getPrice())%></span>
                                                    <% } %>
                                                </div>
                                                <div class="card" >

                                                    <p><button style="border: none; outline: 0; padding: 12px; color: white; background-color: #108bea; text-align: center; cursor: pointer; width: 100%; font-size: 18px;" onclick="location.href='CartController?id=<%=pr.getId()%>&quantity=1';">Add to Cart</button></p>
                                                </div>
                                            </div><!-- /.product-info -->

                                        </div><!-- /.product -->

                                    </div><!-- /.products -->
                                </div><!-- /.item -->
                                <%}%>


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


        <!-- For demo purposes – can be removed on production -->


        <!-- For demo purposes – can be removed on production : End -->

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
