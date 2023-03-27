<%-- Document : vistaResultado Created on : 2 nov. 2021, 23:26:49 Author :
Grandalf --%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="resources/css/estilos.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"
    />
    <title>JSP Page</title>
  </head>
  <body>
      <table id="delitos" class="table table-responsive border-dark text-center">
        <legend class="text-center m-0">Casos</legend>
        <thead>
          <tr class="row">
            <th class="col">Codigo Caso</th>
                        <th class="col">Fecha del caso</th>
                        <th class="col">Numero de Juzgado</th>
                        <th class="col">Codigo de Sucursal</th>
                        <th class="col">Condenados</th>
                        <th class="col">Condenado</th>
                        <th class="col">Tiempo de Condena</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="delito" items="${casos}" varStatus="loop">
                        <tr class="row">
                            <td class="col">${delito.codigo_caso}</td>
                            <td class="col">${delito.fecha_caso}</td>
                            <td class="col">${delito.juez_id.nombre_ape}</td>
                            <td class="col">${delito.codigo_suc.domicilio}</td>
                            <td class="col">
                                
                                <c:forEach var="condenado" items="${delito.condenados}" varStatus="loop2">
                                    ${1+loop2.index}-${condenado.codigo_det.nombre_ape}<br/>
                                </c:forEach>
                            </td>
                            <td class="col">${delito.condena==1? 'Si':'No'} </td>
                            <td class="col">${delito.condena==1? delito.tiempo_condena :'Sin condena'}</td>
                        </tr>
                    </c:forEach>
        </tbody>
      </table>
  </body>
</html>
