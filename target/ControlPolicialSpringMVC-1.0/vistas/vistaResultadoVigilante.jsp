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
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light bg-dark text-white d-flex justify-content-between">
                
                <a href="#contratos" class="nav-link mx-2">Contratos</a>
                <form action="/" method="get">
                <input type="submit" class="btn btn-secondary mx-2" name="cerrarSesion" value="Cerrar Sesion">
                
                </form>
            </nav>
        </header>

        <h1>${usuario.tipo} ${usuario.clave}</h1>
        <c:choose>
            <c:when test="${empty contratosVigilante}">
                <h2>No posee contratos</h2>
            </c:when>
            <c:otherwise>
                <table id="contratos" class="table table-responsive table-bordered border-dark">
                    <legend class="text-center bg-dark text-white m-0">Mis Contratos</legend>
                    <thead>
                        <tr class="row bg-info ">
                            <th class="col">Contrato</th>
                            <th class="col">Fecha</th>
                            <th class="col">Sucursal</th>
                            <th class="col">Vigilante</th>
                            <th class="col">Dias Contratados</th>
                            <th class="col">Armado</th>
                            <th class="col">Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="contrato" items="${contratosVigilante}">
                            <c:choose>
                                <c:when test="${contrato.estado}">
                                    <tr class="row">
                                        <td class="col">${contrato.codigo_contrato}</td>
                                        <td class="col">${contrato.fecha_contratacion}</td>
                                        <td class="col">${contrato.codigo_suc.domicilio}</td>
                                        <td class="col">${contrato.codigo_vig.clave}</td>
                                        <td class="col">${contrato.dias_contratados}</td>
                                        <td class="col">${contrato.armado==true? 'Si':'No'} </td>
                                        <td class="col alert alert-success">${contrato.estado==true? 'Vigente':'Caduco'}</td>
                                    </tr>
                                </c:when>
                                <c:when test="${not contrato.estado}">
                                    <tr class="row">
                                        <td class="col">${contrato.codigo_contrato}</td>
                                        <td class="col">${contrato.fecha_contratacion}</td>
                                        <td class="col">${contrato.codigo_suc.domicilio}</td>
                                        <td class="col">${contrato.codigo_vig.clave}</td>
                                        <td class="col">${contrato.dias_contratados}</td>
                                        <td class="col">${contrato.armado==true? 'Si':'No'} </td>
            
                                        <td class="col alert alert-danger">${contrato.estado==true? 'Vigente':'Caduco'}</td>
                                    </tr>
                                </c:when>
                              </c:choose>
                        
                    </c:forEach>
                    </tbody>
                    
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>
