package Models;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class VentaDAO {

    Connection conn = Conexion.getConnection();
    PreparedStatement ps;
    ResultSet rs;
    int respuesta;

    public String generarNumSerie() {
        String numSerie = "";
        String sql = "SELECT MAX(NumeroSerie) FROM ventas";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                numSerie = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return numSerie;
    }

    public String idVentas() {
        String idVenta = "";
        String sql = "SELECT MAX(IdVentas) FROM ventas";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idVenta = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return idVenta;
    }

    public int guardarVenta(Venta nuevaVenta) {
        String sql = "INSERT INTO ventas(IdCliente, IdEmpleado, NumeroSerie, FechaVentas,Monto,Estado) values(?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, nuevaVenta.getIdCliente());
            ps.setInt(2, nuevaVenta.getIdEmpleado());
            ps.setString(3, nuevaVenta.getNumSerie());
            ps.setString(4, nuevaVenta.getFecha());
            ps.setDouble(5, nuevaVenta.getMonto());
            ps.setString(6, nuevaVenta.getEstado());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return respuesta;
    }
    
    
    public int guardarDetalleVentas(Venta nuevaVenta){
        String sql = "INSERT INTO detalle_ventas(IdVentas, IdProducto,Cantidad,PrecioVenta) VALUES(?,?,?,?)";
        try {
             ps = conn.prepareStatement(sql);
            ps.setInt(1, nuevaVenta.getId());
            ps.setInt(2, nuevaVenta.getIdProducto());
            ps.setInt(3, nuevaVenta.getCantidad());
            ps.setDouble(4, nuevaVenta.getPrecio());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return respuesta;
        
    }
}
