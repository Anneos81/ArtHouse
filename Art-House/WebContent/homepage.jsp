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
                                 <a href="theproduct.jsp?id=31&avg=3">
                                  	<img class="slide-image" src="images/art7.jpg" alt="slide photo2" style="width: 850px !important; height: 450px !important;">
                                  	<div class="carousel-caption">
                                    	  <h3>Rainy Park</h3>
                                 	 </div>
                                 </a>                               
                              </div>
                              <div class="item">
                                  <a href="theproduct.jsp?id=32&avg=3">
                                     <img class="slide-image" src="images/slide3.jpg" alt="slide photo2" style="width: 850px !important; height: 450px !important;">
                                     <div class="carousel-caption">
                                     	<h3>Paris Tower</h3>
                                      </div>
                                  </a>
                              </div>
                              <div class="item">
                                  <a href="theproduct.jsp?id=33&avg=3">
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

                    <div class="row">

                    

                    <%if (pList.size()==0){

                    %>

                <div class="alert  text-center" role="alert"><p><h3><strong>No products found</strong></h3></p></div>

                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br>

                <%

                    } %>

                    
                    <%
                    }
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

                                        <%     j++;

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

</div>

<br><br><br>
<div>
	<%@include file="footer.jsp" %>
</div>
</body>

</html>
