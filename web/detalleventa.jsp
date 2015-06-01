<%@include file="WEB-INF/detalleventa/detalleventatop.jspf" %>

<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8 well">
            <div class="title">
                <form class="tipo">
                    <h1><b>Detalle de Venta</b></h1>
                    <br>
                </form>
            </div>
            <div class="formu">
                <form class="form-horizontal" action="">
                    <div class="form-group">
                        <label class="control-label col-xs-5">Tipo :</label>
                        <div class="col-xs-4">
                            <select class="form-control" name="">
                                <option selected="selected" hidden="">Seleccionar Tipo</option>
                                <option>Venta</option>
                                <option>Registro</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="control-label col-xs-2">Buscar por:</label>
                        <div class="col-xs-4">
                            <select class="form-control" name="categoria">
                                <option selected="selected" hidden="">Seleccionar Categoria</option>
                                <option value="1">Comida</option>
                                <option value="2">Bebida</option>
                                <option value="3">Postres</option>
                            </select>
                        </div>
                        <div class="col-xs-6">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Nombre" autofocus>
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-primary" name=""><i class="glyphicon glyphicon-search"></i></button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <br><br>
                    <div class="form-group">
                        <label class="control-label col-xs-2"></label>
                        <div class="col-xs-5">
                            <input type="text" class="form-control" name="" placeholder="Nombre del Producto" readonly="on">
                        </div>
                        <div class="col-xs-2">
                            <input type="number" title="Solo Numeros (9 en total)" pattern="[0-9]{1,10}" class="form-control" placeholder="cant.">
                        </div>
                        <div class="col-xs-1">
                            <button class="btn btn-primary" type="submit">OK</button>
                        </div>
                    </div>
                    <br><br>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Productos:</label>
                        <div class="col-xs-6">
                            <table class="table table-striped bg-danger">
                                <thead>
                                    <tr>
                                        <th>Nombre del Producto</th>
                                        <th>Cantidad</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Antony</td>
                                        <td>Wilcamango</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <div class="col-xs-offset-2 col-xs-8">
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
