<!DOCTYPE html>
<html lang="en">
<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>핫디즈 :: hoThiz</title>

		 


  <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">




<style type="text/css">



#banner{
	display:flex;


}

.bannerTitle{
	height:auto;
	width:40%;
	background-color: #17a2b8;
	position: relative;
	
}


.img-fluid {
  max-width: auto;
  height: auto;
  object-fit: fill;
}


.banContainer{

  width: 100%;

  margin-right: auto;
  margin-left: auto;
  text-align:center; margin:0 auto;
	

}



</style>
</head>

<body>

		<!-- Header -->

  <!-- Navigation -->

  


  <!-- Page Content -->
  <div class="container">




      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
      
		
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">


				
		            <div class="carousel-item active">
		            	<div id="banner">

				              <img class="d-block img-fluid" src="resources/banner/${bannerMap.banner0.project_main_image}" alt="First slide">
			            	  	<div class="bannerTitle">
			        				<h1>${bannerMap.banner0.project_title }</h1>
			        				<h3>${bannerMap.banner0.project_summary }</h3>
		        				</div>
		        		
	        			</div>
			 		</div>
						
	            		            
	            
	            <div class="carousel-item">
		           <div id="banner">

			              <img class="d-block img-fluid" src="resources/banner/${bannerMap.banner1.project_main_image}" alt="Second slide">
			            		<div class="bannerTitle">
		        					<h1>${bannerMap.banner1.project_title }</h1>
		        					<h3>${bannerMap.banner1.project_summary }</h3>
		        				</div>
		        
	        		</div>
	            </div>


				 <div class="carousel-item">
		           <div id="banner">
			
			              <img class="d-block img-fluid" src="resources/banner/${bannerMap.banner2.project_main_image}" alt="Second slide">
			            		<div class="bannerTitle">
		        					<h1>${bannerMap.banner2.project_title }</h1>
		        					<h3>${bannerMap.banner2.project_summary }</h3>
		        				</div>
		        		
	        		</div>
	            </div>
	    
	    <!--  
	            <div class="carousel-item">
	            <div id="banner">
	              <img class="d-block img-fluid" src="resources/banner/30.jpg" alt="Third slide">
	           		  <div class="bannerTitle">
        					<h1>수영장</h1>
        				</div>
        			</div>
	           	
	            </div>-->
    
	         
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
        
        
      </div>  
        
</div></div>


  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  

			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

</body>

</html>
