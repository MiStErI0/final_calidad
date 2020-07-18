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
                  <li class="breadcrumb-item active">Mantener Plato</li>
                </ol>

                <!-- Page Heading -->
                <div class="row justify-content-between">
                    <div class="col-lg-8">
                        <h2 class="page-header text-left">
                            Lista de Platos
                        </h2>
                    </div>
                    <div class="col-lg-4 text-right">
                        <a href="formsRegistrarProducto.jsp" class="btn btn-secondary">Nuevo Plato</a>
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
                                                <th>Id. Plato</th>
                                                <th>Plato</th>
                                                <th>Costo</th>
                                                <th>Precio</th>
                                                <th>Cantidad</th>
                                                <th>Categoria</th>
                                                <th>Fecha de Vencimiento</th>
                                                <th>Fecha de Registro</th>
                                                <th></th>                                 
                                            </tr>
                                        </thead>
                                        <sql:query var="sqlmantenerProductos" dataSource="${myDS}">                                        
                                            select grafe_int_id,grafe_int_idmarca, grafe_flt_costo, grafe_flt_precio, grafe_int_cantidad, grafe_dat_fchvencimiento, grafe_dat_fchregistro,
                                            grafe_int_idtipo from tbl_grafe_producto where grafe_int_idestado = 1                                         
                                        </sql:query> 
                                        <tbody>
                                        <c:forEach var="fila" items="${sqlmantenerProductos.rows}">
                                              <tr>  
                                                <td>${fila.grafe_int_id}</td>
                                                <td>${fila.grafe_int_idmarca}</td>                                       
                                                <td>${fila.grafe_flt_costo}</td>
                                                <td>${fila.grafe_flt_precio}</td>
                                                <td>${fila.grafe_int_cantidad}</td>
                                                <td>${fila.grafe_int_idtipo}</td>
                                                <td>${fila.grafe_dat_fchvencimiento}</td>
                                                <td>${fila.grafe_dat_fchregistro}</td>
                                                <td>
                                                    <div class="d-inline-block">
                                                        <form action="Modificar_producto" method="POST">
                                                            <input type="hidden" name="idproducto" value="${fila.grafe_int_id}">
                                                            <input type="hidden" name="idmarca" value="${fila.grafe_int_idmarca}">
                                                            <input type="hidden" name="costopro" value="${fila.grafe_flt_costo}">
                                                            <input type="hidden" name="preciopro" value="${fila.grafe_flt_precio}">
                                                            <input type="hidden" name="cantidadpro" value="${fila.grafe_int_cantidad}">
                                                            <input type="hidden" name="idtipocat" value="${fila.grafe_int_idtipo}">
                                                            <input type="hidden" name="fechaven" value="${fila.grafe_dat_fchvencimiento}">
                                                            <input type="hidden" name="fechareg" value="${fila.grafe_dat_fchregistro}">
                                                            <button class="btn btn-primary btn-sm" type="submit" name="fnproducto" value="camposModificar"><i class="fa fa-edit"></i></button>
                                                        </form>
                                                    </div>   
                                                    <div class="d-inline-block">                                                   
                                                    <form action="Modificar_producto" method="POST">
                                                        <input type="hidden" name="idproducto" value="${fila.grafe_int_id}">
                                                        <button class="btn btn-danger btn-sm" type="submit" name="fnproducto" value="eliminarProducto"><i class="fa fa-trash"></i></button>
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
