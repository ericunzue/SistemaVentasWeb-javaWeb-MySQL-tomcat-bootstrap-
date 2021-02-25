
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

            <small class="text-white">Empleado</small>
        </h3>
        <div class="d-flex m-2">

            <div class="card col-sm-4 " >
                <div class="card-body bg-light">
                    <form class="" action="Controlador?menu=Empleado" method="POST">
                        <div class="form-group">
                            <label >DNI</label>
                            <input class="form-control" value="${empleado.getDni()}" required="true" type="text" name="txtDni">                        
                        </div>
                        <div class="form-group">
                            <label >Nombre</label>
                            <input class="form-control" value="${empleado.getNombre()}" required="true" type="text" name="txtNombre"> 
                        </div>
                        <div class="form-group">
                            <label >Teléfono</label>
                            <input class="form-control" value="${empleado.getTel()}" required="true" type="text" name="txtTelefono"> 
                        </div>
                        <div class="form-group">
                            <label >Estado</label>
                            <input class="form-control" value="${empleado.getEstado()}" required="true" type="text" name="txtEstado"> 
                        </div>
                        <div class="form-group">
                            <label >Usuario</label>
                            <input class="form-control" value="${empleado.getUser()}" type="text" name="txtUsuario"> 
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-secondary mt-2">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success mt-2">
                    </form>
                </div>
            </div>
            <div class=" col-sm-8  ms-1  ">
                <div class="card">
                    <div class="card-body">
                        <table class="table table-light table-hover text-center">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>DNI</th>
                                    <th>NOMBRE</th>
                                    <th>TELÉFONO</th>
                                    <th>ESTADO</th>
                                    <th>USUARIO</th>
                                    <th>ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="emp" items="${empleados}">
                                    <tr>
                                        <td>${emp.getId()}</td>
                                        <td>${emp.getDni()}</td>
                                        <td>${emp.getNombre()}</td>
                                        <td>${emp.getTel()}</td>
                                        <td>${emp.getEstado()}</td>
                                        <td>${emp.getUser()}</td>
                                        <td>
                                            <a class="btn btn-warning" href="Controlador?menu=Empleado&accion=Editar&id=${emp.getId()}">Editar</a>
                                            <a class="btn bg-danger" href="Controlador?menu=Empleado&accion=eliminar&id=${emp.getId()}">Eliminar</a>
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
