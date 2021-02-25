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
public class EmpleadoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int respuesta;

    public Empleado validar(String user, String dni) {
        Empleado emp = new Empleado();
        String sql = "select * from empleado where User=? and Dni=?";
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, dni);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setId(rs.getInt("IdEmpleado"));
                emp.setUser(rs.getString("User"));
                emp.setDni(rs.getString("Dni"));
                emp.setNombre(rs.getString("Nombres"));
            }
        } catch (Exception e) {
        }
        return emp;
    }

    //Operaciones CRUD
    public List listar() {
        String sql = "SELECT * FROM empleado";
        List<Empleado> listaEmpleados = new ArrayList<>();
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado emp = new Empleado();
                emp.setId(rs.getInt(1));
                emp.setDni(rs.getString(2));
                emp.setNombre(rs.getString(3));
                emp.setTel(rs.getString(4));
                emp.setEstado(rs.getString(5));
                emp.setUser(rs.getString(6));
                listaEmpleados.add(emp);
            }
        } catch (Exception e) {
        }
        return listaEmpleados;
    }

    public int agregar(Empleado nuevo) {
        String sql = "INSERT INTO empleado (Dni, Nombres, Telefono, Estado, User) VALUES(?,?,?,?,?)";
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, nuevo.getDni());
            ps.setString(2, nuevo.getNombre());
            ps.setString(3, nuevo.getTel());
            ps.setString(4, nuevo.getEstado());
            ps.setString(5, nuevo.getUser());
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Insert error");
        }
        return respuesta;
    }

    public Empleado listarId(int id) {
        Empleado emp = new Empleado();
        String sql = "SELECT * FROM empleado WHERE IdEmpleado=" + id;
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setId(rs.getInt(1));
                emp.setDni(rs.getString(2));
                emp.setNombre(rs.getString(3));
                emp.setTel(rs.getString(4));
                emp.setEstado(rs.getString(5));
                emp.setUser(rs.getString(6));

            }
        } catch (Exception e) {
        }
        return emp;
    }

    public int actualizar(Empleado emp) {
        String sql = "UPDATE empleado SET Dni=?, Nombres=?, Telefono=?, Estado=?, User=? WHERE IdEmpleado=?";
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, emp.getDni());
            ps.setString(2, emp.getNombre());
            ps.setString(3, emp.getTel());
            ps.setString(4, emp.getEstado());
            ps.setString(5, emp.getUser());
            ps.setInt(6, emp.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Insert error");
        }
        return respuesta;
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM empleado WHERE IdEmpleado=" + id;
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

}
