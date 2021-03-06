<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.arthouse.dao.*,com.arthouse.domain.*,java.util.*,java.sql.*"%>

<% String type = (String)session.getAttribute("userid"); %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Register Buyer</title>
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

            <div class="col-md-3">
                <p align="center"><a href="homepage.jsp"><img src="images/ourlogo.png" alt="logo icon" width="100"></a></p><br>
               
  <%@include file="menu.jsp"%>
  
           	</div>	 
            <div class="col-md-9 login">
            	<br> <br> <br>
		        <form class="form-horizontal" method="post" action="registerBuyer">
		        <div class="form-group">
		         <label class="col-sm-2 control-label"></label>
		        
		        <div class="col-sm-6">
		        <h3 align="center"><strong>Register as Buyer</strong></h3><hr>
				<p>Please fill the following fields to register</p>
           		</div> 
		          
		          </div>
		        
		        
		        
		         
		         <div class="form-group">
		         
		         
		         
		            <label class="col-sm-2 control-label">Name</label>
		            <div class="col-sm-6">
		              <input type="text" class="form-control" name="name" placeholder="Name" autofocus required>
		            </div>
		          </div>
		           <div class="form-group">
		            <label class="col-sm-2 control-label">Surname</label>
		            <div class="col-sm-6">
		              <input type="text" class="form-control" name="surname" placeholder="Surname" required>
		            </div>
		          </div>
		          <div class="form-group">
		            <label class="col-sm-2 control-label">Email</label>
		            <div class="col-sm-6">
		              <input type="email" class="form-control" name="email" placeholder="Email" required>
		            </div>
		          </div>
		          <div class="form-group">
		            <label class="col-sm-2 control-label">Username</label>
		            <div class="col-sm-6">
		              <input type="text" class="form-control" name="username" placeholder="Username" required>
		            </div>
		          </div>
		          <div class="form-group">
		            <label class="col-sm-2 control-label">Password</label>
		            <div class="col-sm-6">
		              <input type="password" class="form-control" name="password" placeholder="Password" required>
		            </div>
		          </div>
		         
		        
		          <div class="form-group">
		            <div class="col-sm-offset-2 col-sm-6">
		              <button type="submit" class="btn btn-default">Register</button>
		            </div>
		          </div>
		        </form>
		       </div>
		     </div>
		  </div><!-- /.container -->
		  
		  
		  <br><br><br>
	 <%@include file="footer.jsp" %>

    
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>