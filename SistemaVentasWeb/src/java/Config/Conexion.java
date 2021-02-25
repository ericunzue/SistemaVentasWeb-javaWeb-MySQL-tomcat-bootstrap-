package Config;

/*
This class is made using singleton pattern. Who allows us to make only one instance of the object.

*/
import java.sql.*;
import java.sql.DriverManager;

public final class Conexion {

    private static Connection conn = null;

    private Conexion() {
        String url = "jdbc:mysql://localhost:3306/bd_ventas";
        String driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String pass = "";

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
        }

    }

   
    public static Connection getConnection() {

        if (conn == null) {
            new Conexion();
            System.out.println("Conection Succesfull");
        }

        return conn;
    }


}
