<%@include file="WEB-INF/pensionistas/pensionistastop.jspf" %>

<div class="container">
    <h1 class="sub-header">Lista de Pensionistas</h1>
    <%        
        String opcion = request.getParameter("opcion"); opcion = opcion == null ? "" : opcion;
        String id = request.getParameter("id"); id = id == null ? "" : id;
        String mensaje = "";

        if (opcion.equals("delete")) {

            if (persona.EliminarPersona(Integer.parseInt(id))) {

                mensaje = "Se elimino correctamente";

            } else {

                mensaje = "Ocurrio un error al Eliminar";

            }
        }
    %>
    <div class="table-responsive">
        <table class="table table-striped well">
            <thead>
                <tr>
                    <th>#</th>
                    <th>ID</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>DNI</th>
                    <th>N° de Celular</th>
                    <th>Direccion</th>
                    <th>Inicio de Pension</th>
                    <th>Fin de Pension</th>
                    <th>Renovar</th>
                    <th>Eliminar</th>                                    
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    Pensionistadao dao = new PensionistadoaImpl();

                    for (Persona per : dao.ListarPensionista()) {
                        count++;
                %>
                <tr>
                    <td><%=count%>.</td>
                    <td><%=per.getIdPersona()%></td>
                    <td><%=per.getNombres()%></td>
                    <td><%=per.getApellidos()%></td>
                    <td><%=per.getDni()%></td>
                    <td><%=per.getNCelular()%></td>
                    <td><%=per.getDireccion()%></td>
                    <td></td>
                    <td></td>
                    <td><p><a class="btn btn-primary" href="renovar.jsp?id=<%=per.getIdPersona()%>" role="button"><i class="glyphicon glyphicon-refresh"></i></a></p></td>
                    <td><p><a class="btn btn-danger" role="button" href="pensionistas.jsp?opcion=delete&id=<%=per.getIdPersona()%>"><i class="glyphicon glyphicon-trash"></i></a></p></td>
                </tr>
                <%}%>
                <%=mensaje%>
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