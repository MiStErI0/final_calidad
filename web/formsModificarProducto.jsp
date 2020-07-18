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
                  <li class="breadcrumb-item active">Modificar Plato</li>
                </ol>
                <!-- Page Heading --> 
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">
                            Modificar Plato
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
                        <form action="Modificar_producto" method="POST" role="form">

                            <div class="form-group">
                                <label class="control-label" for="idproducto">IdProducto</label>
                                <input type="text" class="form-control" id="idproducto" value="${param.idproducto}" disabled>
                                <input type="hidden" name="idproducto" value="${param.idproducto}">
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="idmarca">Plato</label>
                                <jsp:include page="selects/marcaproducto.jsp">
                                    <jsp:param name="marca" value="${param.idmarca}" />
                                </jsp:include>                           
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="costopro">Costo</label>
                                <input type="number" min="0" step="0.01" pattern="^\d+(?:\.\d{1,2})?$" class="form-control" id="costopro" name="costopro" value="${param.costopro}">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="preciopro">Precio</label>
                                <input type="number" min="0" step="0.01" pattern="^\d+(?:\.\d{1,2})?$" class="form-control" id="preciopro" name="preciopro" value="${param.preciopro}">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="cantidadpro">Cantidad</label>
                                <input type="number" min="0" class="form-control" id="cantidadpro" name="cantidadpro" value="${param.cantidadpro}">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="fechaven">Fecha de Vencimiento</label>
                                <input type="date" class="form-control" id="fechaven" name="fechaven" value="${param.fechaven}">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="fechareg">Fecha de Registro</label>
                                <input type="date" class="form-control" id="fechareg" name="fechareg" value="${param.fechareg}">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="idtipocat">Tipo</label>
                                <jsp:include page="selects/tipoproducto.jsp">
                                    <jsp:param name="tipproducto" value="${param.idtipocat}" />
                                </jsp:include>                          
                            </div>
                            
                            <div>
                                <button id="btnModificar" class="btn btn-primary" type="submit" name="fnproducto" value="modificarProducto">Modificar</button> 
                            </div>
                        </form>
                  
                    </div>
                     
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