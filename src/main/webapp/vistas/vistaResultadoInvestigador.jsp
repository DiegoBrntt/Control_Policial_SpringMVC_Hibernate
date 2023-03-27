<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css/estilos.css">
        <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
        crossorigin="anonymous"
      />
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <title>CDB - Investigador</title>
    </head>
    <body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light bg-dark text-white d-flex justify-content-between">

            <form action="/changeInv" method="post">
                <div class="row d-inline-flex">
                    <div class="col">
                        <button name="change" value="entidades" class="btn btn-link nav-link mx-2">Entidades</button>
                    </div>
                    <div class="col">
                        <button name="change" value="sucursales" class="btn btn-link nav-link mx-2">Sucursales</button>
                    </div>
                    <div class="col">
                        <button name="change" value="contratos" class="btn btn-link nav-link mx-2">Contratos</button>
                    </div>
                    <div class="col">

                        <button name="change" value="detenidos" class="btn btn-link nav-link mx-2">Detenidos</button>

                    </div>
                    <div class="col">
                        <button name="change" value="jueces" class="btn btn-link nav-link mx-2">Jueces</button>

                    </div>
                    <div class="col">
                        <button name="change" value="delitos" class="btn btn-link nav-link mx-2">Casos/Delitos</button>

                    </div>
                </div>
            
            </form>
            <form action="/" method="get">
            <input type="submit" class="btn btn-secondary mx-2" name="cerrarSesion" value="Cerrar Sesion">
            </form>
        </nav>
    </header>
        <c:choose>
            <c:when test="${tablaEnt}">
                <c:choose>
                <c:when test="${empty entidades}">
                    <h2>No hay entidades cargadas.</h2>
                </c:when>
                <c:otherwise>
                    <jsp:include page="./investigador/vistaEntidades.jsp"/>
                </c:otherwise>
                </c:choose>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${tablaSuc}">
                <c:choose>
                    <c:when test="${empty sucursales}">
                        <h2>No hay sucursales cargadas.</h2>
                    </c:when>
                    <c:otherwise>
                        <jsp:include page="./investigador/vistaSucursales.jsp"/>
                    </c:otherwise>
                </c:choose>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${tablaCon}">
                <c:choose>
                    <c:when test="${empty contratos}">
                        <h2>No hay sucursales cargadas.</h2>
                    </c:when>
                    <c:otherwise>
                        <jsp:include page="./investigador/vistaContratos.jsp"/>
                    </c:otherwise>
                </c:choose>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${tablaDet}">
                <c:choose>
                    <c:when test="${empty bandas}">
                        <h2>No hay bandas cargadas.</h2>
                    </c:when>
                    <c:otherwise>
                        <jsp:include page="./investigador/vistaBandas.jsp"/>
                    </c:otherwise>
                </c:choose>
                <br>
                <c:choose>
                    <c:when test="${empty detenidos}">
                         <h2>No posee contratos</h2>
                    </c:when>
                    <c:otherwise>
                        <jsp:include page="./investigador/vistaDetenidos.jsp"/>
                    </c:otherwise>
                </c:choose>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${tablaJue}">
                <c:choose>
                    <c:when test="${empty juzgados}">
                        <h2>No hay jueces cargados en la base de datos.</h2>
                    </c:when>
                    <c:otherwise>
                        <jsp:include page="./investigador/vistaJuzgados.jsp"/>
                    </c:otherwise>

                </c:choose>
            <c:choose>    
            <c:when test="${empty jueces}">
                <h2>No hay jueces cargados en la base de datos.</h2>
            </c:when>
            <c:otherwise>
                <jsp:include page="./investigador/vistaJueces.jsp"/>
            </c:otherwise>
            </c:choose>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${tablaDel}">
                <c:choose>
                <c:when test="${empty casos}">
                    <h2>No hay casos cargados.</h2>
                </c:when>
                <c:otherwise>
                    <jsp:include page="./investigador/vistaDelitos.jsp"/>
                </c:otherwise>
                </c:choose>
            </c:when>
        </c:choose>
    </body>
</html>

