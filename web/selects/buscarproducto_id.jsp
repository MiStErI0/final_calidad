<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
      url="jdbc:mysql://localhost:3306/dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false"
      user="root"  password="database"/>
<sql:query var="sqlbuscarproductos" dataSource="${myDS}">
    select * from tbl_grafe_producto where grafe_int_idestado = 1 and grafe_int_id = ${param.idproducto}
</sql:query>

                     <c:forEach var="fila" items="${sqlbuscarproductos.rows}" varStatus="loop">
                         <tr class="${loop.index}">
                                            <td class="productoid">${fila.grafe_int_id}</td>
                                            <td class="productomarca">${fila.grafe_int_idmarca}</td>
                                            <td class="productocantidad">${param.cantidadproducto}</td>
                                            <td class="productoprecio">${fila.grafe_flt_precio}</td>
                                            <td class="productototal">${ Math.round((param.cantidadproducto * fila.grafe_flt_precio) * 100.0) / 100.0 }</td>
                                            <td><input type="radio" class="fillPro" name="selectItem" value="${fila.grafe_int_id}"></td>
                                       </tr>
                    </c:forEach>  
