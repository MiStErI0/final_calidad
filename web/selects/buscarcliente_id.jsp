<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="myDS" driver="com.mysql.cj.jdbc.Driver"
      url="jdbc:mysql://localhost:3306/dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false"
      user="root"  password="database"/>
<sql:query var="sqlbuscarclientes" dataSource="${myDS}">
    select c.grafe_int_id,per.grafe_vch_nombre, per.grafe_vch_apepat,per.grafe_vch_apemat,per.grafe_vch_numidentidad
    from tbl_grafe_persona as per 
    inner join tbl_grafe_clientes as c on per.grafe_int_id = c.grafe_int_idpersona
    where per.grafe_int_idestado = 1 and c.grafe_int_id = ${param.idcliente} group by c.grafe_int_id
</sql:query>
    <c:forEach var="fila" items="${sqlbuscarclientes.rows}">
<form action="" id="form-lz-a" method="POST" role="form">
                            <div class="form-row">
                                <div class="form-group col-lg-6">
                                    <label class="control-label" for="idcliente">IDcliente</label>
                                    <input type="text" class="form-control" id="idcliente" name="idcliente" value="${fila.grafe_int_id}" readonly>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label class="control-label" for="nombrecliente">Nombre cliente</label>
                                    <input type="text" class="form-control" id="nombrecliente" name="nombrecliente" value="${fila.grafe_vch_nombre}" readonly>
                                </div>    
                            </div>
                            <div class="form-row">
                                <div class="form-group col-lg-6">
                                    <label class="control-label" for="apepat">Ape. Paterno</label>
                                    <input type="text" class="form-control" id="apepat" name="apepat" value="${fila.grafe_vch_apepat}" readonly>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label class="control-label" for="apemat">Ape. Materno</label>
                                    <input type="text" class="form-control" id="apepmat" name="apemat" value="${fila.grafe_vch_apemat}" readonly>
                                </div>
                            </div>    
                                <div class="form-group">
                                    <label class="control-label" for="dnicliente">Doc. Cliente</label>
                                    <input type="text" class="form-control" id="dnicliente" name="dnicliente" value="${fila.grafe_vch_numidentidad}" readonly>
                                </div>
                       
                                <div class="d-none">
                                <button id="btnRegistrar" class="btn btn-secondary" type="submit">Registrar</button> 
                            </div>
                            
                        </form>
                    </c:forEach>  