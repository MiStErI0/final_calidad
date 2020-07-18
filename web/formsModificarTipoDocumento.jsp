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
                  <li class="breadcrumb-item active">Modificar Tipo de Documento</li>
                </ol>
                <!-- Page Heading --> 
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">
                            Modificar Tipo de Documento
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

                        <form action="Modificar_tipodocumento" method="POST" role="form">
                            
                             <div class="form-group">
                                <label class="control-label" for="idtipodocumento">IdCategoriaDocumento</label>
                                <input type="text" class="form-control" id="idtipodocumento" value="${param.idtipodocumento}" disabled>
                                <input type="hidden" name="idtipodocumento" value="${param.idtipodocumento}">
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label" for="nombretipodocumento">Nombre de Categoria de Documento</label>
                                <input type="text" class="form-control" id="nombretipodocumento" name="nombretipodocumento" value="${param.nombretipodocumento}" placeholder="Nombre de categoria de Documento">
                            </div>
                       
                            <div>
                                <button id="btnModificar" class="btn btn-primary" type="submit" name="fntipodocumento" value="modificarTipoDocumento">Modificar</button> 
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