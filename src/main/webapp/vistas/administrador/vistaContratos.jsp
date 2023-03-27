<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%@page
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
    <title>CDB - Contratos</title>
  </head>
  <body>
    <h1 class="text-center my-2">Contratos</h1>
    <c:choose>
        <c:when test="${verificacionConBaja=='OK'}">
          <div class="alert alert-success text-center">
            <h3>Baja de Sucursal realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionConBaja=='Contrato inexistente'}">
          <div class="alert alert-danger text-center">
            <h3>${verificacionConBaja}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
        <c:when test="${verificacionConMod=='OK'}">
          <div class="alert alert-success text-center">
            <h3>Modificacion de Contrato realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when
          test="${verificacionConMod=='Error al tratar de modficar la entidad'}"
        >
          <div class="alert alert-danger text-center">
            <h3>${verificacionConMod}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
        <c:when test="${verificacionConAlta=='OK'}">
          <div class="alert alert-success text-center m-1">
            <h3>Alta de contrato realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionConAlta==null}">
        </c:when>
        <c:otherwise>
          <div class="alert alert-danger text-center m-1">
            <h3>${verificacionConAlta}</h3>
          </div>
        </c:otherwise>
      </c:choose>
    <form action="/accionContrato" method="post">
      <div class="row my-2">
        <div class="col text-center fw-bolder">ACCIONES</div>
        <div class="col">
          <select name="accionCon" class="form-select" required>
            <c:forEach var="contrato" items="${contratos}">
              <option value="${contrato.codigo_contrato}">${contrato.codigo_suc.codigo_ent.nombre_ent} ${contrato.codigo_suc.codigo_suc} - ${contrato.codigo_contrato}</option>
            </c:forEach>
          </select>
        </div>
        <div class="col d-flex justify-content-center">
          <button name="accion" class="btn btn-danger mx-1" value="Baja">
            Eliminar
          </button>

          <button
            name="accion"
            class="btn btn-secondary mx-1"
            value="Modificar"
          >
            Modificar
          </button>
        </div>
      </div>
    </form>
    <hr />
    <h3 class="text-center my-2">Formulario</h3>
    <form action="/altaContrato" method="post">
      <div className="container d-grid w-50">
        <div class="row form-floating m-3">
          <div class="col">
            <h7 class="form-label">Sucursal</h7>

            <select name="codigo_suc_con" class="form-select" required>
              <c:forEach var="sucursal" items="${sucursales}">
                <option value="${sucursal.codigo_suc}">
                  ${sucursal.codigo_ent.nombre_ent} - ${sucursal.codigo_suc}
                </option>
              </c:forEach>
            </select>
            
          </div>
        </div>
        <div class="row form-floating m-3">
          <div class="col">
            <h7 class="form-label">Vigilante</h7>

            <select name="codigo_vig_con" class="form-select" required>
              <c:forEach var="vigilante" items="${vigilantes}">
                  <option value="${vigilante.usuario_id}">${vigilante.clave}</option>
              </c:forEach>
          </select>

          </div>
        </div>

        <div class="row form-floating m-3">
          <input
            type="date"
            name="fecha_contrato"
            class="form-control"
            placeholder="Fecha del contrato"
            required
          />
          <label htmlFor="fecha_cont_suc">
            Fecha del contrato
          </label>
        </div>
        <div class="row form-floating m-3">
          <input
            type="number"
            name="dias_contrato"
            class="form-control"
            placeholder="Duración de contrato (días)"
            required
          />
          <label htmlFor="dias_cont_suc">
            Duración de contrato (días)
          </label>
          
        </div>
        <div class="row m-3">
          <label>
            Armado
            <input
            type="checkbox"
            name="armado"
            class="mx-2"
            placeholder="Armado"
          />
          </label>
          
        </div>
        <div class="row text-center">
          <div class="col">
            <input
              type="submit"
              name="altaCon"
              value="Crear"
              class="btn btn-primary mt-3"
            />
          </div>
        </div>
      </div>
    </form>
  </body>
</html>
