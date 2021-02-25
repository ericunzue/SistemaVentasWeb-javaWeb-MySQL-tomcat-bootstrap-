
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>JSP Page</title>
  </head>
  <body class="tranparente">
    <h3 class=" text-center">

      <small class="text-white">Nueva Venta</small>
    </h3>

    <div class="d-flex m-2">
      <div class="col-sm-4">
        <div class="card tranparente2 text-white">
          <form action="Controlador?menu=NuevaVenta" method="POST">
            <div class="card-body">
              <!--DATOS DEL CLIENTE-->
              <div class="form-group">
                <label>Datos del cliente</label>
              </div>
              <div class="form-group d-flex mt-2">
                <div class="col-sm-6 d-flex">
                  <input type="text" name="CodigoCliente" value="${cliente.getDni()}" class="form-control" placeholder="DNI">
                  <button type="submit" name="accion" value="BuscarCliente" class="btn btn-secondary ms-1" >Buscar</button>
                </div>
                <div class="col-sm-6 ms-2">
                  <input type="text" name="NombreCliente" value="${cliente.getNombre()}" class="form-control">
                </div>
              </div>
              <!--DATOS DEL PRODUCTO-->
              <div class="form-group mt-3 ">
                <label>Datos del producto</label>
              </div>
              <div class="form-group d-flex mt-1">
                <div class="col-sm-6 d-flex">
                  <input type="text" name="CodigoProducto" value="${producto.getId()}" class="form-control" placeholder="Codigo Prod">
                  <button type="submit" name="accion" value="BuscarProducto" class="btn btn-secondary ms-1" >Buscar</button>
                </div>
                <div class="col-sm-6 ms-2">
                  <input type="text" name="NombreProducto" value="${producto.getNombre()}" class="form-control">
                </div>
              </div>
              <div class="form-group d-flex mt-2">
                <div class="col-sm-6">
                  <input type="text" name="precio" value="${producto.getPrecio()}" class="form-control" placeholder="Precio">
                </div>
                <div class="col-sm-3 ms-1">
                  <input type="number" name="cantidad" value="1" class="form-control">
                </div>
                <div class="col-sm-3 ms-1">
                  <input type="text" name="stock" value="${producto.getStock()}" class="form-control" placeholder="Stock">
                </div>
              </div>
              <!--BOTON AGREGAR PRODUCTO-->
              <div class="form-group mt-4">
                <button type="submit" name="accion" value="Agregar" class="btn btn-secondary">Agregar</button>
              </div>
            </div>
          </form>
        </div>
      </div>
      <!--COMPROBANTE-->
      <div class="col-sm-8  ms-1">
        <div class="card tranparente2 text-white">
          <div class="card-body">
            <div class="d-flex col-sm-3 ms-auto">
              <div class="input-group mb-3">
                <span class="input-group-text bg-primary bg-gradient text-white" id="basic-addon1">Factura</span>
                <input type="text" class="form-control " name="NroSerie" value="${numeroFactura}" aria-describedby="basic-addon1">
              </div>
            </div>
            <br>
            <table class="table table-hover text-white text-center">
              <thead>
                <tr>
                  <th>Nro</th>
                  <th>Código</th>
                  <th>Descripción</th>
                  <th>Precio</th>
                  <th>Cantidad</th>
                  <th>Subtotal</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="list" items="${datos}">
                  <tr>
                    <td>${list.getItem()}</td>
                    <td>${list.getIdProducto()}</td>
                    <td>${list.getDescripcionP()}</td>
                    <td>${list.getPrecio()}</td>
                    <td>${list.getCantidad()}</td>
                    <td>${list.getSubtotal()}</td>
                    <td>
                      <a class="btn btn-warning" href="Controlador?menu=NuevaVenta&accion=Editar&id=${lista.getIdProducto()}">Editar</a>
                      <a class="btn bg-danger" href="Controlador?menu=NuevaVenta&accion=eliminar&id=${lista.getIdProducto()}">Eliminar</a>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          <div class="card-footer d-flex justify-content-between">
            <div class="col-sm-10">
              <a class="btn btn-warning"href="Controlador?menu=NuevaVenta&accion=GenerarVenta">Generar venta</a>
              <input type="submit" name="accion" value="Cancelar" class="btn btn-danger">
            </div>
            <div class="col-sm-2 ms-auto">
              <div class="input-group mb-3">
                <span class="input-group-text bg-primary bg-gradient text-white" id="basic-addon1">Total $</span>
                <input type="text" class="form-control" name="" value="${total}0.0" aria-describedby="basic-addon1">
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
  </body>
</html>
