<%@page import="com.arthouse.dao.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.arthouse.domain.* ,java.util.*"%>

<%
//Buyer buyer1 = (Buyer) session.getAttribute("user-object");
String type= (String) session.getAttribute("userid");

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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRfjaheQKo_hYuNk-kh02_YfEfAI56tsw&callback=initMap"></script>

<!-- jQuery -->
<script type="text/javascript" src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script> <!-- gia photo seller-->

function bigImg(x) {

   x.style.height = "72px";

   x.style.width = "72px";

}function normalImg(x) {

   x.style.height = "42px";

   x.style.width = "42px";

}

</script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">



.button {

 padding: 6px 10px;

 font-size: 24px;

 text-align: center;

 cursor: pointer;

 outline: none;

 color: #fff;

 background-color: #4CAF50

;

 border: none;

 border-radius: 15px;

 box-shadow: 0 9px #999;

}.button:hover {background-color: #3e8e41

}.button:active {

 background-color: #3e8e41

;

 box-shadow: 0 5px #666;

 transform: translateY(4px);}</style>
   <style type="text/css">
   
   @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
  		fieldset, label { margin: 0; padding: 0;}
		body{ margin: 20px; }
		
		/****** Style Star Rating Widget *****/
		
		.rating { 
		  border: none;
		  float: left;
		}
		
		.rating > input { display: none; } 
		.rating > label:before { 
		  margin: 5px;
		  font-size: 1.25em;
		  font-family: FontAwesome;
		  display: inline-block;
		  content: "\f005";
		}

		.rating > label { 
		  color: #fff; 
		 float: right; 
		}
		
		/***** CSS Magic to Highlight Stars on Hover *****/
		
		.rating > input:checked ~ label, /* show gold star when clicked */
		.rating:not(:checked) > label:hover, /* hover current star */
		.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */
		
		.rating > input:checked + label:hover, /* hover current star when changing rating */
		.rating > input:checked ~ label:hover,
		.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
		.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 
   </style>


</head>

<body id="myPage" style="background-image: url('images/ennia.jpg')">


<%@include file="navbar.jsp" %>


<!-- Page Content -->

<div class="container">

		<div class="row">
			<div class="col-md-3">
				<p align="center"><a href="homepage.jsp"><img src="images/ourlogo.png" alt="logo icon" width="100"></a></p><br>

		<%@include file="menu.jsp"%>

			</div>
				<div class="col-md-9">

<%
String pID = request.getParameter("id");
int id = Integer.parseInt(pID);
System.out.println("id"+ id);

String av = request.getParameter("avg");//edited by Anna,το αλλαξαμε γιατι καλουμε απευθειας τη μεθοδο
System.out.println(av);
double avg1 = Double.parseDouble(av);
dao = new ProductDAO();
// pio panw kanw include opou orizw ProductDAO dao;

dao.open();
Product p = dao.findProductByID(id);
int average = (int) dao.getAvgScore(id);
dao.close();

SellerDAO sdao = new SellerDAO();
sdao.open();
Seller s = sdao.getSellerByID(p.getUser_id());
sdao.close();

int ratingProduct=0;
if(type == "buyer"){
	Buyer buyer1 = (Buyer)session.getAttribute("user-object");
	int buyerid = buyer1.getUser_id();

	RatingDAO rdao = new RatingDAO();
	rdao.open();
	ratingProduct = rdao.getRating(buyerid, id);
	rdao.close();
}

%>


