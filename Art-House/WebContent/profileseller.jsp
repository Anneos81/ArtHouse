<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.arthouse.dao.*,com.arthouse.domain.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
 <% String type = (String)session.getAttribute("userid");
	if(session.getAttribute("user-object") == null) {
	request.setAttribute("msg", "Please login first");
%>
 	<jsp:forward page="loginseller.jsp" /> 	
	
<% }
if(session.getAttribute("userid")!= "seller"){
	request.setAttribute("msg", "You have to logout and login as seller to enter the page");
%>
	<jsp:forward page="errorpage.jsp" />
<% }
%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Seller Profile</title>
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

  <%
  Seller seller = (Seller) session.getAttribute("user-object");
  int sellerid = seller.getUser_id();
  System.out.println("sellerid" + sellerid);
  ProductDAO pdao = new ProductDAO();
  pdao.open();
  List<Product> prodlist = pdao.getSellerProducts(sellerid);
  System.out.println("size" +  prodlist.size());
 
  pdao.close();
 %> 

<body id="myPage" style="background-image: url('images/ennia.jpg')">


<%@include file="navbar.jsp" %>


     <div class="container">
        <div class="row">

            <div class="col-md-3">
            
                <p align="center"><img src="images/ourlogo.png" alt="logo icon" width="100"></p><br>
                <div class="list-group">
	                <a href="profileseller.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Seller: <%=seller.getUsername()%></a>
	                <a href="profileseller.jsp" class="list-group-item">My Products<span class="badge"><%=prodlist.size()%></span></a>
	                <a href="uploadnewitem.jsp" class="list-group-item">Upload new Item</a>
                </div>
            
   <%@include file="menu.jsp" %>
   </div>
   	            <div class="col-md-9">
   	              <% if(session.getAttribute("message") != null) { %>		
				<div class="bg-success text-center" role="alert"><%=request.getAttribute("message").toString() %></div>
				<% } %>
            <div class="row">
            <h3 align="center">My products</h3><hr>
            
            	<% if(prodlist.size()==0){%>
				  <div>   
				    <p>You haven't upload any product yet.</p>
				  </div>
		
<% 			}else
{
					for(int i=0;i<prodlist.size();i++){
%>	
   
				<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
           					<img src="<%= prodlist.get(i).getPicture() %>" alt="" style="width: 320px; height: 200px;">
							<div class="caption">
								<h4 class="pull-right"><%=prodlist.get(i).getPrice() %>&euro;</h4>
								<h4>
									<a href="theproduct.jsp?id=<%=prodlist.get(i).getProduct_id()%>&avg=0"><%= prodlist.get(i).getTitle() %></a>
								</h4>
								<p>Description: <%= prodlist.get(i).getDescription() %></p>
								<p>Dimensions: <%= prodlist.get(i).getDimensions() %></p>
							</div>
												
								</p>
								<p align="center"><a href="edititem.jsp?id=<%=prodlist.get(i).getProduct_id() %>" class="btn btn-default" role="button" style="width:150px;">Edit Item</a></p>
						</div> 
				</div>
				
<%					}// end of for
				}// end of else
%></div> <!-- end of row -->
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
