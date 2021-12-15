<%@page import="model.Sale"%>
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
        <%@include file="header.jsp" %>

        <!-- ============================================== HEADER : END ============================================== -->
        <div class="breadcrumb">
            <div class="container">
                <div class="breadcrumb-inner">
                    <ul class="list-inline list-unstyled">
                        <li><a href="home.jsp">Home</a></li>
                        <li class='active'>Shopping Cart</li>
                    </ul>
                </div><!-- /.breadcrumb-inner -->
            </div><!-- /.container -->
        </div><!-- /.breadcrumb -->

        <div class="body-content outer-top-xs">
            <div class="container">
                <div class="row ">
                    <div class="shopping-cart">
                        <div class="shopping-cart-table ">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="cart-romove item">Remove</th>
                                            <th class="cart-description item">Image</th>
                                            <th class="cart-product-name item">Product Detail</th>
                                            
                                            <th class="cart-qty item">Quantity</th>
                                            <th class="cart-sub-total item">Subtotal</th>
                                            <th class="cart-total last-item">Grandtotal</th>
                                        </tr>
                                    </thead><!-- /thead -->
                                    <tfoot>
                                        <tr>
                                            <td colspan="7">
                                                <div class="shopping-cart-btn">
                                                    <span class="">
                                                        <a href="home.jsp" class="btn btn-upper btn-primary outer-left-xs">Continue Shopping</a>
                                                        
                                                    </span>
                                                </div><!-- /.shopping-cart-btn -->
                                            </td>
                                        </tr>
                                    </tfoot>

                                    <tbody>
                                        <% ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
                                            ArrayList<Product> products = (ArrayList<Product>) getServletContext().getAttribute("products");
                                            NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("en", "US"));
                                            Account account = (Account) session.getAttribute("account");
                                            
                                            for (Cart c : cart) {
                                                for (Product product : products) {
                                                    if(c.getProduct().equals(product.getId())){
                                                        
                                        %>
                                        <tr>
                                            <td class="romove-item"><a href="DeleteProductFromCart?id=<%=product.getId()%>" title="cancel" class="icon"><i class="fa fa-trash-o"></i></a></td>
                                            <td class="cart-image">
                                                <a class="entry-thumbnail" href="DetailController?id=<%=product.getId()%>">
                                                    <img src="<%= product.getImagie()%>" height="190" width="200" alt="">
                                                </a>
                                            </td>
                                            <td class="cart-product-name-info">
                                                <h4 class='cart-product-description'><a href="DetailController?id=<%=product.getId()%>"><%= product.getName()%></a></h4>
                                                <div class="cart-product-info">
                                                    <div class="description">Unit: <a style="color:red"><%= product.getUnit()%></a></div>
                                                </div><!-- /.row -->
                                                <div class="cart-product-info">
                                                    <%=product.getDescription()%>
                                                </div>
                                            </td>
                                            
                                            <td>
                                                <div class="row">
                                                    <form action="CartController" method="POST">
                                                        <input type="hidden" name="id" value="<%=product.getId()%>" />
                                                        
                                                        <input type="number" value="<%=c.getQuantity()%>" name = "quantity" min="1" size="5">
                                                        
                                                        
                                                        <input type="submit" value="Edit" />
                                                        
                                                    </form>
                                                </div>
                                                
                                            </td>
                                            <td class="cart-product-sub-total"><span class="cart-sub-total-price"><%= currencyFormatter.format(product.getPrice())%></span></td>
                                            <td class="cart-product-grand-total"><span class="cart-grand-total-price"><%= currencyFormatter.format(product.getPrice()*c.getQuantity())%></span></td>
                                        </tr>
                                        <% }}
                                    }%>
                                    </tbody><!-- /tbody -->
                                </table><!-- /table -->
                            </div>
                        </div><!-- /.shopping-cart-table -->				<div class="col-md-4 col-sm-12 estimate-ship-tax">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>
                                            <span class="estimate-title">Shipping information</span>
                                            
                                        </th>
                                    </tr>
                                </thead><!-- /thead -->
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="form-group">
                                                <label class="info-title control-label">Name: <span>*</span></label>
                                                <%= account.getName() %>
                                            </div>
                                            <div class="form-group">
                                                <label class="info-title control-label">Address: <span>*</span></label>
                                                <%= account.getAddress() %>
                                            </div>
                                            <div class="form-group">
                                                <label class="info-title control-label">Phone: <span>*</span></label>
                                                <%= account.getPhone() %>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- /.estimate-ship-tax -->                       
                        <% float cart_price_normal = 0;
                        float cart_price_sale = 0;
                        
                        int sale_percentage = 0;
                        ArrayList<Sale> sales = (ArrayList<Sale>) getServletContext().getAttribute("sales");
                            for(Cart c:cart){
                                sale_percentage = 0;
                                for(Sale s:sales){
                                    if(c.getProduct().equals(s.getProduct())){
                                        sale_percentage = s.getPercentage();
                                    }
                                }
                                for(Product p:products){
                                    if(c.getProduct().equals(p.getId())){
                                        cart_price_sale+= p.getPrice()/100*(100-sale_percentage)*c.getQuantity();
                                        cart_price_normal+=p.getPrice()*c.getQuantity();
                                    }
                                }
                            }
                        %>
                        <div class="col-md-4 col-sm-12 cart-shopping-total">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>
                                            <div class="cart-sub-total">
                                                Total<span class="inner-left-md"><%=cart_price_normal%></span>
                                            </div>
                                            <div class="cart-grand-total">
                                                After Sale (if exist)<span class="inner-left-md"><%=cart_price_sale%></span>
                                            </div>
                                        </th>
                                    </tr>
                                </thead><!-- /thead -->
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="cart-checkout-btn pull-right">
                                                <button type="submit" class="btn btn-primary checkout-btn">PROCCED TO CHECKOUT</button>
                                                
                                            </div>
                                        </td>
                                    </tr>
                                </tbody><!-- /tbody -->
                            </table><!-- /table -->
                        </div><!-- /.cart-shopping-total -->			</div><!-- /.shopping-cart -->
                </div> <!-- /.row -->
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


        <!-- For demo purposes ? can be removed on production -->


        <!-- For demo purposes ? can be removed on production : End -->

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
