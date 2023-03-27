<%-- Document : index Created on : 2 nov. 2021, 21:42:27 Author : Grandalf --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <title>Control Policial Bancario</title>
  </head>
  <body class="bg-light">
    <div class="divTable3">
      <h1 class="text-white">
        Control delitos bancarios
      </h1>
      <span>
        <img src="resources/animacion/principal.gif" />
      </span>
    </div>

    <form method="post" action="/validarUsuario">
       
        <div className="container d-grid w-50">
          <h1>Ingrese sus datos</h1>
          <div class="row form-floating m-3">
            <input
              type="text"
              name="clave"
              class="form-control"
              placeholder="Nombre de usuario"
            />

            <label htmlFor="clave">
              <i class="bi bi-person-circle"></i> Nombre de usuario
            </label>
          </div>

          <div class="row form-floating m-3">
            <input
              type="password"
              name="pass"
              class="form-control"
              placeholder="Contraseña"
            />
            <label htmlFor="password">
              <i class="bi bi-lock"></i> Contraseña
            </label>
          </div>
          <c:choose>
            <c:when test="${not empty usuario}">
              <span class="row justify-content-center alert alert-danger m-3" role="alert">
                  Contraseña y/o nombre de usuario invalido
              </span>
            </c:when>
          </c:choose>
          <div class="row text-center">
            <div class="col">
              <input
                type="submit"
                value="Iniciar sesion"
                class="btn btn-primary"
              />
            </div>
          </div>
        </div>
    </form>
  </body>
</html>
