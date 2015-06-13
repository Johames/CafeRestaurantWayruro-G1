<%@include file="WEB-INF/productos/addproductotop.jspf" %>

<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8 well">
            <div class="title">
                <form class="tipo">
                    <h2><b>Agregar Categoría</b></h2>
                    <br>
                </form>
            </div>
            <div class="formu">
                <form class="form-horizontal" action="addcategoria.jsp">
                    <div class="form-group">
                        <label class="control-label col-xs-3">Nombre de la Categoría:</label>
                        <div class="col-xs-6">
                            <input type="tex" class="form-control" name="nombreProducto" placeholder="Nombre de la Categoría">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-offset-3 col-xs-9">
                            <input type="submit" class="btn btn-primary" value="Enviar">
                            <input type="reset" class="btn btn-default" value="Limpiar">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>

<script src="jquery/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/holder.js"></script>
<script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>
</html>
