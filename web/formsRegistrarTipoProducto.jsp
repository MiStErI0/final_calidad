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
                  <li class="breadcrumb-item active">Registrar Tipo de Plato</li>
                </ol>
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header text-center">
                            Nuevo Tipo de Plato
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
                                <form action="Registrar_tipoproducto" method="POST" role="form">

                                    <div class="form-group">
                                        <label class="control-label" for="nombretipoproducto">Nombre de Tipo de Plato</label>
                                        <input type="text" class="form-control" id="nombretipoproducto" name="nombretipoproducto" placeholder="Nombre de tipo de producto">
                                    </div>

                                    <div class="text-right">
                                        <button id="btnRegistrar" class="btn btn-primary" type="submit">Registrar</button> 
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
<jsp:include page="includes/footer.jsp"></jsp:include> 