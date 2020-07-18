<jsp:include page="includes/header.jsp"></jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

    <div id="wrapper"> 

       <jsp:include page="includes/navbar.jsp"></jsp:include>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Estados y Categorias
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index_1.jsp">Inicio</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Estados y Categorias
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
          
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-file fa-5x"></i>
                                    </div>
                                </div>
                            </div>
                            <a href="formsMantenerEstadoPedido.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">Estado de Pedido</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>         
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-file fa-5x"></i>
                                    </div>
                                </div>
                            </div>
                            <a href="formsMantenerTipoPersona.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">Categoria de Persona</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>  
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-cubes fa-5x"></i>
                                    </div>
                                </div>
                            </div>
                            <a href="formsMantenerTipoProducto.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">Categoria de Producto</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>  
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-road fa-5x"></i>
                                    </div>
                                </div>
                            </div>
                            <a href="formsMantenerTipoVia.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">Categoria de Via</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>  
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-file fa-5x"></i>
                                    </div>
                                </div>
                            </div>
                            <a href="formsMantenerTipoDocumento.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">Categoria de Documento</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>  
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-file fa-5x"></i>
                                    </div>
                                </div>
                            </div>
                            <a href="formsMantenerTipoCliente.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">Categoria de Cliente</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>  
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-phone fa-5x"></i>
                                    </div>
                                </div>
                            </div>
                            <a href="formsMantenerTipoTelefono.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">Categoria de Telefono</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>  
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-file fa-5x"></i>
                                    </div>
                                </div>
                            </div>
                            <a href="formsMantenerTipoUsuario.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">Categoria de Usuario</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
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
