<%-- 
    Document   : vistaModificacion
    Created on : 12 nov. 2021, 15:28:05
    Author     : Grandalf
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <a href="index.jsp" >Cerrar Sesion</a>
                <a href="#entidades">Entidades</a>
                <a href="#sucursales">Sucursales</a>
                <a href="#contratos">Contratos</a>
                <a href="#detenidos">Detenidos</a>
                <a href="#jueces">Jueces</a>
                <a href="#delitos">Casos/Delitos</a>
            </nav>
        </header>

        <h1>Bienevenido/a ${usuario.tipo} ${usuario.clave}</h1>
        <c:choose>
            <c:when test="${not empty usuarioMod}">
                <form action="/modificarUsuario" method="post">
                    <div class="divTable4">
                        <div class="captionD" id="entidades">
                            <h3>Usuarios</h3>
                        </div>    
                        <div class="divTableBody">
                            <div class="divTableRow">
                                <div class="divTableCell">
                                    <h3>Nombre de Usuario :</h3>
                                </div>
                                <div class="divTableCell">
                                    <h3><input type="text" name="nombreUsu" value="${usuarioMod.clave}" required></h3>
                                </div>
                                <div class="divTableCell">
                                    <h3>Contraseña Usuario</h3>
                                </div>
                                <div class="divTableCell">
                                    <input type="text" name="passUsu" value="${usuarioMod.pass}" required>
                                </div>
                                <div class="divTableCell">
                                    <h3>Edad</h3>
                                </div>
                                <div class="divTableCell">
                                    <input type="number" name="edadUsu" value="${usuarioMod.edad}" required>
                                </div>
                                <div class="divTableCell">
                                    <h3>Tipo</h3>
                                </div>
                                <div class="divTableCell">
                                    <select name="tipoUsu" required>
                                        <option value="Administrador" ${usuarioMod.tipo=='Administrador'?'Selected':''}>Administrador</option>
                                        <option value="Investigador" ${usuarioMod.tipo=='Investigador'?'Selected':''}>Investigador</option>
                                        <option value="Vigilante" ${usuarioMod.tipo=='Vigilante'?'Selected':''}>Vigilante</option>
                                    </select>
                                </div>
                                <div class="divTableCell">
                                    <input type="hidden" name="nombreUsuMod" value="${usuarioMod.usuario_id}">
                                    <button name="modUsu">Modificar Usuario</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </c:when>
            <c:when test="${not empty entidad}">
                <form action="/modificarEntidad" method="post">
                    <div class="divTable4">
                        <div class="captionD" id="entidades">
                            <h3>Entidades</h3>
                        </div>    
                        <div class="divTableBody">
                            <div class="divTableRow">
                                <div class="divTableCell2">
                                    <h3>Nombre de Entidad</h3>
                                </div>
                                <div class="divTableCell2">
                                    <input type="text" name="nombre_ent" value="${entidad.nombre_ent}" required>
                                </div>
                                <div class="divTableCell2">
                                    <div class="divTableCell2">
                                        <h3>Domicilio Central</h3>
                                    </div>
                                    <div class="divTableCell2">
                                        <input type="hidden" name="entidad_id" value="${entidad.entidad_id}">
                                        <input type="text" name="domicilio" value="${entidad.domicilio}" required>
                                    </div>
                                    <div class="divTableCell2">
                                        <button name="modificarEnt">Modificar entidad</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </c:when>
            <c:when test="${not empty sucursal}">
                <form action="/modificarSucursal" method="post">
                    <div class="divTable4">
                        <div class="captionD" id="sucursales">
                            <h3>Sucursales</h3>
                        </div>    
                        <div class="divTableBody">
                            <div class="divTableRow">
                                <div class="divTableCell2">
                                    <h3>Codigo de Entidad</h3>
                                </div>
                                <div class="divTableCell2">
                                    <select name="codigo_ent_suc">
                                        <c:forEach var="entidad" items="${entidades}">
                                            <option value="${entidad.entidad_id}" ${entidad.entidad_id == sucursal.codigo_ent.entidad_id?"selected":""}>${entidad.nombre_ent}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="divTableCell2">
                                    <h3>Domicilio Sucursal</h3>
                                </div>
                                <div class="divTableCell2">
                                    <input type="text" name="domicilio_suc" value="${sucursal.domicilio}" required>
                                </div>
                            </div>
                            <div class="divTableRow">
                                <div class="divTableCell2">
                                    <h3>Fecha de contratación</h3>
                                </div>
                                <div class="divTableCell2">
                                    <input type="date" name="fecha_cont_suc" value="${sucursal.fecha_contratacion}" required>
                                </div>
                                <div class="divTableCell2">
                                    <h3>Frecuencia de contratacion (en dias)</h3>
                                </div>
                                <div class="divTableCell2">
                                    <input type="number" name="dias_cont_suc" value="${sucursal.frecuencia_contratacion}" required>
                                </div>
                                <div class="divTableCell2">
                                    <h3>cantidad de empleados</h3>
                                </div>
                                <div class="divTableCell2">
                                    <input type="number" name="empleados" value="${sucursal.empleados}" required>
                                </div>
                                <div class="divTableCell2">
                                    <input type="hidden" name="codSuc" value="${sucursal.codigo_suc}">
                                    <button name="modSuc">Modificar sucursal</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </c:when>
            <c:when test="${not empty contrato}">
                <form action="/modificarContrato" method="post">
                    <div class="divTable4">
                        <div class="captionD" id="contratos">
                            <h3>Contratos</h3>
                        </div>    
                        <div class="divTableBody">
                            <div class="divTableRow">
                                <div class="divTableCell2">
                                    <h3>Sucursal</h3>
                                </div>
                                <div class="divTableCell2">
                                    <select name="codigo_suc_con">
                                        <c:forEach var="sucursal" items="${sucursales}">
                                            <option value="${sucursal.codigo_suc}" ${contrato.codigo_suc.codigo_suc == sucursal.codigo_suc?"selected":""}>${sucursal.codigo_ent.nombre_ent} ${sucursal.codigo_suc}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="divTableCell2">
                                    <h3>Codigo de Vigilante</h3>
                                </div>
                                <div class="divTableCell2">
                                    <select name="codigo_vig_con">
                                        <c:forEach var="vigilante" items="${vigilantes}">
                                            <option value="${vigilante.usuario_id}" ${contrato.codigo_vig.usuario_id == vigilante.usuario_id?"selected":""}>${vigilante.clave}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="divTableRow">
                                <div class="divTableCell2">
                                    <h3>Fecha del contrato</h3>
                                </div>
                                <div class="divTableCell2">
                                    <input type="date" name="fecha_contrato" value="${contrato.fecha_contratacion}">
                                </div>
                                <div class="divTableCell2">
                                    <h3>Cantidad de dias contratado</h3>
                                </div>
                                <div class="divTableCell2">
                                    <input type="number" name="dias_contrato" value="${contrato.dias_contratados}">
                                </div>
                                <div class="divTableCell2">
                                    <h3>Posesión de arma</h3>
                                </div>
                                <div class="divTableCell2">
                                    <input type="checkbox" value="${contrato.armado==true?1:0}" name="armado" ${contrato.armado==true?'checked':''}>
                                </div>
                                <div class="divTableCell2">
                                    <input type="hidden" value="${contrato.codigo_contrato}" name="codigoConMod">
                                    <button name="modificarCon">Modificar contrato</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </c:when>
            <c:when test="${not empty banda}">
                <form action="/modificarBanda" method="post">
                    <div class="divTable4">
                        <div class="captionD" id="bandas">
                            <h3>Banda</h3>
                        </div>    
                        <div class="divTableBody">
                            <div class="divTableRow">
                                <div class="divTableCell2">
                                    <h3>Nombre de Banda</h3>
                                </div>
                                <div class="divTableCell2">
                                    <input type="text" name="nombre_banda" value="${banda.nombre_banda}" required>
                                </div>
                                <div class="divTableCell2">
                                    <input type="hidden" name="codigoBanMod" value="${banda.banda_id}">
                                    <button name="accion" value="Modificar banda">Modificar banda</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </c:when>
            <c:when test="${not empty detenido}">
                <form action="/modificarDetenido" method="post">
                    <div class="divTable4">
                        <div class="captionD" id="detenidos">
                            <h3>Detenidos</h3>
                        </div>    
                        <div class="divTableBody">
                            <div class="divTableRow">
                                <div class="divTableCell2">
                                    <h3>Codigo de Banda</h3>
                                </div>
                                <div class="divTableCell2">
                                        <select name="codigo_banda" required>
                                            <c:forEach var="banda" items="${bandas}">
                                                <option value="${banda.banda_id}" ${banda.banda_id==detenido.codigo_banda.banda_id?'Selected':''} >${banda.nombre_banda}</option>
                                            </c:forEach>
                                        </select>
                                </div>
                                <div class="divTableCell2">
                                    <h3>Nombre y apellido del integrante</h3>
                                </div>
                                <div class="divTableCell2">
                                    <input type="text" name="nombre_ape_det" value="${detenido.nombre_ape}" required>
                                </div>
                                <div class="divTableCell2">
                                    <input type="hidden" name="codigoDetMod" value="${detenido.codigo_det}">
                                    <button name="accion" value="Modificar detenido">Modificar detenido</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </c:when>
            <c:when test="${not empty juzgado}">
                <form action="/modificarJuzgado" method="post">
                    <div class="divTable4">
                        <div class="captionD" id="jueces">
                            <h3>Juzgado</h3>
                        </div>    
                        <div class="divTableBody">
                            <div class="divTableRow">
                                <div class="divTableCell">
                                    <h3>Número de juzgado</h3>
                                </div>
                                <div class="divTableCell">
                                    <input type="number" name="numero_juzgado" value="${juzgado.numero_juzgado}" required>
                                </div>
                                <input type="hidden" name="numeroJuzMod" value="${juzgado.juzgado_id}">
                                <button name="accion" value="Modificar juzgado">Modificar Juzgado</button>
                            </div>
                        </div>
                    </div>
                </form>
            </c:when>
            <c:when test="${not empty juez}">
                <form action="/modificarJuez" method="post">
                    <div class="divTable4">
                        <div class="captionD" id="jueces">
                            <h3>Jueces / Juzgado</h3>
                        </div>    
                        <div class="divTableBody">
                            <div class="divTableRow">
                                <div class="divTableCell">
                                    <h3>Número de juzgado</h3>
                                </div>
                                <div class="divTableCell">
                                    <select name="numero_juzgado_juez" required>
                                <c:forEach var="juzgado" items="${juzgados}">
                                    <option value="${juzgado.juzgado_id}" ${juzgado.juzgado_id == juez.numero_juzgado.juzgado_id?'selected':''}>${juzgado.numero_juzgado}</option>
                                </c:forEach>
                            </select>
                                </div>
                                <div class="divTableCell">
                                    <h3>Nombre y apellido del juez</h3>
                                </div>
                                <div class="divTableCell">
                                    <input type="text" name="nombre_ape_juez" value="${juez.nombre_ape}" required>
                                </div>
                                <div class="divTableCell">
                                    <h3>Años de servicio</h3>
                                </div>
                                <div class="divTableCell">
                                    <input type="number" name="tiempo_servicio" value="${juez.años_serv}" required>
                                </div>
                                <div class="divTableCell">
                                    <input type="hidden" name="juez_id" value="${juez.juez_id}">
                                    <button name="accion" value="Modificar juez">Modificar Juez</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </c:when>
            <c:when test="${not empty caso}">
                <form action="/modificarCaso" method="post">
                    <div class="divTable4">
                        <div class="captionD" id="casos">
                            <h3>Casos/Delitos</h3>
                        </div>    
                        <div class="divTableBody">
                            <div class="divTableRow">
                                <div class="divTableCell">
                                    <h3>Codigo de Sucursal</h3>
                                </div>
                                <div class="divTableCell">
                                    <select name="codigo_suc_caso">
                                        <c:forEach var="sucursal" items="${sucursales}">
                                            <option value="${sucursal.codigo_suc}" ${caso.codigo_suc.codigo_suc == sucursal.codigo_suc?"selected":""}>${sucursal.codigo_suc}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="divTableCell">
                                    <h3>Juez encargado</h3>
                                </div>
                                <div class="divTableCell">
                                    <select name="juez_encargado">
                                        <c:forEach var="juez" items="${jueces}">
                                            <option value="${juez.juez_id}" ${caso.juez_id.juez_id == juez.juez_id?"selected":""}>J ${juez.numero_juzgado.numero_juzgado} ${juez.nombre_ape}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="divTableRow">
                                <div class="divTableCell">
                                    <h3>Fecha del hecho</h3>
                                </div>
                                <div class="divTableCell">
                                    <input type="date" name="fecha_caso" value="${caso.fecha_caso}" required>
                                </div>
                                <div class="divTableCell">
                                    <h3>Condena</h3>
                                </div>
                                <div class="divTableCell">
                                    <input type="checkbox" name="condena" ${caso.condena==1?'checked':''} value="1">
                                </div>
                                <div class="divTableCell">
                                    <h3>Meses de condena</h3>
                                </div>
                                <div class="divTableCell">
                                    <input type="number" name="tiempo_condena" value="${caso.tiempo_condena}" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="divTable4">
                        <div class="divTableBody">
                            <div class="divTableRow">
                                <div class="divTableCell">
                                    <c:forEach var="condenado" items="${caso.condenados}">
                                        ${condenado.codigo_det.nombre_ape}
                                    </c:forEach>
                                    <c:choose>
                                        <c:when test="${empty detenidos}">
                                            <h2>No posee contratos</h2>
                                        </c:when>
                                        <c:otherwise>
                                            <table id="implicados">
                                                <CAPTION ALIGN=top>Implicados</CAPTION>
                                                <tr>
                                                    <th>Implicado</th>
                                                    <th>Nombre de banda</th>
                                                    <th>Clave del detenido</th>
                                                    <th>Nombre y apellido</th>
                                                </tr>
                                                <c:forEach var="detenido" items="${detenidos}">
                                                    <tr>
                                                        <td>
                                                            <input type="checkbox" name="condenados" value="${detenido.codigo_det}">
                                                        </td>
                                                        <td>${detenido.codigo_banda.nombre_banda}</td>
                                                        <td>${detenido.codigo_det}</td>
                                                        <td>${detenido.nombre_ape}</td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="divTableCell">
                                    <input type="hidden" name="codigo_caso_mod" value="${caso.codigo_caso}">
                                    <button name="modCaso">Modificar caso</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </c:when>
        </c:choose>
    </body>
</html>