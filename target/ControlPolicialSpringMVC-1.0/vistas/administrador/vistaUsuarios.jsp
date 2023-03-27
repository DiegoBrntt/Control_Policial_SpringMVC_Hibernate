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
    <form action="/altaUsuario" method="post">
      <h3 class="text-center my-2">Usuarios</h3>
      <c:choose>
        <c:when test="${verificacionUsuBaja=='OK'}">
          <div class="alert alert-success text-center">
            <h3>Baja de Usuario realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionUsuBaja=='Usuario inexistente'}">
          <div class="alert alert-danger text-center">
            <h3>${verificacionUsuBaja}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
        <c:when test="${verificacionUsuMod=='OK'}">
          <div class="alert alert-success text-center">
            <h3>Modificacion de Usuario realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionUsuMod=='Error al modificar usuario'}">
          <div class="alert alert-danger text-center">
            <h3>${verificacionUsuMod}</h3>
          </div>
        </c:when>
      </c:choose>
      <c:choose>
        <c:when test="${verificacionUsuAlta=='OK'}">
          <div class="alert alert-success text-center m-1">
            <h3>Alta de Usuario realizada correctamente.</h3>
          </div>
        </c:when>
        <c:when test="${verificacionUsuAlta=='Usuario existente'}">
          <div class="alert alert-danger text-center m-1">
            <h3>${verificacionUsuAlta}</h3>
          </div>
        </c:when>
      </c:choose>
      <div className="container d-grid w-50">
        <div class="row form-floating m-3">
          <input
            type="text"
            name="nombreUsu"
            class="form-control"
            placeholder="Nombre de usuario"
            maxlength="4"
            minlength="1"
            required
          />

          <label htmlFor="nombreUsu">
            <i class="bi bi-person-circle"></i> Nombre de usuario
          </label>
        </div>

        <div class="row form-floating m-3">
          <input
            type="password"
            name="passUsu"
            class="form-control"
            placeholder="Contraseña"
            required
          />
          <label htmlFor="passUsu">
            <i class="bi bi-lock"></i> Contrasea
          </label>
        </div>
        <div class="row form-floating m-3">
          <input type="date" name="edadUsu" required />
        </div>
        <div class="row form-floating m-3">
          <select name="tipoUsu" class="form-select" required>
            <option value="Administrador">Administrador</option>
            <option value="Investigador">Investigador</option>
            <option value="Vigilante">Vigilante</option>
          </select>
        </div>

        <div class="row text-center">
          <div class="col">
            <input
              type="submit"
              value="Crear usuario"
              class="btn btn-primary mt-3"
            />
          </div>
        </div>
      </div>
    </form>
    <hr />
    <form action="/accionUsuario" method="post">
      <div class="row my-2">
        <div class="col text-center fw-bolder">ACCIONES</div>
        <div class="col">
          <select name="accionUsu" required>
            <c:forEach var="usuario2" items="${usuarios}">
                <option value="${usuario2.usuario_id}">${usuario2.clave}</option>
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
            value="Modificacion"
          >
            Modificar
          </button>
        </div>
      </div>
    </form>
  </body>
</html>
