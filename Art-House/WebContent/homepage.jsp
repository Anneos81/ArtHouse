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
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRfjaheQKo_hYuNk-kh02_YfEfAI56tsw&callback=initMap"></script>

	<!-- jQuery -->
	<script type="text/javascript" src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>

<body id="myPage" style="background-image: url('images/ennia.jpg')">

	<%@include file="navbar.jsp" %>


	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<!-- γραμμή menu και slide -->

            <div class="col-md-3">
            <p align="center"><img src="images/ourlogo.png" alt="logo icon" width="100"></p><br>
            
<%@include file="menu.jsp" %>

            </div>

			<div class="col-md-9">
				<!-- βάζω την στήλη όπου θα μπει το slide -->

				<div class="row carousel-holder">

                   <div class="col-md-12">
                       <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                           <ol class="carousel-indicators">
                               <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                               <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                               <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                           </ol>
                           <div class="carousel-inner">
                               <div class="item active">
                                   <img class="slide-image" src="images/art7.jpg" alt="slide photo1" style="width: 850px !important; height: 450px !important;">
                               </div>
                               <div class="item">
                                   <img class="slide-image" src="images/slide3.jpg" alt="slide photo2" style="width: 850px !important; height: 450px !important;">
                               </div>
                               <div class="item">
                                   <img class="slide-image" src="images/aa.jpg" alt="slide photo3" style="width: 850px !important; height: 450px !important;">
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

               </div>
					

		

				<div class="row">
					<!-- γραμμή προιόντων -->
					<%if (pList.size()==0){
					%>
				<div class="alert alert-danger text-center" role="alert"><p>No products found.</p></div>
					
				<%
					} %>
					
					
					
					
					<%
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
								
									
									<img src="<%=p.getPicture()%>" alt="<%=p.getTitle()%>"
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
										<%	 j++;
											}%>						
										</p>
									</div>  
								<%  %>
							
						</div>
					</div>
				</div>
						<%
							}
						%>
					

				</div>
	</div>
	</div>
	</div>

	<!-- /.container -->
	<br>
	<br>
	<!-- Container (About Section) -->
	<div id="about" class="container ">
		<h3 class="text-center">About this site</h3>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">About
					our Buyers</a></li>
			<li><a data-toggle="tab" href="#menu1">About our Sellers</a></li>
			<li><a data-toggle="tab" href="#menu2">Our Team</a></li>
			<li><a data-toggle="tab" href="#menu3">Contact</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
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
			         <p>This project was created in November 2016, for the 1st Coding Bootcamp.
			         <p><span class="glyphicon glyphicon-user"></span> Ioakeim Olga</p>
			         <p><span class="glyphicon glyphicon-user"></span> Neofytou Anna</p>
			         <p><span class="glyphicon glyphicon-user"></span> Parris Dimitris</p>
    	    </div>
			<div id="menu3" class="tab-pane fade">
				<br>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span>Athens, GRE
				</p>
				<p>
					<span class="glyphicon glyphicon-phone"></span>Phone: +30
					2102914743
				</p>
				<p>
					<span class="glyphicon glyphicon-envelope"></span>Email:
					art-house@outlook.com
				</p>
			</div>
		</div>
	</div>

<br><br><br>
	

	<!-- Add Google Maps -->
	<div id="googleMap" style="height: 400px; width: 100%;"></div>
	<script type="text/javascript">

		var myCenter = new google.maps.LatLng(37.990832, 23.7033199);
		<!--Athens-->

		function initialize() {
			var mapProp = {
				center : myCenter,
				zoom : 12,
				scrollwheel : false,
				draggable : false,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};

			var map = new google.maps.Map(document.getElementById("googleMap"),
					mapProp);

			var marker = new google.maps.Marker({
				position : myCenter,
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
