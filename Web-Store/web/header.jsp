<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.Product"%>
<%@page import="model.Cart"%>
<%@page import="model.Account"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
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
        <%
            ArrayList<Cart> carth = (ArrayList<Cart>) session.getAttribute("cart");
            ArrayList<Product> productsh = (ArrayList<Product>) getServletContext().getAttribute("products");
            NumberFormat currencyFormatterh = NumberFormat.getCurrencyInstance(new Locale("en", "US"));
            Account eg = (Account) session.getAttribute("account");
            float cart_price = 0;
            for (Cart ch : carth) {
                for (Product productx : productsh) {
                    if (ch.getProduct().equals(productx.getId())) {

                        cart_price += productx.getPrice() * ch.getQuantity();
                    }
                }
            }
        %>
        <!-- ============================================== HEADER ============================================== -->
        <header class="header-style-1">

            <!-- ============================================== TOP MENU ============================================== -->
            <div class="top-bar animate-dropdown">
                <div class="container">
                    <div class="header-top-inner">
                        <div class="cnt-account">
                            <ul class="list-unstyled">

                                <li><a href="shopping-cart.jsp"><i class="icon fa fa-shopping-cart"></i>My Cart</a></li>
                                <li><a href="CheckoutController"><i class="icon fa fa-check"></i>Checkout</a></li>
                                <li><a href="login.jsp"><i class="icon fa fa-lock"></i><%=eg.getName()%></a></li>
                            </ul>
                        </div><!-- /.cnt-account -->


                        <div class="clearfix"></div>
                    </div><!-- /.header-top-inner -->
                </div><!-- /.container -->
            </div><!-- /.header-top -->
            <!-- ============================================== TOP MENU : END ============================================== -->
            <div class="main-header">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
                            <!-- ============================================================= LOGO ============================================================= -->
                            <div class="logo">
                                <a href="home.jsp">

                                    <img src="assets\images\logo.png" alt="">

                                </a>
                            </div><!-- /.logo -->
                            <!-- ============================================================= LOGO : END ============================================================= -->				</div><!-- /.logo-holder -->

                        <div class="col-xs-12 col-sm-12 col-md-7 top-search-holder">
                            <!-- /.contact-row -->
                            <!-- ============================================================= SEARCH AREA ============================================================= -->
                            <div class="search-area">
                                <form action='SearchController' method = 'POST'>
                                    <div class="control-group">
                                        <input class="search-field" placeholder="Search here..." type="text" name="search" value="">
                                        
                                        <input type="submit" value="Search" class="search-button" />
                                    </div>
                                </form>
                            </div><!-- /.search-area -->
                            <!-- ============================================================= SEARCH AREA : END ============================================================= -->				</div><!-- /.top-search-holder -->

                        <div class="col-xs-12 col-sm-12 col-md-2 animate-dropdown top-cart-row">
                            <!-- ============================================================= SHOPPING CART DROPDOWN ============================================================= -->

                            <div class="dropdown dropdown-cart">
                                <a href="#" class="dropdown-toggle lnk-cart" data-toggle="dropdown">
                                    <div class="items-cart-inner">
                                        <div class="basket">
                                            <i class="glyphicon glyphicon-shopping-cart"></i>
                                        </div>
                                        <div class="basket-item-count"><span class="count"><%= carth.size()%></span></div>
                                        <div class="total-price-basket">
                                            <span class="lbl">cart -</span>
                                            <span class="total-price">
                                                <span class="sign">$</span><span class="value"><%= cart_price%></span>
                                            </span>
                                        </div>


                                    </div>
                                </a>

                                <ul class="dropdown-menu">
                                    <li>
                                        <% for (Cart ch2 : carth) {
                                                for (Product productx : productsh) {
                                                    if (ch2.getProduct().equals(productx.getId())) {%>
                                        <div class="cart-item product-summary">
                                            <div class="row">
                                                <div class="col-xs-4">
                                                    <div class="image">
                                                        <a href="DetailController?id=<%=productx.getId()%>"><img src="<%= productx.getImagie()%>" height="25" width="25" alt=""></a>
                                                    </div>
                                                </div>
                                                <div class="col-xs-7">

                                                    <h3 class="name"><a href="DetailController?id=<%=productx.getId()%>"><%=productx.getName()%></a></h3>
                                                    <div class="price"><%= currencyFormatterh.format(productx.getPrice() * ch2.getQuantity())%></div>
                                                </div>
                                                <div class="col-xs-1 action">
                                                    <a href="DeleteProductFromCart?id=<%=productx.getId()%>"><i class="fa fa-trash"></i></a>
                                                </div>
                                            </div>
                                        </div><!-- /.cart-item -->

                                        <div class="clearfix"></div>
                                        <hr>
                                        <% }
                                                }
                                            }%>

                                        <div class="clearfix cart-total">
                                            <div class="pull-right">

                                                <span class="text">Total :</span><span class='price'><%= currencyFormatterh.format(cart_price)%></span>

                                            </div>
                                            <div class="clearfix"></div>

                                            <a href="CheckoutController" class="btn btn-upper btn-primary btn-block m-t-20">Checkout</a>	
                                        </div><!-- /.cart-total-->


                                    </li>
                                </ul><!-- /.dropdown-menu-->
                            </div><!-- /.dropdown-cart -->

                            <!-- ============================================================= SHOPPING CART DROPDOWN : END============================================================= -->				</div><!-- /.top-cart-row -->
                    </div><!-- /.row -->

                </div><!-- /.container -->

            </div><!-- /.main-header -->

            <!-- ============================================== NAVBAR ============================================== -->
            <div class="header-nav animate-dropdown">
                <div class="container">
                    <div class="yamm navbar navbar-default" role="navigation">
                        <div class="navbar-header">
                            <button data-target="#mc-horizontal-menu-collapse" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="nav-bg-class">
                            <div class="navbar-collapse collapse" id="mc-horizontal-menu-collapse">
                                <div class="nav-outer">
                                    <ul class="nav navbar-nav">
                                        <li class="active dropdown yamm-fw">
                                            <a href="home.jsp" data-hover="dropdown" class="dropdown-toggle" data-toggle="dropdown">Home</a>

                                        </li>
                                        <%
                                            ServletContext sc = getServletContext();
                                            ArrayList<Category> categories = (ArrayList<Category>) sc.getAttribute("categories");
                                            for (Category c : categories) {

                                        %>
                                        <li class="dropdown hidden-sm">
                                            <% if (c.getId() == categories.get(categories.size() - 1).getId()) {%>
                                            <a href="CategoryController?id=<%= c.getId()%>"><%=c.getName()%><span class="menu-label new-menu hidden-xs">new</span></a>

                                            <% break;
                                            } else%>
                                            <a href="CategoryController?id=<%=c.getId()%>"><%=c.getName()%></a>
                                        </li>
                                        <% }%>






                                    </ul><!-- /.navbar-nav -->
                                    <div class="clearfix"></div>				
                                </div><!-- /.nav-outer -->
                            </div><!-- /.navbar-collapse -->


                        </div><!-- /.nav-bg-class -->
                    </div><!-- /.navbar-default -->
                </div><!-- /.container-class -->

            </div><!-- /.header-nav -->
            <!-- ============================================== NAVBAR : END ============================================== -->

        </header>

        <!-- ============================================== HEADER : END ============================================== -->
    </body>
</html>