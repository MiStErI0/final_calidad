
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.mysql.cj.jdbc.MysqlDataSource;
public class Conexion {
 private String USER="root";
 private String PSW="database";
 private String HOST="localhost";
 private String PORT="3306";
 private String DATABASE="dbcevicheria?useTimezone=true&serverTimezone=UTC&useSSL=false";
 private String CLASS_NAME="com.mysql.cj.jdbc.Driver";
 private String URL="jdbc:mysql://"+HOST+":"+PORT+"/"+DATABASE;
 private Connection cx;
 
 public Conexion(){
     try{
        Class.forName(CLASS_NAME);
        cx=DriverManager.getConnection(URL,USER,PSW);
     }catch(ClassNotFoundException e){
         System.err.println("Error:"+e);
     }catch(SQLException e){
         System.err.println("Error:"+e);
     }
   }
 
 public Connection getConexion(){
     return cx;
 }
 
 public static void main(String[] args){
 Conexion con = new Conexion();
 }

}










