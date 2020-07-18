/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Jose
 */
public class ConsultasEliminar extends bd {
    public boolean eliminarUsuario(int idpersona){
        PreparedStatement pst=null;
        ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_persona as p\n" +
            "inner join tbl_grafe_usuario as u on p.grafe_int_id = u.grafe_int_idpersona\n" +
            "inner join tbl_grafe_email as e on u.grafe_int_idpersona = e.grafe_int_idpersona\n" +
            "inner join tbl_grafe_telefono as t on u.grafe_int_idpersona = t.grafe_int_idpersona\n" +
            "inner join tbl_grafe_domicilio as d on u.grafe_int_idpersona = d.grafe_int_idpersona\n" +
            "set p.grafe_int_idestado = 2,\n" +
            "u.grafe_int_idestado = 2,\n" +
            "e.grafe_int_idestado = 2,\n" +
            "t.grafe_int_idestado = 2,\n" +
            "d.grafe_int_idestado = 2\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta);             
            pst.setInt(1, idpersona);
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
                if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }

        return false;
    }
    public boolean eliminarCliente(int idpersona){
        PreparedStatement pst=null;
        ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_persona as p\n" +
            "inner join tbl_grafe_clientes as c on p.grafe_int_id = c.grafe_int_idpersona\n" +
            "inner join tbl_grafe_email as e on c.grafe_int_idpersona = e.grafe_int_idpersona\n" +
            "inner join tbl_grafe_telefono as t on c.grafe_int_idpersona = t.grafe_int_idpersona\n" +
            "inner join tbl_grafe_domicilio as d on c.grafe_int_idpersona = d.grafe_int_idpersona\n" +
            "set p.grafe_int_idestado = 2,\n" +
            "c.grafe_int_idestado = 2,\n" +
            "e.grafe_int_idestado = 2,\n" +
            "t.grafe_int_idestado = 2,\n" +
            "d.grafe_int_idestado = 2\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta);             
            pst.setInt(1, idpersona);
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
                if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }

        return false;
    }
    public boolean eliminarProducto(int idproducto){
        PreparedStatement pst=null;
        ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_producto as p\n" +
            "set p.grafe_int_idestado = 2\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta);             
            pst.setInt(1, idproducto);
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
                if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }

        return false;
    }
    public boolean eliminarMarca(int idmarca){
        PreparedStatement pst=null;
        ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_marca as p\n" +
            "set p.grafe_int_idestado = 2\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta);             
            pst.setInt(1, idmarca);
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
                if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }

        return false;
    }
    
    public boolean eliminarOperador(int idoperador){
        PreparedStatement pst=null;
        ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_operador as p\n" +
            "set p.grafe_int_idestado = 2\n" +
            "where p.grafe_int_idoperador = ?";
            pst=getMysql().prepareStatement(Consulta);             
            pst.setInt(1, idoperador);
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
                if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }

        return false;
    }
    
    public boolean eliminarEstadoPedido(int idestadopedido){
        PreparedStatement pst=null;
        ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_estadopedido as p\n" +
            "set p.grafe_int_idestado = 2\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta);             
            pst.setInt(1, idestadopedido);
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
                if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }

        return false;
    }
    
    public boolean eliminarTipoPersona(int idtipopersona){
        PreparedStatement pst=null;
        ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_tipopersona as p\n" +
            "set p.grafe_int_idestado = 2\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta);             
            pst.setInt(1, idtipopersona);
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
                if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }

        return false;
    }
     
    public boolean eliminarTipoDocumento(int idtipodocumento){
        PreparedStatement pst=null;
        ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_tipodocumento as p\n" +
            "set p.grafe_int_idestado = 2\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta);             
            pst.setInt(1, idtipodocumento);
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
                if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }

        return false;
    }
    
    public boolean eliminarTipoCliente(int idtipocliente){
        PreparedStatement pst=null;
        ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_tipocliente as p\n" +
            "set p.grafe_int_idestado = 2\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta);             
            pst.setInt(1, idtipocliente);
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
                if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }

        return false;
    }
    
    public boolean eliminarTipoTelefono(int idtipotelefono){
        PreparedStatement pst=null;
        ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_tipotelefono as p\n" +
            "set p.grafe_int_idestado = 2\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta);             
            pst.setInt(1, idtipotelefono);
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
                if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }

        return false;
    }
    
    public boolean eliminarTipoUsuario(int idtipousuario){
        PreparedStatement pst=null;
        ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_cargo as p\n" +
            "set p.grafe_int_idestado = 2\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta);             
            pst.setInt(1, idtipousuario);
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
                if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }

        return false;
    }
    
    public boolean eliminarTipoProducto(int idtipoproducto){
        PreparedStatement pst=null;
        ResultSet rs = null;
        try{
            String Consulta = "update tbl_grafe_tipoproducto as p\n" +
            "set p.grafe_int_idestado = 2\n" +
            "where p.grafe_int_id = ?";
            pst=getMysql().prepareStatement(Consulta);             
            pst.setInt(1, idtipoproducto);
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
                if(rs !=null) rs.close();
            }catch (Exception e){
                System.err.println("Error2:"+e);
            }
        }

        return false;
    }
    
}
