<%@include file="WEB-INF/pensionistas/agregartop.jspf" %>

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
                    <h2><b>Agregar Pensionista</b></h2>
                    <br>
                </form>
            </div>
            <div class="formu">
                <form class="form-horizontal" action="agregar.jsp">
                    <div class="form-group">
                        <label class="control-label col-xs-3">Nombres:</label>
                        <div class="col-xs-6">
                            <input type="tex" class="form-control" name="nombre" placeholder="Nombres" autofocus>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Apellidos:</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="apellido" placeholder="Apellidos">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">DNI:</label>
                        <div class="col-xs-6">
                            <input type="text" maxlength="8" title="Solo Números (8 en total)" name="dn" pattern="[0-9]{8}" class="form-control" placeholder="DNI">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">N° de Celular:</label>
                        <div class="col-xs-6">
                            <input type="text" maxlength="10" title="Solo Números (9 en total)" pattern="[0-9]{1,10}" name="ncelular" class="form-control" placeholder="N° de Celular">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Dirección:</label>
                        <div class="col-xs-6">
                            <textarea rows="3" class="form-control"  name="direcciones" placeholder="Dirección"></textarea>
                        </div>
                    </div>
                    <input hidden name="idpersona" value="">
                    <div class="form-group">
                        <label class="control-label col-xs-3">Inicio de la Pensión:</label>
                        <div class="col-xs-3">
                            <input type="date" class="form-control"name="fechini">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Costo de la Pension:</label>
                        <div class="col-xs-3">
                            <input type="number" class="form-control"name="precio">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Pago? :</label>
                        <div class="col-xs-4">
                            <select class="form-control" name="stado">
                                <option selected="selected" hidden="">Seleccionar</option>
                                <option value="1">Si</option>
                                <option value="0">No</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Id Usuario:</label>
                        <div class="col-xs-3">
                            <input type="number" class="form-control" value="<%=idUsuario%>" name="idUsuario">
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
