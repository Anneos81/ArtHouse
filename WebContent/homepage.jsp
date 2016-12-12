<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.arthouse.dao.ProductDAO"%>
<%@ page import="com.arthouse.domain.*"%>
<%@ page import="java.util.*"%>

<% String type = (String) session.getAttribute("userid"); %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Art-House Homepage</title>
<!-- My css -->
<link href="css/css.css" rel="stylesheet" !important>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet" !important>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet" !important>

<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet" !important>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
	

	<!-- jQuery -->
	<script type="text/javascript" src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>

<body id="myPage" style="background-image: url('images/ennia.jpg')">

	<%@include file="navbar.jsp" %>

<div>
	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<!-- γραμμή menu και slide -->

            <div class="col-md-3">
            	<p align="center"><a href="homepage.jsp"><img src="images/ourlogo.png" alt="logo icon" width="100"></a></p><br>
           
			<%@include file="menu.jsp" %>

            </div>

			<div class="col-md-9">
				<!-- βάζω την στήλη όπου θα μπει το slide -->

				<div class="row carousel-holder">

                   <div class="col-md-12">
                      <% if((categoryParam==null)&&(searchByParam==null)&&(orderByParam==null)) { %>
                      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                          <ol class="carousel-indicators">
                              <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                              <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                              <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                          </ol>
                          <div class="carousel-inner">
                              <div class="item active">
                                 <a href="theproduct.jsp?id=36&avg=3">
                                  	<img class="slide-image" src="images/art7.jpg" alt="slide photo2" style="width: 850px !important; height: 450px !important;">
                                  	<div class="carousel-caption">
                                    	  <h3>Rainy Park</h3>
                                 	 </div>
                                 </a>                               
                              </div>
                              <div class="item">
                                  <a href="theproduct.jsp?id=35&avg=3">
                                     <img class="slide-image" src="images/slide3.jpg" alt="slide photo2" style="width: 850px !important; height: 450px !important;">
                                     <div class="carousel-caption">
                                     	<h3>Paris Tower</h3>
                                      </div>
                                  </a>
                              </div>
                              <div class="item">
                                  <a href="theproduct.jsp?id=34&avg=3">
                                     <img class="slide-image" src="images/aa.jpg" alt="slide photo2" style="width: 850px !important; height: 450px !important;">
                                     <div class="carousel-caption">
                                     	 <h3>Art in Santorini</h3>
                                     </div>
                                  </a>                      
                             </div>
                          </div>
                          <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                              <span class="glyphicon glyphicon-chevron-left"></span>
                          </a>
                          <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                              <span class="glyphicon glyphicon-chevron-right"></span>
                          </a>
                      </div>
                  </div>
                <%} %>
                </div>

				<div class="row">
					<!-- γραμμή προιόντων -->

                    

                    <%

                    if (categoryParam != null) {//αντίστοιχα για να χω κατηγορία

                        %>

                    <h3 align="center">Category:  <strong><%=categoryParam%></strong></h3><hr>

                    

                    <%

                    }//end if(categoryparam)

                    

                    if (orderByParam != null) {

                            if (orderByParam.equals("price")) {%>

                                <h3 align="center"><strong>Order By Price</strong></h3><hr>

                            <%}// end if(order)              
                            
                            
                            if (orderByParam.equals("score")) {%>

                            <h3 align="center"><strong>Order By Rate</strong></h3><hr>

                        <%}// end if(orderscore)                    
                        	}//end

                    

                    if (searchByParam != null) {//αντίστοιχα για να χω κατηγορία

                        %>

                    <h3 align="center"><strong>Search Results</strong></h3><hr>

                    

                    

                    <%if (pList.size()==0){

                    %>

                <div class="alert  text-center" role="alert"><p><h3><strong>No products found</strong></h3></p></div>

                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br>

                <%

                    } %>

                    
                    <%
                    }
                    if (pList.size()>0){
                        for (Product p : pList) {
                            ProductDAO pdao = new ProductDAO();
                            pdao.open();
                            double avg = pdao.getAvgScore(p.getProduct_id());
                            pdao.close();
                    %>

                    <div>

                        <div class="col-sm-4 col-lg-4 col-md-4">

                            <div class="thumbnail" style="width: 250px !important; height: 355px !important;">

                            <a href="theproduct.jsp?id=<%=p.getProduct_id()%>&avg=<%=avg%>">

                                

                                    

                                    <img src=<%=request.getContextPath() + "/images/" + p.getPicture()%> 
                                    alt="<%=p.getTitle()%>"

                                        style="width: 320px !important; height: 185px !important;" />

                                        

                                    <div class="caption">

                                        <h4 class="pull-right"><%=p.getPrice()%>€</h4>

                                        <h4><%=p.getTitle()%></h4>

                                        </a>

                                        <p style="text-align: center;"><%=p.getDescription()%></p>

                                        <p>Dimensions: <%= p.getDimensions() %></p>

                                    </div>

                                    <div class="ratings">

                                        <p class="pull-right">Avg rate: <%= avg %>/5</p>

                                        <p>

                                        <% int g = (int) avg ;

                                           int j= 0;

                                            while(j<g){ %>

                                            <span class="glyphicon glyphicon-star"></span>

                                        <%     j++;

                                            }%>                        

                                        </p>

                                    </div>  

                                <%  %>

                            

                        </div>

                    </div>

                </div>

                        <%}%>
				</div><!-- end row of products  -->
			<% if(maxProducts > ProductDAO.PRODUCTS_PER_PAGE) {%>
             <nav aria-label="Page navigation" align="center">
			  <ul class="pagination">
			  	<% if(pageNum > 1) {%>
			    <li>
			      <a href="<%=util.appendUri(request, "page=" + (pageNum - 1))%>" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
                <%}%>                        	
			  	<% for(int i = 0; i <= Math.ceil(maxProducts / ProductDAO.PRODUCTS_PER_PAGE); i++) {%>
			    <li class="<%=(pageNum == (i + 1) ? "active" : "")%>"><a href="<%=util.appendUri(request, "page=" + (i + 1))%>"><%=i + 1%> </a></li>						    
                 <%}%> 
			  	<% if(pageNum <= (maxProducts / ProductDAO.PRODUCTS_PER_PAGE)) {%>
			    <li>
			      <a href="<%=util.appendUri(request, "page=" + (pageNum + 1))%>" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
                <%}%>  
			  </ul>
			</nav>
            <%}%> 
           <%}%> 
				</div><!-- end of column "9" -->
			</div><!-- end of row -->
		</div>

