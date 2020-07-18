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
                  <li class="breadcrumb-item active">Buscar Plato</li>
                </ol>

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-8">
                        <h2 class="page-header text-left">
                            Buscar Clientes
                        </h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 text-left">
                        <form class="mb-3" id="form-cli" method="post">
                            <div class="error-msgcli"></div>
                            <div class="form-row">
                              <div class="col-md-6">
                                 <label>Ingresa el codigo o nombre de cliente</label>
                                <div class="input-group mb-2">                  
									<input class="form-control fc-cliente" name="cncliente" type="text" placeholder="codigo o nombre del cliente" pattern="[\sa-zA-Z0-9]+" minlength="1">
                                <button class="btn btn-primary mx-2" id="buscarCli" type="submit">Buscar</button>
                                </div>
                              </div>
                            </div>
                            
                        </form>
                    </div>
                </div>
                <!-- /.row -->
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="row">
                                <div class="col-lg-12">
                                <div id="ResultCliente"></div>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $("#buscarCli").on("click",function(e){
        e.preventDefault();
        var form = $("#form-cli");
        var form_data = form.serialize();
        $("#ResultCliente").html("");
        $(".error-msgcli").html("");
        console.log(form_data)
        var cliente = form.find("input[name='cncliente']").val();
        if (cliente != "") {
        $.ajax({
          type: "POST",
          url:  "selects/buscarcliente.jsp",
          data: form_data,
          beforeSend: function () {
            $(".fc-cliente").attr("disabled", "disabled");
            $("#ResultCliente").html("<div class='text-center'><i class='fa fa-spinner'></i> Cargando..</div>").fadeIn();
          },
          error: function(data){
            console.log(data);
            $(".fc-cliente").val("");
            $(".form-control, .custom-select").removeAttr("disabled");
            $(".error-msgcli").html("<div class='alert alert-danger' role='alert'><i class='fa fa-exclamation-circle'></i> Hubo un error! Intentalo otra vez..</div>").fadeIn("fast");
          },
          success: function(data) {
            console.log(data);
            $(".fc-cliente").val("");
            $(".fc-cliente").removeAttr("disabled");
            $("#ResultCliente").html(data);
          }
        });
        }else{
            $(".error-msgcli").html("<div class='alert alert-danger' role='alert'><i class='fa fa-exclamation-circle'></i> Ingresa la codigo o nombre cliente</div>").fadeIn("fast");
          }   
      });
</script>
<jsp:include page="includes/footer.jsp"></jsp:include>
