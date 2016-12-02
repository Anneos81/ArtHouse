<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	   <!-- Container (Contact Section) -->
    <div id="about" class="container ">
      <h3 class="text-center">About this site</h3>
      <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#menu0">About our Buyers</a></li>
        <li><a data-toggle="tab" href="#menu1">About our Sellers</a></li>
        <li><a data-toggle="tab" href="#menu2">Our Team</a></li>  
        <li><a data-toggle="tab" href="#menu3">Contact</a></li>
        <li><a data-toggle="tab" href="#menu4">Where to find us</a></li>
      </ul>

      <div class="tab-content">
        <div id="menu0" class="tab-pane fade in active">
  			<h2>Art-House promises that you will find paintings for every taste...</h2>
			<p>Founded in October of 2016 and based in Athens, Greece, Art-House is a trusted community marketplace for people to list, 
			discover, and buy unique paintings around the world — online or from a mobile phone or tablet. Easily and quickly 
			you can buy every painting you want. You can choose among many paintings in our site, there are many categories for every taste, style
			and notion. Remember every painting is authenticated! You just have to choose the one 
			that suits to you more!</p>
        </div>
        <div id="menu1" class="tab-pane fade">
			<h2>We are glad to have talented painters at our site...</h2>
			<p>Art-House is the easiest way for painters to monetize their work
			 and their paintings to an audience of thousands. If you are a painter and you would
			 like to sell your paintings, an easy way to do it is our site. You just have to scan your drawing and upload it here!</p>
        </div>
         <div id="menu2" class="tab-pane fade">
          <br>
          <p>This project was created in November 2016, for the 1st Coding Bootcamp.
          <p><span class="glyphicon glyphicon-user"></span> Ioakeim Olga</p>
          <p><span class="glyphicon glyphicon-user"></span> Neofytou Anna</p>
          <p><span class="glyphicon glyphicon-user"></span> Parris Dimitris</p>
        </div>
        <div id="menu3" class="tab-pane fade">
          <br>
          <p><span class="glyphicon glyphicon-map-marker"></span>Athens, GRE</p>
          <p><span class="glyphicon glyphicon-phone"></span>Phone: +30 2102914743</p>
          <p><span class="glyphicon glyphicon-envelope"></span>Email: art-house@outlook.com</p>
        </div>
         <div id="menu4" class="tab-pane fade">
          <br>
          <p>Art-House is located in Athens, just 20 minutes by bus from Athens' Center
           and within easy access of the A1 bus. Our address is: Leoforos Athinon 47</p>
           <p>
            <!-- Add Google Maps -->
			<div id="googleMap" style="height: 400px; width: 100%;"></div>
			<script type="text/javascript">

		var myCenter = new google.maps.LatLng(37.990832, 23.7033199);
		<!--Athens-->

		function initialize() {
			var mapProp = {
				center : myCenter,
				zoom : 12,
				scrollwheel : false,
				draggable : false,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};

			var map = new google.maps.Map(document.getElementById("googleMap"),
					mapProp);

			var marker = new google.maps.Marker({
				position : myCenter,
			});

			marker.setMap(map);
		}

		google.maps.event.addDomListener(window, 'load', initialize);
			</script>
           </p>
		</div>
		</div>
		</div>
		    
		
		      
    
    <footer class="container-fluid text-center">
		<a href="#myPage" title="To Top"> 
		<span class="glyphicon glyphicon-chevron-up"></span>
		</a>
	</footer>