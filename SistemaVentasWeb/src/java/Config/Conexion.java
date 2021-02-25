package Config;

import java.sql.Connection;
import java.sql.DriverManager;
public class Conexion {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/bd_ventas";
    String user = "root";
    String pass = "";

    //metodo sin patron singleton    
    public Connection Conectar() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
        }
        return con;
    }

    //patron singleton
    //private static Connection cone = null;

    /*public static Connection getConnection() {
        try {
            if (cone == null) {
                String driver = "com.mysql.jdbc.Driver"; //el driver varia segun la DB que usemos
                String url = "jdbc:mysql://localhost:3306/bd_ventas?autoReconnect=true";
                String pwd = "";
                String usr = "root";
                Class.forName(driver);
                cone = DriverManager.getConnection(url, usr, pwd);
                System.out.println("Conection Succesfull");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return cone;
    }*/

}
