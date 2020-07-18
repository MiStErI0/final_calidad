<jsp:include page="includes/header.jsp"></jsp:include>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
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
                            Generar Presupuesto de Pedido
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>  <a href="index_1.jsp">Inicio</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Generar Presupuesto de Pedido
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="error-msg"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <h2>Buscar Cliente</h2>
                    </div>
                </div>
                <div class="row text-right" style="margin-bottom:20px;">
                        <div class="col-lg-4">
                             <div class="input-group mb-2">
                                <input class="form-control" name="buscarcliente" type="text" placeholder="Buscar Cliente" readonly>
                                <div class="input-group-btn">
                                  <button class="btn btn-default" data-toggle="modal" data-target="#buscarCliModal" type="button">
                                    <i class="fa fa-fw fa-search"></i>
                                  </button>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="row">
                        <div class="col-lg-6">
                            <h2>Datos Cliente</h2>
                            <div id="ResultClienteDatos">
          
                            <form action="" id="form-lz-a" method="POST" role="form">
                            
                            <div class="form-group">
                                <label class="control-label" for="idcliente">IDcliente</label>
                                <input type="text" class="form-control" id="idcliente" name="idcliente" placeholder="ID Cliente" readonly>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="nombrecliente">Nombre cliente</label>
                                <input type="text" class="form-control" id="nombrecliente" name="nombrecliente" placeholder="Nombre cliente" readonly>
                            </div>    
                            <div class="form-group">
                                <label class="control-label" for="apepat">Ape. Paterno</label>
                                <input type="text" class="form-control" id="apepat" name="apepat" placeholder="Apellido Paterno" readonly>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="apemat">Ape. Materno</label>
                                <input type="text" class="form-control" id="apepmat" name="apemat" placeholder="Apellido Materno" readonly>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="dnicliente">Doc. Cliente</label>
                                <input type="text" class="form-control" id="dnicliente" name="dnicliente" placeholder="Doc. Cliente" readonly>
                            </div>
                      
                        </form>
                        </div>

                        </div> 
                    <div class="col-lg-6">
                        <div class="form-row">
                        <div class="col-md-12 text-right">
                          <button class="btn btn-primary mt-3 mb-3" data-toggle="modal" data-target="#buscarProModal" type="button">
                            <i class="fa fa-fw fa-plus"></i> Agregar Plato</button>
                        </div>
                      </div>
                         <h2>Lista de Producto</h2>
                         <div >
                        <div class="table-responsive">
                            <table class="table table-bordered" width="100%" cellspacing="0">
                              <thead class="thead-light">
                                <tr>
                                  <th>Id. Plato</th>
                                  <th>Plato</th>
                                  <th>Cantidad</th>
                                  <th>Precio x Und</th>
                                  <th>Precio Total</th>
                                  <th></th>
                                </tr>
                              </thead>
                              <tbody id="ResultProductosDatos">
                                       
                              </tbody>
                            </table>
                          </div>
                             </div>
                         <form class="row justify-content-end" id="form-lz-b" method="post">
                            <div class="col-sm-8 col-md-6 col-lg-5">
                              <div class="row">
                                <div class="col-sm-4">
                                  <label class="col-form-label">Total</label>
                                </div>
                                <div class="col-sm-8">
                                  <input class="form-control fc-venta mb-2" name="totventa" type="text" placeholder="" readonly>
                                </div>
                              </div>
                              <div class="row" style="margin-top: 10px;">
                                <div class="col-sm-12 text-right">
                                <input type="hidden" name="idusuario" value="${idusuario}">
                                <%
                                    Date dNow = new Date( );
                                    SimpleDateFormat ft = 
                                    new SimpleDateFormat ("dd/MM/yyyy");
                                 %>
                                 <input type="hidden" name="fechapre" value="<%= ft.format(dNow)%>">
                                 <input type="hidden" name="subtotalventa" value="">
                                <button class="btn btn-primary mt-3 mb-2" id="doIt" type="submit">Grabar </button>
                                </div>
                              </div>
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
<!-- Buscar Cliente Modal-->
    <div class="modal fade" id="buscarCliModal" tabindex="-1" role="dialog" aria-labelledby="buscarCliModalLabel" aria-hidden="true"> 
      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="buscarCliModalLabel">Buscar Cliente</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="row">
            <form class="mb-3" id="form-cli" method="post">
              <div class="form-row">
                <div class="col-md-6">
                   <label>Buscar Cliente</label>
                  <div class="input-group mb-2">                  
					  <input class="form-control fc-cliente mb-2" name="nombrecliente" type="text" placeholder="Ingresa nombre o codigo del cliente">
                  <div class="input-group-btn">
                        <button class="btn btn-primary mt-sm-4" id="buscarCli" type="submit">Buscar</button>
                  </div>
                  </div>
                </div>
              </div>
              <div class="error-msgcli"></div>
            </form>
              </div>
              <div class="row" style="margin-top: 20px">
            <div class="col-lg-12">
            <div id="ResultCliente">
          
            </div>
               </div>
              </div>
          </div>
          <!--<div class="modal-footer">
            <button class="btn btn-primary" id="doIt" type="submit">Confirmar</button>
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
          </div>-->
        </div> 
      </div> 
    </div>
    <!-- Buscar Producto Modal-->
    <div class="modal fade" id="buscarProModal" tabindex="-1" role="dialog" aria-labelledby="buscarProModalLabel" aria-hidden="true"> 
      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="buscarProModalLabel">Buscar Producto</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="row">
            <form class="col-lg-12" id="form-lz2" method="post">
              <div class="row">
                <div class="col-md-4">
                  <label>Codigo Producto</label>
                  <div class="input-group mb-2">                  
                  <input class="form-control fc-producto mb-2" name="idproducto" type="text" placeholder="Ingresa codigo producto">
                  <div class="input-group-btn">
                        <button class="btn btn-primary mt-sm-4" id="buscarPro" type="submit">Buscar</button>
                  </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <label>Cantidad de Producto</label>
                  <input class="form-control fc-producto mb-2" name="cantidadproducto" type="number" min="1" placeholder="Ingresa la cantidad de venta" value="">
                </div>
              </div>
              <div class="error-msgpro"></div>
            </form>
            </div>
            <div class="row" style="margin-top: 20px">
            <div class="col-lg-12">
            <div id="ResultProducto">
          
            </div>
               </div>
              </div>
          </div>
          <!--<div class="modal-footer">
            <button class="btn btn-primary" id="doIt" type="submit">Confirmar</button>
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
          </div>-->
        </div> 
      </div> 
    </div>  
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>

        $("#doIt").on("click",function(e){
        e.preventDefault();
        var forma = $("#form-lz-a");
        var forma_data = forma.serialize();
        var formb = $("#form-lz-b");
        var formb_data = formb.serialize();
        var codProducto = $(".codProducto").val();
        var cantVenta = $(".cantVenta").val();
        //$("#tableResult").html("");
        $(".error-msg").html("");
        console.log(forma_data +"&"+ formb_data)
        $.ajax({
          type: "POST", 
          url:  "selects/registrarpresupuesto.jsp",
          data: forma_data+"&"+formb_data,
          //dataType: html,
          //data: "name="+name+"&email="+email+"&tel="+tel+"&message="+message,
          beforeSend: function () {
            //$("#saveModal").modal('hide');
            //$(".form-control, .custom-select").attr("disabled", "disabled");
            //$("#tableResult").html("<tr><td colspan='11'><div class='text-center'><i class='fa fa-spinner'></i> Cargando..</div></td></tr>").fadeIn();
          },
          error: function(data){
            console.log(data);
            //$(".form-control, .custom-select").val("");
            //$(".form-control, .custom-select").removeAttr("disabled");
            $(".error-msg").html("<div class='alert alert-danger' role='alert'><i class='fa fa-exclamation-circle'></i> Hubo un error! Intentalo otra vez..</div>").fadeIn("fast");
          },
          success: function(data) {
            console.log(data);
            $(".error-msg").html(data);
            /*if (data.status == "notValid" || data.status == "notSent") {
              //$(".form-control, .custom-select").val("");
              //$(".form-control, .custom-select").removeAttr("disabled");
              $(".error-msg").html("<div class='alert alert-danger' role='alert'><i class='fa fa-exclamation-circle'></i> "+data.msg+"</div>").fadeIn("fast");
              //$("#tableResult").html("");
            }else if(data.status == "dataSuccess" || data.status == "dataError"){
              $(".form-control, .custom-select").val("");
              //$(".form-control, .custom-select").removeAttr("disabled");
              $(".error-msg").html("<div class='alert alert-info' role='alert'>"+data.msg+"</div>").fadeIn("fast");
              var dataArr = "";
              for (var key in data) {
                if (data.hasOwnProperty(key)) {
                  dataArr += data[key]["data"];
                }
              }
              //$("#tableResult").html(dataArr);
            }*/
          }
        });   
      });
        $("#buscarCli").on("click",function(e){
        e.preventDefault();
        var form = $("#form-cli");
        var form_data = form.serialize();
        $("#ResultCliente").html("");
        $(".error-msgcli").html("");
        console.log(form_data)
        $.ajax({
          type: "POST",
          url:  "selects/buscarcliente.jsp",
          data: form_data,
          beforeSend: function () {
            $(".fc-cliente").attr("disabled", "disabled");
            $("#ResultCliente").html("<tr><td colspan='11'><div class='text-center'><i class='fa fa-spinner'></i> Cargando..</div></td></tr>").fadeIn();
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
            var f = $(document).find(".fillCli");
              console.log(f);
              fillCli();
          }
        });
      });
      var fillCli = function(){ 
        $(".fillCli").click(function(){
          //e.preventDefault();
          //alert('You clicked radio!');
          var cod = $(this).val();
          console.log(cod)
          var form = $("#form-lz");
        
          $.ajax({
            type: "POST",
            url:  "selects/buscarcliente_id.jsp",
            data: "idcliente="+cod,
            error: function(data){
              console.log(data);
            },
            success: function(data) {
              $("#buscarCliModal").modal('hide');
              console.log(data);
              $("#ResultClienteDatos").html(data);
            }
          });    
        });
      }
      $('#buscarCli').on('hidden.bs.modal', function (e) {
          $("#ResultCliente").html("");
          $(".error-msgcli").html("");
          $(".fc-cliente").val("");
        });
      $("#buscarPro").on("click",function(e){
        e.preventDefault();
        var form = $("#form-lz2");
        var form_data = form.serialize();
        $("#ResultProducto").html("");
        $(".error-msgpro").html("");
        console.log(form_data)
        $.ajax({
          type: "POST",
          url:  "selects/buscarproducto.jsp",
          data: form_data,
          beforeSend: function () {
            $(".fc-producto").attr("disabled", "disabled");
            $("#ResultProducto").html("<tr><td colspan='11'><div class='text-center'><i class='fa fa-spinner'></i> Cargando..</div></td></tr>").fadeIn();
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
            var f = $(document).find(".fillPro");
              console.log(f);
              fillPro();
          }
        });
      });
      var dataArr = subtotalArr = totalArr = []; 
      var fillPro = function(){
        $(".fillPro").click(function(){
          //e.preventDefault();
          //alert('You clicked radio!');
          //Math.floor(Math.random() * (15 - 1)) + 1;
          var cod = $(this).val();
          var cant = $("#form-lz2").find("input[name='cantidadproducto']").val();
          //var pt = cant*;
          console.log(cod+"-"+cant)
          var form = $("#form-lz-b");
          var dataItem  = subtotalItem = totalItem = 0;
          if (cant != "") {
            $.ajax({
              type: "POST",
              url:  "selects/buscarproducto_id.jsp",
              data: "idproducto="+cod+"&cantidadproducto="+cant,
              error: function(data){
                console.log(data);
                //$(".form-control, .custom-select").val("");
                //$(".form-control, .custom-select").removeAttr("disabled");
                $(".error-msg").html("<div class='alert alert-danger' role='alert'><i class='fa fa-exclamation-circle'></i> Hubo un error! Intentalo otra vez..</div>").fadeIn("fast");
              },
              success: function(data) {
                $("#buscarProModal").modal('hide');
                console.log(data);
                var subtototal = igv = total = 0;
                $("#buscarCliModal").modal('hide');
                $("#ResultProductosDatos").append(data);
                    $("#ResultProductosDatos").find("td[class='productototal']").each(function(i) {
                      //if (i != 0)
                        total += parseFloat($(this).html());
                    });
                console.log(total);
                form.find("input[name='subtotalventa']").val(subtotalItem);
                form.find("input[name='totventa']").val(total);
                  $(".fc-producto").val("");                
              }
            });   
          }else{
            $(".error-msgpro").html("<div class='alert alert-danger' role='alert'><i class='fa fa-exclamation-circle'></i> Ingresa la cantidad del producto</div>").fadeIn("fast");
          }

        });
        //$("#tableResult").html(dataArr);
      }
      $('#buscarProModal').on('hidden.bs.modal', function (e) {
          $("#ResultProducto").html("");
          $(".error-msgpro").html("");
          $(".fc-producto").val("");
        });
    </script>
 <jsp:include page="includes/footer.jsp"></jsp:include>  
