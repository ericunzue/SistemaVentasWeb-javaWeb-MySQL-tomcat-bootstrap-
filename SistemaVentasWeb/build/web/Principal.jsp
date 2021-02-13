<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-dark bg-gradient ">
            <div class="container-fluid">                           
                <div class="collapse navbar-collapse justify-content-between" id="navbarNav ">
                    <ul class="navbar-nav ">
                        <li class="nav-item-active">
                            <a class="nav-link text-white" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none"class="btn btn-outline-secondary text-white" href="Controlador?menu=Producto" target="myFrame">Producto</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-secondary text-white" href="Controlador?menu=Empleado&accion=listar" target="myFrame">Empleado</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-secondary text-white" href="Controlador?menu=Clientes" target="myFrame">Clientes</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-secondary text-white" href="Controlador?menu=NuevaVenta" target="myFrame">Nueva Venta</a>
                        </li>
                    </ul>

                    <div class="dropdown  ">
                        <button style="margin-left: 10px; border: none" class="btn btn-outline-secondary text-white dropdown-toggle " type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                            ${usuario.getNombre()}
                        </button>
                        <ul class="dropdown-menu text-center" aria-labelledby="dropdownMenuButton">
                            <li><a class="dropdown-item" href="#">
                                    <img src="img/logoUsuario.png" alt="" width="60"/>
                                </a>
                            </li>

                            <li><a class="dropdown-item" href="#">${usuario.getUser()}</a></li>
                            <li><a class="dropdown-item" href="#">usuario@gmail.com</a></li>
                            <div class="dropdown-divider"></div>
                            <form action="Validar" method="POST">                           
                                <li><button name="accion" value="salir" class="dropdown-item" href="#">Salir</button></li>
                            </form>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <div class="mt-2" style="height: 550px">
            <iframe name="myFrame" style="height: 100%; width: 100%; border: none"></iframe>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    </body>
</html>
