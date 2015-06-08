<%@include file="WEB-INF/usuario/logeotop.jspf"%>

    <body>
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
                            <form method="POST" action="valid">
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
                                            <input type="text" class="form-control" placeholder="Usuario" name="usuario" required autofocus>
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
                        </div>
                    </div>
                </div>
            </div>
        </article>
                                
        <script src="jquery/jquery-1.11.2.min.js"></script>                        
        <script src="bootstrap/js/ie10-viewport-bug-workaround.js"></script>

    </body>
</html>