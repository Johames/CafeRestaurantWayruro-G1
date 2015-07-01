<%@include file="WEB-INF/jspf/top.jspf" %>

<div class="container marketing">  
    <div class="row">
        <div class="col-lg-4">
            <img class="img-circle" src="recursos/img/pensionistas.png" alt="Generic placeholder image" width="140" height="140">
            <h2>Pensionistas</h2>
            <p><a class="btn btn-primary" href="crud?action=listarpen" role="button">Ver Lista »</a></p>
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
            <img class="img-circle" src="recursos/img/pedido.png" alt="Generic placeholder image" width="140" height="140">
            <h2>Ventas</h2>
            <p><a class="btn btn-primary" href="ocultar?action=venta" role="button">Iniciar Venta »</a></p>
        </div>
    </div>

<%@include file="WEB-INF/jspf/bottom.jspf" %>