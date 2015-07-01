<%@include file="WEB-INF/productos/productostop.jspf" %>

<div class="table-responsive col-sm-6 col-sm-offset-2 col-md-12 col-md-offset-1 main">
    <h1 class="sub-header">Lista de <%=nombreCat%></h1>
    <table class="table table-striped well" id="la">
        <thead>
            <tr>
                <th>#</th>
                <th hidden>ID </th>
                <th>Nombre del Plato</th>
                <th>Precio </th>
                <th hidden>IDC </th>
                <th hidden>IDU </th>
                <th>Modificar</th>
                <th>Eliminar</th>                                    
            </tr>
        </thead>
        <tbody>
            <%    
                Productodao dao = new ProductodaoImpl();
                    int coun = 0;
                for (Producto prod : dao.Listar(idCategoria)) {
                    coun++;
                    
            %>
            <tr>
                <td><%=coun%>.</td>
                <td hidden><%=prod.getIdProducto()%></td>
                <td><%=prod.getNombreProducto()%></td>
                <td><%=prod.getPrecio()%></td>
                <td hidden><%=prod.getIdCategoria()%></td>
                <td hidden><%=prod.getIdUsuario()%></td>
                <td><p><a class="btn btn-primary" href="modproducto.jsp?idProducto=<%=prod.getIdProducto()%>&nombrePro=<%=prod.getNombreProducto()%>&precio=<%=prod.getPrecio()%>" title="Modificar" role="button" ><i class="glyphicon glyphicon-edit" ></i></a></p></td>
                <td><p><a class="btn btn-danger"  role="button" title="Eliminar" href="#"><i class="glyphicon glyphicon-trash"></i></a></p></td>
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