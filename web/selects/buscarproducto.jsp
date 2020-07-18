<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
				   url="jdbc:mysql://localhost:3306/dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false"
				   user="root"  password="database"/>
<c:if test="${param.idproducto.matches('[0-9]+') && not empty param.idproducto}">
    <sql:query var="sqlbuscarproductos" dataSource="${myDS}">
        select tp.*, ttp.grafe_vch_nombre from tbl_grafe_producto as tp inner join tbl_grafe_tipoproducto as ttp on tp.grafe_int_idtipo = ttp.grafe_int_id where tp.grafe_int_idestado = 1 and tp.grafe_int_id = ${param.idproducto}
    </sql:query>
</c:if>
<div class="table-responsive">
              <table class="table table-bordered" width="100%" cellspacing="0">
                <thead class="thead-light">
                  <tr>
                                  <th>Id. Plato</th>
                                  <th>Plato</th>
                                  <th>Cantidad</th>
                                  <th>Precio</th>
                                  <th>Fecha Reg</th>
                                  <th>Fecha Ven</th>
                                  <th></th>
                                </tr>
                </thead>
                <tbody id="sqlbuscarproductos">
                    <c:choose>
                        <c:when test="${not empty sqlbuscarproductos.rows}">
                             <c:forEach var="fila" items="${sqlbuscarproductos.rows}">
                                    <tr>
                                                       <td class="productoid">${fila.grafe_int_id}</td>
                                                       <td class="productomarca">${fila.grafe_vch_nombre}</td>
                                                       <td class="productocantidad">${fila.grafe_int_cantidad}</td>
                                                       <td class="productoprecio">${fila.grafe_flt_precio}</td>                                                                                     
                                                       <td class="productofecharegistro">${fila.grafe_dat_fchregistro}</td>
                                                       <td class="productofechavencimiento">${fila.grafe_dat_fchvencimiento}</td>
                                                       <td style="text-align: center"><button type="button" class="btn btn-primary btn-sm fillPro" name="selectItem" value="${fila.grafe_int_id}"><i class="fa fa-check-square"></i></button></td>
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
