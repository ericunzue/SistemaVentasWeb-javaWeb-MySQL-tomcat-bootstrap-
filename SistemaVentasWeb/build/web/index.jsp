<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <title>Login</title>
    </head>
    <body class="fondo">
        <div class="container mt-4 col-lg-4">
            <div class="card col-sm-10 tranparente2 text-white">
                <div class="card-body">
                    <form class="form-sign" action="Validar" method="POST">
                        <div class="form-group  text-center">
                            <h3>Login</h3>
                            <img src="img/logo.jpg" alt="logo" width="170"/>
                            <label>Bienvenido al sistema</label>
                        </div>
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" name="txtuser" class="form-control">
                        </div>
                        <div class="form-group">  
                            <label>Contraseña</label>
                            <input type="password" name="txtpass" class="form-control">
                        </div>
                        <div class="d-grid gap-2 mt-2 ">
                            <input type="submit" name="accion" value="Ingresar" class=" btn btn-secondary text-white">
                        </div>
                    </form>
                </div>
            </div>
        </div>      

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    </body>
</html>
