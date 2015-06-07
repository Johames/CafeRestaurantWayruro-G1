
<%@page import="proy.modelo.entidad.Listar_pensionista"%>
<%@page import="proy.modelo.entidad.ContratoPensionista"%>
<%@include file="WEB-INF/pensionistas/pensionistastop.jspf" %>



        
        <%
            Personadao persona = new PersonadaoImpl();
            Persona person = new Persona();
            ContratoPensionista contratoPensionista =  new ContratoPensionista();
            
        
            //String buscarpen = request.getParameter("buscarpen"); buscarpen = buscarpen == null?"":buscarpen;
            String nombres = request.getParameter("nombres"); nombres = nombres == null?"":nombres;
            String apellidos = request.getParameter("apellidos"); apellidos = apellidos == null?"":apellidos;
            String dni = request.getParameter("dni"); dni = dni == null?"":dni;
            String NCelular = request.getParameter("NCelular"); NCelular = NCelular == null?"":NCelular;
            String direccion = request.getParameter("direccion"); direccion = direccion == null?"":direccion;
            String f_inicio = request.getParameter("fechaInicio"); f_inicio = f_inicio ==null?"":f_inicio;
            String f_final = request.getParameter("fechaFinal"); f_final = f_final ==null?"":f_final;
                        
            Pensionistadao dao = new PensionistadoaImpl();
            for(Listar_pensionista listar_pensionista:dao.buscarPensionista(dni)){
            
                    nombres = person.getNombres();
                    apellidos = person.getApellidos();
                    dni = person.getDni();
                    NCelular = person.getNCelular();
                    direccion = person.getDireccion();
                    f_inicio = contratoPensionista.getFechaInicio();
                    f_final = contratoPensionista.getFechaFin();
                
            
            }      
        %>
<div class="container">
    <h1 class="sub-header">Lista de Pensionistas</h1>
    <%        
        String opcion = request.getParameter("opcion"); opcion = opcion == null ? "" : opcion;
        String id = request.getParameter("id_contrato"); id = id == null ? "" : id;
        String mensaje = "";

        if (opcion.equals("delete")) {

            if (persona.EliminarPersona(Integer.parseInt(id))) {

                mensaje = "Se elimino correctamente";

            } else {

                mensaje = "Ocurrio un error al Eliminar";

            }
        }
    %>
    <div class="table-responsive">
        <table class="table table-striped well">
            <thead>
                <tr>
                    <th>#</th>
                    <th>ID</th>
                    <th>Nombres</th>  
                    <th>Apellidos</th> 
                    <th>Dni</th> 
                    <th>N_Celular</th> 
                    <th>Direccion</th> 
                    <th>Inicio de P ension</th>
                    <th>Fin de Pension</th>
                    <th>Renovar</th>
                    <th>Eliminar</th>                                    
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    //Pensionistadao dao = new PensionistadoaImpl();

                    for (Listar_pensionista per : dao.ListarPensionista()) {
                        count++;
                        
                %>
                <tr>
                    <td><%=count%>.</td>
                    <td><%=per.getIdContrato()%></td>
                    <td><%=per.getNombres()%></td>
                    <td><%=per.getApellidos()%></td>
                    <td><%=per.getDni()%></td>
                    <td><%=per.getNCelular()%></td>
                    <td><%=per.getDireccion()%></td>
                    <td><%=per.getFechaInicio().substring(0,10)%></td>
                    <td><%=per.getFechaFin().substring(0,10)%></td>
                    <td><p><a class="btn btn-primary" href="renovar.jsp?id=<%=per.getIdContrato()%>&nombres=<%=per.getNombres()%>" role="button"><i class="glyphicon glyphicon-refresh"></i></a></p></td>
                    <td><p><a class="btn btn-danger" role="button" href="pensionistas.jsp?opcion=delete&id=<%=per.getIdContrato()%>"><i class="glyphicon glyphicon-trash"></i></a></p></td>
                </tr>
                <%}%>
                <%=mensaje%>
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