
<%@include file="WEB-INF/productos/productostop.jspf"%>

<div class="table-responsive col-sm-6 col-sm-offset-2 col-md-12 col-md-offset-1 main">
    <h1 class="sub-header">Lista de Postres</h1>
    <table class="table table-striped well">
        <thead>
            <tr>
                <th>#</th>
                <th>Nombre del Postre</th>
                <th>Precio Pensionistas</th>
                <th>Precio a Varios</th>
                <th>Stock</th> 
                <th>Modificar</th>
                <th>Eliminar</th>                                    
            </tr>
        </thead>
        <tbody>
            <%
                Productodao dao = new ProductodaoImpl();

                for (Producto prod : dao.ListPostres()) {
                    count++;
            %>
            <tr>
                <td><%=count%>.</td>
                <td><%=prod.getNombreProducto()%></td>
                <td>prod.getPrecio()</td>
                <td><%=prod.getStock()%></td>
                <td><p><a class="btn btn-primary" href="postres.jsp?id=" title="Modificar" role="button"><i class="glyphicon glyphicon-edit"></i></a></p></td>
                <td><p><a class="btn btn-danger" role="button" title="Eliminar" href="postres.jsp?opcion=delete&id=<%=prod.getIdProducto()%>"><i class="glyphicon glyphicon-trash"></i></a></p></td>
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