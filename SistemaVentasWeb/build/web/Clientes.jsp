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

            <small class="text-white">Menú Clientes</small>
        </h3>
        <div class="d-flex m-2">
            <div class="col-sm-4">
                <div class="card tranparente2  text-white " >
                     <h3 class=" text-center">

                        <small class="text-white">Agregar y Modificar</small>
                    </h3>
                    <div class="card-body">
                        <form class="" action="Controlador?menu=Clientes" method="POST">
                            <div class="form-group">
                                <label >DNI</label>
                                <input class="form-control" value="${cliente.getDni()}" required="true" type="text" name="txtDni">                        
                            </div>
                            <div class="form-group">
                                <label >Nombre</label>
                                <input class="form-control" value="${cliente.getNombre()}" required="true" type="text" name="txtNombre"> 
                            </div>
                            <div class="form-group">
                                <label >Dirección</label>
                                <input class="form-control" value="${cliente.getDireccion()}" required="true" type="text" name="txtDireccion"> 
                            </div>
                            <div class="form-group">
                                <label >Estado</label>
                                <input class="form-control" value="${cliente.getEstado()}" required="true" type="text" name="txtEstado"> 
                            </div>
                            <input type="submit" name="accion" value="Agregar" class="btn btn-secondary mt-2">
                            <input type="submit" name="accion" value="Actualizar" class="btn btn-success mt-2">
                        </form>
                    </div>
                </div>
            </div>

            <div class=" col-sm-8 ms-1">
                <div class="card tranparente2">
                     <h3 class=" text-center">

                        <small class="text-white">Lista de Clientes</small>
                    </h3>
                    <div class="card-body ">
                        <table class="table table-hover text-center text-white">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>DNI</th>
                                    <th>NOMBRE</th>
                                    <th>DIRECCION</th>
                                    <th>ESTADO</th>
                                    <th>ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cli" items="${clientes}">
                                    <tr>
                                        <td>${cli.getId()}</td>
                                        <td>${cli.getDni()}</td>
                                        <td>${cli.getNombre()}</td>
                                        <td>${cli.getDireccion()}</td>
                                        <td>${cli.getEstado()}</td>

                                        <td>
                                            <a class="btn btn-warning" href="Controlador?menu=Clientes&accion=Editar&id=${cli.getId()}">Editar</a>
                                            <a class="btn bg-danger" href="Controlador?menu=Clientes&accion=eliminar&id=${cli.getId()}">Eliminar</a>
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

