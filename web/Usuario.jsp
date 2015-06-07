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
                    <th>Usuario</th>
                    <th>Contraseņa</th>
                    <th>Rol</th>
                    <th>Modificar</th>
                    <th>Eliminar</th>                                   
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    Usuariodao dao = new UsuariodaoImpl();

                    for (Usuario user : dao.ListarUsuario()) {
                        count++;

                %>
                <tr>
                    <td><%=count%>.</td>
                    <td><%=user.getUsuario()%></td>
                    <td><%=user.getContrasena()%></td>
                    <td></td>
                    <td><p><a class="btn btn-primary" href="modusuario.jsp?id=" role="button"><i class="glyphicon glyphicon-edit"></i></a></p></td>
                    <td><p><a class="btn btn-danger" role="button" href="Usuario.jsp?opcion=delete&id=<%=usuario.getIdUsuario()%>"><i class="glyphicon glyphicon-trash"></i></a></p></td>
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