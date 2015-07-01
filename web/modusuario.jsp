
<%@include file="WEB-INF/usuario/modusuariotop.jspf" %>
<%
    
            Usuario us=new Usuario(); 
            Usuariodao dao = new UsuariodaoImpl(); 
            String opcion = request.getParameter("opcion"); opcion = opcion == null?"":opcion;
            String idu = request.getParameter("idu"); idu = idu == null?"":idu;
            String usuario= request.getParameter("usuario"); usuario=usuario==null?"":usuario;
            String contra= request.getParameter("contra"); contra=contra==null?"": contra;
            String estado= request.getParameter("estado"); estado=estado==null?"": estado;
            String idrol= request.getParameter("idrol"); idrol=idrol==null?"": idrol;
            String id= request.getParameter("id"); id=id==null?"": id;     
            String alert = "";
            String mensaje ="";
            
            if(opcion.equals("modificar")){
                us.setUsuario(usuario);
                us.setContrasena(contra);
                us.setEstado(estado);
                us.setIdRol(idrol);
                if(dao.ModificarUsuario(us, id)){
                    response.sendRedirect("crud?action=listarus");
                    
                }else{
                  alert = "danger";
                  mensaje="No se pudo modificar el Usuario";                      
                }            
            }
%>
<div class="container">
    <div class="row">
        
        <div class="col-md-2"></div>
          <div class="col-md-8 well">
            <div class="title">
                <div class="tipo">
                    <h2><b>Modificar Usuario</b></h2>
                    <br>
                </div>
            </div>
            <div class="formu">
                <form class="form-horizontal" action="modusuario.jsp" method="post">
                    <input type="hidden" name="opcion" value="modificar">
                    <div class="form-group" hidden>
                        <label class="control-label col-xs-3">id :</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="id" value="<%=idu%>" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Usuario:</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="usuario" value="<%=usuario%>" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Contraseña:</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="contra" value="<%=contra%>">
                        </div>
                    </div>
                    <div class="form-group" hidden>
                        <label class="control-label col-xs-3">Estado:</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="estado" value="<%=estado%>" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Rol :</label>
                        <div class="col-xs-4">
                            <select class="form-control" name="idrol">
                                <option selected="selected" hidden>Seleccionar Rol</option>
                                <%
                                    for(Rol rol : dao.ListarRol()){
                                %>
                                <option value="<%=rol.getIdRol()%>"><%=rol.getNombreRol()%></option>
                                <%}%>
                            </select>
                        </div>
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
