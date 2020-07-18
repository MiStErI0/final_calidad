<%--@page contentType="text/html" pageEncoding="UTF-8"--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
  <!-- Navigation-->
  
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="inicio.jsp">Cevicheria Daria Mar</a><img src="../imgs/cevicheria.jpg" alt=""/>
    
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Inicio">
          <a class="nav-link" href="inicio.jsp">
            <i class="fa fa-fw fa-home"></i>
            <span class="nav-link-text">Inicio</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Buscar">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseBuscar" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-search"></i>
            <span class="nav-link-text">Buscar</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseBuscar">
            <li><a href="formsBuscarProducto.jsp">Buscar Plato</a></li>
            <li><a href="formsBuscarCliente.jsp">Buscar Cliente</a></li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Registrar">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseRegistrar" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-list"></i>
            <span class="nav-link-text">Registrar</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseRegistrar">
            <li><a href="formsRegistrarProducto.jsp">Registrar Plato</a></li>
            <li><a href="formsRegistrarUsuario.jsp">Registrar Usuario</a></li>
            <li><a href="formsRegistrarCliente.jsp">Registrar Cliente</a></li>
            <li><a href="formsRegistrarEstadoPedido.jsp">Registrar Estado Pedido</a></li>
            <li><a href="formsRegistrarMarca.jsp">Registrar Marca</a></li>
            <li><a href="formsRegistrarOperador.jsp">Registrar Operador</a></li>
            <li><a href="formsRegistrarTipoCliente.jsp">Registrar Tipo Cliente</a></li>
            <li><a href="formsRegistrarTipoDocumento.jsp">Registrar Tipo Documento</a></li>
            <li><a href="formsRegistrarTipoPersona.jsp">Registrar Tipo Persona</a></li>
            <li><a href="formsRegistrarTipoProducto.jsp">Registrar Tipo Producto</a></li>
            <li><a href="formsRegistrarTipoTelefono.jsp">Registrar Tipo Telefono</a></li>
            <li><a href="formsRegistrarTipoUsuario.jsp">Registrar Tipo Usuario</a></li>
          </ul>
        </li>
        <c:choose>
            <c:when test="${idcargo == 1 || idcargo == 2}">
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Mantenimiento">
                  <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMantenimiento" data-parent="#exampleAccordion">
                    <i class="fa fa-fw fa-cog"></i>
                    <span class="nav-link-text">Mantenimiento</span>
                  </a>
                  <ul class="sidenav-second-level collapse" id="collapseMantenimiento">
                    <li><a href="formsMantenerProducto.jsp">Mantener Plato</a></li>
                    <li><a href="formsMantenerUsuario.jsp">Mantener Usuario</a></li>
                    <li><a href="formsMantenerCliente.jsp">Mantener Cliente</a>
                    <li><a href="formsMantenerEstadoPedido.jsp">Mantener Estado Pedido</a></li>
                    <li><a href="formsMantenerMarca.jsp">Mantener Marca</a></li>
                    <li><a href="formsMantenerOperador.jsp">Mantener Operador</a></li>
                    <li><a href="formsMantenerTipoCliente.jsp">Mantener Tipo Cliente</a></li>
                    <li><a href="formsMantenerTipoDocumento.jsp">Mantener Tipo Documento</a></li>
                    <li><a href="formsMantenerTipoPersona.jsp">Mantener Tipo Persona</a></li>
                    <li><a href="formsMantenerTipoProducto.jsp">Mantener Tipo Producto</a></li>
                    <li><a href="formsMantenerTipoTelefono.jsp">Mantener Tipo Telefono</a></li>
                    <li><a href="formsMantenerTipoUsuario.jsp">Mantener Tipo Usuario</a></li>
                  </ul>
                </li>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${idcargo == 1 || idcargo == 2}">
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Generar Venta">
                    <a class="nav-link" href="formsVentas.jsp">
                      <i class="fa fa-fw fa-copy"></i>
                      <span class="nav-link-text">Generar Pedido</span>
                    </a>
                </li>
            </c:when>
        </c:choose>
        <!--li class="nav-item d-none" data-toggle="tooltip" data-placement="right" title="Pedidos">
          <a class="nav-link" href="formsPedidos.jsp">
            <i class="fa fa-fw fa-copy"></i>
            <span class="nav-link-text">Pedidos</span>
          </a>
        </li-->
      </ul>
      
        <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item"><a class="nav-link text-center" id="sidenavToggler"><i class="fa fa-fw fa-angle-left"></i></a></li>
      </ul>
      
        <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <div class="nav-link text-white">Hola, ${usuario}</div>
        </li>
        
        <li class="nav-item d-none">
            <form class="form-inline my-2 my-lg-0 mr-lg-2">
                <div class="input-group"><span class="input-group-append"><button class="btn btn-primary" type="button"><i class="fa fa-search">
                    </i></button></span></div>
            </form>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="cerrar_sesion">
            <i class="fa fa-fw fa-sign-out"></i> Salir</a>
        </li>
      </ul>
    </div>
  </nav>
<!-- header-->