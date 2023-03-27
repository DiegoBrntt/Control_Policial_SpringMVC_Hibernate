<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css/estilos.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
        <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
        crossorigin="anonymous"
      />
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <title>CDB - Administrador</title>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light bg-dark text-white d-flex justify-content-between">
    
                <form action="/changeAdm" method="post">
                    <div class="row d-inline-flex">
                        <div class="col">
                            <button name="change" value="usuarios" class="btn btn-link nav-link mx-2">Usuarios</button>
                        </div>
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
                <jsp:include page="./administrador/vistaEntidades.jsp"/>
            </c:when>
            <c:when test="${tablaUsu}">
                <jsp:include page="./administrador/vistaUsuarios.jsp"/>
            </c:when>
            <c:when test="${tablaSuc}">
                <jsp:include page="./administrador/vistaSucursales.jsp"/>
            </c:when>
            <c:when test="${tablaCon}">
                <jsp:include page="./administrador/vistaContratos.jsp"/>
            </c:when>
            <c:when test="${tablaDel}">
                <jsp:include page="./administrador/vistaDelitos.jsp"/>
            </c:when>
            <c:when test="${tablaDet}">
                <div class="accordion" id="BanDet">
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button fw-bolder" type="button" data-bs-toggle="collapse" data-bs-target="#bandas" aria-expanded="true" aria-controls="collapseOne">
                          Bandas
                        </button>
                      </h2>
                      <div id="bandas" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#BanDet">
                        <div class="accordion-body">
                            <jsp:include page="./administrador/vistaBandas.jsp"/>
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button text-center fw-bolder collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#detenidos" aria-expanded="false" aria-controls="detenidos">
                          Detenidos
                        </button>
                      </h2>
                      <div id="detenidos" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#BanDet">
                        <div class="accordion-body">
                            <jsp:include page="./administrador/vistaDetenidos.jsp"/>
                        </div>
                      </div>
                    </div>
                  </div>
            </c:when>
            <c:when test="${tablaJue}">
                <div class="accordion" id="JuzJue">
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button fw-bolder" type="button" data-bs-toggle="collapse" data-bs-target="#juzgados" aria-expanded="true" aria-controls="juzgados">
                          Juzgados
                        </button>
                      </h2>
                      <div id="juzgados" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#BanDet">
                        <div class="accordion-body">
                            <jsp:include page="./administrador/vistaJuzgados.jsp"/>
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button text-center fw-bolder collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#jueces" aria-expanded="false" aria-controls="jueces">
                          Jueces
                        </button>
                      </h2>
                      <div id="jueces" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#JuzJue">
                        <div class="accordion-body">
                            <jsp:include page="./administrador/vistaJueces.jsp"/>
                        </div>
                      </div>
                    </div>
                  </div>
            </c:when>
        </c:choose>
    </body>
</html>
