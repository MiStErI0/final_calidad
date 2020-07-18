<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
				   url="jdbc:mysql://localhost:3306/dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false"
				   user="root"  password="database"/>


<sql:query var="sqltipersona" dataSource="${myDS}">
    select grafe_int_id, grafe_vch_nombre from tbl_grafe_tipopersona where grafe_int_idestado = 1
</sql:query>

<select class="form-control" id="seltipper" name="tipper" onchange="">
    <option value="">Seleccione tipo de persona</option>
        <c:forEach var="fila" items="${sqltipersona.rows}">
         <option value="${fila.grafe_int_id}" ${param.tipper == fila.grafe_int_id ? 'selected' : ''}>${fila.grafe_vch_nombre}</option>
        </c:forEach>             
</select>
