<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>Publicidad - Almacén Pro</title>

  <!-- CSS -->
  <link rel="stylesheet" href="<c:url value='/css/styles.css'/>"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
</head>
<body>
<div class="app">
  <!-- Barra lateral -->
  <aside class="sidebar">
    <div>
      <div class="brand">
        <div class="logo"><i class="fas fa-warehouse"></i></div>
        <h3>Almacén Pro</h3>
      </div>
      <nav class="nav">
        <a href="<c:url value='/home'/>"><i class="fas fa-home"></i><span>Inicio</span></a>
        <a href="<c:url value='/catalogo/list'/>"><i class="fas fa-boxes"></i><span>Lista</span></a>
        <a href="<c:url value='/categoria/list'/>"><i class="fas fa-edit"></i><span>Gestión de Catálogo</span></a>
        <a href="<c:url value='/producto/list'/>"><i class="fas fa-box"></i><span>Gestión de Producto</span></a>
        <a href="<c:url value='/metricas'/>"><i class="fas fa-chart-line"></i><span>Métricas</span></a>
        <a href="<c:url value='/movimientos/list'/>"><i class="fas fa-tasks"></i><span>Gestión de inventario</span></a>
        <a href="<c:url value='/publicidad'/>" class="active"><i class="fas fa-ad"></i><span>Publicidad</span></a>
        <a href="<c:url value='/perfil'/>"><i class="fas fa-user"></i><span>Perfil</span></a>
        <a href="<c:url value='/contacto'/>"><i class="fas fa-envelope"></i><span>Contacto</span></a>
        <a href="<c:url value='/ayuda'/>"><i class="fas fa-question-circle"></i><span>Ayuda</span></a>
      </nav>
    </div>

    <!-- Mini perfil dinámico -->
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

  <!-- Contenido principal -->
  <main class="main">
    <div class="topbar">
      <div class="page-title">
        <h2><i class="fas fa-ad" style="color:var(--panel-start)"></i> Publicidad</h2>
      </div>
    </div>

    <!-- Carrusel -->
    <section class="card">
      <h4>Promociones y banners</h4>
      <div class="carrusel">
        <div class="slides">
          <img src="<c:url value='/images/promo1.png'/>" alt="promo1">
          <img src="<c:url value='/images/promo2.jpeg'/>" alt="promo2">
          <img src="<c:url value='/images/promo3.jpeg'/>" alt="promo3">
        </div>
      </div>
    </section>

    <footer class="app-footer card">© 2025 Sistema de Almacén - Todos los derechos reservados</footer>
  </main>
</div>
</body>
</html>
