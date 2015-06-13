
<%@include file="WEB-INF/detalleventa/detalleventatop.jspf" %>
<br><br><br>
<div class="container">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-5 well">
            <div class="title">
                <form class="tipo">
                    <h1><b>Cliente</b></h1>
                    <br>
                </form>
            </div>
            <%                Pensionistadao dao = new PensionistadoaImpl();

                String Buscar = request.getParameter("Buscar"); Buscar = Buscar == null ? "" : Buscar;
                String opcion3 = request.getParameter("opcion3"); opcion3 = opcion3 == null ? "buscarp" : opcion3;

                String nomb = request.getParameter("Buscar"); nomb = nomb == null ? "" : nomb;


            %>
            <div class="formu">
                <form class="form-horizontal" action="detalle">
                    <div class="form-group">
                        <label class="control-label col-xs-1"></label>
                        <div class="col-xs-0"></div>
                        <%                            
                            if (opcion3.equals("buscarp")) {
                        %>
                        <div class="col-xs-10" hidden>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Nombre" name="Buscar" autofocus>
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-primary" name=""><i class="glyphicon glyphicon-search"></i></button>
                                </span>
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
                            <label class="control-label col-xs-0"></label>
                            <div class="col-xs-1"></div>
                            <div class="col-xs-8">
                                <div class="input-group">
                                    <input name="filt" onkeyup="filter(this, 'tabj', '1')" type="text"class="form-control" placeholder="Nombre a Buscar" autofocus>
                                    <span class="input-group-btn">
                                        <button type="submit" class="btn btn-primary" name=""><i class="glyphicon glyphicon-search"></i></button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table id="tabj" class="table table-striped well">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nombres y Apellidos</th>
                                    <th>Seleccionar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int count = 0;

                                    for (Listar_pensionista per : dao.ListarPensionista(nomb)) {
                                        count++;

                                %>
                                <tr>
                                    <td><%=count%>.</td>
                                    <td><%=per.getNombres()%> <%=per.getApellidos()%></td>
                                    <td><p><a class="btn btn-primary" title="Enviar Cliente" href="detalleventa.jsp" role="button"><i class="glyphicon glyphicon-share-alt"></i></a></p></td>
                                </tr>
                                <%}%>
                                <%=mensaje%>
                            </tbody>
                        </table>
                    </div>
                    <%}%>
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
