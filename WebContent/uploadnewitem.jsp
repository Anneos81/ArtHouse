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
	
<% }%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Upload Item</title>
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

<% Seller seller = (Seller) session.getAttribute("user-object");
int sellerid = seller.getUser_id();

ProductDAO pdao = new ProductDAO();
pdao.open();
List<Product> prodlist = pdao.getSellerProducts(sellerid);


   List<String> catList = new ArrayList<>();
   catList.add("Land"); catList.add("Photography");catList.add("Figure");catList.add("Abstract");
   catList.add("Portrait");catList.add("Modern");catList.add("Emotion");catList.add("Decorative");//pdao.getAllCategories();
  //String pid = request.getParameter("id");
  //int id = Integer.parseInt(pid);
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
          		 	 				<h3>Upload New Item</h3><hr>
          		 	 			
 								<form class="form-horizontal" method="post" enctype="multipart/form-data" action="upload"> 
          		 	 					
								        <div class="form-group">
								            <label class="col-sm-4 control-label">Picture</label>
								            <div class="col-sm-8">
								            	 <input type="text" class="form-control" placeholder="enter photo name" name="name" required>
												 <input type="file" name="image" class="form-control">
								            </div>
								        </div>
								        
          		 	 					<div class="form-group">
								            <label class="col-sm-4 control-label">Title</label>
								            <div class="col-sm-8">
          		 	 							<input type="text" class="form-control" name="ptitle"  placeholder="title your masterpiece..." autofocus required>
								            </div>
								        </div>
          		 	 					<div class="form-group">
								            <label class="col-sm-4 control-label">Price</label>
								            <div class="col-sm-8">
          		 	 							<input type="number" class="form-control" name="pprice" min="0" max="1000" placeholder="price of your painting.." required>
								            </div>
								        </div>
								        <div class="form-group">
									        <label class="col-sm-4 control-label">Category</label>
								    	    <div class="col-sm-8">
								    	    <select type="text" class="form-control" name="pcategory" data-toggle="dropdown" 
								    	    aria-haspopup="true" aria-expanded="true" placeholder="choose category..." required>
                 						    	 <span class="caret"></span>
						                   		  <%
													for (String c : catList) {//παίρνω λίστα με κάθε υποκατηγορία
													%>
													<option value="<%=c%>"><%=c%></option>
													<% } %>
												 </select>
						                   </div>
						                </div>
          		 	 					<div class="form-group">
								            <label class="col-sm-4 control-label">Dimensions</label>
								            <div class="col-sm-8">
          		 	 							<input type="text" class="form-control" name="pdimensions"  placeholder="Dimensions height x width..." required>
								            </div>
								        </div>
          		 	 					<div class="form-group">
								            <label class="col-sm-4 control-label">Description</label>
								            <div class="col-sm-8">
          		 	 							<input type="text" class="form-control" name="pdescription"  placeholder="Give your description..."required>
								            </div>
								        </div>
          		 	 					 	
          		 	 					 <label class="col-sm-4 control-label"></label>
								            <div class="col-sm-8">
          		 	 				    <p align="center"><button type="submit" class="btn btn-default">  Upload Item  </button></p>
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
