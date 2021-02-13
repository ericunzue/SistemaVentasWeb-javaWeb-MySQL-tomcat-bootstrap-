/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Empleado;
import Models.EmpleadoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author e_unz
 */
public class Controlador extends HttpServlet {

    Empleado empleado = new Empleado();
    EmpleadoDAO empDAO = new EmpleadoDAO();
    int idEmp;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("Principal")) {
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        }
        if (menu.equals("Empleado")) {

            switch (accion) {
                case "listar":
                    List lista = empDAO.listar();
                    System.out.println(lista);
                    request.setAttribute("empleados", lista);
                    break;
                case "Agregar":
                    String dni = request.getParameter("txtDni");
                    String nombre = request.getParameter("txtNombre");
                    String tel = request.getParameter("txtTelefono");
                    String estado = request.getParameter("txtEstado");
                    String user = request.getParameter("txtUsuario");
                    empleado.setDni(dni);
                    empleado.setNombre(nombre);
                    empleado.setTel(tel);
                    empleado.setEstado(estado);
                    empleado.setUser(user);
                    empDAO.agregar(empleado);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=listar").forward(request, response);
                    break;
                case "Editar":
                    idEmp = Integer.parseInt(request.getParameter("id"));
                    Empleado e = empDAO.listarId(idEmp);
                    request.setAttribute("empleado", e);
                    break;
                case "Actualizar":
                    String dniEdit = request.getParameter("txtDni");
                    String nombreEdit = request.getParameter("txtNombre");
                    String telEdit = request.getParameter("txtTelefono");
                    String estadoEdit = request.getParameter("txtEstado");
                    String userEdit = request.getParameter("txtUsuario");
                    empleado.setDni(dniEdit);
                    empleado.setNombre(nombreEdit);
                    empleado.setTel(telEdit);
                    empleado.setEstado(estadoEdit);
                    empleado.setUser(userEdit);
                    empleado.setId(idEmp);
                    empDAO.actualizar(empleado);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=listar").forward(request, response);
                    break;
                case "eliminar":
                    idEmp = Integer.parseInt(request.getParameter("id"));
                    empDAO.eliminar(idEmp);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Empleado.jsp").forward(request, response);
        }
        if (menu.equals("Cliente")) {
            request.getRequestDispatcher("Clientes.jsp").forward(request, response);
        }
        if (menu.equals("Producto")) {
            request.getRequestDispatcher("Producto.jsp").forward(request, response);
        }
        if (menu.equals("NuevaVenta")) {
            request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
