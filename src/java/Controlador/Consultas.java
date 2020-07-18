package Controlador;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.concurrent.ExecutionException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Consultas extends bd{
public boolean autentificacion(String usuario,String psw){
    PreparedStatement pst=null;
    ResultSet rs = null;
    try{
        String Consulta ="select * from tbl_grafe_usuario where grafe_vch_user =? and grafe_vch_passw=?";
        pst=getMysql().prepareStatement(Consulta);
        pst.setString(1, usuario);
        pst.setString(2, psw);
        rs=pst.executeQuery();
    
        if(rs.absolute(1)){
        return true;
        }
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
    
    return false;
}
    
/*nombre,apepat,apemat,user,psw,email,tiptel,operadortel,
        departamentos, provincias, distritos, numident, cargusu, numtel, idtipoper, idtipodoc*/
public boolean registrar(String nombre, String apepat, String apemat,String user, String password, String email,
        int tiptel, int operadortel, int departamento, int provincia, int distrito, String numidentidad,
        int cargousu, int numtel, int idtipopersona , int idtipodocumento ){
    PreparedStatement pst=null,pst2=null,pst3=null,pst4=null,pst5=null;
    ResultSet rs, rs2,rs3;
    int idpersona, idestado=1;
    try{
     
     String Consulta_persona = "INSERT INTO tbl_grafe_persona (grafe_vch_apepat,grafe_vch_apemat,grafe_vch_nombre,"
             + "grafe_int_idtipopersona , grafe_int_idtipodocumento, grafe_vch_numidentidad, grafe_int_idestado) \n" +
     "VALUES (? , ? , ? , ? , ? , ?, ?)";
         
     pst=getMysql().prepareStatement(Consulta_persona, Statement.RETURN_GENERATED_KEYS);
     pst.setString(1, apepat);
     pst.setString(2, apemat);
     pst.setString(3, nombre);
     pst.setInt(4, idtipopersona);
     pst.setInt(5, idtipodocumento);
     pst.setString(6, numidentidad);
     pst.setInt(7, idestado);
     int up = pst.executeUpdate();
	 System.out.println(pst.toString());
     //rs3 = pst3.executeQuery("select last_insert_id() as last_id from tbl_grafe_persona limit 1");   
     if(up == 1){
        rs3 = pst.getGeneratedKeys();
        rs3.next();
        idpersona = rs3.getInt(1);
        String Consulta_usuario = "INSERT INTO tbl_grafe_usuario (grafe_vch_user,grafe_vch_passw,grafe_int_idpersona,grafe_int_idcargo, grafe_int_idestado) "
                + "VALUES (?,?,?,?,?)";
        pst2=getMysql().prepareStatement(Consulta_usuario);
        pst2.setString(1, user);
        pst2.setString(2, password);
        pst2.setInt(3, idpersona);
        pst2.setInt(4, cargousu);
        pst2.setInt(5, idestado);
        int up2 = pst2.executeUpdate();
		 System.out.println(pst2.toString());
        String Consulta_email = "INSERT INTO tbl_grafe_email (grafe_vch_direccion,grafe_int_idpersona,grafe_int_idestado) "
                + "VALUES (?,?,?)";
        pst5=getMysql().prepareStatement(Consulta_email);
        pst5.setString(1, email);
        pst5.setInt(2, idpersona);
        pst5.setInt(3, idestado);
        int upem = pst5.executeUpdate();
		System.out.println(pst5.toString());
        if(up2 == 1){
            String Consulta_telefono = "INSERT INTO tbl_grafe_telefono (grafe_int_num,grafe_int_idpersona,grafe_int_idtipotelefono,grafe_int_idoperador,grafe_int_idestado) "
                + "VALUES (?,?,?,?,?)";
            pst3=getMysql().prepareStatement(Consulta_telefono);
            pst3.setInt(1, numtel);
            pst3.setInt(2, idpersona);
            pst3.setInt(3, tiptel);
            pst3.setInt(4, operadortel);
            pst3.setInt(5, idestado);
			
            int up3 = pst3.executeUpdate();
					System.out.println(pst3.toString());

            if(up3==1){                         
                String Consulta_domicilio = "INSERT INTO tbl_grafe_domicilio (grafe_int_idpersona,grafe_int_iddistrito,grafe_int_idprovincia,grafe_int_iddepartamento,grafe_int_idestado) "
                    + "VALUES (?,?,?,?,?)";
                pst4=getMysql().prepareStatement(Consulta_domicilio);
                pst4.setInt(1, idpersona);
                pst4.setInt(2, distrito);
                pst4.setInt(3, provincia);
                pst4.setInt(4, departamento);
                pst4.setInt(5, idestado);
				System.out.println(pst4.toString());

                int up4 = pst4.executeUpdate();

                if(up4==1){
                    return true; 
                }
            }
        }
     }     
    }catch(Exception ex){
		ex.printStackTrace();
            System.err.println("Error1:"+ex);
    }finally{
        try{
            if(getMysql()!=null) getMysql().close();
            if(pst!=null) pst.close();
        }catch (Exception e){
            System.err.println("Error2:"+e);
        }
    }
    
    return false;
}   

public boolean registrar_cliente(String nombre, String apepat, String apemat,String email, int tipocliente,
        int tiptel, int operadortel, int departamento, int provincia, int distrito, String numidentidad, int numtel, int idtipopersona , int idtipodocumento ){
    PreparedStatement pst=null,pst2=null,pst3=null,pst4=null,pst5=null;
    ResultSet rs, rs2,rs3;
    int idpersona, idestado=1;
    try{
     
     String Consulta_persona = "INSERT INTO tbl_grafe_persona (grafe_vch_apepat,grafe_vch_apemat,grafe_vch_nombre,"
             + "grafe_int_idtipopersona , grafe_int_idtipodocumento, grafe_vch_numidentidad, grafe_int_idestado) \n" +
     "VALUES (? , ? , ? , ? , ? , ?, ?)";
         
     pst=getMysql().prepareStatement(Consulta_persona, Statement.RETURN_GENERATED_KEYS);
     pst.setString(1, apepat);
     pst.setString(2, apemat);
     pst.setString(3, nombre);
     pst.setInt(4, idtipopersona);
     pst.setInt(5, idtipodocumento);
     pst.setString(6, numidentidad);
     pst.setInt(7, idestado);
	 System.out.println(pst.toString());
     int up = pst.executeUpdate();
     //rs3 = pst3.executeQuery("select last_insert_id() as last_id from tbl_grafe_persona limit 1");   
     if(up == 1){
        rs3 = pst.getGeneratedKeys();
        rs3.next();
        idpersona = rs3.getInt(1);
        String Consulta_cliente = "INSERT INTO tbl_grafe_clientes (grafe_int_idestado,grafe_int_idpersona, grafe_int_tipocliente) "
                + "VALUES (?,?,?)";
        pst2=getMysql().prepareStatement(Consulta_cliente);
        pst2.setInt(1, idestado);
        pst2.setInt(2, idpersona);
        pst2.setInt(3, tipocliente);
		System.out.println(pst2.toString());
        int up2 = pst2.executeUpdate();
        String Consulta_email = "INSERT INTO tbl_grafe_email (grafe_vch_direccion,grafe_int_idpersona,grafe_int_idestado) "
                + "VALUES (?,?,?)";
        pst5=getMysql().prepareStatement(Consulta_email);
        pst5.setString(1, email);
        pst5.setInt(2, idpersona);
        pst5.setInt(3, idestado);
		System.out.println(pst5.toString());
        int upem = pst5.executeUpdate();
        if(up2 == 1){
            String Consulta_telefono = "INSERT INTO tbl_grafe_telefono (grafe_int_num,grafe_int_idpersona,grafe_int_idtipotelefono,grafe_int_idoperador,grafe_int_idestado) "
                + "VALUES (?,?,?,?,?)";
            pst3=getMysql().prepareStatement(Consulta_telefono);
            pst3.setInt(1, numtel);
            pst3.setInt(2, idpersona);
            pst3.setInt(3, tiptel);
            pst3.setInt(4, operadortel);
            pst3.setInt(5, idestado);
			System.out.println(pst3.toString());
            int up3 = pst3.executeUpdate();
            if(up3==1){                         
                String Consulta_domicilio = "INSERT INTO tbl_grafe_domicilio (grafe_int_idpersona,grafe_int_iddistrito,grafe_int_idprovincia,grafe_int_iddepartamento,grafe_int_idestado) "
                    + "VALUES (?,?,?,?,?)";
                pst4=getMysql().prepareStatement(Consulta_domicilio);
                pst4.setInt(1, idpersona);
                pst4.setInt(2, distrito);
                pst4.setInt(3, provincia);
                pst4.setInt(4, departamento);
                pst4.setInt(5, idestado);
                int up4 = pst4.executeUpdate();
                if(up4==1){
                    return true; 
                }
            }
        }
     }     
    }catch(Exception ex){
            System.err.println("Error1:"+ex);
    }finally{
        try{
            if(getMysql()!=null) getMysql().close();
            if(pst!=null) pst.close();
        }catch (Exception e){
            System.err.println("Error2:"+e);
        }
    }
    
    return false;
} 

public boolean registrar_producto(int idmarca,float costopro,float preciopro,int cantidadpro,String fechaven,String fechareg,int idtipocat){
    PreparedStatement pst=null;
    ResultSet rs;
    int idestado=1;
	System.out.println("ssss");
    try{
     /*java.util.Date fechavencimiento = fechaven;
     java.util.Date fecharegistro = fechareg;
     SimpleDateFormat formatofecha = new SimpleDateFormat("yyyy-MM-dd");
     final String fechavn = formatofecha.format(fechavencimiento);
     final java.sql.Date fecha_vencimiento=  java.sql.Date.valueOf(fechavn);
     final String fecharg = formatofecha.format(fecharegistro);
     final java.sql.Date fecha_registro=  java.sql.Date.valueOf(fecharg);*/
     String Consulta_producto = "INSERT INTO tbl_grafe_producto (grafe_int_idmarca,grafe_flt_costo,grafe_flt_precio,"
             + "grafe_int_cantidad, grafe_dat_fchvencimiento, grafe_dat_fchregistro, grafe_int_idtipo, grafe_int_idestado) \n" +
     "VALUES (? , ? , ? , ? , ? , ?, ?, ?)";
         
     pst=getMysql().prepareStatement(Consulta_producto);
     pst.setInt(1, idmarca);
     pst.setFloat(2, costopro);
     pst.setFloat(3, preciopro);
     pst.setInt(4, cantidadpro);
     pst.setString(5, fechaven);
     pst.setString(6, fechareg);
     pst.setInt(7, idtipocat);
     pst.setInt(8, idestado);
     int up = pst.executeUpdate();
	 System.out.println(pst.toString());
     if(up == 1){
        return true;                
     }     
    }catch(Exception ex){
            System.err.println("Error1:"+ex);
    }finally{
        try{
            if(getMysql()!=null) getMysql().close();
            if(pst!=null) pst.close();
        }catch (Exception e){
            System.err.println("Error2:"+e);
        }
    }
    
    return false;
} 

public boolean registrar_marca(String nombremarca){
    PreparedStatement pst=null;
    ResultSet rs;
    int idestado=1;
    try{
     String Consulta_marca = "INSERT INTO tbl_grafe_marca (grafe_vch_nombre,grafe_int_idestado) \n" +
     "VALUES (? , ? )";    
     pst=getMysql().prepareStatement(Consulta_marca);
     pst.setString(1, nombremarca);
     pst.setInt(2, idestado);
     int up = pst.executeUpdate();
     if(up == 1){
        return true;                
     }     
    }catch(Exception ex){
            System.err.println("Error1:"+ex);
    }finally{
        try{
            if(getMysql()!=null) getMysql().close();
            if(pst!=null) pst.close();
        }catch (Exception e){
            System.err.println("Error2:"+e);
        }
    }
    
    return false;
} 

public boolean registrar_operador(String nombreoperador){
    PreparedStatement pst=null;
    ResultSet rs;
    int idestado=1;
    try{
     String Consulta_operador = "INSERT INTO tbl_grafe_operador (grafe_vch_nombre,grafe_int_idestado) \n" +
     "VALUES (? , ? )";    
     pst=getMysql().prepareStatement(Consulta_operador);
     pst.setString(1, nombreoperador);
     pst.setInt(2, idestado);
     int up = pst.executeUpdate();
     if(up == 1){
        return true;                
     }     
    }catch(Exception ex){
            System.err.println("Error1:"+ex);
    }finally{
        try{
            if(getMysql()!=null) getMysql().close();
            if(pst!=null) pst.close();
        }catch (Exception e){
            System.err.println("Error2:"+e);
        }
    }
    
    return false;
} 

public boolean registrar_estadopedido(String nombreestadopedido){
    PreparedStatement pst=null;
    ResultSet rs;
    int idestado=1;
    try{
     String Consulta_estadopedido = "INSERT INTO tbl_grafe_estadopedido (grafe_vch_nombre,grafe_int_idestado) \n" +
     "VALUES (? , ? )";    
     pst=getMysql().prepareStatement(Consulta_estadopedido);
     pst.setString(1, nombreestadopedido);
     pst.setInt(2, idestado);
     int up = pst.executeUpdate();
     if(up == 1){
        return true;                
     }     
    }catch(Exception ex){
            System.err.println("Error1:"+ex);
    }finally{
        try{
            if(getMysql()!=null) getMysql().close();
            if(pst!=null) pst.close();
        }catch (Exception e){
            System.err.println("Error2:"+e);
        }
    }
    
    return false;
} 

public boolean registrar_tipopersona(String nombretipopersona){
    PreparedStatement pst=null;
    ResultSet rs;
    int idestado=1;
    try{
     String Consulta_tipopersona = "INSERT INTO tbl_grafe_tipopersona (grafe_vch_nombre,grafe_int_idestado) \n" +
     "VALUES (? , ? )";    
     pst=getMysql().prepareStatement(Consulta_tipopersona);
     pst.setString(1, nombretipopersona);
     pst.setInt(2, idestado);
     int up = pst.executeUpdate();
     if(up == 1){
        return true;                
     }     
    }catch(Exception ex){
            System.err.println("Error1:"+ex);
    }finally{
        try{
            if(getMysql()!=null) getMysql().close();
            if(pst!=null) pst.close();
        }catch (Exception e){
            System.err.println("Error2:"+e);
        }
    }
    return false;
} 

public boolean registrar_tipodocumento(String nombretipodocumento){
    PreparedStatement pst=null;
    ResultSet rs;
    int idestado=1;
    try{
     String Consulta_tipodocumento = "INSERT INTO tbl_grafe_tipodocumento (grafe_vch_nombre,grafe_int_idestado) \n" +
     "VALUES (? , ? )";    
     pst=getMysql().prepareStatement(Consulta_tipodocumento);
     pst.setString(1, nombretipodocumento);
     pst.setInt(2, idestado);
     int up = pst.executeUpdate();
     if(up == 1){
        return true;                
     }     
    }catch(Exception ex){
            System.err.println("Error1:"+ex);
    }finally{
        try{
            if(getMysql()!=null) getMysql().close();
            if(pst!=null) pst.close();
        }catch (Exception e){
            System.err.println("Error2:"+e);
        }
    }
    
    return false;
}

public boolean registrar_tipocliente(String nombretipocliente){
    PreparedStatement pst=null;
    ResultSet rs;
    int idestado=1;
    try{
     String Consulta_tipocliente = "INSERT INTO tbl_grafe_tipocliente (grafe_vch_nombre,grafe_int_idestado) \n" +
     "VALUES (? , ? )";    
     pst=getMysql().prepareStatement(Consulta_tipocliente);
     pst.setString(1, nombretipocliente);
     pst.setInt(2, idestado);
     int up = pst.executeUpdate();
     if(up == 1){
        return true;                
     }     
    }catch(Exception ex){
            System.err.println("Error1:"+ex);
    }finally{
        try{
            if(getMysql()!=null) getMysql().close();
            if(pst!=null) pst.close();
        }catch (Exception e){
            System.err.println("Error2:"+e);
        }
    }
    
    return false;
}

public boolean registrar_tipotelefono(String nombretipotelefono){
    PreparedStatement pst=null;
    ResultSet rs;
    int idestado=1;
    try{
     String Consulta_tipotelefono = "INSERT INTO tbl_grafe_tipotelefono (grafe_vch_nombre,grafe_int_idestado) \n" +
     "VALUES (? , ? )";    
     pst=getMysql().prepareStatement(Consulta_tipotelefono);
     pst.setString(1, nombretipotelefono);
     pst.setInt(2, idestado);
     int up = pst.executeUpdate();
     if(up == 1){
        return true;                
     }     
    }catch(Exception ex){
            System.err.println("Error1:"+ex);
    }finally{
        try{
            if(getMysql()!=null) getMysql().close();
            if(pst!=null) pst.close();
        }catch (Exception e){
            System.err.println("Error2:"+e);
        }
    }
    
    return false;
}

public boolean registrar_tipousuario(String nombretipousuario){
    PreparedStatement pst=null;
    ResultSet rs;
    int idestado=1;
    try{
     String Consulta_tipousuario = "INSERT INTO tbl_grafe_cargo (grafe_vch_nombre,grafe_int_idestado) \n" +
     "VALUES (? , ? )";    
     pst=getMysql().prepareStatement(Consulta_tipousuario);
     pst.setString(1, nombretipousuario);
     pst.setInt(2, idestado);
     int up = pst.executeUpdate();
     if(up == 1){
        return true;                
     }     
    }catch(Exception ex){
		ex.printStackTrace();
            System.err.println("Error1:"+ex);
    }finally{
        try{
            if(getMysql()!=null) getMysql().close();
            if(pst!=null) pst.close();
        }catch (Exception e){
            System.err.println("Error2:"+e);
        }
    }
    
    return false;
}

public boolean registrar_tipoproducto(String nombretipoproducto){
    PreparedStatement pst=null;
    ResultSet rs;
    int idestado=1;
    try{
     String Consulta_tipoproducto = "INSERT INTO tbl_grafe_tipoproducto (grafe_vch_nombre,grafe_int_idestado) \n" +
     "VALUES (? , ? )";    
     pst=getMysql().prepareStatement(Consulta_tipoproducto);
     pst.setString(1, nombretipoproducto);
     pst.setInt(2, idestado);
     int up = pst.executeUpdate();
     if(up == 1){
        return true;                
     }     
    }catch(Exception ex){
            System.err.println("Error1:"+ex);
    }finally{
        try{
            if(getMysql()!=null) getMysql().close();
            if(pst!=null) pst.close();
        }catch (Exception e){
            System.err.println("Error2:"+e);
        }
    }
    
    return false;
}

public int datosUsuario(String usuario){
    PreparedStatement pst=null;
    ResultSet rs = null;
    int idcargo = 0;
    try{
        String Consulta ="select grafe_int_idpersona, grafe_int_idcargo, grafe_vch_user "
                + "from tbl_grafe_usuario where grafe_vch_user = ?";
        pst=getMysql().prepareStatement(Consulta);
        pst.setString(1, usuario);
        rs=pst.executeQuery();
    
        if(rs.next()) { 
         int idpersona = rs.getInt("grafe_int_idpersona"); 
         idcargo = rs.getInt("grafe_int_idcargo");
         String nombre = rs.getString("grafe_vch_user");
        }
    }catch(Exception e){
		System.out.println("errorororor");

        System.err.println("Error:"+e);
    }finally{
        try {
            if(getMysql()!=null) getMysql().close();
            if(pst !=null) pst.close();
            if(rs !=null) rs.close();
        }catch (Exception e){
         
        }
    }
    
    return idcargo;
}
public int idUsuario(String usuario){
    PreparedStatement pst=null;
    ResultSet rs = null;
    int idusuario = 0;
    try{
        String Consulta ="select grafe_int_id from tbl_grafe_usuario where grafe_vch_user = ?";
        pst=getMysql().prepareStatement(Consulta);
        pst.setString(1, usuario);
        rs=pst.executeQuery();
    
        if(rs.next()) { 
         idusuario = rs.getInt("grafe_int_id"); 
//         int idcargo = rs.getInt("grafe_int_idcargo");
//         String nombre = rs.getString("grafe_vch_user");
        }
    }catch(Exception e){
		System.out.println("errorororor");
        System.err.println("Error:"+e);
    }finally{
        try {
            if(getMysql()!=null) getMysql().close();
            if(pst !=null) pst.close();
            if(rs !=null) rs.close();
        }catch (Exception e){
         
        }
    }
    
    return idusuario;
}

public boolean generarPresupuesto(String nombre, String apepat, String apemat,String user, String password, String email,
        int tiptel, int operadortel, int departamento, int provincia, int distrito, String numidentidad,
        int cargousu, int numtel, int idtipopersona , int idtipodocumento ){
    PreparedStatement pst=null,pst2=null,pst3=null,pst4=null,pst5=null;
    ResultSet rs, rs2,rs3;
    int idpersona, idestado=1;
    try{
     
     String Consulta_persona = "INSERT INTO tbl_grafe_persona (grafe_vch_apepat,grafe_vch_apemat,grafe_vch_nombre,"
             + "grafe_int_idtipopersona , grafe_int_idtipodocumento, grafe_vch_numidentidad, grafe_int_idestado) \n" +
     "VALUES (? , ? , ? , ? , ? , ?, ?)";
         
     pst=getMysql().prepareStatement(Consulta_persona, Statement.RETURN_GENERATED_KEYS);
     pst.setString(1, apepat);
     pst.setString(2, apemat);
     pst.setString(3, nombre);
     pst.setInt(4, idtipopersona);
     pst.setInt(5, idtipodocumento);
     pst.setString(6, numidentidad);
     pst.setInt(7, idestado);
     int up = pst.executeUpdate();
     //rs3 = pst3.executeQuery("select last_insert_id() as last_id from tbl_grafe_persona limit 1");   
     if(up == 1){
        rs3 = pst.getGeneratedKeys();
        rs3.next();
        idpersona = rs3.getInt(1);
        String Consulta_usuario = "INSERT INTO tbl_grafe_usuario (grafe_vch_user,grafe_vch_passw,grafe_int_idpersona,grafe_int_idcargo, grafe_int_idestado) "
                + "VALUES (?,?,?,?,?)";
        pst2=getMysql().prepareStatement(Consulta_usuario);
        pst2.setString(1, user);
        pst2.setString(2, password);
        pst2.setInt(3, idpersona);
        pst2.setInt(4, cargousu);
        pst2.setInt(5, idestado);
        int up2 = pst2.executeUpdate();
        String Consulta_email = "INSERT INTO tbl_grafe_email (grafe_vch_direccion,grafe_int_idpersona,grafe_int_idestado) "
                + "VALUES (?,?,?)";
        pst5=getMysql().prepareStatement(Consulta_email);
        pst5.setString(1, email);
        pst5.setInt(2, idpersona);
        pst5.setInt(3, idestado);
        int upem = pst5.executeUpdate();
        if(up2 == 1){
            String Consulta_telefono = "INSERT INTO tbl_grafe_telefono (grafe_int_num,grafe_int_idpersona,grafe_int_idtipotelefono,grafe_int_idoperador,grafe_int_idestado) "
                + "VALUES (?,?,?,?,?)";
            pst3=getMysql().prepareStatement(Consulta_telefono);
            pst3.setInt(1, numtel);
            pst3.setInt(2, idpersona);
            pst3.setInt(3, tiptel);
            pst3.setInt(4, operadortel);
            pst3.setInt(5, idestado);
            int up3 = pst3.executeUpdate();
            if(up3==1){                         
                String Consulta_domicilio = "INSERT INTO tbl_grafe_domicilio (grafe_int_idpersona,grafe_int_iddistrito,grafe_int_idprovincia,grafe_int_iddepartamento,grafe_int_idestado) "
                    + "VALUES (?,?,?,?,?,?)";
                pst4=getMysql().prepareStatement(Consulta_domicilio);
                pst4.setInt(1, idpersona);
                pst4.setInt(2, distrito);
                pst4.setInt(4, provincia);
                pst4.setInt(5, departamento);
                pst4.setInt(6, idestado);
                int up4 = pst4.executeUpdate();
                if(up4==1){
                    return true; 
                }
            }
        }
     }     
    }catch(Exception ex){
            System.err.println("Error1:"+ex);
    }finally{
        try{
            if(getMysql()!=null) getMysql().close();
            if(pst!=null) pst.close();
        }catch (Exception e){
            System.err.println("Error2:"+e);
        }
    }
    
    return false;
}   

}






