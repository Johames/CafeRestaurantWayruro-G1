
<%@include file="WEB-INF/pensionistas/renovartop.jspf"%>

<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8 well">
            <div class="title">
                <form class="tipo">
                    <h2><b>Renovar Contrato</b></h2>
                    <br>
                </form>
            </div>
            <div class="formu">
                <form class="form-horizontal" action="">
                    <div class="form-group">
                        <label class="control-label col-xs-3">Nombres :</label>
                        <div class="col-xs-6">
                            <input type="tex" class="form-control" placeholder="Nombres" name="nombres" value="<%=nombre%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Apellidos :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" placeholder="Apellidos" name="apellidos" value="<%=apellido%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">DNI :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" placeholder="DNI" name="dni" value="<%=dn%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">N° de Celular :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" placeholder="N° de Celular" name="ncelular" value="<%=NCelular%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Dirección :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" placeholder="Dirección" value="<%=direccion%>" name="direcciones" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Inicio de la Pensión :</label>
                        <div class="col-xs-3">
                            <input type="date" class="form-control" name="fechaInicio">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Fin de la Pensión :</label>
                        <div class="col-xs-3">
                            <input type="date" class="form-control" name="fechaFin">
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
