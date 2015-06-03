<%@include file="WEB-INF/productos/productostop.jspf" %>

<div class="table-responsive col-sm-6 col-sm-offset-2 col-md-12 col-md-offset-1 main">
    <h1 class="sub-header">Lista de Platos</h1>
    <table class="table table-striped well">
        <thead>
            <tr>
                <th>#</th>
                <th>Nombre del Plato</th>
                <th>Precio Pencionistas</th>
                <th>Precio a Varios</th>
                <th>Stock</th> 
                <th>Modificar</th>
                <th>Eliminar</th>                                    
            </tr>
        </thead>
        <tbody>
            <%
                int count = 0;
                Productodao dao = new ProductodaoImpl();

                for (Producto prod : dao.ListarPlatos()) {
                    count++;

            %>
            <tr>
                <td><%=count%>.</td>
                <td><%=prod.getNombreProducto()%></td>
                <td><%=prod.getPrecioPensionista()%></td>
                <td><%=prod.getPrecioAVarios()%></td>
                <td><%=prod.getStock()%></td>
                <td><p><a class="btn btn-primary" href="platos.jsp?id=" title="Modificar" role="button"><i class="glyphicon glyphicon-edit"></i></a></p></td>
                <td><p><a class="btn btn-danger" role="button" title="Eliminar" href="platos.jsp?opcion=delete&id=<%=prod.getIdProducto()%>"><i class="glyphicon glyphicon-trash"></i></a></p></td>
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