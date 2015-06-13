
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
                    <div class="form-group" hidden>
                        <label class="control-label col-xs-3">id :</label>
                        <div class="col-xs-6">
                            <input type="tex" class="form-control" name="idPerson" value="<%=idPerson%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Nombres :</label>
                        <div class="col-xs-6">
                            <input type="tex" class="form-control" value="<%=nombre%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Apellidos :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" value="<%=apellido%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">DNI :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" value="<%=dn%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">N� de Celular :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" value="<%=NCelular%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Direcci�n :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" value="<%=direccion%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Inicio de la Pensi�n :</label>
                        <div class="col-xs-3">
                            <input type="date" class="form-control" name="fechaInicio">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Fin de la Pensi�n :</label>
                        <div class="col-xs-3">
                            <input type="date" class="form-control" name="fechaFin">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Costo de la Pension :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="p_pen" value="<%=p_pen%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Fecha de Pago :</label>
                        <div class="col-xs-3">
                            <input type="date" class="form-control" name="fechaFin">
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
                    <div class="form-group">
                        <label class="control-label col-xs-3">id Usuario :</label>
                        <div class="col-xs-6">
                            <input type="number" class="form-control" name="" value="<%=idU%>" readonly>
                        </div>
                    </div>
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
