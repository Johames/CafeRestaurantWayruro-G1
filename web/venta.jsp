<%@page import="proy.modelo.entidad.Producto"%>
<%@page import="proy.modelo.daoImpl.PensionistadoaImpl"%>
<%@page import="proy.modelo.dao.Pensionistadao"%>
<%@page import="proy.modelo.daoImpl.ProductodaoImpl"%>
<%@page import="proy.modelo.dao.Productodao"%>
<%@page import="proy.modelo.entidad.Categoria"%>
<%@page import="proy.modelo.entidad.Listar_pensionista"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="keywords" content="Javascript,table filter" />
        <meta name="author" content="">
        <link rel="icon" href="recursos/ico/favicon.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        <script src="bootstrap/js/ie-emulation-modes-warning.js"></script>
        <title>Café Restaurant "Wayruro"</title>
        <jsp:useBean id="idUsuario" scope="session" class="java.lang.String" />
    </head>
    <body>
        <%

            String mensaje = "";

            Productodao productodao = new ProductodaoImpl();

            if (idUsuario == null) {
                response.sendRedirect("error.jsp");
            }

            String nombres = request.getParameter("nombres");
            nombres = nombres == null ? "" : nombres;

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
                    <a class="navbar-brand" href="#">Café Restaurant "Wayruro"</a>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="index.jsp">Inicio <i class="glyphicon glyphicon-home"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
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
                                            <br><br><br>
                                            <div class="container col-md-12">
                                                <div class="row">
                                                    <div class="form-group">
                                                        <label class="control-label col-xs-2">Cliente</label>
                                                        <div class="col-xs-0"></div>
                                                        <div class="col-xs-8">
                                                            <form class="input-group" method="Post">
                                                                <input type="text" class="form-control" placeholder="Nombre del Cliente" name="nombres" autofocus>
                                                                <span class="input-group-btn">
                                                                    <a type="submit" href="detalleventa.jsp?nombres=Cliente Varios" class="btn btn-primary"><i>ir</i></a>
                                                                </span>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="col-xs-6">

                                            <%                
                                                Pensionistadao dao = new PensionistadoaImpl();
                                            %>
                                            <div class="formu">
                                                <form class="form-horizontal" action="detalle">
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
                                                                    <td><p>
                                                                            <a class="btn btn-primary" title="Enviar Cliente" href="control.jsp?idContrato=<%=per.getIdContrato()%>&nombres=<%=per.getNombres()%>&apellidos=<%=per.getApellidos()%>" role="button">
                                                                                <i class="glyphicon glyphicon-share-alt">
                                                                                </i>
                                                                            </a>
                                                                        </p>
                                                                    </td>
                                                                </tr>

                                                                <%}%>
                                                                <%=mensaje%>
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
