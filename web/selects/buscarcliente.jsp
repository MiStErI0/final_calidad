<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
      url="jdbc:mysql://localhost:3306/dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false"
      user="root"  password="database"/>
<c:if test="${!param.cncliente.matches('[0-9]+') && not empty param.cncliente}">    
    <sql:query var="sqlbuscarclientes" dataSource="${myDS}">
        select c.grafe_int_id,per.grafe_vch_nombre, per.grafe_vch_apepat,per.grafe_vch_apemat,per.grafe_vch_numidentidad
        from tbl_grafe_persona as per 
        inner join tbl_grafe_clientes as c on per.grafe_int_id = c.grafe_int_idpersona
        where per.grafe_vch_nombre like '%${param.cncliente}%' and per.grafe_int_idestado = 1 group by c.grafe_int_id
    </sql:query>
 </c:if>
    <c:if test="${param.cncliente != NULL && param.cncliente.matches('[0-9]+') && not empty param.cncliente}">
    <sql:query var="sqlbuscarclientes" dataSource="${myDS}">
        select c.grafe_int_id,per.grafe_vch_nombre, per.grafe_vch_apepat,per.grafe_vch_apemat,per.grafe_vch_numidentidad
        from tbl_grafe_persona as per 
        inner join tbl_grafe_clientes as c on per.grafe_int_id = c.grafe_int_idpersona
        where c.grafe_int_id = ${param.cncliente} and per.grafe_int_idestado = 1 group by c.grafe_int_id
    </sql:query>
    </c:if>

<div class="table-responsive">
              <table class="table table-bordered" width="100%" cellspacing="0">
                <thead class="thead-light">
                  <tr>
                    <th>Id.Cliente</th>
                    <th>Nom.Cliente</th>
                    <th>Ape.Paterno</th>
                    <th>Ape.Materno</th>
                    <th>Num.Documento</th>
                    <th> </th>
                  </tr>
                </thead>
                <tbody id="sqlbuscarclientes">
                    <c:choose>
                        <c:when test="${not empty sqlbuscarclientes.rows}">
                            <c:forEach var="fila" items="${sqlbuscarclientes.rows}">
                                <tr>
                                   <td>${fila.grafe_int_id}</td>
                                               <td>${fila.grafe_vch_nombre}</td>                                       
                                               <td>${fila.grafe_vch_apepat}</td>
                                               <td>${fila.grafe_vch_apemat}</td>
                                               <td>${fila.grafe_vch_numidentidad}</td>
                                               <td><button type="button" class="btn btn-primary btn-sm fillCli" name="selectItem" value="${fila.grafe_int_id}"><i class="fa fa-check-square"></i></button></td>
                                </tr>
                           </c:forEach>
                        </c:when>
                        <c:otherwise>
                                <tr>
                                   <td colspan="11"><div class='text-center'>No se encontraron datos..</div></td>
                                </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
              </table>
            </div>
