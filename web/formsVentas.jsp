<jsp:include page="includes/header.jsp"></jsp:include>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
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
                  <li class="breadcrumb-item active">Pedido</li>
                </ol>
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">
                            Generar Pedido
                        </h2>
                    </div>
                </div>
                <!-- /.row -->
                <div class="card mb-3">
                    <div class="card-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="error-msg"></div>
                    </div>
                </div>
                <div class="row text-right">
                        <div class="col-lg-4">
                             <div class="input-group mb-2">
                                <!--<input class="form-control" name="buscarcliente" type="text" placeholder="Buscar Cliente" readonly>-->
                                <div class="">
                                  <button class="btn btn-secondary" data-toggle="modal" data-target="#buscarCliModal" type="button">
                                    <i class="fa fa-fw fa-search"></i> Buscar Cliente
                                  </button>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="row">
                        <div class="col-lg-6">
                            <h3 class="mt-3">Datos Cliente</h3>
                            <div id="ResultClienteDatos">
          
                            <form action="" id="form-lz-a" method="POST" role="form">
                                <div class="form-row">
                                    <div class="form-group col-lg-6">
                                        <label class="control-label" for="idcliente">IDcliente</label>
                                        <input type="text" class="form-control" id="idcliente" name="idcliente" placeholder="ID Cliente" readonly>
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label class="control-label" for="nombrecliente">Nombre cliente</label>
                                        <input type="text" class="form-control" id="nombrecliente" name="nombrecliente" placeholder="Nombre cliente" readonly>
                                    </div> 
                                </div> 
                                <div class="form-row">
                                    <div class="form-group col-lg-6">
                                        <label class="control-label" for="apepat">Ape. Paterno</label>
                                        <input type="text" class="form-control" id="apepat" name="apepat" placeholder="Apellido Paterno" readonly>
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label class="control-label" for="apemat">Ape. Materno</label>
                                        <input type="text" class="form-control" id="apepmat" name="apemat" placeholder="Apellido Materno" readonly>
                                    </div>
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
                         <h3>Lista de Platos</h3>
                         <div >
                        <div class="table-responsive">
                            <table class="table table-bordered" width="100%" cellspacing="0">
                              <thead class="thead-light">
                                <tr>
                                  <th>Id. Plato</th>
                                  <th>Marca</th>
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
                            <div class="col-sm-8 col-md-6 col-lg-6">
                              <div class="row">
                                <div class="col-sm-5">
                                  <label class="col-form-label">Total Venta:</label>
                                </div>
                                <div class="col-sm-7">
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
                </div>                
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
                <div class="col-lg-12">
                    <div class="error-msgcli"></div>               
                </div>   
                <div class="col-lg-6">
                    <form class="mb-3" id="form-cli" method="post">
                        <div class="">
                           <label>Buscar Cliente</label>
                          <div class="input-group mb-2">                  
                          <input class="form-control fc-cliente" name="cncliente" type="text" placeholder="Ingresa nombre cliente o codigo">
                          <div class="input-group-append">
                                <button class="btn btn-primary" id="buscarCli" type="submit"><i class="fa fa-fw fa-search"></i></button>
                          </div>
                          </div>
                        </div>
                    </form>
                 </div>
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
            <h5 class="modal-title" id="buscarProModalLabel">Buscar Plato</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="row">
            <form class="col-lg-12" id="form-lz2" method="post">
                <div class="error-msgpro"></div>
              <div class="row">
                <div class="col-md-4">
                  <label>Codigo Plato</label>
                  <div class="input-group mb-2">                  
                  <input class="form-control fc-producto" name="idproducto" type="text" placeholder="Ingresa codigo producto">
                  <div class="input-group-append">
                        <button class="btn btn-primary" id="buscarPro" type="submit"><i class="fa fa-fw fa-search"></i></button>
                  </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <label>Cantidad de Platos</label>
                  <input class="form-control fc-producto" name="cantidadproducto" type="number" min="1" placeholder="Ingresa la cantidad de venta" value="">
                </div>
              </div>
              
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
          beforeSend: function () { 
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
            $(".error-msg").html("<div class='alert alert-success' role='alert'><i class='fa fa-check-circle'></i>"+data+"</div>").fadeIn("fast");
            $(".form-control").val("");
            $("#ResultProductosDatos").html("");
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
        var cliente = form.find("input[name='cncliente']").val();
        if (cliente != "") {
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
        }else{
            $(".error-msgcli").html("<div class='alert alert-danger' role='alert'><i class='fa fa-exclamation-circle'></i> Ingresa el codigo o nombre cliente</div>").fadeIn("fast");
        }
      });
      var fillCli = function(){ 
        $(".fillCli").click(function(){
          //e.preventDefault();
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
              $("#sqlbuscarclientes").html("");
              $("#ResultClienteDatos").html(data);
            }
          });    
        });
      }
      $('#buscarCli').on('hidden.bs.modal', function (e) {
          $("#ResultCliente").html("");
          $(".error-msgcli").html("");
          $(".fc-cliente").val("");
          $("#sqlbuscarclientes").html("");
        });
      $("#buscarPro").on("click",function(e){
        e.preventDefault();
        var form = $("#form-lz2");
        var form_data = form.serialize();
        $("#ResultProducto").html("");
        $(".error-msgpro").html("");
        console.log(form_data)
        var idproducto = $("#form-lz2").find("input[name='idproducto']").val();
        if (idproducto != "") {
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
                $("#sqlbuscarproductos").html("");
                $(".fc-producto").val("");
                $(".fc-producto").removeAttr("disabled");
                $("#ResultProducto").html(data);
                var f = $(document).find(".fillPro");
                  console.log(f);
                  fillPro();
              }
            });
        }else{
            $(".error-msgpro").html("<div class='alert alert-danger' role='alert'><i class='fa fa-exclamation-circle'></i> Ingresa el codigo del producto</div>").fadeIn("fast");
        }
      });
      var dataArr = subtotalArr = totalArr = []; 
      var fillPro = function(){
        $(".fillPro").click(function(){
          //e.preventDefault();
          //Math.floor(Math.random() * (15 - 1)) + 1;
          var cod = $(this).val();
          var cant = $("#form-lz2").find("input[name='cantidadproducto']").val();
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
                $(".error-msgpro").html("");
                $("#sqlbuscarproductos").html("");
                var subtototal = igv = total = 0;
                $("#buscarCliModal").modal('hide');
                $("#ResultProductosDatos").append(data);
                    $("#ResultProductosDatos").find("td[class='productototal']").each(function(i) {
                        total += parseFloat($(this).html());
                    });
                console.log(total);
                form.find("input[name='subtotalventa']").val(subtotalItem);
                form.find("input[name='totventa']").val(total.toFixed(2));
                $(".fc-producto").val("");                
              }
            });   
          }else{
            $(".error-msgpro").html("<div class='alert alert-danger' role='alert'><i class='fa fa-exclamation-circle'></i> Ingresa la cantidad del producto</div>").fadeIn("fast");
          }

        });
      }
      $('#buscarProModal').on('hidden.bs.modal', function (e) {
          $("#ResultProducto").html("");
          $(".error-msgpro").html("");
          $(".fc-producto").val("");
          $("#sqlbuscarproductos").html("");
        });
    </script>
 <jsp:include page="includes/footer.jsp"></jsp:include>  
