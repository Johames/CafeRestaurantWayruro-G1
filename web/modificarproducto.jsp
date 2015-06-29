
<%@include file="WEB-INF/productos/productostop.jspf" %>


<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6" id="aler">
        <br>
        <%            if (!mensaje.equals("")) {
        %>
        <div ><%=mensaje%></div>
        <%}%>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8 well">
            <div class="title">
                <form class="tipo">
                    <h2><b>Modificar Producto</b></h2>
                    <br>
                </form>
            </div>
            <div class="formu">
                <form class="form-horizontal" action="modificarproducto.jsp" method="post">
                    <div class="form-group">
                        <label class="control-label col-xs-3">id :</label>
                        <div class="col-xs-6">
                            <input type="tex" class="form-control" name="idproducto" value="<%=idProducto%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Nombres :</label>
                        <div class="col-xs-6">
                            <input type="tex" class="form-control" value="<%=nombrePro%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">id Usuario :</label>
                        <div class="col-xs-6">
                            <input type="number" class="form-control" name="idusuario" value="<%=idUsuario%>" readonly>
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