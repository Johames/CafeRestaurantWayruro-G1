<%@include file="WEB-INF/usuario/usuariotop.jspf" %>

<div class="container">
    <%
        
        String opcion = request.getParameter("opcion");
        opcion = opcion == null ? "" : opcion;
        String id = request.getParameter("id");
        id = id == null ? "" : id;
        String mensaje = "";

        if (opcion.equals("delete")) {

            if (usuariodao.EliminarUsuario(Integer.parseInt(id))) {

                mensaje = "Se elimino correctamente";

            } else {

                mensaje = "Ocurrio un error al Eliminar";

            }
        }
    %>
    <h1 class="sub-header">Lista de Usuarios</h1>
    <div class="table-responsive">
        <table class="table table-striped well">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Nombres</th>
                    <th>Usuario</th>
                    <th>Rol</th>
                    <th>Modificar</th>
                    <th>Eliminar</th>                                   
                </tr>
            </thead>
            <tbody>
                <%
                    Usuariodao dao = new UsuariodaoImpl();
                    int coun = 0;
                    for (Listar_Usuario user : dao.ListarUsuario()) {
                        coun++;

                %>
                <tr>
                    <td><%=coun%>.</td>
                    <td><%=user.getNombres()%>&nbsp;<%=user.getApellidos()%></td>
                    <td><%=user.getUsuario()%></td>
                    <td><%=user.getNombre_rol()%></td>
                    <td><p><a class="btn btn-primary" href="modusuario.jsp?id=<%=user.getIdPersona()%>" role="button"><i class="glyphicon glyphicon-pencil"></i></a></p></td>
                    <td><p><a class="btn btn-danger" onclick="if(!confirm('Esta seguro de eliminar a <%=user.getNombres()%><%=user.getApellidos()%>'))return false" role="button" href="Usuario.jsp?opcion=delete&id=<%=user.getIdPersona()%>"><i class="glyphicon glyphicon-trash"></i></a></p></td>
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