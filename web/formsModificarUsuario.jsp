<jsp:include page="includes/header.jsp"></jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<jsp:include page="includes/navbar.jsp"></jsp:include>
<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
      url="jdbc:mysql://localhost:3306/dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false"
      user="root"  password="database"/>
    <div id="wrapper">

        <div id="page-wrapper" class="content-wrapper">

            <div class="container-fluid">
                
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a href="inicio.jsp">Inicio</a>
                  </li>
                  <li class="breadcrumb-item active">Modificar Usuario</li>
                </ol>
                <!-- Page Heading --> 
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">
                            Modificar Usuario
                        </h2>
                        
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                          
                    <div class="col-lg-6 col-lg-offset-3">
                        
                            <c:choose>
                                <c:when test="${error==false}">
                                    <div class="alert alert-success">Modificacion exitosa!</div>                                   
                                </c:when>
                                <c:when test="${error==true}">
                                    <div class="alert alert-danger">Modificacion fallida!</div>
                                </c:when>
                            </c:choose>
                        <form action="Modificar_user" method="POST" role="form">
                            
                            <div class="form-group">
                                <label class="control-label" for="idusuario">IdUsuario</label>
                                <input type="text" class="form-control" id="idusuario" value="${param.iduser}" disabled>
                                <input type="hidden" name="iduser" value="${param.iduser}">
                                <input type="hidden" name="idpersona" value="${param.idpersona}">
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="usuario">Usuario</label>
                                <input type="text" class="form-control" id="usuario" name="user" value="${param.user}" placeholder="Nombre Usuario">
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="pass">Password</label>
                                <input type="password" class="form-control" id="pass" name="psw" value="${param.psw}" placeholder="Password">
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="cargousu">Cargo</label>
                                <jsp:include page="selects/cargousuario.jsp">
                                    <jsp:param name="cargusu" value="${param.cargusu}" />
                                </jsp:include>                                                           
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="tipper">Tipo de Persona</label>
                                <jsp:include page="selects/tipopersona.jsp">
                                     <jsp:param name="tipper" value="${param.tipper}" />
                                </jsp:include> 
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="tipdociden">Tipo de Documento de Identidad</label>
                                <jsp:include page="selects/tipodocumento.jsp">
                                    <jsp:param name="tipdoc" value="${param.tipdoc}" />
                                </jsp:include>
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="ndi">Numero Documento de Identidad</label>
                                <input type="text" class="form-control" id="ndi" name="numident" value="${param.numident}" placeholder="Numero de Documento de Identidad">
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="nomusu">Nombre</label>
                                <input type="text" class="form-control" id="nomusu" name="nomUser" value="${param.nomUser}" placeholder="Nombres">
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="apepatusu">Apellido Paterno</label>
                                <input type="text" class="form-control" id="apepatusu" name="apePatUser" value="${param.apePatUser}" placeholder="Apellido Paterno">
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="apematusu">Apellido Materno</label>
                                <input type="text" class="form-control" id="apematusu" name="apeMatUser" value="${param.apeMatUser}" placeholder="Apellido Materno">
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="correoele">Correo Electronico</label>
                                <input type="text" class="form-control" id="correoele" name="correoElectro" value="${param.correoElectro}" placeholder="Correo Electronico">
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="tiptel">Tipo de Telefono</label>
                                <jsp:include page="selects/tipotelefono.jsp">
                                    <jsp:param name="tiptel" value="${param.tiptel}" />
                                </jsp:include>
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="opera">Operador</label>
                                <jsp:include page="selects/operadortel.jsp">
                                    <jsp:param name="operadortel" value="${param.operadortel}" />
                                </jsp:include>
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="numtel">Numero de Telefono</label>
                                <input type="text" class="form-control" id="numtel" name="numtel" value="${param.numtel}" placeholder="Numero de Telefono">
                            </div>
                                                       
                            <div class="form-group">
                                <label class="control-label" for="departa">Departamento</label>
                                <jsp:include page="selects/listadepartamentos.jsp">
                                    <jsp:param name="dep" value="${param.seldepartamentos}" />
                                </jsp:include>
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="provin">Provincia</label>
                                <div id="listapro">
                                    <jsp:include page="selects/listaprovincias.jsp">
                                        <jsp:param name="dep" value="${param.seldepartamentos}" />
                                        <jsp:param name="prov" value="${param.selprovincias}" />
                                    </jsp:include>
                                    <!--<select class="form-control" id="selprovincias">
                                        <option value="">Seleccione la Provincia</option>
                                    </select>-->
                                </div>                      
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="distrit">Distrito</label>
                                <div id="listadis">
                                    <jsp:include page="selects/listadistritos.jsp">
                                        <jsp:param name="dep" value="${param.seldepartamentos}" />
                                        <jsp:param name="prov" value="${param.selprovincias}" />
                                        <jsp:param name="dis" value="${param.seldistritos}" />
                                    </jsp:include>
                                </div>                      
                            </div>                                                            
                            <div>
                                <button id="btnModificar" class="btn btn-primary" type="submit" name="fnusuario" value="modificarUsuario">Modificar</button> 
                            </div>
                        </form>
                  
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
 <script>
        function provincias(){
            departamento = document.getElementById("seldepartamentos").value;
            $.ajax({
               data: {dep:departamento},
               type: "POST",
               url: "selects/listaprovincias.jsp",
               success: function(d){
                   document.getElementById("listapro").innerHTML=d;
               }
            });
        }
        function distritos(){
            departamento = document.getElementById("seldepartamentos").value;
            provincia = document.getElementById("selprovincias").value;
            $.ajax({
               data: {dep:departamento,prov:provincia},
               type: "POST",
               url: "selects/listadistritos.jsp",
               success: function(d){
                   document.getElementById("listadis").innerHTML=d;
               }
            });
        }
    </script>
<jsp:include page="includes/footer.jsp"></jsp:include>  
