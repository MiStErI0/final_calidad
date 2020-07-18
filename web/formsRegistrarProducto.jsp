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
                  <li class="breadcrumb-item active">Registrar Plato</li>
                </ol>
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header text-center">
                            Registrar Plato
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
                                <form action="Registrar_producto" method="POST" role="form">
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="idmarca">Marca</label>
                                            <jsp:include page="selects/marcaproducto.jsp">
                                                <jsp:param name="marca" value="" />
                                            </jsp:include>                           
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="idtipocat">Tipo de Plato</label>
                                            <jsp:include page="selects/tipoproducto.jsp">
                                                <jsp:param name="tipproducto" value="" />
                                            </jsp:include>                          
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-lg-5">
                                            <label class="control-label" for="costopro">Costo</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend"><div class="input-group-text">S/</div></div>
                                                <input type="number" min="0" step="0.01" pattern="^\d+(?:\.\d{1,2})?$" class="form-control" id="costopro" name="costopro">
                                            </div>
                                        </div>
                                        <div class="form-group col-lg-5">
                                            <label class="control-label" for="preciopro">Precio</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend"><div class="input-group-text">S/</div></div>
                                                <input type="number" min="0" step="0.01" pattern="^\d+(?:\.\d{1,2})?$" class="form-control" id="preciopro" name="preciopro">
                                            </div>
                                        </div>
                                        <div class="form-group col-lg-2">
                                            <label class="control-label" for="cantidadpro">Cantidad</label>
                                            <input type="number" min="0" class="form-control" id="cantidadpro" name="cantidadpro">
                                        </div>
                                    </div>
                                    <div class="form-row">                                       
                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="fechareg">Fecha de Registro</label>
                                            <input type="date" class="form-control" id="fechareg" name="fechareg">
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <label class="control-label" for="fechaven">Fecha de Vencimiento</label>
                                            <input type="date" class="form-control" id="fechaven" name="fechaven">
                                        </div>
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