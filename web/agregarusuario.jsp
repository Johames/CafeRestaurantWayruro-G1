<%@include file="WEB-INF/usuario/agregarusuariotop.jspf" %>

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
                    <h2><b>Agregar Usuario</b></h2>
                    <br>
                </form>
            </div>
            <div class="formu">
                <form class="form-horizontal" action="agregarusuario.jsp" method="Post">
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
                            <input type="text" maxlength="8" title="Solo N�meros (8 en total)" name="dn" pattern="[0-9]{8}" class="form-control" placeholder="DNI">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">N� de Celular:</label>
                        <div class="col-xs-6">
                            <input type="text" maxlength="10" title="Solo N�meros (9 en total)" pattern="[0-9]{1,10}" name="ncelular" class="form-control" placeholder="N� de Celular">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Direcci�n:</label>
                        <div class="col-xs-6">
                            <input rows="3" class="form-control"  name="direcciones" placeholder="Direcci�n">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Usuario:</label>
                        <div class="col-xs-6">
                            <input type="tex" class="form-control" name="usuar" placeholder="Usuario">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Contrase�a:</label>
                        <div class="col-xs-6">
                            <input type="password" class="form-control" name="contra" placeholder="Contrase�a">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Rol :</label>
                        <div class="col-xs-4">
                            <select class="form-control" name="rol">
                                <option selected="selected" hidden>Seleccionar Rol</option>
                                <%
                                    for(Rol rl :dao.ListarRol()){
                                %>
                                <option value="<%=rl.getIdRol()%>"><%=rl.getNombreRol()%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" hidden>
                        <label class="control-label col-xs-3">Estado:</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" value="1" name="stado" readonly>
                        </div>
                    </div>
                    <div class="form-group" hidden>
                        <label class="control-label col-xs-3">Id Usuario:</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="idUsuario" value="<%=idUsuario%>" readonly>
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
