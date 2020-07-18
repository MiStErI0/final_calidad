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
                  <li class="breadcrumb-item active">Mantener Usuario</li>
                </ol>
                     
                <!-- Page Heading -->
                <div class="row justify-content-between">
                    <div class="col-lg-8">
                        <h2 class="page-header text-left">
                            Lista de Usuarios
                        </h2>
                    </div>
                    <div class="col-lg-4 text-right">
                        <a href="formsRegistrarUsuario.jsp" class="btn btn-secondary">Nuevo Usuario</a>
                    </div>
                </div>
                <!-- /.row -->
                <div class="card mb-3">
                    <div class="card-body">
                        <c:choose>
                                <c:when test="${error==false}">
                                    <div class="alert alert-success"><i class="fa fa-check-circle"></i> Eliminacion exitosa</div>                                   
                                </c:when>
                                <c:when test="${error==true}">
                                    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> Eliminacion fallida</div>
                                </c:when>
                            </c:choose>
                        <div class="row">
                                <div class="col-lg-12">

                                <!--<form role="form">-->
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead class="thead-light">
                                            <tr>

                                                <th>idUsuario</th>
                                                <th>Usuario</th>
                                                <th>N° Doc.Identidad</th>
                                                <th>Nombre</th>
                                                <th>Ap. Paterno</th>     
                                                <th>Ap. Materno</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        <sql:query var="sqlmantenerUsuarios" dataSource="${myDS}">
                                                select p.grafe_vch_apepat,
                                                p.grafe_vch_apemat,
                                                p.grafe_vch_nombre,
                                                p.grafe_int_idtipopersona,
                                                p.grafe_int_idtipodocumento,
                                                p.grafe_vch_numidentidad,
                                                u.grafe_int_id,
                                                u.grafe_vch_user,
                                                u.grafe_vch_passw,
                                                u.grafe_int_idcargo,
                                                u.grafe_int_idpersona,
                                                e.grafe_vch_direccion,
                                                t.grafe_int_num,
                                                t.grafe_int_idtipotelefono,
                                                t.grafe_int_idoperador,
                                                d.grafe_int_idprovincia,
                                                d.grafe_int_iddistrito,
                                                d.grafe_int_idprovincia,
                                                d.grafe_int_iddepartamento from tbl_grafe_persona as p
                                               inner join tbl_grafe_usuario as u on p.grafe_int_id = u.grafe_int_idpersona
                                               inner join tbl_grafe_email as e on u.grafe_int_idpersona = e.grafe_int_idpersona
                                               inner join tbl_grafe_telefono as t on u.grafe_int_idpersona = t.grafe_int_idpersona
                                               inner join tbl_grafe_domicilio as d on u.grafe_int_idpersona = d.grafe_int_idpersona
                                               where u.grafe_int_idestado = 1                                         
                                        </sql:query> 
                                           <!--select u.grafe_int_id, u.grafe_vch_user, u.grafe_vch_passw, u.grafe_int_idpersona,p.grafe_vch_nombre, 
                                                p.grafe_vch_numidentidad, p.grafe_vch_apepat, p.grafe_vch_apemat from tbl_grafe_usuario as u 
                                                inner join tbl_grafe_persona as p on u.grafe_int_idpersona = p.grafe_int_id 
                                                where u.grafe_int_idestado = 1-->
                                        <c:forEach var="fila" items="${sqlmantenerUsuarios.rows}">
                                              <tr>  
                                                <td>${fila.grafe_int_id}</td>
                                                <td>${fila.grafe_vch_user}</td>
                                                <td>${fila.grafe_vch_numidentidad}</td>
                                                <td>${fila.grafe_vch_nombre}</td>
                                                <td>${fila.grafe_vch_apepat}</td>
                                                <td>${fila.grafe_vch_apemat}</td>
                                                <td>
                                                    <div class="d-inline-block">
                                                        <form action="Modificar_user" method="POST">
                                                            <input type="hidden" name="iduser" value="${fila.grafe_int_id}">
                                                            <input type="hidden" name="idpersona" value="${fila.grafe_int_idpersona}">
                                                            <input type="hidden" name="user" value="${fila.grafe_vch_user}">
                                                            <input type="hidden" name="psw" value="${fila.grafe_vch_passw}">
                                                            <input type="hidden" name="nomUser" value="${fila.grafe_vch_nombre}">
                                                            <input type="hidden" name="apePatUser" value="${fila.grafe_vch_apepat}">
                                                            <input type="hidden" name="apeMatUser" value="${fila.grafe_vch_apemat}">
                                                            <input type="hidden" name="correoElectro" value="${fila.grafe_vch_direccion}">
                                                            <input type="hidden" name="tipper" value="${fila.grafe_int_idtipopersona}">
                                                            <input type="hidden" name="tipdoc" value="${fila.grafe_int_idtipodocumento}">
                                                            <input type="hidden" name="numident" value="${fila.grafe_vch_numidentidad}">
                                                            <input type="hidden" name="cargusu" value="${fila.grafe_int_idcargo}">
                                                            <input type="hidden" name="tiptel" value="${fila.grafe_int_idtipotelefono}">
                                                            <input type="hidden" name="operadortel" value="${fila.grafe_int_idoperador}">
                                                            <input type="hidden" name="numtel" value="${fila.grafe_int_num}">
                                                            <input type="hidden" name="via" value="${fila.grafe_int_idvia}">
                                                            <input type="hidden" name="seldepartamentos" value="${fila.grafe_int_iddepartamento}">
                                                            <input type="hidden" name="selprovincias" value="${fila.grafe_int_idprovincia}">
                                                            <input type="hidden" name="seldistritos" value="${fila.grafe_int_iddistrito}">
                                                            <button class="btn btn-primary btn-sm" type="submit" name="fnusuario" value="camposModificar"><i class="fa fa-edit"></i></button>
                                                        </form>
                                                    </div>   
                                                    <div class="d-inline-block">                                                  
                                                    <form action="Modificar_user" method="POST">
                                                        <input type="hidden" name="idpersona" value="${fila.grafe_int_idpersona}">
                                                        <button class="btn btn-danger btn-sm" type="submit" name="fnusuario" value="eliminarUsuario"><i class="fa fa-trash"></i></button>
                                                    </form>
                                                    </div>
                                                </td>
                                            </tr>  
                                        </c:forEach>    
                                        </tbody>
                                    </table>
                                </div>
                                    <!--</form>-->

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
<jsp:include page="includes/footer.jsp"></jsp:include>   