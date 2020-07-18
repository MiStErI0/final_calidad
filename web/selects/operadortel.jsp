<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
      url="jdbc:mysql://localhost:3306/dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false"
      user="root"  password="database"/>


<sql:query var="sqloperadortel" dataSource="${myDS}">
    select grafe_int_idoperador, grafe_vch_nombre from tbl_grafe_operador where grafe_int_idestado = 1
</sql:query>

<select class="form-control" id="seloperadortel" name="operadortel" onchange="">
    <option value="">Seleccione Nombre de Operador</option>
    <c:forEach var="fila" items="${sqloperadortel.rows}">
         <option value="${fila.grafe_int_idoperador}" ${param.operadortel == fila.grafe_int_idoperador ? 'selected' : ''}>${fila.grafe_vch_nombre}</option>
    </c:forEach>                           
</select>
