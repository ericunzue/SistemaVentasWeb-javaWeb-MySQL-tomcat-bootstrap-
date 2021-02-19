<%-- 
    Document   : RegistrarVenta
    Created on : 11 feb. 2021, 3:06:34 p. m.
    Author     : e_unz
--%>

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
                <div class="card">
                    <form action="Controlador" method="POST">
                        <div class="card-body">
                            <div class="form-group">
                                <label>Datos del cliente</label>
                            </div>
                            <div class="form-group d-flex mt-2">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="CodigoCliente" class="form-control" placeholder="Codigo">
                                    <input type="submit" name="accion" value="Buscar" class="btn btn-secondary ms-1" >
                                </div>
                                <div class="col-sm-6 ms-2">
                                    <input type="text" name="NombreCliente" class="form-control">
                                </div>
                            </div>
                            <div class="form-group mt-3 ">
                                <label>Datos del producto</label>
                            </div>
                            <div class="form-group d-flex mt-2">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="CodigoProducto" class="form-control" placeholder="Codigo Prod">
                                    <input type="submit" name="accion" value="Buscar" class="btn btn-secondary ms-1" >
                                </div>
                                <div class="col-sm-6 ms-2">
                                    <input type="text" name="NombreProducto" class="form-control">
                                </div>
                            </div>
                            <div class="form-group d-flex mt-4">
                                <div class="col-sm-6">
                                    <input type="text" name="precio" class="form-control" placeholder="Precio">
                                </div>
                                <div class="col-sm-3 ms-1">
                                    <input type="number" name="cantidad" class="form-control">
                                </div>
                                <div class="col-sm-3 ms-1">
                                    <input type="text" name="stock" class="form-control" placeholder="Stock">
                                </div>
                            </div>
                            <div class="form-group mt-2">
                                <input type="submit" name="accion" value="Agregar" class="btn btn-secondary">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-8  ms-1">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex col-sm-5 ms-auto">
                            <label>Número comprobante</label>
                            <input type="text" name="NroSerie" class="form-control">
                        </div>
                        <br>
                        <table class="table table-hover">
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
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer">
                        <div>
                            <input type="submit" name="accion" value="Generar Venta" class="btn btn-success">
                            <input type="submit" name="accion" value="Cancelar" class="btn btn-danger">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    </body>
</html>
