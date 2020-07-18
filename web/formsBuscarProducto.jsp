<jsp:include page="includes/header.jsp"></jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<jsp:include page="includes/navbar.jsp"></jsp:include>

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
                            Buscar Platos
                        </h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 text-left">
                        <form class="mb-3" id="form-pro" method="post">
                            <div class="error-msgpro"></div>
                            <div class="form-row">
                              <div class="col-md-6">
                                 <label>Ingresa el codigo de Platos</label>
                                <div class="input-group mb-2">                  
                                <input class="form-control fc-producto" name="idproducto" type="text" placeholder="codigo producto" pattern="[0-9]+" minlength="1">
                                <button class="btn btn-primary mx-2" id="buscarPro" type="submit">Buscar</button>
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
                                <div id="ResultProducto"></div>
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
    $("#buscarPro").on("click",function(e){
        e.preventDefault();
        var form = $("#form-pro");
        var form_data = form.serialize();
        $("#ResultProducto").html("");
        $(".error-msgpro").html("");
        console.log(form_data)
        var producto = form.find("input[name='idproducto']").val();
        if (producto != "") {
        $.ajax({
          type: "POST",
          url:  "selects/buscarproducto.jsp",
          data: form_data,
          beforeSend: function () {
            $(".fc-producto").attr("disabled", "disabled");
            $("#ResultProducto").html("<div class='text-center'><i class='fa fa-spinner'></i> Cargando..</div>").fadeIn();
          },
          error: function(data){
            console.log(data);
            $(".fc-producto").val("");
            $(".form-control, .custom-select").removeAttr("disabled");
            $(".error-msgpro").html("<div class='alert alert-danger' role='alert'><i class='fa fa-exclamation-circle'></i> Hubo un error! Intentalo otra vez..</div>").fadeIn("fast");
          },
          success: function(data) {
            console.log(data);
            $(".fc-producto").val("");
            $(".fc-producto").removeAttr("disabled");
            $("#ResultProducto").html(data);
            /*var f = $(document).find(".fillPro");
              console.log(f);
              fillCli();*/
          }
        });
        }else{
            $(".error-msgpro").html("<div class='alert alert-danger' role='alert'><i class='fa fa-exclamation-circle'></i> Ingresa la codigo producto</div>").fadeIn("fast");
          } 
      });
</script>
<jsp:include page="includes/footer.jsp"></jsp:include>
