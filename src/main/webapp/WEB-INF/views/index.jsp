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
      <div class="page-title"><h2><i class="fas fa-home" style="color:var(--panel-start)"></i> Panel</h2></div>
      <div class="top-actions">
        <button class="btn"><i class="fas fa-bell"></i> Notificaciones</button>
        <button class="btn secondary"><i class="fas fa-user-cog"></i> Config</button>
      </div>
    </div>

    <!-- Estadísticas principales -->
    <section class="card">
      <div class="card-row">
        <div class="stat">
          <div class="icon"><i class="fas fa-boxes" style="color:#112f91"></i></div>
          <div class="info"><h3 id="stat-prod">1,248</h3><div style="color:var(--muted)">Productos en stock</div></div>
        </div>
        <div class="stat">
          <div class="icon"><i class="fas fa-exclamation-triangle" style="color:#8B2E3C"></i></div>
          <div class="info"><h3 id="stat-low">7</h3><div style="color:var(--muted)">Productos con stock bajo</div></div>
        </div>
        <div class="stat">
          <div class="icon"><i class="fas fa-clipboard-list" style="color:#dabd19"></i></div>
          <div class="info"><h3>56</h3><div style="color:var(--muted)">Pedidos este mes</div></div>
        </div>
        <div class="stat">
          <div class="icon"><i class="fas fa-check-circle" style="color:#27ae60"></i></div>
          <div class="info"><h3>12</h3><div style="color:var(--muted)">Tareas pendientes</div></div>
        </div>
      </div>
    </section>

    <!-- Actividad reciente -->
    <section class="card">
      <div style="display:flex;justify-content:space-between;align-items:center">
        <h3 style="color:var(--panel-start)">Actividad reciente</h3>
        <a class="btn ghost" href="<c:url value='/movimientos/list'/>">Ver todas</a>
      </div>
      <div style="margin-top:12px">
        <table>
          <thead><tr><th>Actividad</th><th>Detalle</th><th>Fecha</th></tr></thead>
          <tbody>
            <tr><td>Entrada de productos</td><td>15 monitores ingresados</td><td>Hace 2 horas</td></tr>
            <tr><td>Salida de productos</td><td>5 laptops enviadas</td><td>Ayer 14:30</td></tr>
            <tr><td>Nuevo producto</td><td>Teclados mecánicos agregados</td><td>05/09/2025</td></tr>
          </tbody>
        </table>
      </div>
    </section>

    <footer class="app-footer card">© 2025 Sistema de Almacén - Todos los derechos reservados</footer>
  </main>
</div>
</body>
</html>
