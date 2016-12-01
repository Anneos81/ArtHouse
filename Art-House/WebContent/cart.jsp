<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.arthouse.dao.*,com.arthouse.domain.*,java.util.*,java.sql.*"%>
	
<% 
String type = (String)session.getAttribute("userid");
if (type!= "buyer" || type==null){
	request.setAttribute("msg", "You have to login as buyer to enter the page");
	%>
	<jsp:forward page="errorpage.jsp"/>

<%}
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

    <title>My cart</title>
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
                <p align="center"><img src="images/ourlogo.png" alt="logo icon" width="100"></p><br>
                <div class="list-group">
	                <a href="buyer_ratedprod.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Buyer: <%=buyer1.getUsername() %></a>
	                <a href="buyer_ratedprod.jsp" class="list-group-item">My Rated Products</a>
	                <a href="buyer_myorders.jsp" class="list-group-item">My Orders</a>
                </div>
                <%@include file="menu.jsp" %>
            </div>
           <div class="col-md-9">
           
	           <form method="POST" action="createOrder">
	            <h3 align="center">My Cart</h3><hr>
	<% 			
				SellerDAO sdao = new SellerDAO();
				sdao.open();
				
				
				double total_amount =0.0;
				for (int i=0;i<basket.size();i++){	
					Seller s = sdao.getSellerByID(basket.get(i).getUser_id());
					System.out.println("ola ok 2 " + basket.size() + " " + i);
	%>	  
	
					 <div class="thumbnail">
						 <div class="row">
				            <div class="col-md-5 col-sm-6">
				                <img class="img-responsive" src="<%= basket.get(i).getPicture() %>" alt="" style="width: 320px; height: 210px;">
				            </div>
				
				            <div class="col-md-7 col-sm-6">
				            	<div class="row">
				            	  <div class="col-md-5 col-xs-12">	
						                <h3><%= basket.get(i).getTitle() %></h3>
						                <p><%= basket.get(i).getDescription() %></p>
						                <h4>Product Details</h4>
						                <ul>
						                	<li>Category: <%= basket.get(i).getCategory() %></li>
						                    <li>Dimensions: <%= basket.get(i).getDimensions() %></li> 
						                    <li>Price: <%=basket.get(i).getPrice() %>&euro;</li>
						
						                </ul>				            
					                </div>
					                	
						            <div class="col-md-7 col-xs-12">
							         
						                <div class="row">
				            	 			 <div class="col-md-5 col-xs-12" >	
				            	 			 	<img src="<%= s.getPhoto_seller() %>" alt="..." class="img-circle" style="width: 80px; height: 80px;">
						                	</div>
						                	<div class="col-md-7 col-xs-12">
						                		<p><u>Artist</u></p>
							                	<p>Name: <%= s.getName() %></p>
							                	<p>Surname: <%= s.getSurname() %></p>
					                		</div>
				                		</div>
							            
						             </div>

				                </div> <!-- row -->
				             
				            </div> 
				         </div>
				         </div>
				          <% total_amount = total_amount + basket.get(i).getPrice();
							             } //for %>   
		            <div>
		 <% 			
				session.setAttribute("amount", total_amount);
					if (basket.size()==0){
						%>
						<div class="alert alert-danger text-center" role="alert">
							<p>Your cart is empty</p>
						</div>
						<% }else{ %>
						<p><strong> Delivery</strong></p>
						<div class="radio">
						  <label>
						    <input type="radio" name="delivery" id="optionsRadios1" value="" checked>
						    Delivery at your place
						  </label>
						</div>
						<div class="radio">
						  <label>
						    <input type="radio" name="delivery" id="optionsRadios2" value="">
						    Pick it from the shop
						  </label>
					    </div>
					    
					    <p><strong> Payment</strong> </p>
					    <div class="radio">
						  <label>
						    <input type="radio" name="payment" id="optionsRadios1" value="" checked>
						    Cash
						  </label>
						</div>
						<div class="radio">
						  <label>
						    <input type="radio" name="payment" id="optionsRadios2" value="">
						    Credit card
						  </label>
					    </div>
					        <hr>
					  <div class="col-md-7">
					 </div>
					    <div class="col-md-5">
							<h3><strong>Total Order Amount: <%= total_amount %>&euro;</strong></h3>
						
							<div class="col-md-6 ">
								<button type="submit" class="btn btn-default" aria-label="Left Align" name="cart" value=""> Submit Order</button>
			                </div><!-- 2-3 -->
		       		   	</div>	
		       
		        <%}
				sdao.close(); %>
				</div><!-- 1 -->
				</form>
				<br>
				</div><!-- col 9 -->
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-9">
					<%if(basket.size()!=0) {%>
					<form method="POST" action="removefromCart">
					
						<button type="submit" class="btn btn-default" aria-label="Left Align" name="cart" value="">
						 Empty your Cart   
						</button>
					</form>
					<form action="homepage.jsp">
						<button type="submit" class="btn btn-default" aria-label="Left Align">Sinexeia agorwn</button>
				    </form>  
					<%} %>
					</div> <!-- /.col 9 -->
				</div>
					
			
				 </div>
				
				
				
		   </div><!-- /.row -->
<br> <br><br><br><br>
	
	 <%@include file="footer.jsp" %>
	
	
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
    