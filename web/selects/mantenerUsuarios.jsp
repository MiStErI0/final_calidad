<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>



<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
      url="jdbc:mysql://localhost:3306/dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false"
      user="root"  password="database"/>

<sql:query var="sqlmantenerUsuarios" dataSource="${myDS}">
        select grafe_int_id, grafe_vch_user, grafe_vch_passw, grafe_int_idpersona 
        from tbl_grafe_usuario 
        where grafe_int_idestado = 1
    </sql:query>
                               
                                <c:forEach var="fila" items="${sqlmantenerUsuarios.rows}">
                                      <tr>  
                                        <td>${fila.grafe_int_id}</td>
                                        <td>${fila.grafe_vch_user}</td>
                                        <td>${fila.grafe_vch_passw}</td>
                                        <td>${fila.grafe_int_idpersona}</td>
                                        <td>
                                            <a href="modificarUsuario.jsp"><button class="btn btn-primary" type="button">Modificar</button></a>
                                            <button class="btn btn-danger" type="button">Eliminar</button></td>
                                    </tr>  
                                </c:forEach>  