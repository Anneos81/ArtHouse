<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.arthouse.domain.*"%>
<%@ page import="java.util.*"%>
	

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" style="background-color:#2d2d30;">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="homepage.jsp"><strong>ART-HOUSE</strong></a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
          <ul class="nav navbar-nav navbar-right">
          
   <% 
   Basket basket = (Basket)session.getAttribute("cart-object");
   System.out.println("type is " + type);
  
   if (type== null){
	%>       
            <li><a href="loginbuyer.jsp">LOGIN AS BUYER</a></li>
            <li><a href="loginseller.jsp">LOGIN AS SELLER</a></li>
            <li><a href="#about">ABOUT</a></li>
            <li><a href="cart.jsp">MY CART <strong><span class="glyphicon glyphicon-shopping-cart"></span></strong></a></li>
           
            
            <%}else if (type == "buyer"){ 
            User user = (Buyer)session.getAttribute("user-object");%>
            <li><a href="buyer_ratedprod.jsp"><%=user.getUsername()  %></a></li> 
            <li><a href="logout.jsp">LOGOUT</a></li>  
            <li><a href="#about">ABOUT</a></li>
            	<% if(basket!= null){ %>
            <li><a href="cart.jsp">MY CART <strong><span class="glyphicon glyphicon-shopping-cart"><%= basket.size() %></span></strong></a></li>
           <%} %>
            
            <%} else if (type == "seller"){
            	User user = (Seller)session.getAttribute("user-object");
            %>
            <li><a href="profileseller.jsp"><%=user.getUsername() %></a></li> 
            <li><a href="logout.jsp">LOGOUT</a></li> 
             <li><a href="#about">ABOUT</a></li>
            <li><a href="cart.jsp">MY CART <strong><span class="glyphicon glyphicon-shopping-cart"></span></strong></a></li>
            <%} %>

          </ul>
        </div>
      </div>
    </nav>