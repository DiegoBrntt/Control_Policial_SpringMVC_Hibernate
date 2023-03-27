<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>CDB - Bandas</title>
  </head>
  <body>
    <form action="/altaJuez" method="post">
      <c:choose>
        <c:when test="${verificacionJuezBaja=='OK'}">
          <div class="alert alert-success text-center">
            <h3>Baja de Juez realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionJuezBaja=='Juez inexistente'}">
          <div class="alert alert-danger text-center">
            <h3>${verificacionJuezBaja}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
        <c:when test="${verificacionJuezMod=='OK'}">
          <div class="alert alert-success text-center">
           <h3>Modificacion de Juez realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionJuezMod=='Error al modificar juzgado.'}">
          <div class="alert alert-danger text-center">
            <h3>${verificacionJuezMod}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
            <c:when test="${verificacionJuezAlta=='OK'}">
              <div class="alert alert-success text-center m-1">
                <h3>Alta de Juez realizada correctamente.</h3>
              </div>
            </c:when>
            <c:when test="${verificacionJuezAlta=='Banda existente'}">
              <div class="alert alert-danger text-center m-1">
                <h3>${verificacionJuezAlta}</h3>
              </div>
            </c:when>
      </c:choose>
      <div className="container d-grid w-50">
        <div class="row form-floating m-3"> 
          <h7 class="form-label">Juzgado N°</h7>
          <select name="numero_juzgado_juez" required>
            <c:forEach var="juzgado" items="${juzgados}">
                <option value="${juzgado.juzgado_id}">${juzgado.numero_juzgado}</option>
            </c:forEach>
        </select>
        </div>
        <div class="row form-floating m-3">
          <input
            type="text"
            name="nombre_ape_juez"
            class="form-control"
            placeholder="Nombre del juez"
            required
          />

          <label htmlFor="nombre_ape_juez">
            <i class="bi bi-person-circle"></i> Nombre del juez
          </label>
        </div>
        <div class="row form-floating m-3">
          <input
            type="number"
            name="tiempo_servicio"
            class="form-control"
            placeholder="Años de servicio"
            required
          />

          <label htmlFor="tiempo_servicio">
            Años de servicio
          </label>
        </div>
        <div class="row text-center">
          <div class="col">
            <input
              type="submit"
              name="altaJuez"
              value="Crear"
              class="btn btn-primary mt-3"
            />
          </div>
        </div>
      </div>
    </form>
    <hr />
    <form action="/accionJuez" method="post">
      <div class="row my-2">
        <div class="col text-center fw-bolder">
          ACCIONES
        </div>
        <div class="col">
          <select name="accionJuez" class="form-select" required>
            <c:forEach var="juez" items="${jueces}">
              <option value="${juez.juez_id}">${juez.numero_juzgado.numero_juzgado} ${juez.nombre_ape}</option>
            </c:forEach>
          </select>
        </div>
        <div class="col d-flex justify-content-center">
          <button name="accion" class="btn btn-danger mx-1" value="Baja">Eliminar</button>
          
          <button name="accion" class="btn btn-secondary mx-1" value="Modificar">
            Modificar
          </button>
        </div>
      </div>
    </form>
      
  </body>
</html>
