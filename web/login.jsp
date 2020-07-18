<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="includes/header_b.jsp"></jsp:include>
    <div class="container">
            <div class="row justify-content-center"> 
                <div class="col-lg-4 col-lg-offset-4">
                    <div class="mt-5">
                        <img src="imgs/cevicheria.jpg" width="350" alt="Cevicheria Daria Mar"><br>
                    </div>
                    <form class="form-signin" action="iniciar" method="post">   
                      <hr>
                        <%  String msg = (String)request.getAttribute("msg"); 
                            if( msg != null){ %>
                            <div class="alert alert-danger text-center mb-3"><i class="fa fa-exclamation-circle"></i>
                                <%= msg %>
                            </div>
                        <%  }  %>
                      <label for="inputEmail" class="">Usuario</label>
                      <input type="text" id="inputEmail" class="form-control mb-3" 
                             placeholder="Ingrea tu usuario" required="" autofocus="" name="usuario">
                      
                      <label for="inputPassword" class="">Contraseña</label>
                      <input type="password" id="inputPassword" class="form-control mb-3" 
                             placeholder="Ingresa tu contraseña" required="" name="password">
                      
                      <div class="text-right"><button class="btn btn-md btn-primary" type="submit">Ingresar</button></div>
                      <p class="mt-5 mb-3 text-muted text-center"></p>
                    </form>
                  
                </div>
            </div>
        </div>
  
   </body>
</html>
