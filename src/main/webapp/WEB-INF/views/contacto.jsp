<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>Contacto - Almacén Pro</title>
  <link rel="stylesheet" href="<c:url value='/css/styles.css'/>"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
</head>
<body>
<div class="app">
  <!-- SIDEBAR -->
  <aside class="sidebar">
    <div>
      <div class="brand">
        <div class="logo"><i class="fas fa-warehouse"></i></div>
        <h3>Almacén Pro</h3>
      </div>
      <nav class="nav">
        <a href="<c:url value='/home'/>"><i class="fas fa-home"></i><span>Inicio</span></a>
        <a href="<c:url value='/catalogo'/>"><i class="fas fa-boxes"></i><span>Lista</span></a>
        <a href="<c:url value='/categoria/list'/>"><i class="fas fa-edit"></i><span>Gestión de Catálogo</span></a>
        <a href="<c:url value='/producto/list'/>"><i class="fas fa-box"></i><span>Gestión de Producto</span></a>
        <a href="<c:url value='/metricas'/>"><i class="fas fa-chart-line"></i><span>Métricas</span></a>
        <a href="<c:url value='/gestion'/>"><i class="fas fa-tasks"></i><span>Gestión de inventario</span></a>
        <a href="<c:url value='/publicidad'/>"><i class="fas fa-ad"></i><span>Publicidad</span></a>
        <a href="<c:url value='/perfil'/>"><i class="fas fa-user"></i><span>Perfil</span></a>
        <a href="<c:url value='/contacto'/>" class="active"><i class="fas fa-envelope"></i><span>Contacto</span></a>
        <a href="<c:url value='/ayuda'/>"><i class="fas fa-question-circle"></i><span>Ayuda</span></a>
      </nav>
    </div>
    
    <div class="profile-mini">
      <div class="avatar-sm">
        <c:if test="${usuario != null}">
          ${usuario.nombre.substring(0,2)}
        </c:if>
      </div>
      <div style="font-size:0.95rem">
        <div style="font-weight:700">
          <c:if test="${usuario != null}">${usuario.nombre}</c:if>
        </div>
        <div style="font-size:0.82rem;color:#dfe7ff">
          <c:if test="${usuario != null}">${usuario.rol}</c:if>
        </div>
      </div>
    </div>
  </aside>

  <!-- MAIN -->
  <main class="main">
    <div class="topbar">
      <div class="page-title">
        <h2><i class="fas fa-envelope" style="color:var(--panel-start)"></i> Contacto</h2>
      </div>
    </div>

    <section class="card">
      <h3>Información de contacto</h3>
      <p>Puedes comunicarte con el equipo de <strong>Almacén Pro</strong> mediante los siguientes canales:</p>
      <br>

      <div class="card" style="margin-bottom:12px;">
        <i class="fas fa-phone"></i>
        <strong>Teléfono:</strong> (064) 555-321<br>
        <small>Horario de atención: Lunes a viernes, 8:00 a.m. - 6:00 p.m.</small>
      </div>

      <div class="card" style="margin-bottom:12px;">
        <i class="fas fa-envelope"></i>
        <strong>Correo electrónico:</strong> soporte@almacenpro.com<br>
        <small>Responderemos a tu mensaje en un plazo máximo de 24 horas.</small>
      </div>

      <div class="card">
        <i class="fas fa-map-marker-alt"></i>
        <strong>Dirección:</strong> Jr. Comercio 456, Huancayo, Perú<br>
        <small>Oficinas administrativas de Almacén Pro</small>
      </div>
    </section>

    <footer class="app-footer card">© 2025 Sistema de Almacén</footer>
  </main>
</div>
</body>
</html>
