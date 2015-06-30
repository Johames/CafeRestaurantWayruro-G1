
<%@page import="proy.modelo.entidad.AgregarVenta"%>
<%@page import="proy.modelo.entidad.Tipo_Venta"%>
<%@page import="proy.modelo.entidad.Total_venta"%>
<%@page import="proy.modelo.entidad.AgregarMov"%>
<%@page import="proy.modelo.daoImpl.MovimientosdaoImpl"%>
<%@page import="proy.modelo.dao.Movimientosdao"%>
<%@page import="proy.modelo.daoImpl.ControldaoImpl"%>
<%@page import="proy.modelo.dao.Controldao"%>
<%@page import="proy.modelo.entidad.Controldia"%>
<%@include file="WEB-INF/detalleventa/detalleventatop.jspf" %>

<%
    detalledao dao = new detalledaoImpl();
    Ventadao ventadao = new VentadaoImpl();
    Controldao concontroldao = new ControldaoImpl();
    Controldia control = new Controldia();
    Detalle detalle = new Detalle();
    Producto producto = new Producto();
    Movimientosdao mov = new MovimientosdaoImpl();
    AgregarMov agregarMov = new AgregarMov();
    AgregarVenta venta = new AgregarVenta();
        
    String opcion = request.getParameter("opcion"); opcion = opcion == null?"":opcion;
    String opc = request.getParameter("opc"); opc = opc == null?"":opc;
    
    String nombres = request.getParameter("nombres"); nombres = nombres == null?"":nombres;
    String idContrato = request.getParameter("idContrato"); idContrato = idContrato == null?"":idContrato;
            
    String idProducto = request.getParameter("idProducto"); idProducto = idProducto == null?"":idProducto;
    String nombreProducto = request.getParameter("nombreProducto"); nombreProducto = nombreProducto == null?"":nombreProducto;
    String precio = request.getParameter("precio"); precio = precio == null?"":precio;
    String cantidad = request.getParameter("cantidad"); cantidad = cantidad == null?"":cantidad;
    String idventa = request.getParameter("idventa"); idventa = idventa == null?"":idventa;
    String idv = request.getParameter("idv"); idv = idv == null?"":idv;
    String idp = request.getParameter("idp"); idp = idp == null?"":idp;
    String tipo = request.getParameter("tipo"); tipo = tipo == null?"":tipo;
    String total = request.getParameter("total"); total = total == null?"":total;
    if(opcion.equals("control")){
        if(!opc.equals("") && !idContrato.equals("")){
            control.setOpc(opc);
            control.setIdContrato(idContrato);
            concontroldao.AgregarControl(control);
        }
        if(!tipo.equals("")){
            venta.setTipo(tipo);
            venta.setIdUsuario(idUsuario);
            if(ventadao.Agregar(venta)){
                idventa = ventadao.BuscarId();
                response.sendRedirect("detalleventa.jsp?opcion=control&nombres="+nombres+"&idContrato="+idContrato+"&idventa="+idventa);
            }
        }
    }
    if(opcion.equals("controlar")){
        if(!opc.equals("") && !idContrato.equals("")){
            control.setOpc(opc);
            control.setIdContrato(idContrato);
            if(concontroldao.AgregarControl(control)){
                response.sendRedirect("detalleventa.jsp?idventa="+idventa);
            }
        }
    }
    if(idProducto != ""){
        producto = dao.BuscarProducto(idProducto);
    }
if(opcion.equals("agrega")){
        detalle.setIdVenta(idventa);
        detalle.setIdProducto(idProducto);
        detalle.setPrecioUnitario(precio);
        detalle.setCantProducto(cantidad);
        dao.AgregarDetalle(detalle);
    }
    if (opcion.equals("delete")) {
        dao.EliminarDetalle(idv, idp);
    }
    if(opcion.equals("editar")){
        detalle.setCantProducto(cantidad);
        dao.ModificarDetalle(detalle, idp, idv);
    }
    if(opcion.equals("cancelar")){
        dao.EliminarVenta(idv);
        response.sendRedirect("venta.jsp");
    }
    if(opcion.equals("confirmar")){
        if(!tipo.equals("") && !total.equals("") && !idventa.equals("")){
            agregarMov.setIdventa(idventa);
            agregarMov.setTipo(tipo);
            agregarMov.setTotal(total);
            agregarMov.setIdu(idUsuario);
            if(mov.AgregarMovimiento(agregarMov)){
                response.sendRedirect("venta.jsp");
            }
        }
    }
    if(opcion.equals("control")){
        
    }
