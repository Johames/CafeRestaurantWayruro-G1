<%@include file="WEB-INF/pensionistas/renovartop.jspf"%>

<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6" id="aler">
        <br>
        <%            ContratoPensionista cp = new ContratoPensionista();
            String idcontrato = request.getParameter("idcontrato");
            idcontrato = idcontrato == null ? "" : idcontrato;
            if (opcion.equals("modificar")) {

                if (persona.ModificarFechaP(idcontrato)) {
                    alert = "info";
                    mensaje = "El Contrato se modifico correctamente...";
                    response.sendRedirect("pensionistas.jsp");
                } else {
                    alert = "danger";
                    mensaje = "No se pudo modificar el Contrato";
                }
            }

            if (!mensaje.equals("")) {
        %>
        <div class="alert alert-<%=alert%>"><%=mensaje%></div>
        <%}%>
    </div>
</div>
<div class="container">

    <div class="row">


        <div class="col-md-2"></div>

        <div class="col-md-8 well">
            <div class="container">
                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-3 " >
                    <input type="hidden" class="btn btn-primary" name="opcion" value="persona">
                    <input type="submit" class="btn btn-default" value="Persona">
                    </div>
                    <div class="col-md-3 " >
                    <input type="hidden" class="btn btn-primary" name="opcion" value="contrato">
                    <input type="submit" class="btn btn-default" value="Contrato">
                </div>
                </div>
            </div>

            <div class="title">
                <form class="tipo">
                    <h2><b>Modificar Contrato</b></h2>
                    <br>
                </form>
            </div>
            <div class="formu">
                <form class="form-horizontal" action="modificarcontrato.jsp" method="post">
                    <div class="form-group" hidden>
                        <label class="control-label col-xs-3">id :</label>
                        <div class="col-xs-6">
                            <input type="tex" class="form-control" name="idcontrato" value="<%=idpersona%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Nombres :</label>
                        <div class="col-xs-6">
                            <input type="tex" class="form-control" value="<%=nombres%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Apellidos :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" value="<%=apellidos%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">DNI :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" value="<%=dni%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">N° de Celular :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" value="<%=NCelular%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Dirección :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" value="<%=direccion%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Va a Pagar? :</label>
                        <div class="col-xs-4">
                            <select class="form-control" name="stado">
                                <option selected="selected" hidden>Seleccionar</option>
                                <option value="1">Si</option>
                                <option value="0">No</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" hidden>
                        <label class="control-label col-xs-3">id Usuario :</label>
                        <div class="col-xs-6">
                            <input type="number" class="form-control" name="idusuario" value="<%=idUsuario%>" readonly>
                            <input type="hidden" class="form-control" name="opcion" value="modificar" readonly>
                        </div>
                    </div>
                    <div class="form-group" hidden>
                        <label class="control-label col-xs-3">Tipo :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="tip" value="c" readonly>
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
