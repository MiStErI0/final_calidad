<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
      url="jdbc:mysql://localhost:3306/dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false"
      user="root"  password="database"/>

<sql:query var="sqldistritos" dataSource="${myDS}">
    select grafe_int_id, grafe_vch_nombre from tbl_grafe_distrito 
    where grafe_int_iddepartamento = ${param.dep} and grafe_int_idprovincia = ${param.prov}
</sql:query>

<select class="form-control" id="seldistritos" name="seldistritos">
    <option value="">Seleccione el Distrito</option>
    <c:forEach var="fila" items="${sqldistritos.rows}">
         <option value="${fila.grafe_int_id}" ${param.dis == fila.grafe_int_id ? 'selected' : ''}>${fila.grafe_vch_nombre}</option>
    </c:forEach>                           
</select>
