<%-- 
    Document   : vistaResultado
    Created on : 2 nov. 2021, 23:26:49
    Author     : Grandalf
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/css/estilos.css">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <nav>
                <form action="/" method="get">
                <input type="submit" name="cerrarSesion" value="Cerrar Sesion">
                <a href="#contratos">Contratos</a>
            </nav>
        </header>

        <h1>Bienevenido/a ${usuario.tipo} ${usuario.clave}</h1>
        <c:choose>
            <c:when test="${empty contratosVigilante}">
                <h2>No posee contratos</h2>
            </c:when>
            <c:otherwise>
                <table id="contratos">
                    <CAPTION ALIGN=top>Mis Contratos</CAPTION>
                    <tr>
                        <th>Contrato</th>
                        <th>Fecha</th>
                        <th>Sucursal</th>
                        <th>Vigilante</th>
                        <th>Dias Contratados</th>
                        <th>Armado</th>
                        <th>Estado</th>
                    </tr>
                    <c:forEach var="contrato" items="${contratosVigilante}">
                        <tr>
                            <td>${contrato.codigo_contrato}</td>
                            <td>${contrato.fecha_contratacion}</td>
                            <td>${contrato.codigo_suc.domicilio}</td>
                            <td>${contrato.codigo_vig.clave}</td>
                            <td>${contrato.dias_contratados}</td>
                            <td>${contrato.armado==true? 'Si':'No'} </td>
                            <td>${contrato.estado==true? 'Vigente':'Caduco'}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>
