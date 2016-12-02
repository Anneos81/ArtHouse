<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.arthouse.dao.*,com.arthouse.domain.*,java.util.*,java.sql.*"%>

<%
String type = (String)session.getAttribute("userid");
if(session.getAttribute("user-object") == null) {
	request.setAttribute("msg", "Please login first");
%>
	<jsp:forward page="loginbuyer.jsp" />
	
<% }
if(session.getAttribute("userid")!= "buyer"){
	request.setAttribute("msg", "You have to logout and login as buyer to enter the page");
%>
	<jsp:forward page="errorpage.jsp" />
	    
<% }

Buyer buyer1 = (Buyer)session.getAttribute("user-object");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>My Rated Products</title>
    <!-- My css -->
    <link href="css/css.css" rel="stylesheet">

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/shop-homepage.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="myPage" style="background-image: url('images/ennia.jpg')">

<%@include file="navbar.jsp" %>

     <div class="container">
     	<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-9">
				
			</div>
		</div>

        <div class="row">

            <div class="col-md-3">
            	
                	<p align="center"><a href="homepage.jsp"><img src="images/ourlogo.png" alt="logo icon" width="100"></a></p><br>
              
                <div class="list-group">
	                <a href="buyer_ratedprod.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Buyer: <%=buyer1.getUsername() %></a>
	                <a href="buyer_ratedprod.jsp" class="list-group-item">My Rated Products</a>
	                <a href="buyer_myorders.jsp" class="list-group-item">My Orders</a>
                </div>
                
                <%@include file="menu.jsp" %>
                
            </div>
            <div class="col-md-9">
            	<div class="row">
            	<h3 align="center">My Rated Products</h3><hr>
			
<% 			BuyerDAO s = new BuyerDAO();
			s.open();
			List<Product> rated = s.printRatedProductsByBuyer(buyer1.getUser_id());
			s.close();
			if (rated.size()==0){				
%>	  
				  <div>   
				    <div class="alert alert-success text-center" role="alert"><p>You haven't rated any product yet.</p></div>
				  </div>
		
<% 			}else{
					for(int i=0;i<rated.size();i++){
%>		
					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
							<img src="<%= rated.get(i).getPicture() %>" alt="" style="width: 320px; height: 200px;">
							<div class="caption">
								<h4 class="pull-right"><%=rated.get(i).getPrice() %>&euro;</h4>
								<h4>
									<a href="theproduct.jsp?id=<%=rated.get(i).getProduct_id()%>&avg=0"><%= rated.get(i).getTitle() %></a>
								</h4>
								<p>Description: <%= rated.get(i).getDescription() %></p>
								<p>Dimensions: <%= rated.get(i).getDimensions() %></p>
							</div>
						<div class="ratings">
								<p class="pull-right">My rate: <%= rated.get(i).getRatelist().get(i).getRate() %>/5</p>
								<p>
								<% int g = rated.get(i).getRatelist().get(i).getRate();
								   int j= 0;
									while(j<g){ %>
									<span class="glyphicon glyphicon-star"></span> 
								<%	 j++;
									}%>						
								</p>
							</div> 
						</div>
					</div>
<%					}// end of for
				}
%>
				</div>

			</div>

		</div>

	</div><!-- /.container -->
	
	 <%@include file="footer.jsp" %>

    
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
    
            
            
            
            
            