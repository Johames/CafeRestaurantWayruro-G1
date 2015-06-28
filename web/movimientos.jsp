<%@include file="WEB-INF/detalleventa/movimientotop.jspf" %>

<script>

    function calculo(importe, totaltext) {

        /* Parametros:
         cantidad - entero con la cantidad
         precio - entero con el precio
         inputtotal - nombre del elemento del formulario donde ira el total
         */

        // Calculo del subtotal
        //subtotal = precio * cantidad;
        //inputtext.value = subtotal;

        //Actualizar el total
        // Utilizamos el eval. Ya que el valor es un texto y si lo tratamos como tal
        // es como si estuviesemos manipulando una cadena.
        total = eval(totaltext.value);
        totaltext.value = total + importe;
    }
</script>
<div class="container-fluid">
    <h1 class="sub-header">Movimientos de Mes<label class="col-lg-offset-0"></label>&nbsp;&nbsp;&nbsp;<label class="col-lg-offset-7"></label><a href="movcompletos.jsp" class="btn btn-primary right">Todos los Movimientos</a></h1>
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
                    List<Listar_Movimientos> lista = dao.MovdelMes();
                    for (Listar_Movimientos list : lista) {
                        count++;

                %>
                <tr>
                <td><%=count%>.</td>
                <td hidden><%=list.getIdMovimiento()%></td>
                <td><%=list.getTipo()%></td>
                <td hidden><%=list.getIdDocumento()%></td>
                <td><%=list.getFecha().substring(0, 10)%></td>
                <td><input type="hidden" id="imp" value="<%=list.getImporte()%>" onChange="calculo(this.value, total);">$.&nbsp;<%=list.getImporte()%></td>
                <td><%=list.getUsuario()%></td>
                </tr>
                <%}%>
                <tr>
                <td>Total</td>
                <td colspan="2"></td>
                <td>$.&nbsp;<input type="text" id="total" size="8" value="0"></td>
                </tr>
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