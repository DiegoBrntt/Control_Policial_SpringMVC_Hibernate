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
    <title>CDB - Sucursales</title>
  </head>
  <body>
    <h1 class="text-center my-2">Sucursales</h1>
    <form action="/accionSucursal" method="post">
      <div class="row my-2">
        <div class="col text-center fw-bolder">
          ACCIONES
        </div>
        <div class="col">
          <select name="accionSuc" class="form-select" required>
            <c:forEach var="sucursal" items="${sucursales}">
                <option value="${sucursal.codigo_suc}">${sucursal.codigo_ent.nombre_ent} - ${sucursal.codigo_suc}</option>
            </c:forEach>
          </select>
        </div>
        <div class="col d-flex justify-content-center">
          <button name="accion" class="btn btn-danger mx-1" value="Baja">Baja sucusal</button>
          
          <button name="accion" class="btn btn-secondary mx-1" value="Modificar">
            Modificar sucursal
          </button>
        </div>
      </div>
    </form>
    <hr />
    <h3 class="text-center my-2">Formulario</h3>
    <form action="/altaSucursal" method="post">
      <c:choose>
        <c:when test="${verificacionSucBaja=='OK'}">
          <div class="alert alert-success text-center">
            <h3>Baja de Sucursal realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionSucBaja=='Sucursal inexistente'}">
          <div class="alert alert-danger text-center">
            <h3>${verificacionSucBaja}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
        <c:when test="${verificacionSucMod=='OK'}">
          <div class="alert alert-success text-center">
           <h3>Modificacion de Sucursal realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionSucMod=='Error al tratar de modficar la entidad'}">
          <div class="alert alert-danger text-center">
            <h3>${verificacionSucMod}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
            <c:when test="${verificacionSucAlta=='OK'}">
              <div class="alert alert-success text-center m-1">
                <h3>Alta de sucursal realizada correctamente.</h3>
              </div>
            </c:when>
            <c:when test="${verificacionSucAlta=='Entidad ya existente'}">
              <div class="alert alert-danger text-center m-1">
                <h3>${verificacionSucAlta}</h3>
              </div>
            </c:when>
      </c:choose>
      <div className="container d-grid w-50">
        <div class="row form-floating m-3">
          <div class="col">
            <h7 class="form-label">Entidad</h7>

            <select name="codigo_ent_suc" class="form-select" required>
            
              <c:forEach var="entidad" items="${entidades}">
                  <option value="${entidad.entidad_id}">${entidad.nombre_ent}</option>
              </c:forEach>
            </select>
          </div>
          

          
        </div>

        <div class="row form-floating m-3">
          <input
            type="text"
            name="domicilio_suc"
            class="form-control"
            placeholder="Domicilio central"

            required
          />
          <label htmlFor="domicilio_suc">
            <i class="bi bi-lock"></i> Domicilio sucursal
          </label>
        </div>
        <div class="row form-floating m-3">
          <input
            type="date"
            name="fecha_cont_suc"
            class="form-control"
            placeholder="Fecha inicial de contratación"

            required
          />
          <label htmlFor="fecha_cont_suc">
            <i class="bi bi-lock"></i> Fecha inicial de contratación
          </label>
        </div>
        <div class="row form-floating m-3">
          <input
            type="number"
            name="dias_cont_suc"
            class="form-control"
            placeholder="Fecha inicial de contratación"

            required
          />
          <label htmlFor="dias_cont_suc">
            <i class="bi bi-lock"></i> Frecuencia de contratación
          </label>
        </div>
        <div class="row form-floating m-3">
          <input
            type="number"
            name="empleados"
            class="form-control"
            placeholder="Fecha inicial de contratación"

            required
          />
          <label htmlFor="empleados">
            <i class="bi bi-lock"></i> Cantidad de empleados
          </label>
        </div>
        <div class="row text-center">
          <div class="col">
            <input
              type="submit"
              name="altaEnt"
              value="Crear sucursal"
              class="btn btn-primary mt-3"
            />
          </div>
        </div>
      </div>
    </form>
    
    
    
      
  </body>
</html>
