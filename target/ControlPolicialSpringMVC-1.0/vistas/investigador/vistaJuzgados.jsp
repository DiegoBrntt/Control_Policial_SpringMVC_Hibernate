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
    <table id="juezgados" class="table table-responsive border-dark">
      <legend class="text-center m-0">Juzgados</legend>
      <thead>
          <tr class="row text-center bg-info">
            <th class="col">Número de Juzgado</th>
            <th class="col">Jueces</th>
          </tr>
      </thead>
      <tbody>
        <c:forEach var="juzgado" items="${juzgados}">
          <tr class="row">
              <td class="col">${juzgado.numero_juzgado}</td>
              <td class="col">
                  <c:forEach var="juez" items="${juzgado.jueces}">
                      ${juez.nombre_ape} <br/>
                  </c:forEach>
              </td>
          </tr>
      </c:forEach>
      </tbody>
  </table>
  </body>
</html>
