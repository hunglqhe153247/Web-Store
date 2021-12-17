<%@page import="model.Category"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Account"%>
?<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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




        <!-- Icons/Glyphs -->
        <link rel="stylesheet" href="assets\css\font-awesome.css">

        <!-- Fonts --> 
        <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,600italic,700,700italic,800' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>


    </head>
    <body class="cnt-home">
        <!-- ============================================== HEADER ============================================== -->
           
        <!-- ============================================== HEADER : END ============================================== -->
        <% Account account = (Account) session.getAttribute("account");
ArrayList<Category> categories = (ArrayList<Category>) getServletContext().getAttribute("categories");
        %>
        <div class="breadcrumb">
            <div class="container">
                <div class="breadcrumb-inner">
                    <ul class="list-inline list-unstyled">
                        
                        <li class='active'>Admin</li>
                        <li><a href="logout"><i class="icon fa fa-lock"></i>Logout</a></li>
                    </ul>
                </div><!-- /.breadcrumb-inner -->
            </div><!-- /.container -->
        </div><!-- /.breadcrumb -->

        <div class="body-content">
            <div class="container">
                <div class="contact-page">
                    <div class="col-md-12 col-sm-12 create-new-account">
                        <h4 class="checkout-subtitle">Add product</h4>
                        
                        <form class="register-form outer-top-xs" role="form" action="AdminController" method="POST"> 
                            <div class="form-group">
                                <label class="info-title" for="exampleInputEmail2">id <span>*</span></label>
                                <input type="text" class="form-control unicase-form-control text-input" id="exampleInputEmail2" name="id" value="">
                            </div>
                            <div class="form-group">
                                <label class="info-title" for="exampleInputEmail1">Name <span>*</span></label>
                                <input type="text" class="form-control unicase-form-control text-input" id="exampleInputEmail1" name="name" value = "">
                            </div>
                            <div class="form-group">
                                <label class="info-title" for="exampleInputEmail1">Price <span>*</span></label>
                                <input type="number" class="form-control unicase-form-control text-input" id="exampleInputEmail1" name="price" value = "">
                            </div>
                            <div class="form-group">
                                <label class="info-title" for="exampleInputEmail1">Unit <span>*</span></label>
                                <input type="text" class="form-control unicase-form-control text-input" id="exampleInputEmail1" name="unit" value = "">
                            </div>
                            <div class="form-group">
                                <label class="info-title" for="exampleInputEmail1">Category <span>*</span></label>
                                <% for(Category cate:categories){ %>
                                <input type="radio" name="category" value="<%=cate.getId()%>" /><%=cate.getName()%>
                                <% } %>
                            </div>
                            <div class="form-group">
                                <label class="info-title" for="exampleInputEmail1">Imagie <span>*</span></label>
                                <input type="text" class="form-control unicase-form-control text-input" name="imagie" id="" value="">
                            </div>
                            <div class="form-group">
                                <label class="info-title" for="exampleInputEmail1">Description <span>*</span></label>
                                <input type="text" class="form-control unicase-form-control text-input" name="description"  value="">
                            </div>
                            <div class="form-group">
                                <label class="info-title" for="exampleInputEmail1">Supplier <span>*</span></label>
                                <input type="text" class="form-control unicase-form-control text-input" name="supplier" value="">
                            </div>
                            <br>
                            <button type="submit" class="btn-upper btn btn-primary checkout-page-button">Add Product</button>
                        </form>


                    </div>
                    
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
            <!-- ============================================================= FOOTER ============================================================= -->
            
            <!-- ============================================================= FOOTER : END============================================================= -->


            <!-- For demo purposes ? can be removed on production -->


            <!-- For demo purposes ? can be removed on production : End -->

            <!-- JavaScripts placed at the end of the document so the pages load faster -->
            <script src="assets\js\jquery-1.11.1.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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

            <!-- For demo purposes ? can be removed on production -->

            <script src="switchstylesheet/switchstylesheet.js"></script>

            <script>
                $(document).ready(function () {
                    $(".changecolor").switchstylesheet({seperator: "color"});
                    $('.show-theme-options').click(function () {
                        $(this).parent().toggleClass('open');
                        return false;
                    });
                });

                $(window).bind("load", function () {
                    $('.show-theme-options').delay(2000).trigger('click');
                });
            </script>
            <script>
                $('#password, #confirm_password').on('keyup', function () {
                    if ($('#password').val() == $('#confirm_password').val()) {
                        $('#message').html('Matching').css('color', 'green');
                    } else
                        $('#message').html('Not Matching').css('color', 'red');
                });
            </script>
            <!-- For demo purposes ? can be removed on production : End -->



        </div></body>
</html>
