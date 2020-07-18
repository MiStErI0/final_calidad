<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
      url="jdbc:mysql://localhost:3306/dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false"
      user="root"  password="database"/>

<sql:query var="sqldepartamentos" dataSource="${myDS}">
    select grafe_int_iddepartamento, grafe_vch_nombre from tbl_grafe_departamento
</sql:query>

<select class="form-control" id="seldepartamentos" name="seldepartamentos" onchange="provincias()">
    <option value="">Seleccione el Departamento</option>
    <c:forEach var="fila" items="${sqldepartamentos.rows}">
         <option value="${fila.grafe_int_iddepartamento}" ${param.dep == fila.grafe_int_iddepartamento ? 'selected' : ''}>${fila.grafe_vch_nombre}</option>
    </c:forEach>                           
</select>
