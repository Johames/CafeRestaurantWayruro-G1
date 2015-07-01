<%@page import="java.util.List"%>
<%@page import="proy.modelo.daoImpl.PensionistadoaImpl"%>
<%@page import="proy.modelo.entidad.Listar_pensionista"%>
<%@page import="proy.modelo.entidad.ContratoPensionista"%>
<%@page import="proy.modelo.dao.Pensionistadao"%>
<%@page import="proy.modelo.entidad.Persona"%>
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
        <jsp:useBean id="listainac" scope="request" type="java.util.List" />
    </head>

    <body>
        <%

            if (idUsuario == null) {
                response.sendRedirect("error.jsp");
            }

            Pensionistadao p = new PensionistadoaImpl();
            Persona person = new Persona();
            ContratoPensionista contrato = new ContratoPensionista();

            String idPersona = request.getParameter("idpersona"); idPersona = idPersona == null ? "" : idPersona;
            
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
                        <li class="active"><a href="ocultar?action=volver">Inicio <i class="glyphicon glyphicon-home"></i></a></li>
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
                            <input name="filt" onkeyup="filter(this, 'tj', '1')" type="text"class="form-control" placeholder="Nombre a Buscar" autofocus >
                        </div>
                    </form>
                    <div id="navbar" class="navbar-collapse collapse">
                        <form class="navbar-form navbar-right">
                            <a class="btn btn-primary" href="crud?action=listarpen" role="button">Volver &emsp;<i class="glyphicon glyphicon-list-alt"></i></a>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
<% 
      String opcion = request.getParameter("opcion"); opcion=opcion==null?"":opcion;
      String alert="";
      String mensaje="";
        if (opcion.equals("delete")) {
    
        String idcontrato = request.getParameter("idcontrato"); idcontrato = idcontrato == null ? "" : idcontrato;
    
        Pensionistadao pensionistadao = new PensionistadoaImpl();
        
        if (pensionistadao.EliminarPensionista(idcontrato)) {
            alert="info";
            mensaje="Se eliminó correctamente";
        } else {
            alert = "danger";
            mensaje = "No se puede eliminar. ";
        }
    }
%>
        

        <div class="container-fluid">
            <h1 class="sub-header">Lista de Pensionistas Inactivos</h1>
            <div class="table-responsive">
                <table id="tj" class="table table-striped well">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th hidden>ID</th>
                            <th>Nombres y Apellidos</th>
                            <th>Dni</th> 
                            <th>N° Celular</th> 
                            <th>Direccion</th> 
                            <th>Inicio de Pension</th>
                            <th>Fin de Pension</th>  
                            <th>Precio</th>   
                            <th>Fecha de Pago</th> 
                            <th colspan="3">Acciones</th>                                    
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 0;
                            Pensionistadao dao = new PensionistadoaImpl();
                            List<Listar_pensionista> list = listainac;
                            for (Listar_pensionista per : list) {
                                count++;

                        %>
                        <tr>
                            <td><%=count%>.</td>
                            <td hidden><%=per.getIdPersona()%></td>
                            <td><%=per.getNombres()%>&nbsp;<%=per.getApellidos()%></td>
                            <td><%=per.getDni()%></td>
                            <td><%=per.getNCelular()%></td>
                            <td><%=per.getDireccion()%></td>
                            <td><%=per.getFechaInicio().substring(0, 10)%></td>
                            <td><%=per.getFechaFin().substring(0, 10)%></td>
                            <td>$.&nbsp;<%=per.getPrecioPension()%></td>
                            <td><%=per.getFechaPago().substring(0, 10)%></td>
                            <td><p><a class="btn btn-primary" title="Renovar Contrato del Pencionista" href="renovar.jsp?idpersona=<%=per.getIdPersona()%>&nombres=<%=per.getNombres()%>&apellidos=<%=per.getApellidos()%>&dni=<%=per.getDni()%>&ncelular=<%=per.getNCelular()%>&direcciones=<%=per.getDireccion()%>&precio=<%=per.getPrecioPension()%>&pago=<%=per.getFechaPago().substring(0, 10)%>" role="button"><i class="glyphicon glyphicon-refresh"></i></a></p></td>
                            <td><p><a class="btn btn-danger" title="Eliminar" onclick="if (!confirm('Esta seguro de eliminar a <%=per.getNombres()%> <%=per.getApellidos()%>'))return false" role="button" href="crud?action=listarinac&opcion=delete&idcontrato=<%=per.getIdContrato()%>"><i class="glyphicon glyphicon-trash"></i></a></p></td>
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