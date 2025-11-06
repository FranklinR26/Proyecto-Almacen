<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>Ayuda - Almacén Pro</title>

  <!-- Rutas corregidas para Spring -->
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
        <a href="<c:url value='/home'/>"><i class="fas fa-home"></i><span>Inicio</span></a>
        <a href="<c:url value='/catalogo'/>"><i class="fas fa-boxes"></i><span>Lista</span></a>
        <a href="<c:url value='/categoria/list'/>"><i class="fas fa-edit"></i><span>Gestión de Catálogo</span></a>
        <a href="<c:url value='/producto/list'/>"><i class="fas fa-box"></i><span>Gestión de Producto</span></a>
        <a href="<c:url value='/metricas'/>"><i class="fas fa-chart-line"></i><span>Métricas</span></a>
        <a href="<c:url value='/gestion'/>"><i class="fas fa-tasks"></i><span>Gestión de inventario</span></a>
        <a href="<c:url value='/publicidad'/>"><i class="fas fa-ad"></i><span>Publicidad</span></a>
        <a href="<c:url value='/perfil'/>"><i class="fas fa-user"></i><span>Perfil</span></a>
        <a href="<c:url value='/contacto'/>"><i class="fas fa-envelope"></i><span>Contacto</span></a>
        <a href="<c:url value='/ayuda'/>" class="active"><i class="fas fa-question-circle"></i><span>Ayuda</span></a>
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

  <!-- Main -->
  <main class="main">
    <div class="topbar">
      <div class="page-title">
        <h2><i class="fas fa-question-circle" style="color:var(--panel-start)"></i> Centro de Ayuda</h2>
      </div>
    </div>

    <section class="card">
      <p>Preguntas frecuentes</p>
      <div style="margin-top:12px">
        <div style="margin-bottom:10px">
          <div class="faq-q" style="cursor:pointer;font-weight:700">¿Cómo ingreso al sistema?</div>
          <div class="faq-a" style="padding:10px 0;color:var(--muted)">
            Accede con tu usuario y contraseña en la página de login.
          </div>
        </div>
        <div style="margin-bottom:10px">
          <div class="faq-q" style="cursor:pointer;font-weight:700">¿Cómo registro una entrada de producto?</div>
          <div class="faq-a" style="padding:10px 0;color:var(--muted)">
            En Gestión → Registrar Entrada, completa y guarda.
          </div>
        </div>
        <div style="margin-bottom:10px">
          <div class="faq-q" style="cursor:pointer;font-weight:700">¿Cómo contacto con soporte?</div>
          <div class="faq-a" style="padding:10px 0;color:var(--muted)">
            Usa la sección Contacto para enviar tu consulta.
          </div>
        </div>
      </div>
    </section>

    <footer class="app-footer card">© 2025 Sistema de Almacén</footer>
  </main>
</div>
</body>
</html>
