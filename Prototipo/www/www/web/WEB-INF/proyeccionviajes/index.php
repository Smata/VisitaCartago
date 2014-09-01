<!DOCTYPE html>
<!--
pagina principal
-->
<html lang="en">
    <head> <!-- encabezados e importaciones de archivos .CSS  -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="shortcut icon" href="../../assets/ico/favicon.png">

		<title>Carousel Template for Bootstrap</title>

		<!-- Bootstrap core CSS -->
		<link href="../../dist/css/bootstrap.css" rel="stylesheet">

		<!-- Custom styles for this template -->
		<link href="carousel.css" rel="stylesheet">
    
	</head>
    <body>
		
	
        <h4 style="position: absolute; left: 2%; top: 3%">Central phone: </h4> <!-- Telefono -->
		<h4 style="position: absolute; left: 15%; top: 5px; font-size: xx-large; font-style: italic; font-weight: bold; color: crimson">(506) 2256-7653</h4>
        
		<!--encabezado (contact us, site map)-->
		<a href="#"> <label style="right: 150px; top: 10px; position: absolute">Contact us!</label>  </a>
		<label style="right: 115px; top: 10px; position: absolute">  |  </label>
		<a href="#"> <label style="right: 30px; top: 10px; position: absolute">Site map</label>  </a>
		
		<!--barra superior y logo (contact us, site map)-->
		
		<img src="divisor.png" style="position: absolute; right: 0px; top: 60px;  height: 1px">
		
		<div class="navbar-wrapper" style="top: 70px; width: 70%; left: 10px">  <!-- barra de links-->
		  <div class="container">

			<div class="navbar navbar-inverse navbar-static-top">
			  <div class="container">
				<div class="navbar-header"> <!-- Primera porcion del encabezado "WebMedics" -->
				  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				  </button>
				</div>
				<div class="navbar-collapse collapse">
				  <ul class="nav navbar-nav">
					<li><a href="/web/WEB-INF/main page/index.php">Home</a></li>
					<li><a href="#about">Site map</a></li>
					<li><a href="#contact">Contact</a></li>
					<li class="dropdown">
					  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Search <b class="caret"></b></a>
					  <ul class="dropdown-menu">
						<li><a href="#">Travels</a></li>
						<li><a href="#">Centers</a></li>
						<li><a href="#">Providers</a></li>
						<li class="divider"></li>
						<li><a href="#">Dates</a></li>
						<li><a href="#">Calendar</a></li>
					  </ul>
					</li>
				  </ul>
				</div>
			  </div>
			</div>

		  </div>
		</div>
		
			<!-- Carousel
		================================================== -->
		<div id="myCarousel" class="carousel slide" style="top: 170px">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
			<div class="item active">
			  <div class="container">
				<div class="carousel-caption">
				  <h1>Fun and relax is our commitment</h1>
				  <p><a class="btn btn-large btn-primary" href="#">Who we are?</a></p>
				</div>
			  </div>
			</div>
			<div class="item">
			  <div class="container">
				<div class="carousel-caption">
				  <h1></h1>
				  <p>Go to the zone to add new travels, providers and centers</p>
				  <a  href="http://localhost:8080/web/WEB-INF/medicosRegistro/index.php"><button type="button" class="btn btn-info" style="position: absolute; right: 0%; top: -220px; width: 25%">Sign up travel</button></a>
				  <a  href="http://localhost:8080/web/WEB-INF/pacientes/pacienteRegistro.php"><button type="button" class="btn btn-info" style="position: absolute; right: 0%; top: -180px; width: 25%">Sign up center</button></a>
				  <a  href="http://localhost:8080/web/WEB-INF/clinica/index.php"><button type="button" class="btn btn-info" style="position: absolute; right: 0%; top: -140px; width: 25%">Sign up provider</button></a>
				</div>
			  </div>
			</div>
			<div class="item">
			  <div class="container">
				<div class="carousel-caption">
				  <a  href="http://localhost:8080/web/WEB-INF/medicoModificacion/index.php"><button type="button" class="btn btn-info" style="position: absolute; right: 0%; top: -220px; width: 25%">Search travels</button></a>
				  <a  href="http://localhost:8080/web/WEB-INF/clinica/clinicaModificacion.php"><button type="button" class="btn btn-info" style="position: absolute; right: 0%; top: -180px; width: 25%">Search provider by rank</button></a>
				  <a  href="http://localhost:8080/web/WEB-INF/padecimientos/padecimientoModificacion.php"><button type="button" class="btn btn-info" style="position: absolute; right: 0%; top: -140px; width: 25%">Search all reviews of a provider</button></a>
				
				  <h1>Search, ask, seek for?</h1>
				</div>
			  </div>
			</div>
		  </div>
		  <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
		  <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
		<?php
			for ($index=0;$index< count($listaMedicos)-1;$index++)
			{
				$infoMedico = preg_split("/[%]+/", $listaMedicos[$index]);
				
				echo
				'	
					<div class="well" style="position: absolute;top: '.(700+($index*290)).'px; width:90%; left:5%;">
						<h1></h1>
						<h2></h2>
						<h2></h2>
						
						<div class="progress" style="width:30%">
							<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: %;"><span class="sr-only">60% Complete</span></div>
						</div>
					</div>
				';
			}
		?>
		
        <script src="../../assets/js/jquery.js"></script>
		<script src="../../dist/js/bootstrap.min.js"></script>
		<script src="../../assets/js/holder.js"></script>
    </body>
</html>
