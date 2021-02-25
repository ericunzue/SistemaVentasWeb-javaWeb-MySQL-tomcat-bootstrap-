<%-- 
    Document   : Producto
    Created on : 11 feb. 2021, 3:05:05 p. m.
    Author     : e_unz
--%>



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
       
        <div class="d-flex m-2">

            <div class="card col-sm-4 tranparente2 " >
                <h3 class=" text-center">

                    <small class="text-white">Carga y modificación</small>
                </h3>
                <div class="card-body">
                    <form class=" text-white" action="Controlador?menu=Producto" method="POST">
                        <div class="form-group">
                            <label >Nombre</label>
                            <input class="form-control" value="${producto.getNombre()}" type="text" name="txtNombre"> 
                        </div>
                        <div class="form-group">
                            <label >Precio</label>
                            <input class="form-control" value="${producto.getPrecio()}" placeholder="0" type="text" name="txtPrecio"> 
                        </div>
                        <div class="form-group">
                            <label >Stock</label>
                            <input class="form-control" value="${producto.getStock()}" placeholder="0" type="text" name="txtStock"> 
                        </div>
                        <div class="form-group">
                            <label >Estado</label>
                            <input class="form-control" value="${producto.getEstado()}" type="text" name="txtEstado"> 
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-secondary mt-2">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success mt-2">
                    </form>
                </div>
            </div>
            <div class=" col-sm-8 ms-1 ">
                <div class="card tranparente2">
                    <h3 class=" text-center">

                        <small class="text-white">Lista de Productos</small>
                    </h3>
                    <div class="card-body">
                        <table class="table text-center text-white">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>NOMBRE</th>
                                    <th>PRECIO</th>
                                    <th>STOCK</th>
                                    <th>ESTADO</th>
                                    <th>ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="prod" items="${productos}">
                                    <tr>
                                        <td>${prod.getId()}</td>
                                        <td>${prod.getNombre()}</td>
                                        <td>${prod.getPrecio()}</td>
                                        <td>${prod.getStock()}</td>
                                        <td>${prod.getEstado()}</td>
                                        <td>
                                            <a class="btn btn-warning" href="Controlador?menu=Producto&accion=Editar&id=${prod.getId()}">Editar</a>
                                            <a class="btn bg-danger" href="Controlador?menu=Producto&accion=eliminar&id=${prod.getId()}">Eliminar</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    </body>
</html>
