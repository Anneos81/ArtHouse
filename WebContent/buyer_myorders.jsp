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
if(session.getAttribute("userid")== "seller"){
	request.setAttribute("msg", "You have to logout and login as buyer to enter the page");
%>
	<jsp:forward page="errorpage.jsp" />
	    
<% }
Buyer buyer1 = (Buyer)session.getAttribute("user-object");
//Basket basket = (Basket)session.getAttribute("cart-object");

%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>My Orders</title>
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
            
            <% if(session.getAttribute("message") != null) { %>		
				<div class="alert alert-success text-center" role="alert"><%=session.getAttribute("message").toString() %></div>
			<% //}
           // if(session.getAttribute("message")!=null){
            	basket.clear();
            	session.setAttribute("message", null); 
            }%>
            
            	<div class="row">
            	<h3 align="center">My Orders</h3><hr>

					<%
						OrderDAO o = new OrderDAO();
						o.open();
						List<Order> lista =o.printOrdersByBuyer(buyer1.getUser_id());
						o.close();
						if (lista.size()==0) {
					%>
					<div>
						<div class="alert alert-success text-center" role="alert"><p>You haven't done any orders yet.</p></div>
					</div>

					<%
						} else {
							for (int i=0; i<lista.size();i++){
								
					%>
					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
						<%	int order = lista.get(i).getOrder_id();
							OrderDAO ord = new OrderDAO();
							ord.open();
							List<Product> listaprod = ord.printOrderProducts(order);
							ord.close();
							
							if (listaprod.size()!=0){
							%>
							<img src=<%=request.getContextPath() + "/images/" + listaprod.get(i).getPicture()%>"
							 alt="" style="width: 320px; height: 200px;" name="thisorderid">
							<center>
							<% } 
							
							%>
							<div class="caption">
								<!-- <h4 class="pull-right">$24.99</h4> -->
								<h4>
									<a href="orderproducts.jsp?thisorderid=<%=lista.get(i).getOrder_id() %>">Order id: <%=lista.get(i).getOrder_id() %></a>
								</h4>
								<p>Order Date: <%=lista.get(i).getDate() %></p>
								<%if (lista.get(i).getQuantity()==1) {%>
									<p>Quantity: <%=lista.get(i).getQuantity() %> product</p>
								<%}else{ %>
									<p>Quantity: <%=lista.get(i).getQuantity() %> products</p>
								<%} %>
								<p>Amount: <%=lista.get(i).getAmount() %> &euro;</p>
							</div>
							<p>
								<form method="POST" action="orderproducts.jsp">
									<button type="submit" class="btn btn-default"
										aria-label="Left Align" name="thisorderid" value="<%=lista.get(i).getOrder_id() %>">See products</button>
								</form>
							</p>
							</center>
						</div>
					</div>
					<%
							}
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
    