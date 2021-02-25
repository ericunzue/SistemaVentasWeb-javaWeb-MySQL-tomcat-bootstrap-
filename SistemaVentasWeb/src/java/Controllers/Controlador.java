/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Config.GenerarSerie;
import Models.Cliente;
import Models.ClienteDAO;
import Models.Empleado;
import Models.EmpleadoDAO;
import Models.Producto;
import Models.ProductoDAO;
import Models.Venta;
import Models.VentaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author e_unz
 */
public class Controlador extends HttpServlet{

  Empleado empleado = new Empleado();
  EmpleadoDAO empDAO = new EmpleadoDAO();
  Producto producto = new Producto();
  ProductoDAO productoDAO = new ProductoDAO();
  Cliente cliente = new Cliente();
  ClienteDAO clienteDAO = new ClienteDAO();
  int idEmp;
  int idProd;
  int idCli;
  Venta venta = new Venta();
  List<Venta> listaVentas = new ArrayList();//cantidad de productos a comprar
  int item;
  int cod;
  String descripcion;
  double precio;
  int cant;
  double subtotal;
  double totalPagar;
  String numeroSerie;
  VentaDAO ventaDAO = new VentaDAO();
  LocalDate fecha = LocalDate.now();

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException{
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
    if (menu.equals("Clientes")) {
      switch (accion) {
        case "listar":
          List lista = clienteDAO.listar();
          System.out.println(lista);
          request.setAttribute("clientes", lista);
          break;
        case "Agregar":
          String dni = request.getParameter("txtDni");
          String nombre = request.getParameter("txtNombre");
          String dir = request.getParameter("txtDireccion");
          String estado = request.getParameter("txtEstado");
          cliente.setDni(dni);
          cliente.setNombre(nombre);
          cliente.setDireccion(dir);
          cliente.setEstado(estado);
          clienteDAO.agregar(cliente);
          request.getRequestDispatcher("Controlador?menu=Clientes&accion=listar").forward(request, response);
          break;
        case "Editar":
          idCli = Integer.parseInt(request.getParameter("id"));
          Cliente c = clienteDAO.listarId(idCli);
          request.setAttribute("cliente", c);
          break;
        case "Actualizar":
          String dniEdit = request.getParameter("txtDni");
          String nombreEdit = request.getParameter("txtNombre");
          String dirEdit = request.getParameter("txtDireccion");
          String estadoEdit = request.getParameter("txtEstado");
          cliente.setDni(dniEdit);
          cliente.setNombre(nombreEdit);
          cliente.setDireccion(dirEdit);
          cliente.setEstado(estadoEdit);
          cliente.setId(idCli);
          clienteDAO.actualizar(cliente);
          request.getRequestDispatcher("Controlador?menu=Clientes&accion=listar").forward(request, response);
          break;
        case "eliminar":
          idCli = Integer.parseInt(request.getParameter("id"));
          clienteDAO.eliminar(idCli);
          request.getRequestDispatcher("Controlador?menu=Clientes&accion=listar").forward(request, response);
          break;
        default:
          throw new AssertionError();
      }
      request.getRequestDispatcher("Clientes.jsp").forward(request, response);
    }
    if (menu.equals("Producto")) {
      switch (accion) {
        case "listar":
          List listaProductos = productoDAO.listar();
          request.setAttribute("productos", listaProductos);
          break;
        case "Agregar":
          String nombre = request.getParameter("txtNombre");
          String precio2 = request.getParameter("txtPrecio");
          String stock = request.getParameter("txtStock");
          String estado = request.getParameter("txtEstado");
          producto.setNombre(nombre);
          producto.setPrecio(producto.ParseDouble(precio2));
          producto.setStock(producto.ParseInt(stock));
          producto.setEstado(estado);
          productoDAO.agregar(producto);
          request.getRequestDispatcher("Controlador?menu=Producto&accion=listar").forward(request, response);
          break;

        case "Editar":
          idProd = Integer.parseInt(request.getParameter("id"));
          Producto p = productoDAO.listarId(idProd);
          request.setAttribute("producto", p);
          break;

        case "Actualizar":
          String nombreEdit = request.getParameter("txtNombre");
          String precioEdit = request.getParameter("txtPrecio");
          String stockEdit = request.getParameter("txtStock");
          String estadoEdit = request.getParameter("txtEstado");
          producto.setNombre(nombreEdit);
          producto.setPrecio(producto.ParseDouble(precioEdit));//Para no generar errores es necesario comprobar que los datos de los inputs sean correctos. Ejemplo for vacio
          producto.setStock(producto.ParseInt(stockEdit));//Para no generar errores es necesario comprobar que los datos de los inputs sean correctos. Ejemplo for vacio
          producto.setEstado(estadoEdit);
          producto.setId(idProd);
          productoDAO.actualizar(producto);
          request.getRequestDispatcher("Controlador?menu=Producto&accion=listar").forward(request, response);
          break;

        case "eliminar":
          idProd = Integer.parseInt(request.getParameter("id"));
          productoDAO.eliminar(idProd);
          request.getRequestDispatcher("Controlador?menu=Producto&accion=listar").forward(request, response);
          break;
        default:
          throw new AssertionError();
      }
      request.getRequestDispatcher("Producto.jsp").forward(request, response);
    }
    if (menu.equals("NuevaVenta")) {
      switch (accion) {
        case "BuscarCliente":
          String dni = request.getParameter("CodigoCliente");
          cliente.setDni(dni);
          cliente = clienteDAO.buscar(dni);
          request.setAttribute("cliente", cliente);
          request.setAttribute("numeroFactura", numeroSerie);

          break;

        case "BuscarProducto":
          int id = Integer.parseInt(request.getParameter("CodigoProducto"));
          producto = productoDAO.listarId(id);
          request.setAttribute("cliente", cliente);
          request.setAttribute("datos", listaVentas);
          request.setAttribute("producto", producto);
          request.setAttribute("total", totalPagar);
          request.setAttribute("numeroFactura", numeroSerie);

          break;
        case "Agregar":
          request.setAttribute("cliente", cliente);
          totalPagar = 0;
          item = item + 1;
          cod = producto.getId();
          descripcion = request.getParameter("NombreProducto");
          precio = Double.parseDouble(request.getParameter("precio"));
          cant = Integer.parseInt(request.getParameter("cantidad"));
          subtotal = precio * cant;
          venta = new Venta();
          venta.setItem(item);
          venta.setIdProducto(cod);
          venta.setDescripcionP(descripcion);
          venta.setPrecio(precio);
          venta.setCantidad(cant);
          venta.setSubtotal(subtotal);
          listaVentas.add(venta);
          for (Venta listaVenta : listaVentas) {
            totalPagar += listaVenta.getSubtotal();

          }
          request.setAttribute("total", totalPagar);
          request.setAttribute("datos", listaVentas);
          request.setAttribute("numeroFactura", numeroSerie);

          break;

        case "GenerarVenta":
          //Actualización de stock
          for (int i = 0; i < listaVentas.size(); i++) {
            Producto pr = new Producto();
            int cantidad = listaVentas.get(i).getCantidad();
            int idProducto = listaVentas.get(i).getIdProducto();
            ProductoDAO pdao = new ProductoDAO();
            pr = pdao.listarId(idProducto);
            int resta = pr.getStock() - cantidad;
            pdao.actualizarStock(resta, idProducto);
          }
          //Guardar Venta
          venta.setIdCliente(cliente.getId());
          venta.setIdEmpleado(2);
          venta.setNumSerie(numeroSerie);
          venta.setFecha("2021-02-01");
          venta.setMonto(totalPagar);
          venta.setEstado("1");
          ventaDAO.guardarVenta(venta);
          //Guardar Detalle Venta
          int idVenta = Integer.parseInt(ventaDAO.idVentas());
          listaVentas.forEach(listaVenta->{
            venta = new Venta();
            venta.setId(idVenta);
            venta.setIdProducto(listaVenta.getIdProducto());
            venta.setCantidad(listaVenta.getCantidad());
            venta.setPrecio(listaVenta.getPrecio());
            ventaDAO.guardarDetalleVentas(venta);

          });
          listaVentas.clear();
          break;

        default:
          numeroSerie = ventaDAO.generarNumSerie();
          if (numeroSerie == null) {
            numeroSerie = "00000001";
            request.setAttribute("numeroFactura", numeroSerie);
          } else {
            int incrementar = (int) Integer.parseInt(numeroSerie);
            GenerarSerie generarSerie = new GenerarSerie();
            numeroSerie = generarSerie.numeroSerie(incrementar);
            request.setAttribute("numeroFactura", numeroSerie);

          }
          request.setAttribute("numeroFactura", numeroSerie);

          request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);

      }
      request.setAttribute("numeroFactura", numeroSerie);

      request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
    }

  }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  /**
   * Handles the HTTP <code>GET</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error
   * occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException{
    processRequest(request, response);
  }

  /**
   * Handles the HTTP <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error
   * occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException{
    processRequest(request, response);
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */
  @Override
  public String getServletInfo(){
    return "Short description";
  }// </editor-fold>

}
