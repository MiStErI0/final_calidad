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
                  <li class="breadcrumb-item active">Registrar Usuario</li>
                </ol>
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header text-center">
                            Registrar Usuario
                        </h2>
                    </div>
                </div>
                <!-- /.row -->
                <div class="card mb-3">
                    <div class="card-body">

                        <div class="row justify-content-center">

                            <div class="col-lg-6">
                                <c:choose>
                                            <c:when test="${error==false}">
                                                <div class="alert alert-success text-center"><i class="fa fa-check-circle"></i> Registro exitoso</div>                                   
                                            </c:when>
                                            <c:when test="${error==true}">
                                                <div class="alert alert-danger text-center"><i class="fa fa-exclamation-circle"></i> ${msg}</div>
                                            </c:when>
                                    </c:choose>
                                <form action="Registrar_user" method="POST" role="form">

                                    <div class="form-row">                          
                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="usuario">Usuario</label>
                                            <input type="text" class="form-control" id="usuario" name="user" placeholder="Nombre Usuario" onkeypress="return soloLetras(event,this.value,20)">
                                        </div>

                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="pass">Password</label>
                                            <input type="password" class="form-control" id="pass" name="psw" placeholder="Password">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="cargousu">Cargo</label>
                                            <jsp:include page="selects/cargousuario.jsp">
                                                <jsp:param name="cargusu" value="" />
                                            </jsp:include>                                                                                               
                                        </div>

                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="tipper">Tipo de Persona</label>
                                            <jsp:include page="selects/tipopersona.jsp">
                                                <jsp:param name="tipper" value="" />
                                            </jsp:include>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="tipdociden">Tipo de Documento de Identidad</label>
                                            <jsp:include page="selects/tipodocumento.jsp">
                                                <jsp:param name="tipdoc" value="" />
                                            </jsp:include>
                                        </div>

                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="ndi">Numero Documento de Identidad</label>
                                            <input type="text" class="form-control" id="ndi" name="numident" placeholder="Numero de Documento de Identidad" onkeypress="return soloNumeros(event,this.value,12)">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="nomusu">Nombre</label>
                                            <input type="text" class="form-control" id="nomusu" name="nomUser" placeholder="Nombres" onkeypress="return soloLetras(event,this.value,20)">
                                        </div>

                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="apepatusu">Apellido Paterno</label>
                                            <input type="text" class="form-control" id="apepatusu" name="apePatUser" placeholder="Apellido Paterno" onkeypress="return soloLetras(event,this.value,20)">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="apematusu">Apellido Materno</label>
                                            <input type="text" class="form-control" id="apematusu" name="apeMatUser" placeholder="Apellido Materno" onkeypress="return soloLetras(event,this.value,20)">
                                        </div>

                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="correoele">Correo Electronico</label>
                                            <input type="text" class="form-control" id="correoele" name="correoElectro" placeholder="Correo Electronico" onkeypress="return soloLetras(event,this.value,50)">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="tiptel">Tipo de Telefono</label>
                                            <jsp:include page="selects/tipotelefono.jsp">
                                                <jsp:param name="tiptel" value="" />
                                            </jsp:include>
                                        </div>

                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="opera">Operador</label>
                                            <jsp:include page="selects/operadortel.jsp">
                                                <jsp:param name="operadortel" value="" />
                                            </jsp:include>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="numtel">Numero de Telefono</label>
                                            <input type="text" class="form-control" id="numtel" name="numtel" placeholder="Numero de Telefono" onkeypress="return soloNumeros(event,this.value,9)">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-4">
                                            <label class="control-label" for="departa">Departamento</label>
                                            <jsp:include page="selects/listadepartamentos.jsp">
                                                <jsp:param name="dep" value="" />
                                            </jsp:include>
                                        </div>

                                        <div class="form-group col-lg-4">
                                            <label class="control-label" for="provin">Provincia</label>
                                            <div id="listapro">
                                                <select class="form-control" id="selprovincias">
                                                    <option value="">Seleccione la Provincia</option>
                                                </select>
                                            </div>                      
                                        </div>

                                        <div class="form-group col-lg-4">
                                            <label class="control-label" for="distrit">Distrito</label>
                                            <div id="listadis">
                                                <select class="form-control" id="seldistritos">
                                                    <option value="">Seleccione el Distrito</option>
                                                </select>
                                            </div>                      
                                        </div> 
                                    </div>
                                    <div class="text-right">
                                        <button id="btnRegistrar" class="btn btn-primary" type="submit" name="rgusuario" value="registrarUsuario">Registrar</button> 
                                    </div>
                                </form>

                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                </div>
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
