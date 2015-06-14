<%@include file="WEB-INF/pensionistas/pensionistastop.jspf" %>

<input type="hidden" name="idPersona" value="<%=idPersona%>" size="10">
        
<div class="container-fluid">
    <h1 class="sub-header">Lista de Pensionistas</h1>
    <%        
    
        Personadao persona = new PersonadaoImpl();
    
        String opcion = request.getParameter("opcion"); opcion = opcion == null ? "" : opcion;
        String id = request.getParameter("id_contrato"); id = id == null ? "" : id;

        if (opcion.equals("delete")) {

            if (persona.EliminarPersona(Integer.parseInt(id))) {

                mensaje = "Se elimino correctamente";

            } else {

                mensaje = "Ocurrio un error al Eliminar";

            }
        }
    %>
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
                    <th colspan="3">Acciones</th>                                    
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    Pensionistadao dao = new PensionistadoaImpl();
                    List<Listar_pensionista> lista = dao.ListarPensionista(nomb);
                    for (Listar_pensionista per : lista) {
                        count++;
                        
                %>
                <tr>
                    <td><%=count%>.</td>
                    <td hidden><%=per.getIdPersona()%></td>
                    <td><%=per.getNombres()%>&nbsp;<%=per.getApellidos()%></td>
                    <td><%=per.getDni()%></td>
                    <td><%=per.getNCelular()%></td>
                    <td><%=per.getDireccion()%></td>
                    <td><%=per.getFechaInicio().substring(0,10)%></td>
                    <td><%=per.getFechaFin().substring(0,10)%></td>
                    <td>$.&nbsp;<%=per.getPrecioPension()%></td>
                    <td><%=per.getFechaPago().substring(0,10)%></td>
                    <td><p><a class="btn btn-primary" title="Renovar Contrato del Pencionista" href="renovar.jsp?idpersona=<%=per.getIdPersona()%>&nombres=<%=per.getNombres()%>&apellidos=<%=per.getApellidos()%>
                              &dni=<%=per.getDni()%>&ncelular=<%=per.getNCelular()%>&direcciones=<%=per.getDireccion()%>
                              &precioPension=<%=per.getPrecioPension()%>&pago=<%=per.getFechaPago().substring(0,10)%>" role="button"><i class="glyphicon glyphicon-refresh"></i></a></p></td>
                    <td><p><a class="btn btn-primary" title="Modificar Contrato del Pencionista" href="modificarpen.jsp role="button><i class="glyphicon glyphicon-pencil"></i></a></p></td>
                    <td><p><a class="btn btn-danger" title="Eliminar" onclick="if(!confirm('Esta seguro de eliminar a <%=per.getNombres()%> <%=per.getApellidos()%>'))return false" role="button" href="pensionistas.jsp?opcion=delete&id=<%=per.getIdContrato()%>"><i class="glyphicon glyphicon-trash"></i></a></p></td>
                </tr>
                <%}%>
                <%=mensaje%>
            </tbody>
        </table>
    </div>    
</div>
<%}%>
</body>

<script src="jquery/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/holder.js"></script>
<script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>

</html>