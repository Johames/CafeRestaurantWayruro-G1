<%@include file="WEB-INF/usuario/logeotop.jspf"%>

    <body>
        <%
            String usuario = request.getParameter("usuario");
            usuario = usuario == null ? "" : usuario;
            String contrasena = request.getParameter("contrasena");
            contrasena = contrasena == null ? "" : contrasena;
            String mensaje = "";

            if (!usuario.equals("") && !contrasena.equals("")) {
                Usuariodao dao = new UsuariodaoImpl();
                Usuario us = dao.ComprobarUsuario(usuario, contrasena);
                if (us != null) {
                    response.sendRedirect("index.jsp");
                } else {
                    mensaje = "Error";
                }

            }


        %>
        <br><br><br><br>
        <article>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4 well">
                        <div class="container-fluid">
                            <div class="compartirlogos" >
                                <div style="text-align:center !important"> 
                                    <img src="recursos/img/johann2.png" style="max-width:280px;">                                
                                    <br><br>
                                </div>
                            </div>
                            <form class="form-signin-heading" action="logeo.jsp" method="post">
                                <div class="title">
                                    <label>
                                        <h3 class="tipo"><b>Ingresar Usuario</b></h3>
                                    </label>
                                </div>
                                <div>
                                    <div class="col-lg-pull-0">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-user"></span>
                                            </span>
                                            <input type="Usuario" class="form-control" placeholder="Usuario" name="usuario" required autofocus>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div>
                                    <div>
                                        <input type="password" class="form-control" placeholder="Contraseña" name="contrasena" required>
                                    </div>
                                </div>
                                <div class="checkbox">
                                    <label class="checkbox">
                                        <div class="checker" id="uniform-RememberMe">
                                            <span>
                                                <input data-val="true" data-val-required="The Recordar en esta 
                                                       computadora field is required." id="RememberMe" name="RememberMe" 
                                                       type="checkbox" value="true">
                                            </span>
                                        </div>
                                        <input type="checkbox" value="remember-me"> Recordar Usuario
                                    </label>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <button class="btn btn-lg btn-primary btn-block" type="submit">Iniciar Session &emsp;<i class="glyphicon glyphicon-log-in"></i></button>
                                    </div>
                                </div>
                            </form>
                            <div class="row">
                                <div class="col-md-12" id="aler">
                                    <br>
                                    <%                                    if (!mensaje.equals("")) {
                                    %>
                                    <div class="alert alert-danger"><%=mensaje%></div>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </article>
                                
        <script src="jquery/jquery-1.11.2.min.js"></script>                        
        <script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>

    </body>
</html>