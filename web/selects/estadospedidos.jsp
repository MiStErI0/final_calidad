<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
      url="jdbc:mysql://localhost:3306/dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false"
      user="root"  password="database"/>

<sql:query var="sqlestadospedidos" dataSource="${myDS}">
    select grafe_int_id, grafe_vch_nombre from tbl_grafe_estadopedido where grafe_int_idestado = 1
</sql:query>

<select class="form-control" id="sqlestadospedidos" name="estadospedidos" onchange="">
    <option value="">Seleccione el estado del pedido</option>
    <c:forEach var="fila" items="${sqlestadospedidos.rows}">
         <option value="${fila.grafe_int_id}" ${param.estadospedidos == fila.grafe_int_id ? 'selected' : ''}>${fila.grafe_vch_nombre}</option>
    </c:forEach>                           
</select>