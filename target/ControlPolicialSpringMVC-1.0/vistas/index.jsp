<%-- 
    Document   : index
    Created on : 2 nov. 2021, 21:42:27
    Author     : Grandalf
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css/estilos.css">
        <title>Control Policial Bancario</title>
    </head>
    <body>



        <div class="divTable3">
            <h1>Bienvenido/a a la pagina central del control policial para sucursales bancarias.</h1>
            <span>
                <img src="resources/animacion/principal.gif">
            </span>
        </div>

        <h2 class="centrado">Ingrese sus datos para ingresar:</h2>
        <form method="post" action="/validarUsuario">

            <div class="divTable">
                <c:choose>
                    <c:when test="${not empty usuario}">
                        <div class="divTable5">
                            <div class="divTableBody">
                                <div class="divTableRow">
                                    <div class="divTableCell">
                                        <h3>Contraseña y/o nombre de usuario invalido..</h3>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:when>
                </c:choose>
                <div class="divTableBody">
                    <div class="divTableRow">
                        <div class="divTableCell">
                            <h3>Nombre de usuario:</h3>
                        </div>
                        <div class="divTableCell">
                            <input type="text" name="clave" required>
                        </div>
                    </div>    
                    <div class="divTableRow">
                        <div class="divTableCell">
                            <h3>Contraseña:</h3>
                        </div>
                        <div class="divTableCell">
                            <input type="password" name="pass" required>
                        </div>
                    </div>
                    <div class="divTable2">
                        <center> <input type="submit" value="Iniciar sesion"></center>
                    </div>
                </div>
            </div>
        </form>

    </body>
</html>
