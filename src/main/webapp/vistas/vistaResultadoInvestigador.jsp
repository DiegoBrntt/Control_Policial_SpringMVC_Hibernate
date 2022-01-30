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
                
                <a href="#entidades">Entidades</a>
                <a href="#sucursales">Sucursales</a>
                <a href="#contratos">Contratos</a>
                <a href="#detenidos">Detenidos</a>
                <a href="#jueces">Jueces</a>
                <a href="#delitos">Casos/Delitos</a>
                </form>
            </nav>
        </header>

        <h1>Bienevenido/a ${usuario.tipo} ${usuario.clave}</h1>

        <c:choose>
            <c:when test="${empty entidades}">
                <h2>No hay entidades cargadas.</h2>
            </c:when>
            <c:otherwise>
                <table id="entidades">
                    <CAPTION ALIGN=top>Entidades</CAPTION>
                    <tr>
                        <th>Codigo Entidad</th>
                        <th>Domicilio Central</th>
                        <th>Cantidades de Sucursales</th>
                    </tr>
                    <c:forEach var="entidad" items="${entidades}" varStatus="loop">
                        <tr>
                            <td>${entidad.nombre_ent}</td>
                            <td>${entidad.domicilio}</td>
                            <td>${fn:length(entidad.sucursales)}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
        <br>
        <c:choose>
            <c:when test="${empty sucursales}">
                <h2>No hay sucursales cargadas.</h2>
            </c:when>
            <c:otherwise>
                <table id="Sucursales">
                    <CAPTION ALIGN=top>Sucursales</CAPTION>
                    <tr>
                        <th>Codigo Entidad</th>
                        <th>Codigo Sucursal</th>
                        <th>Domicilio Central</th>
                        <th>Cantidad de empleados</th>
                    </tr>
                    <c:forEach var="sucursal" items="${sucursales}">
                        <tr>
                            <td>${sucursal.codigo_ent.nombre_ent}</td>
                            <td>${sucursal.codigo_suc}</td>
                            <td>${sucursal.domicilio}</td>
                            <td>${sucursal.empleados}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
        <br>
        <c:choose>
            <c:when test="${empty contratos}">
                <h2>No posee contratos</h2>
            </c:when>
            <c:otherwise>
                <table id="contratos">
                    <CAPTION ALIGN=top>Contratos</CAPTION>
                    <tr>
                        <th>Contrato</th>
                        <th>Fecha</th>
                        <th>Sucursal</th>
                        <th>Vigilante</th>
                        <th>Dias Contratados</th>
                        <th>Armado</th>
                        <th>Estado</th>
                    </tr>
                    <c:forEach var="contrato" items="${contratos}">
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
        <br>
        <c:choose>
            <c:when test="${empty bandas}">
                <h2>No posee contratos</h2>
            </c:when>
            <c:otherwise>

                <table id="bandas">
                    <CAPTION ALIGN=top>Bandas</CAPTION>
                    <tr>
                        <th>Codigo de banda</th>
                        <th>Cantidad de integrantes</th>
                    </tr>
                    <c:forEach var="banda" items="${bandas}" varStatus="loop">
                        <tr>
                            <td>${banda.nombre_banda}</td>
                            <td>${fn:length(banda.integrantes)}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
        <br>
        <c:choose>
            <c:when test="${empty detenidos}">
                <h2>No posee contratos</h2>
            </c:when>
            <c:otherwise>

                <table id="detenidos">
                    <CAPTION ALIGN=top>Detenidos</CAPTION>
                    <tr>
                        <th>Nombre de la banda</th>
                        <th>Clave del detenido</th>
                        <th>Nombre y apellido</th>
                    </tr>
                    <c:forEach var="detenido" items="${detenidos}">
                        <tr>
                            <td>${detenido.codigo_banda.nombre_banda}</td>
                            <td>${detenido.codigo_det}</td>
                            <td>${detenido.nombre_ape}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
        <br>
        <c:choose>
            <c:when test="${empty juzgados}">
                <h2>No hay jueces cargados en la base de datos.</h2>
            </c:when>
            <c:otherwise>

                <table id="juzgados">
                    <CAPTION ALIGN=top>Jueces</CAPTION>
                    <tr>
                        <th>Número de Juzgado</th>
                        <th>Jueces</th>
                    </tr>
                    <c:forEach var="juzgado" items="${juzgados}">
                        <tr>
                            <td>${juzgado.numero_juzgado}</td>
                            <td>
                                <c:forEach var="juez" items="${juzgado.jueces}">
                                    ${juez.nombre_ape} <br>
                                </c:forEach>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
        <br>
        <c:choose>
            <c:when test="${empty jueces}">
                <h2>No hay jueces cargados en la base de datos.</h2>
            </c:when>
            <c:otherwise>

                <table id="jueces">
                    <CAPTION ALIGN=top>Jueces</CAPTION>
                    <tr>
                        <th>Número de Juzgado</th>
                        <th>Nombre y apellido</th>
                        <th>Años de servicio</th>
                    </tr>
                    <c:forEach var="juez" items="${jueces}">
                        <tr>
                            <td>${juez.numero_juzgado.numero_juzgado}</td>
                            <td>${juez.nombre_ape}</td>
                            <td>${juez.años_serv}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
        <br>
        <c:choose>
            <c:when test="${empty casos}">
                <h2>No hay entidades cargadas.</h2>
            </c:when>
            <c:otherwise>
                <table id="delitos">
                    <CAPTION ALIGN=top>Delitos</CAPTION>
                    <tr>
                        <th>Codigo Caso</th>
                        <th>Fecha del caso</th>
                        <th>Numero de Juzgado</th>
                        <th>Codigo de Sucursal</th>
                        <th>Condenados</th>
                        <th>Condenado</th>
                        <th>Tiempo de Condena</th>
                    </tr>
                    <c:forEach var="delito" items="${casos}" varStatus="loop">
                        <tr>
                            <td>${delito.codigo_caso}</td>
                            <td>${delito.fecha_caso}</td>
                            <td>${delito.juez_id.nombre_ape}</td>
                            <td>${delito.codigo_suc.domicilio}</td>
                            <td>
                                
                                <c:forEach var="condenado" items="${delito.condenados}" varStatus="loop2">
                                    ${1+loop2.index}-${condenado.codigo_det.nombre_ape}<br>
                                </c:forEach>
                            </td>
                            <td>${delito.condena==1? 'Si':'No'} </td>
                            <td>${delito.condena==1? delito.tiempo_condena :'Sin condena'}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
                
    </body>
</html>

