/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
/**
 *
 * @author Jose
 */
public class ConsultasMenu extends bd{
    
    public ArrayList<String> listaMenu(int usuario){
    PreparedStatement pst=null;
    ResultSet rs = null;
    //String nombre = "algooo";
    ArrayList<String> menus = new ArrayList<String>();
    //String[] menus; //= (String[])request.getAttibute("");
    try{
        String Consulta = "select menu.grafe_int_id, menu.grafe_vch_nombre, menu.grafe_vch_url from tbl_grafe_menu as menu \n" +
"inner join tbl_grafe_permisos as permisos on menu.grafe_int_id = permisos.grafe_int_idmenu\n" +
"inner join usuario as u on u.idusuario = permisos.grafe_int_iduser where u.idusuario = ? and menu.grafe_vch_estado = 1 \n" +
"order by menu.grafe_int_orden asc";
        
        pst=getMysql().prepareStatement(Consulta);
        pst.setInt(1, usuario);
        rs=pst.executeQuery();
        //ResultSet rs = st.executeQuery(sql);
        while(rs.next()) { 
         int id = rs.getInt("menu.grafe_int_id"); 
         String nombre = rs.getString("menu.grafe_vch_nombre");
         String url = rs.getString("menu.grafe_vch_url");
         menus.add(nombre);
        }
        /*if(rs.absolute(1)){
        return true;
        }*/
    }catch(Exception e){
        System.err.println("Error:"+e);
    }finally{
        try {
            if(getMysql()!=null) getMysql().close();
            if(pst !=null) pst.close();
            if(rs !=null) rs.close();
        }catch (Exception e){
         
        }
    }
    
    return menus;
}
     public static void main(String[] args){
 Conexion con = new Conexion();
 }
    
}
