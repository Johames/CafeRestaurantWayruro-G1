
<%@include file="WEB-INF/pensionistas/pensionistastop.jspf" %>

<% 
      
        if (opcion.equals("delete")) {
    
        String idcontrato = request.getParameter("idcontrato"); idcontrato = idcontrato == null ? "" : idcontrato;
    
        Pensionistadao pensionistadao = new PensionistadoaImpl();
        
        if (pensionistadao.EliminarPensionista(idcontrato)) {
            alert = "info";
            mensaje = "Se eliminó correctamente.";
        } else {
            alert = "danger";
            mensaje = "No se puede eliminar. ";
        }
    }
%>
<div class="col-md-6" id="aler">
        <br>
        <%
            if(!mensaje.equals("")){
        %>
        <div class="alert alert-<%=alert%>"><%=mensaje%></div>
        <%}%>
</div>
<div class="container-fluid">
    <h1 class="sub-header">Lista de Pensionistas Activos<label class="col-lg-offset-0"></label>&nbsp;&nbsp;<label class="col-lg-offset-6"></label><a href="pensionistasinactivos.jsp" class="btn btn-primary right">Pensionistas Inactivos</a></h1>
    <div class="table-responsive">
        <table id="tj" class="table table-striped well">
            <thead>
                <tr>
                    <th>#</th>
                    <th hidden>ID</th>
                    <th>Nombres y Apellidos</th>
                    <th>Dni</th> 
                    <th>N_Celular</th> 
                    <th>Direccion</th> 
                    <th>Inicio de Pension</th>
                    <th>Fin de Pension</th>  
                    <th>Precio</th>   
                    <th>Fecha de Pago</th> 
                    <th>Vigencia</th>
                    <th colspan="3">Acciones</th>                                    
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    Pensionistadao dao = new PensionistadoaImpl();
                    List<Listar_pensionista> lista = dao.ListarPensionista();
                    for (Listar_pensionista listar_pensionista : lista) {
                        count++;
                    
                %>
                <tr>
                    <td><%=count%>.</td>
                    <td hidden><%=listar_pensionista.getIdContrato()%></td>
                    <td hidden><%=listar_pensionista.getIdPersona()%></td>
                    <td><%=listar_pensionista.getNombres()%>&nbsp;<%=listar_pensionista.getApellidos()%></td>
                    <td><%=listar_pensionista.getDni()%></td>
                    <td><%=listar_pensionista.getNCelular()%></td>
                    <td><%=listar_pensionista.getDireccion()%></td>
                    <td><%=listar_pensionista.getFechaInicio().substring(0,10)%></td>
                    <td><%=listar_pensionista.getFechaFin().substring(0,10)%></td>
                    <td>S/.&nbsp;<%=listar_pensionista.getPrecioPension()%></td>
                    <td><%=listar_pensionista.getFechaPago()%></td>
                    <td><%=listar_pensionista.getVigencia()%>&nbsp;Días</td>
                    <td><p><a class="btn btn-primary" title="Modificar Contrato del Pensionista" href="modificarcontrato.jsp?idcontrato=<%=listar_pensionista.getIdContrato()%>&idpersona=<%=listar_pensionista.getIdPersona()%>&nombres=<%=listar_pensionista.getNombres()%>&apellidos=<%=listar_pensionista.getApellidos()%>&dni=<%=listar_pensionista.getDni()%>&ncelular=<%=listar_pensionista.getNCelular()%>&direcciones=<%=listar_pensionista.getDireccion()%>" role="button"><i class="glyphicon glyphicon-pencil"></i></a></p></td>
                    <td><p><a class="btn btn-danger" title="Eliminar" onclick="if(!confirm('Esta seguro de eliminar a <%=listar_pensionista.getNombres()%> <%=listar_pensionista.getApellidos()%> y todos sus registros'))return false" role="button" href="pensionistas.jsp?opcion=delete&idcontrato=<%=listar_pensionista.getIdContrato()%>"><i class="glyphicon glyphicon-trash"></i></a></p></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </div>    
</div>
</body>

<script src="jquery/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/holder.js"></script>
<script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>

</html>
