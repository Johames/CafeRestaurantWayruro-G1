<%@page import="java.util.List"%>
<%@include file="WEB-INF/usuario/usuariotop.jspf" %>

<div class="container">
    <%
        
        String opcion = request.getParameter("opcion");opcion = opcion == null ? "" : opcion;
        String id = request.getParameter("id");id = id == null ? "" : id;
        String mensaje = "";

        if (opcion.equals("delete")) {

            if (usuariodao.EliminarUsuario(id)) {

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
                    <th hidden>Contraseņa</th>
                    <th hidden>Estado</th>
                    <th>Rol</th>
                    <th>Modificar</th>
                    <th>Eliminar</th>                                   
                </tr>
            </thead>
            <tbody>
                <%  
        
                    int coun = 0;
                    List<Listar_Usuario> lista = listaus;
                    for (Listar_Usuario user : lista) {
                        coun++;

                %>
                <tr>
                    <td><%=coun%>.</td>
                    <td hidden><%=user.getIdUsuario()%></td>
                    <td><%=user.getNombres()%>&nbsp;<%=user.getApellidos()%></td>
                    <td><%=user.getUsuario()%></td>
                    <td hidden><%=user.getContrasena()%></td>
                    <td hidden><%=user.getEstado()%></td>
                    <td><%=user.getNombre_rol()%></td>
                    <td><p><a class="btn btn-primary" href="modusuario.jsp?idu=<%=user.getIdUsuario()%>&usuario=<%=user.getUsuario()%>&contra=<%=user.getContrasena()%>&estado=<%=user.getEstado()%>" role="button"><i class="glyphicon glyphicon-pencil"></i></a></p></td>
                    <td><p><a class="btn btn-danger" href="#" ><i class="glyphicon glyphicon-trash"></i></a></p></td>
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