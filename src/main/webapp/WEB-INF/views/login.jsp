<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - Almacén Pro</title>
  <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
</head>
<body class="login-body">

  <div class="login-wrapper">
    <div class="login-card">
      <div class="login-header">
        <div class="login-logo">AP</div>
        <h2>Acceso al Sistema</h2>
        <p class="subtitle">Bienvenido, inicia sesión para continuar</p>
      </div>

      <!-- Formulario de inicio de sesión -->
      <form action="<c:url value='/auth/login' />" method="post">
        <div class="form-group">
          <label for="correo">Correo electrónico</label>
          <input type="email" id="correo" name="correo" placeholder="ejemplo@empresa.com" required>
        </div>
        <div class="form-group">
          <label for="contraseña">Contraseña</label>
          <input type="password" id="contrasena" name="contrasena" placeholder="••••••••" required>
        </div>
        <button type="submit" class="btn login-btn">Ingresar</button>

        <!-- Mensaje de error -->
        <c:if test="${not empty error}">
          <p style="color:red; text-align:center; margin-top:10px;">${error}</p>
        </c:if>

        <!-- Mensaje de éxito (por ejemplo, después del registro) -->
        <c:if test="${not empty mensaje}">
          <p style="color:green; text-align:center; margin-top:10px;">${mensaje}</p>
        </c:if>
      </form>

      <div class="login-footer">
        <p>¿No tienes cuenta? <a href="<c:url value='/auth/registro'/>">Regístrate aquí</a></p>
      </div>
    </div>
  </div>

</body>
</html>
