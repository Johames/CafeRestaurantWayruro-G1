
<%@include file="WEB-INF/productos/productostop.jspf" %>
<%
    
            Producto pro=new Producto(); 
            Productodao dao = new ProductodaoImpl(); 
            String alert = "";            
            if(opcion.equals("modificar")){
                pro.setNombreProducto(nombrePro);
                pro.setPrecio(precio);
                pro.setIdCategoria(idCategoria);
                pro.setIdUsuario(idUsuario);
                if(dao.UpdateProducto(pro, id)){
                    response.sendRedirect("platos.jsp?idCategoria=1&nombreCat=Menu");
                    
                }else{
                  alert = "danger";
                  mensaje="No se pudo modificar el Producto";                      
                }            
            }
%>
<div class="container">
    <div class="row">
        
        <div class="col-md-2"></div>
          <div class="col-md-8 well">
            <div class="title">
                <div class="tipo">
                    <h2><b>Modificar Producto</b></h2>
                    <br>
                </div>
            </div>
            <div class="formu">
                <form class="form-horizontal" action="modproducto.jsp" method="post">
                    <input type="hidden" name="opcion" value="modificar">
                    <div class="form-group" hidden>
                        <label class="control-label col-xs-3">id :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="id" value="<%=idProducto%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Nombre:</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="nombrePro" value="<%=nombrePro%>" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Precio:</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="precio" value="<%=precio%>">
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="control-label col-xs-3">Categoria :</label>
                        <div class="col-xs-4">
                            <select class="form-control" name="idCategoria">
                                <option selected="selected" hidden>Seleccionar Categoria</option>
                                <%                                                        
                                    Categoriadao categoriadao = new CategoriadaoImpl();
                                    for (Categoria cate : categoriadao.ListarCategoria()) {
                                        count++;
                                %>
                                <option value="<%=cate.getIdCategoria()%>"><%=cate.getNombreCat()%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" hidden>
                        <label class="control-label col-xs-3">Usuario :</label>
                        <div class="col-xs-6">
                            <input type="number" class="form-control" value="<%=idUsuario%>" name="idUsuario" readonly>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <div class="col-xs-offset-3 col-xs-9">
                            <input type="submit" class="btn btn-primary" value="Enviar">
                            <input type="reset" class="btn btn-default" value="Limpiar">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>

<script src="jquery/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/holder.js"></script>
<script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>
</html>
