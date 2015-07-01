
<%@include file="WEB-INF/pensionistas/renovartop.jspf"%>
<div class="container-fluid">
    <div class="col-md-3"></div>
    <div class="col-md-6" id="aler">
        <br>
        <%  
            if (!mensaje.equals("")) {
        %>
        <div class="alert alert-<%=alert%>"><%=mensaje%></div>
        <%}%>
    </div>
</div>
<br><br>
<div class="container">
    <div class="row">
        <div class="col-md-7"></div>
        <div class="title">
            <div class="col-md-1"></div>
            <form class="tipo">
                <h2><b>Modificar </b></h2>
                <br>
            </form>
        </div>
        <div class="">
            <div class="">
                <div class="col-md-3"></div>
                <div class="col-md-7">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-2"></div>
                                <div class="col-md-3 ">
                                    <form class="form-horizontal" action="modificarcontrato.jsp" method="get">
                                        <input type="hidden" class="btn btn-primary" name="opcion" value="persona">
                                        <input type="hidden" name="idpersona" value="<%=idpersona%>">
                                        <input type="submit" class="btn btn-primary" value="Persona">
                                    </form>
                                </div>
                                        <label class="col-sm-3"></label>
                                <div class="col-md-2 ">
                                    <form class="form-horizontal" action="modificarcontrato.jsp" method="get">
                                        <input type="hidden" class="btn btn-primary" name="opcion" value="contrato">
                                        <input type="hidden" name="idcontrato" value="<%=idcontrato%>">
                                        <input type="submit" class="btn btn-primary" value="Contrato">
                                    </form>
                                </div>
                            </div>
                        </div>            
                    </div>
                </div>               
            </div>
            
        </div>
    </div>
            <%
                ContratoPensionista conp = new ContratoPensionista();
                if(opcion.equals("contrato")){
                    conp = persona.MostrarContrato(idcontrato);
                }
                if(opcion.equals("modificarcontrato")){
                    conp.setFechaInicio(fechini);
                    conp.setFechaFin(fechfin);
                    conp.setPrecioPension(precio);
                    conp.setEstado(stado);
                    conp.setIdusuario(idUsuario);
                    if(persona.ModificarContrato(conp, idcontrato)){
                        response.sendRedirect("crud?action=listarpen");
                    }else{
                        alert = "danger";
                        mensaje = "No se pudo modificar el Contrato";
                    }
                }
                if(opcion.equals("contrato")){
            %>
            <div class="title">
                <form class="tipo">
                    <h2><b>Datos del Contrato</b></h2>
                    <br>
                </form>
            </div>
            <div class="formu">
                <form class="form-horizontal" action="modificarcontrato.jsp" method="get">
                    <input type="hidden" name="opcion" value="modificarcontrato">
                    <input type="hidden" name="idcontrato" value="<%=idcontrato%>">
                    <div class="form-group">
                        <label class="control-label col-xs-5">Fecha Inicio :</label>
                        <div class="col-xs-3">
                            <input type="date" class="form-control" name="fechini" value="<%=conp.getFechaInicio()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-5">Fecha Fin :</label>
                        <div class="col-xs-3">
                            <input type="date" class="form-control" name="fechfin" value="<%=conp.getFechaFin()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-5">Precio :</label>
                        <div class="col-xs-3">
                            <input type="number" class="form-control" name="precio" value="<%=conp.getPrecioPension()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-5">Va a Pagar? :</label>
                        <div class="col-xs-3">
                            <select class="form-control" name="stado">
                                <option selected="selected" hidden="">Seleccionar</option>
                                <option value="1">Si</option>
                                <option value="0">No</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-offset-2 col-xs-8">
                            <input type="submit" class="btn btn-primary" value="Enviar">
                            <input type="reset" class="btn btn-default" value="Limpiar">
                        </div>
                    </div>
                </form>
            </div>
            <%}
                
                Persona per = new Persona();
                if(opcion.equals("persona")){
                   per = persona.MostrarPersona(idpersona);
                }
                if(opcion.equals("modificarpersona")){
                    per.setNombres(nombres);
                    per.setApellidos(apellidos);
                    per.setDni(dni);
                    per.setNCelular(NCelular);
                    per.setDireccion(direccion);
                    if(persona.ModificarPersona(per, idpersona)){
                        response.sendRedirect("crud?action=listarpen");
                    }else{
                        alert = "danger";
                        mensaje = "No se pudo modificar la Persona";
                    }
                }
                if(opcion.equals("persona")){
            %>
            <div class="title">
                <form class="tipo">
                    <h2><b>Datos del Pensionista</b></h2>
                    <br>
                </form>
            </div>
            <div class="formu">
                <form class="form-horizontal" action="modificarcontrato.jsp" method="get">
                    <input type="hidden" name="opcion" value="modificarpersona">
                    <input type="hidden" name="idpersona" value="<%=idpersona%>">
                    <div class="form-group">
                        <label class="control-label col-xs-5">Nombres :</label>
                        <div class="col-xs-3">
                            <input type="tex" class="form-control" name="nombres" value="<%=per.getNombres()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-5">Apellidos :</label>
                        <div class="col-xs-3">
                            <input type="text" class="form-control" name="apellidos" value="<%=per.getApellidos()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-5">DNI :</label>
                        <div class="col-xs-3">
                            <input type="text" class="form-control" name="dni" value="<%=per.getDni()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-5">N° de Celular :</label>
                        <div class="col-xs-3">
                            <input type="text" class="form-control" name="ncelular" value="<%=per.getNCelular()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-5">Dirección :</label>
                        <div class="col-xs-3">
                            <input type="text" class="form-control" name="direcciones" value="<%=per.getDireccion()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-offset-2 col-xs-8">
                            <input type="submit" class="btn btn-primary" value="Enviar">
                            <input type="reset" class="btn btn-default" value="Limpiar">
                        </div>
                    </div>
                </form>
            </div>
            <%}%>
        </div>
    </div>
</div>
</body>

<script src="jquery/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/holder.js"></script>
<script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>
</html>
