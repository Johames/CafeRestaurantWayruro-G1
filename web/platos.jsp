<%@include file="WEB-INF/productos/productostop.jspf" %>

<div class="table-responsive col-sm-6 col-sm-offset-2 col-md-12 col-md-offset-1 main">
    <h1 class="sub-header">Lista de <%=nombreCat%></h1>
    <table class="table table-striped well" id="la">
        <thead>
            <tr>
                <th>#</th>
                <th>Nombre del Plato</th>
                <th>Precio </th>
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
                    
                      if(opcion.equals("modificar")){
                    Producto producto = new Producto();
                    producto.setIdProducto(idProducto);
                    if(dao.UpdateProducto(producto)){
                        mensaje=" Se actualizo Correctamente <a href='platos.jsp'>Lista</a>";
                    }else{
                        mensaje = "no se pudo actualizar";
                    }
                    
                        
                    }

            %>
            <tr>
                <td><%=coun%>.</td>
                <td><%=prod.getNombreProducto()%></td>
                <td><%=prod.getPrecio()%></td>
                <td><p><a class="btn btn-primary" href="platos.jspopcion=modificar&id=<%=prod.getIdProducto()%>" title="Modificar" role="button" ><i class="glyphicon glyphicon-edit" ></i></a></p></td>
                <td><p><a class="btn btn-danger" onclick="if(!confirm('�Esta seguro de eliminar este Producto?'))return false" role="button" title="Eliminar" href="platos.jsp?opcion=delete&id=<%=prod.getIdProducto()%>"><i class="glyphicon glyphicon-trash"></i></a></p></td>
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