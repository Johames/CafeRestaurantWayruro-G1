<%@include file="WEB-INF/pensionistas/controltop.jspf" %>

<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8 well">
            <div class="title">
                <form class="tipo">
                    <h1><b>Control de Pensionistas</b></h1>
                    <br>
                </form>
            </div>
            <div class="formu">
                <form class="form-horizontal" action="">
                    <div class="form-group">
                        <label class="control-label col-xs-3">Id Contrato:</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" value="<%=idContrato%>" name="idContrato" readonly="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Nombres:</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" value="<%=nombres%><%=apellidos%>" readonly="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Fecha :</label>
                        <div class="col-xs-4">
                            <input type="date" class="form-control">
                        </div> 
                    </div>
                    <div>
                        <table class="table table-striped well">
                            <thead>
                                <tr>
                                    <th>Registrar</th>
                                    <th>Desayuno</th>
                                    <th>Almuerzo</th>
                                    <th>Cena</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td>
                                        <input type="checkbox" class="" name="Desayuno" value="1">
                                    </td>
                                    <td>
                                        <input type="checkbox" class="" name="Almuerzo" value="1">
                                    </td>
                                    <td>
                                        <input type="checkbox" class="" name="Cena" value="1">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
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
