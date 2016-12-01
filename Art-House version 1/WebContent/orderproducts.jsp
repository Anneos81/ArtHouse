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
int id = Integer.parseInt(request.getParameter("thisorderid")); 
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Order no <%=id %></title>
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
				<h4>Order no: <%= id %> </h4>
			</div>
		</div>

        <div class="row">

            <div class="col-md-3">
                <p align="center"><img src="images/ourlogo.png" alt="logo icon" width="100"></p><br>
                <div class="list-group">
	                <a href="buyer_ratedprod.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Buyer: <%=buyer1.getUsername() %></a>
	                <a href="buyer_ratedprod.jsp" class="list-group-item">My Rated Products</a>
	                <a href="buyer_myorders.jsp" class="list-group-item">My Orders</a>
                </div>
                <%@include file="menu.jsp" %>
            </div>
            <div class="col-md-9">
            	 <%	    int totalamount=0;
						OrderDAO o = new OrderDAO();
						o.open();
						List<Product> prod = o.printOrderProducts(id);
						o.close();
						 if(prod.size()==0){
					%>	
					
				
					<div>
						<p>That order doesn't exist.</p>
					</div>

					<%
						} else {
							for (int i=0; i< prod.size(); i++){
					%>
				 <div class="thumbnail">
					 <div class="row">
			            <div class="col-md-5 col-sm-6">
			                <img class="img-responsive" src="<%= prod.get(i).getPicture() %>" alt="" style="width: 320px; height: 210px;">
			            </div>
			
			            <div class="col-md-7 col-sm-6">
			            	<div class="row">
			            	  <div class="col-md-5 col-xs-12">	
					                <h3><%= prod.get(i).getTitle() %></h3>
					                <p><%= prod.get(i).getDescription() %></p>
					                <h4>Product Details</h4>
					                <ul>
					                	<li>Category: <%= prod.get(i).getCategory() %></li>
					                    <li>Dimensions: <%= prod.get(i).getDimensions() %></li> 
					                    <li>Price: <%=prod.get(i).getPrice() %>&euro;</li>
					                    <li>Seller_id: <%=prod.get(i).getUser_id() %></li>
					                </ul>
					                <% totalamount=totalamount+prod.get(i).getPrice(); %>
				                </div>
				                	
					            <div class="col-md-7 col-xs-12">
						             <% int seller = prod.get(i).getUser_id();
						             	SellerDAO sel = new SellerDAO();
						                sel.open();
						                Seller sell = sel.printProductSeller(seller);
						                sel.close();
						                if (sell != null){
						                %>   
					                <div class="row">
			            	 			 <div class="col-md-5 col-xs-12">	
			            	 			 	<img src="<%= sell.getPhoto_seller() %>" alt="..." class="img-circle" style="width: 80px; height: 80px;">
					                	</div>
					                	<div class="col-md-7 col-xs-12">
					                		<p><u>Artist</u></p>
						                	<p>Name: <%= sell.getName() %></p>
						                	<p>Surname: <%= sell.getSurname() %></p>
				                		</div>
			                		</div>
						             <%} %>   
					             </div>
					      
			                </div> <!-- row -->
			             
			            </div> 
			         </div>
			         </div>
				
					<%
							}
						}
					%>
					<div class="col-md-5">
					</div>
					<div class="col-md-7">
						<h3 class="right">Total Order Amount: <%= totalamount %>&euro; </h3>
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
    
            
            
            
            
            
            