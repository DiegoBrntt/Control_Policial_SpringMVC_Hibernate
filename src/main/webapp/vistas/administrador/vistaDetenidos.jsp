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
    <form action="/altaDetenido" method="post">
      <c:choose>
        <c:when test="${verificacionDetBaja=='OK'}">
          <div class="alert alert-success text-center">
            <h3>Baja de Detenido realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionDetBaja=='Detenido inexistente'}">
          <div class="alert alert-danger text-center">
            <h3>${verificacionDetBaja}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
        <c:when test="${verificacionDetMod=='OK'}">
          <div class="alert alert-success text-center">
           <h3>Modificacion de Banda realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionBanMod=='Error al modificar detenido.'}">
          <div class="alert alert-danger text-center">
            <h3>${verificacionDetMod}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
            <c:when test="${verificacionDetAlta=='OK'}">
              <div class="alert alert-success text-center m-1">
                <h3>Alta de Detenido realizada correctamente.</h3>
              </div>
            </c:when>
            <c:when test="${verificacionDetAlta=='Detenido existente'}">
              <div class="alert alert-danger text-center m-1">
                <h3>${verificacionDetAlta}</h3>
              </div>
            </c:when>
          </c:choose>
      <div className="container d-grid w-50">
        <div class="row form-floating m-3">
          <input
            type="text"
            name="nombre_ape_det"
            class="form-control"
            placeholder="Nombre de banda"
            required
          />

          <label htmlFor="nombre_ape_det">
            <i class="bi bi-person-circle"></i> Nombre completo del detenido
          </label>
        </div>
        <div class="row form-floating m-3">
          <h7 class="form-label">Banda</h7>
          <select name="codigo_banda" class="form-select" required>
            <c:forEach var="banda" items="${bandas}">
                <option value="${banda.banda_id}">${banda.nombre_banda}</option>
            </c:forEach>
        </select>
        </div>
        <div class="row text-center">
          <div class="col">
            <input
              type="submit"
              name="altaDet"
              value="Crear"
              class="btn btn-primary mt-3"
            />
          </div>
        </div>
      </div>
    </form>
    <hr />
    <form action="/accionDetenido" method="post">
      <div class="row my-2">
        <div class="col text-center fw-bolder">
          ACCIONES
        </div>
        <div class="col">
          <select name="accionDetenido" class="form-select" required>
            <c:forEach var="detenido" items="${detenidos}">
                <option value="${detenido.codigo_det}">${detenido.codigo_banda.nombre_banda} - ${detenido.nombre_ape}</option>
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
