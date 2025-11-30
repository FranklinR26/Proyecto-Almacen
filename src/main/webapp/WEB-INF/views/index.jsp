<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>Inicio - Almacén Pro</title>
  <link rel="stylesheet" href="<c:url value='/css/styles.css'/>"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
</head>
<body>
<div class="app">
  <!-- Sidebar -->
  <aside class="sidebar">
    <div>
      <div class="brand">
        <div class="logo"><i class="fas fa-warehouse"></i></div>
        <h3>Almacén Pro</h3>
      </div>
      <nav class="nav">
        <a href="<c:url value='/home'/>" class="active"><i class="fas fa-home"></i><span>Inicio</span></a>
        <a href="<c:url value='/catalogo'/>"><i class="fas fa-boxes"></i><span>Lista</span></a>
        <a href="<c:url value='/categoria/list'/>"><i class="fas fa-edit"></i><span>Gestión de Catálogo</span></a>
        <a href="<c:url value='/producto/list'/>"><i class="fas fa-box"></i><span>Gestión de Producto</span></a>
        <a href="<c:url value='/metricas'/>"><i class="fas fa-chart-line"></i><span>Métricas</span></a>
        <a href="<c:url value='/movimientos/list'/>"><i class="fas fa-tasks"></i><span>Gestión de inventario</span></a>
        <a href="<c:url value='/publicidad'/>"><i class="fas fa-ad"></i><span>Publicidad</span></a>
        <a href="<c:url value='/perfil'/>"><i class="fas fa-user"></i><span>Perfil</span></a>
        <a href="<c:url value='/contacto'/>"><i class="fas fa-envelope"></i><span>Contacto</span></a>
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

  <!-- Main -->
  <main class="main">
    <div class="topbar">
      <div class="page-title"><h2><i class="fas fa-home" style="color:var(--panel-start)"></i> Panel de Bienvenida</h2></div>
      <div class="top-actions">
        <button class="btn"><i class="fas fa-bell"></i> Notificaciones</button>
        <button class="btn secondary"><i class="fas fa-user-cog"></i> Config</button>
      </div>
    </div>

    <!-- Bienvenida -->
    <section class="welcome-section">
      <div class="welcome-message">
        <h2>¡Bienvenido a Almacén Pro!</h2>
        <p>Gestiona tu inventario de manera eficiente con nuestro sistema fácil de usar.</p>
      </div>
    </section>

    <!-- Características Principales -->
    <section class="features">
      <h3>Características Principales</h3>
      <div class="features-list">
        <div class="feature-item">
          <i class="fas fa-boxes"></i>
          <h4>Gestión de Catálogo</h4>
          <p>Organiza productos en categorías para una búsqueda más rápida.</p>
        </div>
        <div class="feature-item">
          <i class="fas fa-tasks"></i>
          <h4>Gestión de Productos</h4>
          <p>Administra tu stock y visualiza el inventario en tiempo real.</p>
        </div>
        <div class="feature-item">
          <i class="fas fa-chart-line"></i>
          <h4>Reportes de Métricas</h4>
          <p>Obtén análisis detallados sobre el estado de tu inventario.</p>
        </div>
      </div>
    </section>

    <!-- Guías rápidas -->
    <section class="quick-guides">
      <h3>Guías Rápidas</h3>
      <ul>
        <li><a href="<c:url value='/categoria/list'/>">Crear una nueva categoría</a></li>
        <li><a href="<c:url value='/producto/list'/>">Ver y gestionar productos</a></li>
        <li><a href="<c:url value='/metricas'/>">Consultar métricas de inventario</a></li>
      </ul>
    </section>

    <footer class="app-footer card">
      © 2025 Sistema de Almacén - Todos los derechos reservados
    </footer>
  </main>
</div>

<!-- Estilos adicionales (no usar JS para mayor simplicidad) -->
<style>
  .welcome-section {
    text-align: center;
    margin: 30px 0;
    padding: 20px;
    background: #f7f7f7;
    border-radius: 8px;
  }

  .welcome-message h2 {
    font-size: 2rem;
    font-weight: bold;
    color: #333;
  }

  .welcome-message p {
    font-size: 1.1rem;
    color: #555;
  }

  .features {
    margin-top: 40px;
  }

  .features h3 {
    font-size: 1.5rem;
    color: #333;
    text-align: center;
    margin-bottom: 20px;
  }

  .features-list {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
  }

  .feature-item {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    width: 250px;
    margin: 10px;
    text-align: center;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  }

  .feature-item i {
    font-size: 2rem;
    color: #4CAF50;
    margin-bottom: 10px;
  }

  .feature-item h4 {
    font-size: 1.3rem;
    margin-bottom: 10px;
    color: #333;
  }

  .feature-item p {
    font-size: 1rem;
    color: #666;
  }

  .quick-guides {
    margin-top: 40px;
    padding: 20px;
    background: #f7f7f7;
    border-radius: 8px;
  }

  .quick-guides h3 {
    font-size: 1.5rem;
    color: #333;
    margin-bottom: 15px;
  }

  .quick-guides ul {
    list-style-type: none;
    padding: 0;
  }

  .quick-guides ul li {
    margin: 10px 0;
  }

  .quick-guides ul li a {
    text-decoration: none;
    color: #007bff;
    font-size: 1.1rem;
  }

  .quick-guides ul li a:hover {
    color: #0056b3;
  }

  footer.app-footer {
    margin-top: 40px;
    text-align: center;
    background-color: #f7f7f7;
    padding: 15px;
    color: #777;
  }
</style>
</body>
</html>
