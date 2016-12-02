<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.arthouse.dao.*,com.arthouse.domain.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
 <%
 String type = (String)session.getAttribute("userid");
	if(session.getAttribute("user-object") == null) {
	request.setAttribute("msg", "Please login first");
%>
 	<jsp:forward page="loginseller.jsp" /> 	
	
<% }%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Edit Item</title>
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
  String pid = request.getParameter("id");
 int id = Integer.parseInt(pid);
 Seller seller = (Seller) session.getAttribute("user-object");
 int sellerid = seller.getUser_id();
  
  ProductDAO pdao = new ProductDAO();
  pdao.open();
  Product product = pdao.findProductByID(id);
  List<Product> prodlist = pdao.getSellerProducts(sellerid);

  //List<String> catList = prod.getCategories();
  pdao.close();
 %>

<body id="myPage" style="background-image: url('images/ennia.jpg')">


<%@include file="navbar.jsp" %>

		<div class="container">
     			<div class="row">
          		 	 <div class="col-md-3">
          		 	 	
          		 	 	   <p align="center"><a href="homepage.jsp"><img src="images/ourlogo.png" alt="logo icon" width="100"></a></p><br>
               			
               			 <div class="list-group">
	             		   <a href="profileseller.jsp" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Seller: <%=seller.getUsername()%></a>
	             		   <a href="profileseller.jsp" class="list-group-item">My Products<span class="badge"><%=prodlist.size()%></span></a>
	            	       <a href="uploadnewitem.jsp" class="list-group-item">Upload new Item</a>
             		     </div>
             		      <%@include file="menu.jsp" %>
             		</div><!-- end of col-3 -->
          		 	 	
          		 	<div class="col-md-9">
            			 <div class="row">
            				
          		 	 		<div class="col-sm-8 col-lg-8 col-md-8" align="center">
          		 	 				<h3>Update Item</h3><hr>
          		 	 			
								<form class="form-horizontal" method="post" action="update">
          		 	 				<label class="col-sm-4 control-label"></label>
          		 	 				 <div class="col-sm-8">
          		 	 					 <p><img src="<%=product.getPicture() %>"  alt="something's wrong" style="width: 350px; height: 200px;" name="thisorderid"></p>
          							</div>
          		 	 				
	          		 	 				<div class="form-group">
								            <label class="col-sm-4 control-label">Picture</label>
								           <div class="col-sm-8">
								            <div class="row">
								            	<div class="col-sm-6">
								            	    <input type="text" class="form-control" name="ppicture" value="<%=product.getPicture() %>" placeholder="url https://">
								     
								            	</div>
								            		<div class="col-sm-6">
								            			<button><a target="blank" href="https://goo.gl/">Shorten photo's link..</a></button>
								            		</div>
								            </div>
								               
								            </div>
								        </div>
          		 	 					<div class="form-group">
								            <label class="col-sm-4 control-label">Title</label>
								            <div class="col-sm-8">
          		 	 							<input type="text" class="form-control" name="ptitle" value="<%=product.getTitle() %>" placeholder="title your masterpiece..."autofocus>
								            </div>
								        </div>
          		 	 					<div class="form-group">
								            <label class="col-sm-4 control-label">Price</label>
								            <div class="col-sm-8">
          		 	 							<input type="text" class="form-control" name="pprice" value="<%=product.getPrice() %>" placeholder="price of your painting..">
								            </div>
								        </div>
          		 	 					<div class="form-group">
								            <label class="col-sm-4 control-label">Category</label>
								            <div class="col-sm-8">
          		 	 							<input type="text" class="form-control" name="pcategory" value="<%=product.getCategory() %>" placeholder="choose category.." >
								            </div>
								        </div>
          		 	 					<div class="form-group">
								            <label class="col-sm-4 control-label">Dimensions</label>
								            <div class="col-sm-8">
          		 	 							<input type="text" class="form-control" name="pdimensions" value="<%=product.getDimensions() %>" placeholder="Dimensions height x width...">
								            </div>
								        </div>
          		 	 					<div class="form-group">
								            <label class="col-sm-4 control-label">Description</label>
								            <div class="col-sm-8">
          		 	 							<input type="text" class="form-control" name="pdescription" value="<%=product.getDescription() %>" placeholder="Give your description...">
								            </div>
								        </div>
          		 	 					 <input type="hidden" name="pid" value="<%=id%>">	
          		 	 					 <label class="col-sm-4 control-label"></label>
								            <div class="col-sm-8">
          		 	 				    <p align="center"><button type="submit" class="btn btn-default">  Save Changes  </button></p>
          		 	 				    </div>
          		 	 			    </form>
          		 	 			
          			 		 </div><!-- end of col-5 -->
            				<div class="col-sm-2 col-lg-2 col-md-2">
            				</div>
          			 		
          				</div><!-- end of row -->
          			</div><!-- end of col-9 -->
		</div><!-- end of container -->



</div>



 <%@include file="footer.jsp" %>

    
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
