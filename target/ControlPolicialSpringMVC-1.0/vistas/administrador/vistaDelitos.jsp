<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
    <form action="/altaCaso" method="post">
      <h1 class="text-center">Casos</h1>
      <c:choose>
        <c:when test="${verificacionCasoBaja=='OK'}">
          <div class="alert alert-success text-center">
            <h3>Baja de Caso realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionCasoBaja=='Caso inexistente'}">
          <div class="alert alert-danger text-center">
            <h3>${verificacionCasoBaja}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
        <c:when test="${verificacionCasoMod=='OK'}">
          <div class="alert alert-success text-center">
           <h3>Modificacion de Caso realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionCasoMod=='Error al modificar banda.'}">
          <div class="alert alert-danger text-center">
            <h3>${verificacionCasoMod}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
            <c:when test="${verificacionCasoAlta=='OK'}">
              <div class="alert alert-success text-center m-1">
                <h3>Alta de Caso realizada correctamente.</h3>
              </div>
            </c:when>
            <c:when test="${verificacionCasoAlta=='Caso existente'}">
              <div class="alert alert-danger text-center m-1">
                <h3>${verificacionCasoAlta}</h3>
              </div>
            </c:when>
          </c:choose>
      <div className="container d-grid w-50">
        <div class="row form-floating m-3">

          <h7 class="form-label fw-bolder">
            Sucursal
          </h7>
          <select name="codigo_suc_caso" class="form-select" required>
            <c:forEach var="sucursal" items="${sucursales}">
                <option value="${sucursal.codigo_suc}">${sucursal.codigo_suc}</option>
            </c:forEach>
          </select>
        </div>
        <div class="row form-floating m-3">

          <h7 class="form-label fw-bolder">
            Juez
          </h7>
          <select name="juez_encargado" class="form-select" required>
            <c:forEach var="juez" items="${jueces}">
              <option value="${juez.juez_id}">${juez.nombre_ape}</option>
            </c:forEach>
          </select>
        </div>
        <div class="row form-floating m-3">
          <input
            type="date"
            name="fecha_caso"
            class="form-control"
            placeholder="Fecha del hecho"
            required
          />

          <label htmlFor="fecha_caso">
            Fecha del hecho
          </label>
        </div>
        <div class="row form-floating m-3">
          <input
            type="number"
            name="tiempo_condena"
            class="form-control"
            placeholder="Meses de condena"
            required
          />

          <label htmlFor="tiempo_condena">
            Meses de condena
          </label>
        </div>
        <c:choose>
            <c:when test="${empty detenidos}">
                <h2>No posee contratos</h2>
            </c:when>
            <c:otherwise>
              <div class="table table-responsive">
                <table class="table">
                  <thead>
                    <tr class="row">
                      <th class="col fw-bolder text-center">Implicado</th>
                      <th class="col fw-bolder text-center">Banda</th>
                      <th class="col fw-bolder text-center">Clave</th>
                      <th class="col fw-bolder text-center">Nombre y apellido</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="detenido" items="${detenidos}">
                      <tr class="row">
                          <td class="col"><input type="checkbox" name="condenados" value="${detenido.codigo_det}"></td>
                          <td class="col">${detenido.codigo_banda.nombre_banda}</td>
                          <td class="col">${detenido.codigo_det}</td>
                          <td class="col">${detenido.nombre_ape}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                  
              </table> 
              </div>
                
            </c:otherwise>
        </c:choose>
        <div class="row form-floating m-3">
          <h7 class="fw-bolder">Condena</h7>
          <input
            type="checkbox"
            name="condena"
            value="1"
            placeholder="Condena"
            required
          />
        </div>
        <div class="row text-center">
          <div class="col">
            <input
              type="submit"
              name="altaCaso"
              value="Crear"
              class="btn btn-primary mt-3"
            />
          </div>
        </div>
      </div>
    </form>
    <hr />
    <form action="/accionCaso" method="post">
      <div class="row my-2">
        <div class="col text-center fw-bolder">
          ACCIONES
        </div>
        <div class="col">
          <select name="accionCaso" class="form-select" required>
            <c:forEach var="caso" items="${casos}">
              <option value="${caso.codigo_caso}">${caso.codigo_caso}</option>
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