</div>



<br><br><br>
<div><!-- vale footer -->
	
	  <!-- Container (Contact Section) -->
    <div id="about" class="container ">
      <h3 class="text-center">About this site</h3>
      <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#menu0">About our Buyers</a></li>
        <li><a data-toggle="tab" href="#menu1">About our Sellers</a></li>
        <li><a data-toggle="tab" href="#menu2">Our Team</a></li>  
        <li><a data-toggle="tab" href="#menu3">Contact</a></li>
      </ul>

      <div class="tab-content">
        <div id="menu0" class="tab-pane fade in active">
  			<h2>Art-House promises that you will find paintings for every taste...</h2>
			<p>Founded in October of 2016 and based in Athens, Greece, Art-House is a trusted community marketplace for people to list, 
			discover, and buy unique paintings around the world — online or from a mobile phone or tablet. Easily and quickly 
			you can buy every painting you want. You can choose among many paintings in our site, there are many categories for every taste, style
			and notion. Remember every painting is authenticated! You just have to choose the one 
			that suits to you more!</p>
        </div>
        <div id="menu1" class="tab-pane fade">
			<h2>We are glad to have talented painters at our site...</h2>
			<p>Art-House is the easiest way for painters to monetize their work
			 and their paintings to an audience of thousands. If you are a painter and you would
			 like to sell your paintings, an easy way to do it is our site. You just have to scan your drawing and upload it here!</p>
        </div>
         <div id="menu2" class="tab-pane fade">
          <br>
          <p>This project was created in November 2016, for the <a href="http://www.afdemp.org/">1st Coding Bootcamp</a>.
          <p><span class="glyphicon glyphicon-user"></span> Ioakeim Olga</p>
          <p><span class="glyphicon glyphicon-user"></span> Neofytou Anna</p>
          <p><span class="glyphicon glyphicon-user"></span> Parris Dimitris</p>
        </div>
        <div id="menu3" class="tab-pane fade">
          <br>
          <p>Art-House is located in Athens, just 20 minutes by bus from Athens' Center and within easy access of the A1 bus.</p>
          <p><span class="glyphicon glyphicon-map-marker"></span>Athinon Avenue, 47, Athens, GRE</p>
          <p><span class="glyphicon glyphicon-phone"></span>Phone: +30 2102914743</p>
          <p><span class="glyphicon glyphicon-envelope"></span>Email: art-house@outlook.com</p>
          
        </div>
         
		</div>
		</div>
		<br><br>
	<script>
						$(document).ready(function(){
						  // Add smooth scrolling to all links in navbar + footer link
						  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
						    // Make sure this.hash has a value before overriding default behavior
						    if (this.hash !== "") {
						      // Prevent default anchor click behavior
						      event.preventDefault();
						
						      // Store hash
						      var hash = this.hash;
						
						      // Using jQuery's animate() method to add smooth page scroll
						      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
						      $('html, body').animate({
						        scrollTop: $(hash).offset().top
						      }, 900, function(){
						
						        // Add hash (#) to URL when done scrolling (default click behavior)
						        window.location.hash = hash;
						      });
						    } // End if
						  });
						
						  $(window).scroll(function() {
						    $(".slideanim").each(function(){
						      var pos = $(this).offset().top;
						
						      var winTop = $(window).scrollTop();
						        if (pos < winTop + 600) {
						          $(this).addClass("slide");
						        }
						    });
						  });
						})
</script>
</div>
<!-- Add Google Maps -->
	<div id="googleMap" style="height: 400px; width: 100%;"></div>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRfjaheQKo_hYuNk-kh02_YfEfAI56tsw&callback=initMap"></script>
	<script>
var myCenter = new google.maps.LatLng(37.990832,23.7033199);<!--Athens-->

function initialize() {
var mapProp = {
  center:myCenter,
  zoom:12,
  scrollwheel:false,
  draggable:false,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker = new google.maps.Marker({
  position:myCenter,
  });

marker.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>

<footer class="container-fluid text-center">
		<a href="#myPage" title="To Top"> 
		<span class="glyphicon glyphicon-chevron-up"></span>
		</a>
	</footer>

</body>

</html>
