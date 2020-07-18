/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.concurrent.ExecutionException;
/**
 *
 * @author Jose
 */
public class ConsultasModificar extends bd{
    public boolean modificarUsuario(int idpersona,String nombre, String apepat, String apemat,String user, String password, String email,
        int tiptel, int operadortel, int departamento, int provincia, int distrito, String numidentidad,
        int cargousu, int numtel, int idtipopersona , int idtipodocumento){
        PreparedStatement pst=null;
        //ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_persona as p\n" +
            "inner join tbl_grafe_usuario as u on p.grafe_int_id = u.grafe_int_idpersona\n" +
            "inner join tbl_grafe_email as e on u.grafe_int_idpersona = e.grafe_int_idpersona\n" +
            "inner join tbl_grafe_telefono as t on u.grafe_int_idpersona = t.grafe_int_idpersona\n" +
            "inner join tbl_grafe_domicilio as d on u.grafe_int_idpersona = d.grafe_int_idpersona\n" +
            "set p.grafe_vch_apepat = ?,\n" +
            " p.grafe_vch_apemat = ?,\n" +
            " p.grafe_vch_nombre = ?,\n" +
            " p.grafe_int_idtipopersona = ?,\n" +
            " p.grafe_int_idtipodocumento = ?,\n" +
            " p.grafe_vch_numidentidad = ?,\n" +
            " u.grafe_vch_user = ?,\n" +
            " u.grafe_vch_passw = ?,\n" +
            " u.grafe_int_idcargo = ?,\n" +
            " e.grafe_vch_direccion = ?,\n" +
            " t.grafe_int_num = ?,\n" +
            " t.grafe_int_idtipotelefono = ?,\n" +
            " t.grafe_int_idoperador = ?,\n" +
            " d.grafe_int_iddistrito = ?,\n" +
            " d.grafe_int_idprovincia = ?,\n" +
            " d.grafe_int_iddepartamento = ?\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta); 
            pst.setString(1, apepat);
            pst.setString(2, apemat);
            pst.setString(3, nombre);
            pst.setInt(4, idtipopersona);
            pst.setInt(5, idtipodocumento);
            pst.setString(6, numidentidad);
            pst.setString(7, user);
            pst.setString(8, password);
            pst.setInt(9, cargousu);
            pst.setString(10, email);
            pst.setInt(11, numtel);
            pst.setInt(12, tiptel);
            pst.setInt(13, operadortel);
            pst.setInt(14, distrito);
            pst.setInt(16, provincia);
            pst.setInt(17, departamento);
            pst.setInt(18, idpersona);
            int up = pst.executeUpdate();
            if(up > 0) {                 
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error:"+ex);
        }finally{
            try {
                if(getMysql()!=null) getMysql().close();
                if(pst !=null) pst.close();
                //if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }
        return false;
    }
    public boolean modificarCliente(int idpersona,String nombre, String apepat, String apemat, int tipocliente, String email,
        int tiptel, int operadortel, int departamento, int provincia, int distrito, String numidentidad,
        int numtel, int idtipopersona , int idtipodocumento){
        PreparedStatement pst=null;
        //ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_persona as p\n" +
            "inner join tbl_grafe_clientes as c on p.grafe_int_id = c.grafe_int_idpersona\n" +
            "inner join tbl_grafe_email as e on c.grafe_int_idpersona = e.grafe_int_idpersona\n" +
            "inner join tbl_grafe_telefono as t on c.grafe_int_idpersona = t.grafe_int_idpersona\n" +
            "inner join tbl_grafe_domicilio as d on c.grafe_int_idpersona = d.grafe_int_idpersona\n" +
            "set p.grafe_vch_apepat = ?,\n" +
            " p.grafe_vch_apemat = ?,\n" +
            " p.grafe_vch_nombre = ?,\n" +
            " p.grafe_int_idtipopersona = ?,\n" +
            " p.grafe_int_idtipodocumento = ?,\n" +
            " p.grafe_vch_numidentidad = ?,\n" +
            " c.grafe_int_tipocliente = ?,\n" +
            " e.grafe_vch_direccion = ?,\n" +
            " t.grafe_int_num = ?,\n" +
            " t.grafe_int_idtipotelefono = ?,\n" +
            " t.grafe_int_idoperador = ?,\n" +
            " d.grafe_int_iddistrito = ?,\n" +
            " d.grafe_int_idprovincia = ?,\n" +
            " d.grafe_int_iddepartamento = ?\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta); 
            pst.setString(1, apepat);
            pst.setString(2, apemat);
            pst.setString(3, nombre);
            pst.setInt(4, idtipopersona);
            pst.setInt(5, idtipodocumento);
            pst.setString(6, numidentidad);
            pst.setInt(7, tipocliente);
            pst.setString(8, email);
            pst.setInt(9, numtel);
            pst.setInt(10, tiptel);
            pst.setInt(11, operadortel);
            pst.setInt(12, distrito);
            pst.setInt(14, provincia);
            pst.setInt(15, departamento);
            pst.setInt(16, idpersona);
            int up = pst.executeUpdate();
            if(up > 0) {                 
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error:"+ex);
        }finally{
            try {
                if(getMysql()!=null) getMysql().close();
                if(pst !=null) pst.close();
                //if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }
        return false;
    } 
    public boolean modificarProducto(int idproducto,int idmarcapro, float costopro, float preciopro, int cantidadpro, String fechaven, String fechareg,
        int idtipocat){
        PreparedStatement pst=null;
        //ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_producto as p\n" +
            "set p.grafe_int_idmarca = ?,\n" +
            "p.grafe_flt_costo = ?,\n" +
            "p.grafe_flt_precio = ?,\n" +
            "p.grafe_int_cantidad = ?,\n" +
            "p.grafe_dat_fchvencimiento = ?,\n" +
            "p.grafe_dat_fchregistro = ?,\n" +
            "p.grafe_int_idtipo = ?\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta); 
            pst.setInt(1, idmarcapro);
            pst.setFloat(2, costopro);
            pst.setFloat(3, preciopro);
            pst.setInt(4, cantidadpro);
            pst.setString(5, fechaven);
            pst.setString(6, fechareg);
            pst.setInt(7, idtipocat);
            pst.setInt(8, idproducto);
            int up = pst.executeUpdate();
            if(up > 0) {                 
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error:"+ex);
        }finally{
            try {
                if(getMysql()!=null) getMysql().close();
                if(pst !=null) pst.close();
                //if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }
        return false;
    } 
    public boolean modificarMarca(int idmarca,String nombremarca){
        PreparedStatement pst=null;
        //ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_marca as p\n" +
            "set p.grafe_vch_nombre = ?\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta); 
            pst.setString(1, nombremarca);
            pst.setInt(2, idmarca);
            int up = pst.executeUpdate();
            if(up > 0) {                 
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error:"+ex);
        }finally{
            try {
                if(getMysql()!=null) getMysql().close();
                if(pst !=null) pst.close();
                //if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }
        return false;
    }
    
    
    public boolean modificarOperador(int idoperador,String nombreoperador){
        PreparedStatement pst=null;
        //ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_operador as p\n" +
            "set p.grafe_vch_nombre = ?\n" +
            "where p.grafe_int_idoperador = ?";
            pst=getMysql().prepareStatement(Consulta); 
            pst.setString(1, nombreoperador);
            pst.setInt(2, idoperador);
            int up = pst.executeUpdate();
            if(up > 0) {                 
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error:"+ex);
        }finally{
            try {
                if(getMysql()!=null) getMysql().close();
                if(pst !=null) pst.close();
                //if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }
        return false;
    }
    
    public boolean modificarEstadoPedido(int idestadopedido,String nombreestadopedido){
        PreparedStatement pst=null;
        //ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_estadopedido as p\n" +
            "set p.grafe_vch_nombre = ?\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta); 
            pst.setString(1, nombreestadopedido);
            pst.setInt(2, idestadopedido);
            int up = pst.executeUpdate();
            if(up > 0) {                 
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error:"+ex);
        }finally{
            try {
                if(getMysql()!=null) getMysql().close();
                if(pst !=null) pst.close();
                //if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }
        return false;
    }
     
     public boolean modificarTipoPersona(int idtipopersona,String nombretipopersona){
        PreparedStatement pst=null;
        //ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_tipopersona as p\n" +
            "set p.grafe_vch_nombre = ?\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta); 
            pst.setString(1, nombretipopersona);
            pst.setInt(2, idtipopersona);
            int up = pst.executeUpdate();
            if(up > 0) {                 
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error:"+ex);
        }finally{
            try {
                if(getMysql()!=null) getMysql().close();
                if(pst !=null) pst.close();
                //if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }
        return false;
    }
     
public boolean modificarTipoDocumento(int idtipodocumento,String nombretipodocumento){
        PreparedStatement pst=null;
        //ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_tipodocumento as p\n" +
            "set p.grafe_vch_nombre = ?\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta); 
            pst.setString(1, nombretipodocumento);
            pst.setInt(2, idtipodocumento);
            int up = pst.executeUpdate();
            if(up > 0) {                 
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error:"+ex);
        }finally{
            try {
                if(getMysql()!=null) getMysql().close();
                if(pst !=null) pst.close();
                //if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }
        return false;
    }
    
    public boolean modificarTipoCliente(int idtipocliente,String nombretipocliente){
        PreparedStatement pst=null;
        //ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_tipocliente as p\n" +
            "set p.grafe_vch_nombre = ?\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta); 
            pst.setString(1, nombretipocliente);
            pst.setInt(2, idtipocliente);
            int up = pst.executeUpdate();
            if(up > 0) {                 
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error:"+ex);
        }finally{
            try {
                if(getMysql()!=null) getMysql().close();
                if(pst !=null) pst.close();
                //if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }
        return false;
    }
    
    public boolean modificarTipoTelefono(int idtipotelefono,String nombretipotelefono){
        PreparedStatement pst=null;
        //ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_tipotelefono as p\n" +
            "set p.grafe_vch_nombre = ?\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta); 
            pst.setString(1, nombretipotelefono);
            pst.setInt(2, idtipotelefono);
            int up = pst.executeUpdate();
            if(up > 0) {                 
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error:"+ex);
        }finally{
            try {
                if(getMysql()!=null) getMysql().close();
                if(pst !=null) pst.close();
                //if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }
        return false;
    }
    
    
    public boolean modificarTipoUsuario(int idtipousuario,String nombretipousuario){
        PreparedStatement pst=null;
        //ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_cargo as p\n" +
            "set p.grafe_vch_nombre = ?\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta); 
            pst.setString(1, nombretipousuario);
            pst.setInt(2, idtipousuario);
            int up = pst.executeUpdate();
            if(up > 0) {                 
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error:"+ex);
        }finally{
            try {
                if(getMysql()!=null) getMysql().close();
                if(pst !=null) pst.close();
                //if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }
        return false;
    }
    
    public boolean modificarTipoProducto(int idtipoproducto,String nombretipoproducto){
        PreparedStatement pst=null;
        //ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_tipoproducto as p\n" +
            "set p.grafe_vch_nombre = ?\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta); 
            pst.setString(1, nombretipoproducto);
            pst.setInt(2, idtipoproducto);
            int up = pst.executeUpdate();
            if(up > 0) {                 
                return true;
            }
        }catch(Exception ex){
            System.err.println("Error:"+ex);
        }finally{
            try {
                if(getMysql()!=null) getMysql().close();
                if(pst !=null) pst.close();
                //if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }
        return false;
    }
}
