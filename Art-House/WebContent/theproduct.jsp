<%@page import="com.arthouse.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.arthouse.domain.* ,java.util.*"%>

<% 
//Buyer buyer1 = (Buyer) session.getAttribute("user-object");
String type = (String) session.getAttribute("userid");
if (type == "buyer"){
	
//Basket basket = (Basket) session.getAttribute("cart-object");
//System.out.println("basket size1 " + basket.size());
}
%>
<!DOCTYPE html>
<html lang="en">


<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Art-House Painting</title>
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
    
    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-3">
                	<p align="center"><a href="homepage.jsp"><img src="images/ourlogo.png" alt="logo icon" width="100"></a></p><br>
				  	
  	<%@include file="menu.jsp" %>
            </div>

            <div class="col-md-9"> 
<%

	String pID = request.getParameter("id");
	int id = Integer.parseInt(pID);
	System.out.println("id " + id);
	String av = request.getParameter("avg");// edited by Anna,το αλλαξαμε γιατι καλουμε απευθειας τη μεθοδο
	System.out.println(av);
	double avg1 = Double.parseDouble(av);
    dao = new ProductDAO(); // pio panw kanw include opou orizw ProductDAO dao;
	dao.open();
	Product p = dao.findProductByID(id);
	double average = dao.getAvgScore(id);
	dao.close();
	
	SellerDAO sdao = new SellerDAO();
	sdao.open();
	Seller s = sdao.getSellerByID(p.getUser_id());
	sdao.close();
	
%>

                <div class="row carousel-holder">

                    <div class="col-md-12">
                      <div class="row">
                          <div class="col-lg-12">
                              <h1 class="page-header"><%=p.getTitle()%>
                                  <small>by <%=s.getUsername()%></small>
                              </h1>
                          </div>
                      </div>
                      <!-- /.row -->

                      <!-- Portfolio Item Row -->
                      <div class="row">

                          <div class="col-md-8">
                              <img class="img-responsive" src="<%=p.getPicture()%>" alt="product's icon" style="width: 725px !important;height: 400px !important;">
                          </div>

                          <div class="col-md-4">
                          	  <img src="<%=s.getPhoto_seller()%>" alt="<%=s.getUsername()%>" class="img-circle" width="80" height="80">
                              
                              <h3>Painting Details</h3>
                              <ul>
                              	  <li><strong>Description:</strong><%=p.getDescription()%></li>
                                  <li><strong>Category:</strong> <%=p.getCategory() %></li>
						          <li><strong>Dimensions:</strong> <%=p.getDimensions() %></li>
						          <li><strong>Product id:</strong> <%=p.getProduct_id() %></li>
						      </ul>
						      <h3>Price: <%=p.getPrice()%> €</h3>
						      <% ProductDAO prdao = new ProductDAO();
						      prdao.open();%>
						      <h4> Average Rating:   
                                  <% int g = (int) average ;
                                   if (g!=0) {
                                                   int j= 0;
                                                while(j<g){ %>
                                                      <small><span class="glyphicon glyphicon-star"></span></small>
                                                    <%j++;}
                                    
                                            }
                                   else{%>
                                   <br>
                                   <small><span>No ratings yet</span></small>
                                   <%}%>
                                </h4>
						      
<%	   prdao.close();
		System.out.println(type);
		if (type == "buyer") {
			
%>
								<form method="POST" action="<%session.setAttribute("product_obj", p);%>addtoCart"> 				
									<button type="submit" class="btn btn-default"
										aria-label="Left Align" name="cart" value="">Add to cart</button>
								</form>
													
			<%}
			 else {
					String msg1 = "You have to login as buyer to add to cart. If you don't have an account please register.";
					
				%>
								<form method="POST" action="loginbuyer.jsp"> 
	
									<input type="hidden" name="product_id" value="<%=p.getProduct_id()%>">
									<input type="hidden" name="avg_p" value="<%=g %>">
									<input type="hidden" name="mymsg" value="<%=msg1 %>">
									<button type="submit" class="btn btn-default"
										aria-label="Left Align" name="cart" value="">Add to cart</button>
								</form>
					<% } //end of else %>					
					
                          </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
    </div>
    <!-- /.container -->
	
	 <%@include file="footer.jsp" %>

  </body>

</html>
