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
                  <li class="breadcrumb-item active">Modificar Tipo de Cliente</li>
                </ol>
                <!-- Page Heading --> 
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">
                            Modificar Tipo de Cliente
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
                        <form action="Modificar_tipocliente" method="POST" role="form">

                            <div class="form-group">
                                <label class="control-label" for="idtipocliente">IdCategoriaCliente</label>
                                <input type="text" class="form-control" id="idtipocliente" value="${param.idtipocliente}" disabled>
                                <input type="hidden" name="idtipocliente" value="${param.idtipocliente}">
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="nombretipocliente">Nombre de Categoria cliente</label>
                                <input type="text" class="form-control" id="nombretipocliente" name="nombretipocliente" value="${param.nombretipocliente}" placeholder="Nombre de Categoria cliente">
                            </div>
                       
                            <div>
                                <button id="btnModificar" class="btn btn-primary" type="submit" name="fntipocliente" value="modificarTipoCliente">Modificar</button> 
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
<jsp:include page="includes/footer.jsp"></jsp:include> 