%>

<div class="container">
    <div class="form-group"> 
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-12 well">
                <div class="title">
                    <form class="tipo">
                        <h1><b>Detalle de Venta</b></h1>
                        <br>
                    </form>
                </div>
                <div class="table-responsive col-md-12">
                    <table class="table table-striped well">
                        <thead>
                            <tr>
                            <th>Venta</th>
                            <th>Productos</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            <td class="col-xs-6">
                                    <%
                                        if(opcion.equals("control")){
                                    %>
                                    <div class="title">
                                        <div class="tipo">
                                            <h3><b>Control de Pensionistas</b></h3>
                                            <br>
                                        </div>
                                    </div>
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="control-label col-xs-3">Nombres:</label>
                                            <div class="col-xs-6">
                                                <input type="text" class="form-control" value="<%=nombres%>" readonly>
                                            </div>
                                        </div>
                                        <div>
                                            <form action="detalleventa.jsp" method="post">
                                                <input type="hidden" name="opcion" value="controlar">
                                                <input type="hidden" name="idventa" value="<%=idventa%>">
                                                <input type="hidden" name="idContrato" value="<%=idContrato%>">
                                                <table class="table table-striped well">
                                                    <thead>
                                                        <tr>
                                                        <th>Desayuno</th>
                                                        <th>Almuerzo</th>
                                                        <th>Cena</th>
                                                        <th>Registrar</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                        <td>
                                                            <input type="checkbox" name="opc" value="2">
                                                        </td>
                                                        <td>
                                                            <input type="checkbox" name="opc" value="3">
                                                        </td>
                                                        <td>
                                                            <input type="checkbox" name="opc" value="4">
                                                        </td>
                                                        <td><input type="submit" value="Enviar"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </form>
                                        </div>
                                    </div>
                                    <%}%>
                                <%
                                    if(opcion.equals("Agregar")){
                                %>
                                <form action="detalleventa.jsp" method="get">
                                    <input type="hidden" name="idventa" value="<%=idventa%>" >
                                    <input type="hidden" name="idProducto" value="<%=idProducto%>" >
                                    <input type="hidden" name="opcion" value="agrega" >
                                    <div class="table-responsive">
                                        <table class="table table-striped well">
                                            <thead>
                                                <tr>
                                                <th>Producto</th>
                                                <th>Precio</th>
                                                <th>Cantidad</th>
                                                <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                <td><%=nombreProducto%></td>
                                                <td><input class="form-control col-md-1" type="text" name="precio" value="<%=precio%>" readonly></td>
                                                <td><input class="form-control col-md-1" type="number" name="cantidad"></td>
                                                <td><input class="btn btn-primary" type="submit" value="OK"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </form>
                                 <%}%>   
                                    <div class="table-responsive">
                                        <table class="table table-striped well">
                                            <thead>
                                                <tr>
                                                <th>#</th>
                                                <th>Producto</th>
                                                <th hidden>Id Producto</th>
                                                <th>Precio</th>
                                                <th>Cantidad</th>
                                                <th>Sub Total</th>
                                                <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                        int count = 0;
                                                        for(int i=0; i<dao.ListarDetalle(idventa).size(); i++){
                                                            detalle = dao.ListarDetalle(idventa).get(i);
                                                                count++;
                                                %>
                                                <tr>
                                                <td><%=count%></td>
                                                <td><%=detalle.getNombreProducto()%></td>
                                                <td><%=detalle.getPrecioUnitario()%></td>
                                                <td><%=detalle.getCantProducto()%></td>
                                                <td><%=detalle.getSubtotal()%></td>
                                                <td>
                                                    <p>
                                                        <a title="Editar" href="detalleventa.jsp?opcion=update&idv=<%=idventa%>&idp=<%=detalle.getIdProducto()%>&idventa=<%=idventa%>"><i class="glyphicon glyphicon-pencil"></i></a>&nbsp;&nbsp;
                                                        <a title="Eliminar" onclick="if(!confirm('¿Esta seguro de eliminar este producto de la venta?'))return false" href="detalleventa.jsp?opcion=delete&idv=<%=idventa%>&idp=<%=detalle.getIdProducto()%>&idventa=<%=idventa%>"><i class="glyphicon glyphicon-trash"></i></a>
                                                    </p>
                                                </td>
                                                <%}%>
                                                <%
                                                    Total_venta tv = new Total_venta();
                                                    tv = dao.total(idventa);
                                                %>
                                                <tr>             
                                                    <td></td>
                                                    <td></td>
                                                    <td><b>TOTAL</b></td>
                                                    <td><b><%=tv.getTotal()%></b></td> 
                                                    <td></td>
                                                    <td></td>             
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <br><br>
                                    <%
                                        if(opcion.equals("update")){
                                            detalle = dao.BuscarProductoVendido(idv, idp);
                                    %>
                                    <form action="detalleventa.jsp" method="get">
                                        <input type="hidden" name="idventa" value="<%=idventa%>">
                                        <input type="hidden" name="idProducto" value="<%=detalle.getIdProducto()%>">
                                        <input type="hidden" name="idv" value="<%=idventa%>">
                                        <input type="hidden" name="idp" value="<%=detalle.getIdProducto()%>">
                                        <input type="hidden" name="opcion" value="editar" >
                                        <div class="table-responsive">
                                            <table class="table table-striped well">
                                                <thead>
                                                    <tr>
                                                    <th>Producto</th>
                                                    <th>Precio</th>
                                                    <th>Cantidad</th>
                                                    <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                    <td><%=detalle.getNombreProducto()%></td>
                                                    <td><input class="form-control col-md-1" type="text" name="" value="<%=detalle.getPrecioUnitario()%>" readonly></td>
                                                    <td><input class="form-control col-md-1" type="number" name="cantidad" value="<%=detalle.getCantProducto()%>"></td>
                                                    <td><input class="btn btn-primary" type="submit" value="Actualizar"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </form>
                                     <%}%>
                                    <br>
                                    <div class="form-group">
                                        <div class="input-group col-lg-3">
                                            <label class="form-group col-xs-1"></label>
                                            <form action="detalleventa.jsp" method="post">
                                                <input type="hidden" name="opcion" value="confirmar">
                                                <input type="submit" class="btn btn-primary" value="Confirmar Venta">&nbsp;
                                            </form>
                                            <form action="detalleventa.jsp" method="post">
                                                <input type="hidden" name="opcion" value="cancelar">
                                                <input type="hidden" name="idv" value="<%=idventa%>">
                                                <input type="submit" class="btn btn-default" value="Cancelar">
                                            </form>
                                        </div>
                                    </div>
                            </td>
                            <td class="col-xs-5">
                                    <div class="form-group">
                                        <script type="text/javascript">
                                            function filter(phrase, _id) {
                                                var words = phrase.value.toLowerCase().split(" ");
                                                var table = document.getElementById(_id);
                                                var ele;
                                                for (var r = 1; r < table.rows.length; r++) {
                                                    ele = table.rows[r].innerHTML.replace(/<[^>]+>/g, "");
                                                    var displayStyle = 'none';
                                                    for (var i = 0; i < words.length; i++) {
                                                        if (ele.toLowerCase().indexOf(words[i]) >= 0)
                                                            displayStyle = '';
                                                        else {
                                                            displayStyle = 'none';
                                                            break;
                                                        }
                                                    }
                                                    table.rows[r].style.display = displayStyle;
                                                }
                                            }
                                        </script>
                                        <div>
                                            <div class="col-lg-pull-0">
                                                <div class="input-group">
                                                    <input name="filt" onkeyup="filter(this, 'jt', '1')" type="text"class="form-control" placeholder="Nombre a Buscar" autofocus>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="formu">
                                        <div class="table-responsive">
                                            <table id="jt" class="table table-striped well">
                                                <thead>
                                                    <tr hidden>
                                                    <th>#</th>
                                                    <th>Id Producto</th>
                                                    <th>Productos</th>
                                                    <th>Precio</th>
                                                    <th>Enviar</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%                                                            
                                                        int u = 0;
                                                        List<Producto> lista = productodao.ListarProductos();
                                                        for (Producto prod : lista) {
                                                            u++;

                                                    %>
                                                    <tr>
                                                    <td><%=u%></td>
                                                    <td hidden><%=prod.getIdProducto()%></td>
                                                    <td><%=prod.getNombreProducto()%></td>
                                                    <td hidden><%=prod.getPrecio()%></td>
                                                    <td>
                                                        <a href="detalleventa.jsp?idProducto=<%=prod.getIdProducto()%>&nombreProducto=<%=prod.getNombreProducto()%>&precio=<%=prod.getPrecio()%>&idventa=<%=idventa%>&opcion=Agregar"><i class="glyphicon glyphicon-send"></i></a>
                                                    </td>
                                                    </tr>
                                                    <%}%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                            </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
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