<div class="row carousel-holder">
		<div class="col-md-12">
			<div class="row">
				<div class="col-lg-12">

					<h1 class="page-header"><%=p.getTitle()%> <small> by <%=s.getUsername()%> </small> 
					<img onmouseover="bigImg(this)" onmouseout="normalImg(this)" border="0"
					src="<%=request.getContextPath() + "/images/" +s.getPhoto_seller()%>"
					 alt="<%=s.getUsername()%>" class="img-circle" width="40" height="40"></h1>
				</div>
			</div><!-- /.row -->

			<!-- Portfolio Item Row -->

			<div class="row">
				<div class="col-md-8">
					<img class="img-responsive" src="<%=request.getContextPath() + "/images/" + p.getPicture()%>" alt="product's icon" style="width: 725px !important;height:400px !important;">
				</div>
				<div class="col-md-4">
					<h3>Painting Details</h3>
						<ul>
							<li><strong>Description:</strong> <%=p.getDescription()%></li>
							<li><strong>Category:</strong> <%=p.getCategory()%></li>
							<li><strong>Dimensions:</strong> <%=p.getDimensions()%></li>
							<li><strong>Product id:</strong> <%=p.getProduct_id()%></li>
					    </ul>
					<h3>Price: <%=p.getPrice()%>€</h3>
					
					<%ProductDAO prdao = new ProductDAO();prdao.open();%>
					
					<h3>Average Rating:</h3>
					 
				 <%if (type != "buyer"){ %> 
				                                               
                    <fieldset class="rating">
					    <input type="radio" id="star5" name="rating" value="5" <%= ((int) average == 5 ? "checked" : "")%> disabled/><label class = "full" for="star5" title="Awesome - 5 stars"></label>
					    <input type="radio" id="star4" name="rating" value="4" <%= ((int) average == 4 ? "checked" : "")%> disabled/><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
					    <input type="radio" id="star3" name="rating" value="3" <%= ((int) average == 3 ? "checked" : "")%> disabled/><label class = "full" for="star3" title="Meh - 3 stars"></label>
					    <input type="radio" id="star2" name="rating" value="2" <%= ((int) average == 2 ? "checked" : "")%> disabled/><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
					    <input type="radio" id="star1" name="rating" value="1" <%= ((int) average == 1 ? "checked" : "")%> disabled/><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
					</fieldset>
                  </h3>
						      
				<%}else{ %>
				<h4>                                            
                    <fieldset class="rating">
					    <input  type="radio" id="star5" name="rating" value="5" <%= ((int) average == 5 ? "checked" : "")%>/><label class = "full" for="star5" title="Awesome - 5 stars"></label>
					    <input type="radio" id="star4" name="rating" value="4" <%= ((int) average == 4 ? "checked" : "")%>/><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
					    <input type="radio" id="star3" name="rating" value="3" <%= ((int) average == 3 ? "checked" : "")%>/><label class = "full" for="star3" title="Meh - 3 stars"></label>
					    <input type="radio" id="star2" name="rating" value="2" <%= ((int) average == 2 ? "checked" : "")%>/><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
					    <input type="radio" id="star1" name="rating" value="1" <%= ((int) average == 1 ? "checked" : "")%>/><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
					</fieldset>
                  </h4>	 <br>

				<%
					if(ratingProduct!=0 && type=="buyer"){
					%><br>
					<h3>Your rate: <span style="color:#cc0052;"><%=ratingProduct%></span><span style="color:black;"> / 5</span></h3>
				<% 					
					}//end of if
				
				
				}//end of else
				 
				
				   	System.out.println(type);
					if (type =="buyer") {%>
					<br>
					<form method="POST" action="<%session.setAttribute("product_obj",p);%>addtoCart">
						<button type="submit" class="button" aria-label="Left Align" name="cart" value="">Add to cart</button>
					</form>
					<%} else {
						String msg1 ="You have to login as buyer to add to cart. If you don't have an account please register.";
					%>
					<br><br><br>
					<form method="POST" action="loginbuyer.jsp">
						<input type="hidden" name="product_id" value="<%=p.getProduct_id()%>">
						<input type="hidden" name="avg_p" value="<%=average%>">
						<input type="hidden" name="mymsg" value="<%=msg1%>">
						<button type="submit" class="button" aria-label="Left Align" name="cart" value="">Add to cart</button>
				   </form>

				<% }//end of else %>


			</div>
		</div>

	</div>

</div>
</div>
</div>
</div>

<!--
/.container
-->

<br><br><br>
<div>
<%@include file="footer.jsp"%>
</div>
</body>
</html>


<script type="text/javascript">
	$(document).on('click', '.rating > input', function() {		  
		$.ajax({
			url: "rate",
			data: {
				product: <%=p.getProduct_id() %>,
				rating: $(this).val()
			},
			complete: function(data) {
				location.reload();
			}
		})
	});
</script>
