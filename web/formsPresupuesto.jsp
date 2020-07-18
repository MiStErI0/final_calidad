<jsp:include page="includes/header.jsp"></jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
      url="jdbc:mysql://localhost:3306/dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false"
      user="root"  password="database"/>

    <div id="wrapper">
 
       <jsp:include page="includes/navbar.jsp"></jsp:include>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Presupuesto de Ventas
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index_1.jsp">Inicio</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Presupuesto de Venta
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <h2>Lista de Presupuestos</h2>
                    </div>
                </div>
                <div class="row text-right" style="margin-bottom:20px;">
                        <div class="col-lg-4 col-lg-offset-8">
                            <a href="formsGenerarPresupuesto.jsp" class="btn btn-default">Nuevo Presupuesto</a>
                        </div>
                </div>
                <div class="row">
                        <div class="col-lg-12">
                            <c:choose>
                                <c:when test="${error==false}">
                                    <div class="alert alert-success">Eliminacion exitosa!</div>                                   
                                </c:when>
                                <c:when test="${error==true}">
                                    <div class="alert alert-danger">Eliminacion fallida!</div>
                                </c:when>
                            </c:choose>
                        <!--<form role="form">-->
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        
                                        <th>IdPresupuesto</th>
                                        <th>Cliente</th>
                                        <th>Usuario</th>
                                        <th>Monto Total</th>
                                        <th>Fecha</th>
                                        <th></th>                                 
                                    </tr>
                                </thead>
                                <tbody>
                                <sql:query var="sqlPresupuesto" dataSource="${myDS}">
                                        select p.grafe_int_id, concat(c.grafe_vch_nombre, '') as nombre_cliente, concat(u.grafe_vch_nombre, '') as nombre_usuario, p.grafe_flt_montototal, p.grafe_vch_fecha 
                                        from tbl_grafe_presupuesto as p 
                                        inner join 
                                        (select u.grafe_int_id,per.grafe_vch_nombre
                                        from tbl_grafe_persona as per 
                                        inner join tbl_grafe_usuario as u on per.grafe_int_id  = u.grafe_int_idpersona
                                        where per.grafe_int_idestado = 1 group by per.grafe_int_id) 

                                        as u on p.grafe_int_idusuario = u.grafe_int_id
                                        inner join 
                                        (select c.grafe_int_id,per.grafe_vch_nombre
                                        from tbl_grafe_persona as per 
                                        inner join tbl_grafe_clientes as c on per.grafe_int_id = c.grafe_int_idpersona
                                        where per.grafe_int_idestado = 1 group by per.grafe_int_id) 

                                        as c on p.grafe_int_idcliente = c.grafe_int_id
                                        where p.grafe_int_idestado = 1                                       
                                </sql:query> 
                                <c:forEach var="fila" items="${sqlPresupuesto.rows}">
                                      <tr>  
                                        <td>${fila.grafe_int_id}</td>
                                        <td>${fila.nombre_cliente}</td>                                       
                                        <td>${fila.nombre_usuario}</td>
                                        <td>${fila.grafe_flt_montototal}</td>
                                        <td>${fila.grafe_vch_fecha}</td>
                                        <td>
                                            <div class="col-lg-4">
                                                <form action="Modificar_cliente" method="POST">
                                                    <input type="hidden" name="idcliente" value="${fila.grafe_int_id}">
                                                    <input type="hidden" name="idpersona" value="${fila.nombre_cliente}">
                                                    <input type="hidden" name="tipcli" value="${fila.nombre_usuario}">
                                                    <input type="hidden" name="nomUser" value="${fila.grafe_vch_fecha}">
                                                   
                                                    <button class="btn btn-primary" type="submit" name="fncliente" value="camposModificar">Modificar</button>
                                                </form>
                                            </div>   
                                            <div class="col-lg-4">                                                   
                                            <form action="Modificar_cliente" method="POST">
                                                <input type="hidden" name="idpersona" value="${fila.grafe_int_id}">
                                                <button class="btn btn-danger" type="submit" name="fncliente" value="eliminarCliente">Eliminar</button>
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
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

 <jsp:include page="includes/footer.jsp"></jsp:include>  
