<!DOCTYPE HTML>
<%@ page contentType = "text/html;charset=utf-8" %>
<html>
<head>
  <title>Navbar</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="assets/css/myCss.css">
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style type="text/css">


.dropdown-submenu {
    position: relative;
}

.dropdown-submenu>.dropdown-menu {
    top: 0;
    left: 100%;
    margin-top: -6px;
    margin-left: -1px;
    -webkit-border-radius: 0 6px 6px 6px;
    -moz-border-radius: 0 6px 6px;
    border-radius: 0 6px 6px 6px;
}

.dropdown-submenu:hover>.dropdown-menu {
    display: block;
}

.dropdown-submenu>a:after {
    display: block;
    content: " ";
    float: right;
    width: 0;
    height: 0;
    border-color: transparent;
    border-style: solid;
    border-width: 5px 0 5px 5px;
    border-left-color: #ccc;
    margin-top: 5px;
    margin-right: -10px;
}

.dropdown-submenu:hover>a:after {
    border-left-color: #fff;
}

.dropdown-submenu.pull-left {
    float: none;
}

.dropdown-submenu.pull-left>.dropdown-menu {
    left: -100%;
    margin-left: 10px;
    -webkit-border-radius: 6px 0 6px 6px;
    -moz-border-radius: 6px 0 6px 6px;
    border-radius: 6px 0 6px 6px;
}
body{
    padding:10px;
}

.show-on-hover:hover > ul.dropdown-menu {
    display: block;    
}
</style>


</head>
  <body>
  
  <%@include file="../main_header.jsp" %>
  
<!------ Include the above in your HEAD tag ---------->

<div class="container">
	<div class="row">


      
        <!-- Single button -->
        <div class="btn-group">
          <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
           	 카테고리
          </button>
          
          <ul class="dropdown-menu" role="menu" style="text-decoration: none;">
            
            
            <li class="dropdown-submenu"><a href="#">게임</a>
            	<ul class="dropdown-menu">
            		<li><a href="#">시발</a></li>
            		
            	
            	
            	
            	</ul>
            
            </li>
            
            
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </div>
	</div>
</div>




        
        
        
        
        
        <div class="dropdown">
            <a id="dLabel" role="button" data-toggle="dropdown" class="btn btn-primary" data-target="#" href="/page.html">
                Dropdown <span class="caret"></span>
            </a>
    		<ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">
           
              
              <li class="dropdown-submenu"> <!-- 이게 이중 드랍 상위 클래스-->
                <a tabindex="-1" href="#">Hover me for more options</a>
                <ul class="dropdown-menu"> <!-- 이중드랍 하위 클라스 -->
                  <li><a tabindex="-1" href="#">Second level</a></li>
                  
			                  <!--  
			                  <li class="dropdown-submenu">
			                    <a href="#">Even More..</a>
			                    
			                    <ul class="dropdown-menu">
			                        <li><a href="#">3rd level</a></li>
			                    	<li><a href="#">3rd level</a></li>
			                    </ul>
			                    
			                  </li>
			                  
			                  -->
                  <li><a href="#">Second level</a></li>
                  <li><a href="#">Second level</a></li>
                </ul>
              </li><!-- 이중드랍으로 묶음 -->
              
              
            </ul>
        </div>
	</div>
</div>
   

      
      
</body>
</html>