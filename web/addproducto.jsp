
<%@include file="WEB-INF/productos/addproductotop.jspf" %>

<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6" id="aler">
        <br>
        <%
            if(!mensaje.equals("")){
        %>
        <div class="alert alert-<%=alert%>"><%=mensaje%></div>
        <%}%>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8 well">
            <div class="title">
                <form class="tipo">
                    <h2><b>Agregar Producto</b></h2>
                    <br>
                </form>
            </div>
            <div class="formu">
                <form class="form-horizontal" action="addproducto.jsp" method="post">
                    <div class="form-group">
                        <label class="control-label col-xs-3">Nombre del Producto :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="nombreProducto" placeholder="Nombre del Producto" autofocus>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Precio :</label>
                        <div class="col-xs-6">
                            <input type="number" pattern="[0-9]{6}" class="form-control" name="precio" placeholder="Precio">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Categoria :</label>
                        <div class="col-xs-4">
                            <select class="form-control" name="idCategoria">
                                <option selected="selected" hidden>Seleccionar Categoria</option>
                                <%                                                        
                                    int count = 0;
                                    for (Categoria cate : categoriadao.ListarCategoria()) {
                                        count++;
                                %>
                                <option value="<%=cate.getIdCategoria()%>"><%=cate.getNombreCat()%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Usuario :</label>
                        <div class="col-xs-6">
                            <input type="number" class="form-control" value="<%=idUsuario%>" name="idUsuario" readonly>
                        </div>
                    </div>
                    <br>
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