<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Heroic Features - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="resources/css/heroic-features.css" rel="stylesheet">
   <link href="resources/css/shop-homepage.css" rel="stylesheet">
   
<style type="text/css">

.img-fluid {
  max-width: 100%;
  height: auto;
  object-fit: fill;
  margin:0 auto;
}

.bannerTitle{
	height: 20%;
	width:100%;
	background-color: #17a2b8;
	position: relative;
	margin:0 auto;
	
}
#banner{
	width:100%;
	/*flex-flow:column;*/
	text-align: center;

}



.jumbotron {
  width : 100%;
  padding: 0 0 0 0;
  background-color: white;
  border-radius: 0.3rem;
  margin:0 0 0 0;
}



@media (min-width: 576px) {

	#banner{
		display:flex;
		
	}
	
	.bannerTitle{
	width:40%;
	background-color: pink;
	height:auto;
	position: relative;
	
}
.img-fluid {
  max-width: 60%;
  height: auto;
  object-fit: fill;
}
	
	


/*

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
  max-width: 60%;
  height: auto;
  object-fit: fill;
}


*/



</style>
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Start Bootstrap</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
     

		
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
   
   
   
   
    </header>

    <!-- Page Features -->
    <div class="row text-center">

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo magni sapiente, tempore debitis beatae culpa natus architecto.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">Card title</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo magni sapiente, tempore debitis beatae culpa natus architecto.</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div>
      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>

