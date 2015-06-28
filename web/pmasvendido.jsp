<%@page import="proy.modelo.daoImpl.ProductodaoImpl"%>
<%@page import="proy.modelo.dao.Productodao"%>
<%@page import="proy.modelo.entidad.Pmasvendido"%>
<%@page import="proy.modelo.entidad.Listar_Movimientos"%>
<%@page import="java.util.List"%>
<%@page import="proy.modelo.daoImpl.MovimientosdaoImpl"%>
<%@page import="proy.modelo.dao.Movimientosdao"%>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content="Javascript,table filter" />
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="recursos/ico/favicon.ico">
        <title>Café Restaurant "Wayruro"</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/dashboard.css" rel="stylesheet">
        <script src="bootstrap/js/ie-emulation-modes-warning.js"></script>
        <jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
    </head>

    <body>
        <%

            if (idUsuario.equals("")) {
                response.sendRedirect("error.jsp");
            }

        %>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="pensionistas.jsp">Café Restaurant "Wayruro"</a>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="inicio.jsp">Inicio <i class="glyphicon glyphicon-home"></i></a></li>
                    </ul>  
                </div>
                <div id="navbar" class="navbar-collapse collapse">
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
                    <form class="navbar-form navbar-right">
                        <div class="col-lg-pull-0">
                            <input name="filt" onkeyup="filter(this, 'jla', '1')" type="text"class="form-control" placeholder="Buscar" autofocus>
                        </div>
                    </form>
                </div>
            </div>
        </nav><div class="container-fluid">
            <h1 class="sub-header">Producto mas Vendido</h1>
            <div class="table-responsive">
                <table id="jla" class="table table-striped well">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>nombre del Producto</th>
                            <th>Fecha</th>
                            <th>Cantidad</th>                              
                        </tr>
                    </thead>
                    <tbody>
                        <%                    
                            int count = 0;
                            Productodao dao = new ProductodaoImpl();
                            List<Pmasvendido> lista = dao.PmasVendido();
                            for (Pmasvendido pmv : lista) {
                                count++;

                        %>
                        <tr>
                            <td><%=count%>.</td>
                            <td><%=pmv.getNombreprod()%></td>
                            <td><%=pmv.getFechaventa()%></td>
                            <td><%=pmv.getCantidad()%></td>
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