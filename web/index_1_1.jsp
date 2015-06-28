<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="recursos/ico/favicon.ico">
        <title>Café Restaurant "Wayruro"</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="./Carousel Template for Bootstrap_files/ie-emulation-modes-warning.js"></script>
        <link href="css/carousel.css" rel="stylesheet">
        <jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
    </head>

    <body>
        <%
            if(idUsuario.equals("")){
                response.sendRedirect("error.jsp");
            }
        %>
        <div class="navbar-wrapper">
            <div class="container">
                <nav class="navbar navbar-inverse navbar-static-top">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" >Café Restaurant "Wayruro"</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="index_1.jsp">Inicio <i class="glyphicon glyphicon-home"></i></a></li>
                            </ul>
                            <div>
                                <div id="navbar" class="navbar-collapse collapse">
                                    <form class="navbar-form navbar-right">
                                        <a class="btn btn-danger" href="cerrar" role="button">Salir <i class="glyphicon glyphicon-log-out"></i></a>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>

            </div>
        </div>


        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class=""></li>
                <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="2" class=""></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active left">
                    <img class="first-slide" src="recursos/img/img1.jpg" alt="First slide">          
                </div>
                <div class="item next left">
                    <img class="second-slide" src="recursos/img/img3.jpg" alt="Second slide">          
                </div>
                <div class="item">
                    <img class="third-slide" src="recursos/img/img2.jpg" alt="Third slide">          
                </div>
            </div>
        </div>
        
    <div class="container marketing">  
      <div class="row">
        <div class="col-lg-4">
          <img class="img-circle" src="recursos/img/pensionistas.png" alt="Generic placeholder image" width="140" height="140">
          <h2>Pensionistas</h2>
          <p><a class="disabled btn btn-primary" href="pensionistas.jsp" role="button">Ver Lista »</a></p>
        </div>
        <div class="col-lg-4">
          <div class="tab-pane fade active in" id="map-acercade">
                  <div class="row-fluid">
                    <div class="span11">
                        <div class="tab-pane active" id="maptarapoto">
	                    <iframe width="100%" height="220" scrolling="auto" frameborder="1px" src="http://www.sudoku-online.org/" name="window"></iframe>
	                </div>
                    </div>
                  </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="tab-pane fade active in" id="map-acercade">
                  <div class="row-fluid">
                    <div class="span11">
                        <div class="tab-pane active" id="maptarapoto">
	                    <iframe width="100%" height="220" frameborder="2" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.pe/maps?f=q&amp;source=s_q&amp;hl=es&amp;geocode=&amp;q=upeu&amp;aq=&amp;sll=-9.243538,-75.019515&amp;sspn=35.39906,59.106445&amp;ie=UTF8&amp;hq=upeu&amp;hnear=&amp;t=m&amp;cid=6993184648769333257&amp;ll=-6.472842,-76.393604&amp;spn=0.018762,0.025663&amp;z=14&amp;iwloc=A&amp;output=embed"></iframe>
	                </div>
                    </div>
                  </div>
          </div>
        </div>
      </div>
              
<%@include file="WEB-INF/jspf/bottom.jspf" %>