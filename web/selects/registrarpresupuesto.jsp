<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
      url="jdbc:mysql://localhost:3306/dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false"
      user="root"  password="database"/>


<sql:update var="sqlgenerarpresupuesto" dataSource="${myDS}">
    INSERT INTO tbl_grafe_presupuesto
    (grafe_int_idcliente, grafe_int_idusuario, grafe_flt_montototal, grafe_flt_subtotal, grafe_int_idestado) 
    VALUES(${param.idcliente}, ${param.idusuario} , ${param.totventa}, ${param.totventa*0.18}, 1);
</sql:update>
<span> Se ha registrado la venta</span>