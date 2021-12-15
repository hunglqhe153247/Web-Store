<%@page import="model.Review"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.Sale"%>
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

<!-- Icons/Glyphs -->
<link rel="stylesheet" href="assets\css\font-awesome.css">

<!-- Fonts -->
<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,600italic,700,700italic,800' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
</head>
<body>
<!-- ============================================== HEADER ============================================== -->
<%@include file="header.jsp" %>
<!-- ============================================== HEADER : END ============================================== -->
<div class="breadcrumb">
  <div class="container">
    <div class="breadcrumb-inner">
      <ul class="list-inline list-unstyled">
        <li><a href="home.jsp">Home</a></li>
        <li class='active'><%= request.getAttribute("categoryName") %></li>
      </ul>
    </div>
    <!-- /.breadcrumb-inner --> 
  </div>
  <!-- /.container --> 
</div>
<!-- /.breadcrumb -->
<div class="body-content outer-top-xs">
  <div class='container'>
    <div class='row'>
      <div class='col-md-3 sidebar'> 

        <div class="sidebar-module-container">
          <div class="sidebar-filter"> 
            <!-- ============================================== SIDEBAR CATEGORY ============================================== -->
            
            <!-- /.sidebar-widget --> 
            <!-- ============================================== SIDEBAR CATEGORY : END ============================================== --> 
            
            <!-- ============================================== PRICE SILDER============================================== -->
            <% ArrayList<Product> productsWithCategory = (ArrayList<Product>)request.getAttribute("productsWithCategory");
            String category = productsWithCategory.get(0).getCategory();
            NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("en", "US"));
            ArrayList<Review> review = (ArrayList<Review>)request.getAttribute("review");
            %>
            

 
 
          <!----------- Testimonials------------->
            <div class="sidebar-widget  wow fadeInUp outer-top-vs ">
              <div id="advertisement" class="advertisement">
                  <% if(review.size()!=0){
                      for(Review r : review) {%>
                <div class="item">
                  <div class="image"><img src="<%=r.getImagie() %>" height="200" width="220"></div>
                  <br>
                  <div class="testimonials"><em>"</em><%=r.getContent() %><em>"</em></div>
                  <div class="clients_author"><%=r.getWriter()%>  </div>
                  <!-- /.container-fluid --> 
                </div>
                <!-- /.item -->
                <%      }
                    } 
                else{ %>
                        <div class="item">
                  <div class="image"><img src="https://i.pinimg.com/736x/81/0b/0a/810b0a0aa4335d2b1cbd00a3ec5d9546.jpg" height="200" width="220"></div>
                  <br>
                  <div class="testimonials"><em>"</em>We are pleased to serve you. All contributions please send to our email or hotline.<em>"</em></div>
                  <!-- /.container-fluid --> 
                </div>
                <!-- /.item -->
                   <% }%>
                
              </div>
              <!-- /.owl-carousel --> 
            </div>
            
            <!-- ============================================== Testimonials: END ============================================== -->
            
            
          </div>
          <!-- /.sidebar-filter --> 
        </div>
        <!-- /.sidebar-module-container --> 
      </div>
      <!-- /.sidebar -->
      <div class='col-md-9'> 
        
        
     
        <div class="clearfix filters-container m-t-10">
          <div class="row">
            <div class="col col-sm-6 col-md-2">
              <div class="filter-tabs">
                <ul id="filter-tabs" class="nav nav-tabs nav-tab-box nav-tab-fa-icon">
                  <li class="active"> <a data-toggle="tab" href="#grid-container"><i class="icon fa fa-th-large"></i>Grid</a> </li>
                  <li><a data-toggle="tab" href="#list-container"><i class="icon fa fa-th-list"></i>List</a></li>
                </ul>
              </div>
              <!-- /.filter-tabs --> 
            </div>
            <!-- /.col -->
            <div class="col col-sm-12 col-md-6">
              <div class="col col-sm-3 col-md-6 no-padding">
                <div class="lbl-cnt"> <span class="lbl">Sort by</span>
                  <div class="fld inline">
                    <div class="dropdown dropdown-small dropdown-med dropdown-white inline">
                        <button data-toggle="dropdown" type="button" class="btn dropdown-toggle"> Position <span class="caret"></span> </button>
                      <ul role="menu" class="dropdown-menu">
                        <li role="presentation"><a href="SortController?sortby=NameAsc&category=<%=category%>">Product Name:A to Z</a></li>
                        <li role="presentation"><a href="SortController?sortby=NameDesc&category=<%=category%>">Product Name:Z to A</a></li>
                        <li role="presentation"><a href="SortController?sortby=PriceAsc&category=<%=category%>">Price:Lowest first</a></li>
                        <li role="presentation"><a href="SortController?sortby=PriceDes&category=<%=category%>">Price:Highest first</a></li>
                        
                      </ul>
                        
                    </div>
                  </div>
                  <!-- /.fld --> 
                </div>
                <!-- /.lbl-cnt --> 
              </div>
              <!-- /.col -->
              
              <!-- /.col --> 
            </div>
            <!-- /.col -->
            
            <!-- /.col --> 
          </div>
          <!-- /.row --> 
        </div>
        <div class="search-result-container ">
          <div id="myTabContent" class="tab-content category-list">
            <div class="tab-pane active " id="grid-container">
              <div class="category-product">
                <div class="row">
				<% 
                                ArrayList<Sale> sales = (ArrayList<Sale>) getServletContext().getAttribute("sales");

                                                
                                                for (Product p : productsWithCategory) {
                                                    int sale_percentage = 0;
                                                    boolean hasSale = false;
                                                    for (Sale s : sales) {
                                                        if (p.getId().equals(s.getProduct())) {
                                                            sale_percentage = s.getPercentage();
                                                            hasSale = true;
                                                        }
                                                    }
                                                
                                
                                %>
                  <div class="col-sm-6 col-md-4 wow fadeInUp">
                    <div class="products">
                      <div class="product">
                        <div class="product-image">
                          <div class="image"> <a href="DetailController?id=<%=p.getId()%>"><img src="<%=p.getImagie()%>" height="190" width="200" alt=""></a> </div>
                          <!-- /.image -->
                          
                          <div class="tag new"><span>new</span></div>
                        </div>
                        <!-- /.product-image -->
                        
                        <div class="product-info text-left">
                          <h3 class="name"><a href="DetailController?id=<%=p.getId()%>"><%=p.getName() %></a></h3>
                          <div class="description">Unit: <a style="color:red"><%= p.getUnit()%></a></div>
                          
                          <div class="product-price"> <span class="price"><%= currencyFormatter.format(p.getPrice() / 100 * (100-sale_percentage))%> </span>
                              <% if (hasSale == true) {%>
                              <span class="price-before-discount"><%= currencyFormatter.format(p.getPrice())%></span>
                              <% }%>
                          </div>
                          <!-- /.product-price --> 
                          <div class="card" >
															
                             <p><button style="border: none; outline: 0; padding: 12px; color: white; background-color: #108bea; text-align: center; cursor: pointer; width: 100%; font-size: 18px;">Add to Cart</button></p>
                           </div>
                        </div>
                        <!-- /.product-info -->
                        
                        <!-- /.cart --> 
                      </div>
                      <!-- /.product --> 
                      
                    </div>
                    <!-- /.products --> 
                  </div>
                  <!-- /.item -->
                  <% } %>

                </div>
                <!-- /.row --> 
              </div>
              <!-- /.category-product --> 
              
            </div>
            <!-- /.tab-pane -->
            
            <div class="tab-pane " id="list-container">
              <div class="category-product">
			  <% for (Product p : productsWithCategory) {
                                                    int sale_percentage = 0;
                                                    boolean hasSale = false;
                                                    for (Sale s : sales) {
                                                        if (p.getId().equals(s.getProduct())) {
                                                            sale_percentage = s.getPercentage();
                                                            hasSale = true;
                                                        }
                                                    }
                                                
                                
                                %>
                <div class="category-product-inner wow fadeInUp">
                  <div class="products">
                    <div class="product-list product">
                      <div class="row product-list-row">
                        <div class="col col-sm-4 col-lg-4">
                          <div class="product-image">
                              <div class="image"> <a href="DetailController?id=<%=p.getId()%>"><img src="<%=p.getImagie()%>" height="190" width="200" alt=""></a> </div>
                          </div>
                          <!-- /.product-image --> 
                        </div>
                        <!-- /.col -->
                        <div class="col col-sm-8 col-lg-8">
                          <div class="product-info">
                            <h3 class="name"><a href="DetailController?id=<%=p.getId()%>"><%=p.getName() %></a></h3>
                            <div class="description">Unit: <a style="color:red"><%= p.getUnit()%></a></div>
                            <div class="product-price"> <span class="price"><%= currencyFormatter.format(p.getPrice() / 100 * (100-sale_percentage))%> </span>
                              <% if (hasSale == true) {%>
                              <span class="price-before-discount"><%= currencyFormatter.format(p.getPrice())%></span>
                              <% }%>
                          </div>
                            <!-- /.product-price -->
                            <div class="description m-t-10"><%= p.getDescription() %></div>
                            <div class="cart clearfix animate-effect">
                              <div class="action">
                                <ul class="list-unstyled">
                                  <li class="add-cart-button btn-group">
                                    <button class="btn btn-primary icon" data-toggle="dropdown" type="button"> <i class="fa fa-shopping-cart"></i> </button>
                                    <button class="btn btn-primary cart-btn" type="button">Add to cart</button>
                                  </li>
                                  
                                </ul>
                              </div>
                              <!-- /.action --> 
                            </div>
                            <!-- /.cart --> 
                            
                          </div>
                          <!-- /.product-info --> 
                        </div>
                        <!-- /.col --> 
                      </div>
                      <!-- /.product-list-row -->
                      <div class="tag new"><span>new</span></div>
                    </div>
                    <!-- /.product-list --> 
                  </div>
                  <!-- /.products --> 
                </div>
                <!-- /.category-product-inner -->
			  <% } %>
                

                

              </div>
              <!-- /.category-product --> 
            </div>
            <!-- /.tab-pane #list-container --> 
          </div>
          <!-- /.tab-content -->
          
          <!-- /.filters-container --> 
          
        </div>
        <!-- /.search-result-container --> 
        
      </div>
      <!-- /.col --> 
    </div>
    <!-- /.row --> 
    <!-- ============================================== BRANDS CAROUSEL ============================================== -->
    <div id="brands-carousel" class="logo-slider wow fadeInUp">
      <div class="logo-slider-inner">
        <div id="brand-slider" class="owl-carousel brand-slider custom-carousel owl-theme">
          <div class="item m-t-15"> <a href="#" class="image"> <img data-echo="assets/images/brands/brand1.png" src="assets\images\blank.gif" alt=""> </a> </div>
          <!--/.item-->
          
          <div class="item m-t-10"> <a href="#" class="image"> <img data-echo="assets/images/brands/brand2.png" src="assets\images\blank.gif" alt=""> </a> </div>
          <!--/.item-->
          
          <div class="item"> <a href="#" class="image"> <img data-echo="assets/images/brands/brand3.png" src="assets\images\blank.gif" alt=""> </a> </div>
          <!--/.item-->
          
          <div class="item"> <a href="#" class="image"> <img data-echo="assets/images/brands/brand4.png" src="assets\images\blank.gif" alt=""> </a> </div>
          <!--/.item-->
          
          <div class="item"> <a href="#" class="image"> <img data-echo="assets/images/brands/brand5.png" src="assets\images\blank.gif" alt=""> </a> </div>
          <!--/.item-->
          
          <div class="item"> <a href="#" class="image"> <img data-echo="assets/images/brands/brand6.png" src="assets\images\blank.gif" alt=""> </a> </div>
          <!--/.item-->
          
          <div class="item"> <a href="#" class="image"> <img data-echo="assets/images/brands/brand2.png" src="assets\images\blank.gif" alt=""> </a> </div>
          <!--/.item-->
          
          <div class="item"> <a href="#" class="image"> <img data-echo="assets/images/brands/brand4.png" src="assets\images\blank.gif" alt=""> </a> </div>
          <!--/.item-->
          
          <div class="item"> <a href="#" class="image"> <img data-echo="assets/images/brands/brand1.png" src="assets\images\blank.gif" alt=""> </a> </div>
          <!--/.item-->
          
          <div class="item"> <a href="#" class="image"> <img data-echo="assets/images/brands/brand5.png" src="assets\images\blank.gif" alt=""> </a> </div>
          <!--/.item--> 
        </div>
        <!-- /.owl-carousel #logo-slider --> 
      </div>
      <!-- /.logo-slider-inner --> 
      
    </div>
    <!-- /.logo-slider --> 
    <!-- ============================================== BRANDS CAROUSEL : END ============================================== --> </div>
  <!-- /.container --> 
  
</div>
<!-- /.body-content --> 
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
<script src="assets\js\bootstrap-select.min.js"></script> 
<script src="assets\js\wow.min.js"></script> 
<script src="assets\js\scripts.js"></script>
</body>
</html>