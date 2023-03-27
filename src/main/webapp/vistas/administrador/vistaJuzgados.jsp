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
    <form action="/altaJuzgado" method="post">
      <c:choose>
        <c:when test="${verificacionJuzBaja=='OK'}">
          <div class="alert alert-success text-center">
            <h3>Baja de Banda realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionJuzBaja=='Juzgado inexistente'}">
          <div class="alert alert-danger text-center">
            <h3>${verificacionJuzBaja}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
        <c:when test="${verificacionJuzMod=='OK'}">
          <div class="alert alert-success text-center">
           <h3>Modificacion de Juzgado realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionJuzMod=='Error al modificar juzgado.'}">
          <div class="alert alert-danger text-center">
            <h3>${verificacionJuzMod}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
            <c:when test="${verificacionJuzAlta=='OK'}">
              <div class="alert alert-success text-center m-1">
                <h3>Alta de Juzgado realizada correctamente.</h3>
              </div>
            </c:when>
            <c:when test="${verificacionJuzAlta=='Banda existente'}">
              <div class="alert alert-danger text-center m-1">
                <h3>${verificacionJuzAlta}</h3>
              </div>
            </c:when>
          </c:choose>
      <div className="container d-grid w-50">
        <div class="row form-floating m-3">
          <input
            type="number"
            name="numero_juzgado"
            class="form-control"
            placeholder="N° juzgado"
            required
          />

          <label htmlFor="numero_juzgado">
            <i class="bi bi-person-circle"></i> N° Juzgado
          </label>
        </div>
        <div class="row text-center">
          <div class="col">
            <input
              type="submit"
              name="altaJuz"
              value="Crear"
              class="btn btn-primary mt-3"
            />
          </div>
        </div>
      </div>
    </form>
    <hr />
    <form action="/accionJuzgado" method="post">
      <div class="row my-2">
        <div class="col text-center fw-bolder">
          ACCIONES
        </div>
        <div class="col">
          <select name="accionJuzgado" class="form-select" required>
            <c:forEach var="juzgado" items="${juzgados}">
              <option value="${juzgado.juzgado_id}">${juzgado.numero_juzgado}</option>
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
