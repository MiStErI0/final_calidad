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
                  <li class="breadcrumb-item active">Mantener Tipo de Plato</li>
                </ol>

                <!-- Page Heading -->
                <div class="row justify-content-between">
                    <div class="col-lg-8">
                        <h2 class="page-header text-left">
                            Lista de Tipo de Plato
                        </h2>
                    </div>
                    <div class="col-lg-4 text-right">
                        <a href="formsRegistrarTipoProducto.jsp" class="btn btn-secondary">Nuevo Tipo de Plato</a>
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
                                                <th>idCategoriaPlato</th>
                                                <th>Nombre de Plato</th>
                                                <th></th>                                 
                                            </tr>
                                        </thead>
                                        <sql:query var="sqlmantenerTipoProducto" dataSource="${myDS}">                                        
                                            select grafe_int_id, grafe_vch_nombre from tbl_grafe_tipoproducto where grafe_int_idestado = 1                                        
                                        </sql:query> 
                                        <tbody>
                                        <c:forEach var="fila" items="${sqlmantenerTipoProducto.rows}">
                                            <tr>

                                                <td>${fila.grafe_int_id}</td>
                                                <td>${fila.grafe_vch_nombre}</td>
                                                <td>
                                                    <div class="d-inline-block">
                                                        <form action="Modificar_tipoproducto" method="POST">
                                                            <input type="hidden" name="idtipoproducto" value="${fila.grafe_int_id}">
                                                            <input type="hidden" name="nombretipoproducto" value="${fila.grafe_vch_nombre}">
                                                            <button class="btn btn-primary btn-sm" type="submit" name="fntipoproducto" value="camposModificar"><i class="fa fa-edit"></i></button>
                                                        </form>
                                                    </div>   
                                                    <div class="d-inline-block">                                                   
                                                    <form action="Modificar_tipoproducto" method="POST">
                                                        <input type="hidden" name="idtipoproducto" value="${fila.grafe_int_id}">
                                                        <button class="btn btn-danger btn-sm" type="submit" name="fntipoproducto" value="eliminarTipoProducto"><i class="fa fa-trash"></i></button>
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