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
    <title>CDB - Entidades</title>
  </head>
  <body>
    <form action="/altaEntidad" method="post">
      <h3 class="text-center my-2">Entidades</h3>
      <c:choose>
        <c:when test="${verificacionEntBaja=='OK'}">
          <div class="alert alert-success text-center">
            <h3>Baja de Entidad realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionEntBaja=='Entidad inexistente'}">
          <div class="alert alert-danger text-center">
            <h3>${verificacionEntBaja}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
        <c:when test="${verificacionEntMod=='OK'}">
          <div class="alert alert-success text-center">
           <h3>Modificacion de Entidad realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionEntMod=='Error al tratar de modficar la entidad'}">
          <div class="alert alert-danger text-center">
            <h3>${verificacionEntMod}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
            <c:when test="${verificacionEntAlta=='OK'}">
              <div class="alert alert-success text-center m-1">
                <h3>Alta de Entidad realizada correctamente.</h3>
              </div>
            </c:when>
            <c:when test="${verificacionEntAlta=='Entidad ya existente'}">
              <div class="alert alert-danger text-center m-1">
                <h3>${verificacionEntAlta}</h3>
              </div>
            </c:when>
          </c:choose>
      <div className="container d-grid w-50">
        <div class="row form-floating m-3">
          <input
            type="text"
            name="nombreEnt"
            class="form-control"
            placeholder="Nombre de entidad"
            required
          />

          <label htmlFor="nombreEnt">
            <i class="bi bi-person-circle"></i> Nombre de entidad
          </label>
        </div>

        <div class="row form-floating m-3">
          <input
            type="text"
            name="central"
            class="form-control"
            placeholder="Domicilio central"

            required
          />
          <label htmlFor="central">
            <i class="bi bi-lock"></i> Domicilio central
          </label>
        </div>
        <div class="row text-center">
          <div class="col">
            <input
              type="submit"
              name="altaEnt"
              value="Crear entidad"
              class="btn btn-primary mt-3"
            />
          </div>
        </div>
      </div>
    </form>
    <hr />
    <form action="/accionEntidad" method="post">
      <div class="row my-2">
        <div class="col text-center fw-bolder">
          ACCIONES
        </div>
        <div class="col">
          <select name="accionEnt" class="form-select" required>
            <c:forEach var="ent" items="${entidades}">
              <option value="${ent.entidad_id}">${ent.nombre_ent}</option>
            </c:forEach>
          </select>
        </div>
        <div class="col d-flex justify-content-center">
          <button name="accion" class="btn btn-danger mx-1" value="Baja">Baja entidad</button>
          
          <button name="accion" class="btn btn-secondary mx-1" value="Modificacion">
            Modificar entidad
          </button>
        </div>
      </div>
    </form>
      
  </body>
</html>
