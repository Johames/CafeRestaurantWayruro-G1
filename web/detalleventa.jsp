<%@include file="WEB-INF/detalleventa/detalleventatop.jspf" %>

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
                                <th>Compra</th>
                                <th>Productos</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="col-xs-6">
                                    <form class="form-horizontal" action="" name="form1">
                                        <div> 
                                            <div class="form-group col-md-7">
                                                <input type="text" class="form-control" name="" placeholder="Nombre del Producto" readonly> 
                                            </div>
                                        </div>
                                        <div class="col-xs-4">
                                            <input type="number" title="Solo Números" pattern="[0-9]{1,10}" class="form-control" placeholder="Cant.">
                                        </div>
                                        <div class="col-xs-1">
                                            <button class="btn btn-primary" type="submit">OK</button>
                                        </div><br><br><br>
                                    </form>
                                    <form class="form-horizontal" action="" name="form2">
                                        <div class="table-responsive">
                                            <table class="table table-striped well">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Cantidad</th>
                                                        <th>Producto</th>
                                                        <th>Precio</th>
                                                        <th>Sub Total</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td>
                                                            <p>
                                                                <a title="Editar" href=""><i class="glyphicon glyphicon-pencil"></i></a>&nbsp;&nbsp;
                                                                <a title="Eliminar" href=""><i class="glyphicon glyphicon-trash"></i></a>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <div class="input-group col-lg-5">
                                                <label class="form-group col-xs-2"></label>
                                                <input type="submit" class="btn btn-primary" value="Confirmar Venta">&nbsp;
                                                <input type="submit" class="btn btn-default" value="Cancelar">
                                            </div>
                                        </div>
                                    </form>
                                </td>
                                <td class="col-xs-5">
                                    <form class="form-horizontal" action="" name="form">
                                        <div class="form-group">
                                            <label class="control-label col-xs-3">Buscar por:</label>
                                            <div class="col-md-4">
                                                <select class="form-control" name="categoria">
                                                    <option selected="selected" hidden>Seleccionar</option>
                                                    <%                                                        int count = 0;
                                                        for (Categoria cat : productodao.ListarCategoria()) {
                                                            count++;
                                                    %>
                                                    <option value="<%=cat.getIdCategoria()%>"><%=cat.getNombreCat()%></option>
                                                    <%}%>
                                                </select>
                                            </div>
                                            <%
                                                String buscarpro = request.getParameter("buscarpro");
                                                buscarpro = buscarpro == null ? "" : buscarpro;
                                                String opcion2 = request.getParameter("opcion1");
                                                opcion2 = opcion2 == null ? "buscar" : opcion2;

                                                String nombre = request.getParameter("buscarpro");
                                                nombre = nombre == null ? "" : nombre;

                                                if (opcion2.equals("buscar")) {

                                            %>
                                            <div hidden>
                                                <div class="col-lg-pull-0">
                                                    <div class="input-group">
                                                        <input type="text" name="buscarpro" class="form-control" title="Nombre del Producto" placeholder="Producto">
                                                        <span class="input-group-btn">
                                                            <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-search"></i></button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
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
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Productos</th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%                                                            int coun = 0;
                                                            List<Producto> lista = productodao.ListProductos(nombre);
                                                            for (Producto producto : lista) {
                                                                coun++;

                                                        %>
                                                        <tr>
                                                            <td><%=coun%></td>
                                                            <td><%=producto.getNombreProducto()%></td>
                                                            <td><p><a class="btn btn-primary" title="Agregar a la Venta" href="detalleventa.jsp" role="button"><i class="glyphicon glyphicon-share-alt"></i></a></p></td>
                                                        </tr>
                                                        <%}%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <%}%>
                                    </form>
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
