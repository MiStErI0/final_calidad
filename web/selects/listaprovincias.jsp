<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
      url="jdbc:mysql://localhost:3306/dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false"
      user="root"  password="database"/>


<sql:query var="sqlprovincias" dataSource="${myDS}">
    select grafe_int_id, grafe_vch_nombre from tbl_grafe_provincia where grafe_int_iddepartamento = ${param.dep}
</sql:query>

<select class="form-control" id="selprovincias" name="selprovincias" onchange="distritos()">
    <option value="">Seleccione la Provincia</option>
    <c:forEach var="fila" items="${sqlprovincias.rows}">
         <option value="${fila.grafe_int_id}" ${param.prov == fila.grafe_int_id ? 'selected' : ''}>${fila.grafe_vch_nombre}</option>
    </c:forEach>                           
</select>
