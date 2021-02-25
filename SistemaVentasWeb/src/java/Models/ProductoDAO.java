/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author e_unz
 */
public class ProductoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int respuesta;

    public List listar() {
        String sql = "SELECT * FROM producto";
        List<Producto> listaProductos = new ArrayList<>();
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto producto = new Producto();
                producto.setId(rs.getInt(1));
                producto.setNombre(rs.getString(2));
                producto.setPrecio(rs.getDouble(3));
                producto.setStock(rs.getInt(4));
                producto.setEstado(rs.getString(5));

                listaProductos.add(producto);
            }
        } catch (Exception e) {
        }
        return listaProductos;
    }

    public int agregar(Producto nuevo) {
        String sql = "INSERT INTO producto (Nombres, Precio, Stock, Estado) VALUES(?,?,?,?)";
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, nuevo.getNombre());
            ps.setDouble(2, nuevo.getPrecio());
            ps.setInt(3, nuevo.getStock());
            ps.setString(4, nuevo.getEstado());
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Insert error");
        }
        return respuesta;
    }

    public Producto listarId(int idProd) {//Trae un objeto con el id deseado.
        Producto prod = new Producto();
        String sql = "SELECT * FROM producto WHERE IdProducto=" + idProd;
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                prod.setId(rs.getInt(1));
                prod.setNombre(rs.getString(2));
                prod.setPrecio(rs.getDouble(3));
                prod.setStock(rs.getInt(4));
                prod.setEstado(rs.getString(5));

            }
        } catch (Exception e) {
        }
        return prod;
    }

    public int actualizar(Producto producto) {
        String sql = "UPDATE producto SET Nombres=?, Precio=?, Stock=?, Estado=? WHERE IdProducto=?";
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, producto.getNombre());
            ps.setDouble(2, producto.getPrecio());
            ps.setInt(3, producto.getStock());
            ps.setString(4, producto.getEstado());
            ps.setInt(5, producto.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Insert error");
        }
        return respuesta;
    }

    public void eliminar(int idProd) {
        String sql = "DELETE FROM producto WHERE IdProducto=" + idProd;
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
   

}
