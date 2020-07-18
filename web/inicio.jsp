<jsp:include page="includes/header.jsp"></jsp:include>
<jsp:include page="includes/navbar.jsp"></jsp:include>
<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
      url="jdbc:mysql://localhost:3306/dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false"
      user="root"  password="database"/>
    <div id="wrapper">
        <div id="page-wrapper" class="content-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"></h1>
                    </div>
                </div>

                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card mb-3">
                            <div class="card-header">
                                <i class="fa fa-home"></i>  Bienvenido</div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-8 my-auto">
                                        <h2><img src="imgs/cevicheria.jpg" width="350" alt="Cevicheria Daria Mar"></h2></div>
                                    <div class="col-sm-8 my-auto">
                                        <p>Bueno. A pesar de ser un restaurante de ceviches y mariscos, no se siente concentrado el 
                                           olor a cebolla o a fritura. Asimismo,se cuida bastante la limpieza de las mesas y del 
                                           local en general, por lo que casi no entran moscas.</p>
                                        <p>Te traemos nuestros riquisimos platos de fondo como: Arroz la brava, Arroz con mariscos, 
                                           Arroz con langostinos, Chaufa de mariscos o pescado, Saltado de mariscos, Filete de 
                                           pescado a la plancha, Pescado a la chorrillana y muchos platos mas.</p>
                                        <p>Elige el plato que te guste.</p>
                                    </div>
                                    <div class="col-sm-4 text-center my-auto">
                                        <img src="imgs/ceviche0.jpg" width="300" alt="Cevicheria Daria Mar"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                
                <!--div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-area-chart"></i> Graficas
                    </div>
                    <div class="card-body">
                        <canvas id="myAreaChart" style="width:100%; height:30px"></canvas>
                    </div>
                    <div class="card-footer small text-muted"></div>
                </div-->

            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/morris-data.js"></script>
<jsp:include page="includes/footer.jsp"></jsp:include>