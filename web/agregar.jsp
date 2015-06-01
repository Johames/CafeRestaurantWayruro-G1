<%@include file="WEB-INF/pensionistas/agregartop.jspf" %>

<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8 well">
            <div class="title">
                <form class="tipo">
                    <h2><b>Agregar Pensionista</b></h2>
                    <br>
                </form>
            </div>
            <div class="formu">
                <form class="form-horizontal" action="">
                    <div class="form-group">
                        <label class="control-label col-xs-3">Nombres:</label>
                        <div class="col-xs-6">
                            <input type="tex" class="form-control" name="nombres" placeholder="Nombres" autofocus>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Apellidos:</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="apellidos" placeholder="Apellidos">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">DNI:</label>
                        <div class="col-xs-6">
                            <input type="text" title="Solo Números (8 en total)" name="dni" pattern="[0-9]{8}" class="form-control" placeholder="DNI">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">N° de Celular:</label>
                        <div class="col-xs-6">
                            <input type="text" title="Solo Números (9 en total)" pattern="[0-9]{1,10}" name="ncelular" class="form-control" placeholder="N° de Celular">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Dirección:</label>
                        <div class="col-xs-6">
                            <textarea rows="3" class="form-control"  name="direccion" placeholder="Dirección"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Inicio de la Pensión:</label>
                        <div class="col-xs-3">
                            <input type="date" class="form-control"name="fechaInicio">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Fin de la Pensión:</label>
                        <div class="col-xs-3">
                            <input type="date" class="form-control" name="fechaFin">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Costo de la Pension:</label>
                        <div class="col-xs-3">
                            <input type="number" class="form-control"name="precioPencion">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Pago? :</label>
                        <div class="col-xs-4">
                            <select class="form-control" name="estado">
                                <option selected="selected" hidden="">Seleccionar</option>
                                <option value="1">Si</option>
                                <option value="0">No</option>
                            </select>
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
            <%=mensaje%>
        </div>
    </div>
</div>
</body>

<script src="jquery/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/holder.js"></script>
<script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>
</html>
