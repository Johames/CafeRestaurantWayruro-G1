<%@include file="WEB-INF/detalleventa/movcompletostop.jspf" %>

<div class="container-fluid">
    <h1 class="sub-header">Todos los Movimientos</h1>
    <div class="table-responsive">
        <table id="tab" class="table table-striped well">
            <thead>
                <tr>
                <th>#</th>
                <th hidden>Id Movimiento</th>
                <th>Registros</th>
                <th hidden>Id Documento</th>
                <th>Fecha</th> 
                <th>Importe</th>
                <th>Usuario</th>                                   
                </tr>
            </thead>
            <tbody>
                <%                    int count = 0;
                    Movimientosdao dao = new MovimientosdaoImpl();
                    List<Listar_Movimientos> lista = dao.Listar();
                    for (Listar_Movimientos list : lista) {
                        count++;

                %>
                <tr>
                <td><%=count%>.</td>
                <td hidden><%=list.getIdMovimiento()%></td>
                <td><%=list.getTipo()%></td>
                <td hidden><%=list.getIdDocumento()%></td>
                <td><%=list.getFecha().substring(0, 10)%></td>
                <td>$.&nbsp;<%=list.getImporte()%></td>
                <td><%=list.getUsuario()%></td>
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