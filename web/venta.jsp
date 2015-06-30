<%@page import="proy.modelo.entidad.AgregarVenta"%>
<%@page import="proy.modelo.entidad.Venta"%>
<%@page import="proy.modelo.daoImpl.VentadaoImpl"%>
<%@page import="proy.modelo.dao.Ventadao"%>
<%@include file="WEB-INF/detalleventa/ventatop.jspf" %>

<%
    Ventadao ventadao = new VentadaoImpl();
    AgregarVenta venta = new AgregarVenta();

    String opcion = request.getParameter("opcion"); opcion = opcion == null?"":opcion; 
    String tipo = request.getParameter("tipo"); tipo = tipo == null?"":tipo; 
    String idventa = request.getParameter("idventa"); idventa = idventa == null?"":idventa;
    String numero = request.getParameter("numero"); numero = numero == null?"":numero;
    String fechaventa = request.getParameter("fechaventa"); fechaventa = fechaventa == null?"":fechaventa;
    
    if(opcion.equals("Venta")){
        venta.setIdUsuario(idUsuario);
        venta.setTipo(tipo);
        if(ventadao.Agregar(venta)){
            idventa = ventadao.BuscarId();
            response.sendRedirect("detalleventa.jsp?idventa="+idventa);
        }
    }
    
%>
        <div class="container">
            <div class="form-group"> 
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-12 well">
                        <div class="table-responsive col-md-12">
                            <table class="table table-striped well">
                                <thead>
                                    <tr>
                                        <th>Iniciar Venta</th>
                                        <th>Control de Pencionistas</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <br>
                                            <br>
                                            <br>
                                            <br>
                                            <br>
                                            <form>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-3 col-md-4"></div>
                                                <div class="col-xs-12 col-sm-6 col-md-4">
                                                    <div>
                                                        <input type="hidden" name="tipo" value="v">
                                                        <input class="btn btn-primary" type="submit" name="opcion" value="Venta">
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-3 col-md-4"></div>
                                            </div>
                                            </form>
                                        </td>
                                        <td class="col-xs-6">
                                            <% 
                                                Pensionistadao dao = new PensionistadoaImpl();
                                            %>
                                            <div class="formu">
                                                <form class="form-horizontal" action="venta.jsp" method="Post">
                                                    <div class="form-group">
                                                        <label class="control-label col-xs-1"></label>
                                                        <div class="col-xs-0"></div>
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
                                                        <div class="col-md-10">
                                                            <label class="control-label col-xs-6"></label>
                                                            <div class="col-md-12">
                                                                <div class="input-group col-xs-12">
                                                                    <input name="filt" onkeyup="filter(this, 'tabj', '1')" type="text" class="form-control" placeholder="Nombre a Buscar" autofocus>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="table-responsive">
                                                        <table id="tabj" class="table table-striped well">
                                                            <thead>
                                                                <tr hidden>
                                                                    <th>#</th>
                                                                    <th>Id Contrato</th>
                                                                    <th>Nombres y Apellidos</th>
                                                                    <th>Seleccionar</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%
                                                                    int count = 0;

                                                                    for (Listar_pensionista per : dao.ListarPensionista()) {
                                                                        count++;
                                                                %>
                                                                <tr>
                                                                    <td><%=count%>.</td>
                                                                    <td hidden><%=per.getIdContrato()%></td>
                                                                    <td><%=per.getNombres()%>&nbsp;<%=per.getApellidos()%></td>
                                                                    <td>
                                                                        <a class="btn btn-primary" href="detalleventa.jsp?opcion=control&idContrato=<%=per.getIdContrato()%>&nombres=<%=per.getNombres()%> <%=per.getApellidos()%>&opc=1&tipo=r">Control</a>                                                                    
                                                                    </td>
                                                                </tr>
                                                                <%}%>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </form>
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

    <script src="jquery/jquery.min.js">

    </script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/holder.js"></script>
    <script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>
</html>
