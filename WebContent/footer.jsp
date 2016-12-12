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
          <p>This project was created in November 2016, for the <a href="http://www.afdemp.org/">1st Coding Bootcamp</a> .
          <p><span class="glyphicon glyphicon-user"></span> Ioakeim Olga</p>
          <p><span class="glyphicon glyphicon-user"></span> Neofytou Anna</p>
          <p><span class="glyphicon glyphicon-user"></span> Parris Dimitris</p>
        </div>
        <div id="menu3" class="tab-pane fade">
          <br>
          <p>Art-House is located in Athens, just 20 minutes by bus from Athens' Center and within easy access of the A1 bus.</p>
          <p><span class="glyphicon glyphicon-map-marker"></span>Athinon Avenue, 47, Athens, GRE</p>
          <p><span class="glyphicon glyphicon-phone"></span>Phone: +30 2102914743</p>
          <p><span class="glyphicon glyphicon-envelope"></span>Email: art-house@outlook.com</p>
          
        </div>
         
		</div>
		</div>
	
	<script>
						$(document).ready(function(){
						  // Add smooth scrolling to all links in navbar + footer link
						  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
						    // Make sure this.hash has a value before overriding default behavior
						    if (this.hash !== "") {
						      // Prevent default anchor click behavior
						      event.preventDefault();
						
						      // Store hash
						      var hash = this.hash;
						
						      // Using jQuery's animate() method to add smooth page scroll
						      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
						      $('html, body').animate({
						        scrollTop: $(hash).offset().top
						      }, 900, function(){
						
						        // Add hash (#) to URL when done scrolling (default click behavior)
						        window.location.hash = hash;
						      });
						    } // End if
						  });
						
						  $(window).scroll(function() {
						    $(".slideanim").each(function(){
						      var pos = $(this).offset().top;
						
						      var winTop = $(window).scrollTop();
						        if (pos < winTop + 600) {
						          $(this).addClass("slide");
						        }
						    });
						  });
						})
</script>
		    
		
		      
    
    <footer class="container-fluid text-center">
		<a href="#myPage" title="To Top"> 
		<span class="glyphicon glyphicon-chevron-up"></span>
		</a>
	</footer>