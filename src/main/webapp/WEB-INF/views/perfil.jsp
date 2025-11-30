<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>Perfil - Almacén Pro</title>
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
        <a href="<c:url value='/catalogo'/>"><i class="fas fa-boxes"></i><span>Lista de Catálogo</span></a>
        <a href="<c:url value='/categoria/list'/>"><i class="fas fa-edit"></i><span>Gestión de Catálogo</span></a>
        <a href="<c:url value='/producto/list'/>"><i class="fas fa-box"></i><span>Gestión de Producto</span></a>
        <a href="<c:url value='/metricas'/>"><i class="fas fa-chart-line"></i><span>Métricas</span></a>
        <a href="<c:url value='/movimientos/list'/>"><i class="fas fa-tasks"></i><span>Gestión de inventario</span></a>
        <a href="<c:url value='/publicidad'/>"><i class="fas fa-ad"></i><span>Publicidad</span></a>
        <a href="<c:url value='/auth/perfil'/>" class="active"><i class="fas fa-user"></i><span>Perfil</span></a>
        <a href="<c:url value='/contacto'/>"><i class="fas fa-envelope"></i><span>Contacto</span></a>
        <a href="<c:url value='/ayuda'/>"><i class="fas fa-question-circle"></i><span>Ayuda</span></a>
      </nav>
    </div>
    <div class="profile-mini">
      <div class="avatar-sm">${usuario.nombre.substring(0, 2)}</div>
      <div style="font-size:0.95rem">
        <div style="font-weight:700">${usuario.nombre}</div>
        <div style="font-size:0.82rem;color:#dfe7ff">${usuario.rol}</div>
      </div>
    </div>
  </aside>

  <!-- MAIN -->
  <main class="main">
    <div class="topbar">
      <div class="page-title">
        <h2><i class="fas fa-user" style="color:var(--panel-start)"></i> Perfil del Usuario</h2>
      </div>
    </div>

    <!-- PERFIL PRINCIPAL -->
    <section class="card">
      <div class="profile-hero">
        <div class="avatar">${usuario.nombre.substring(0, 2)}</div>
        <div class="profile-info">
          <h3>${usuario.nombre}</h3>
          <div style="color:var(--muted)">${usuario.rol}</div>
          <div class="kv" style="margin-top:12px">
            <div class="item"><strong>Correo:</strong> ${usuario.correo}</div>
            <div class="item"><strong>Rol:</strong> ${usuario.rol}</div>
            <div class="item"><strong>Fecha de registro:</strong> ${usuario.fechaRegistro}</div>
          </div>

          <p style="margin-top:10px; font-size:0.9rem; color:var(--muted)">
            Este usuario posee permisos de <strong>${usuario.rol}</strong> para gestionar usuarios y productos.
          </p>

          <div style="margin-top:14px">
            <a href="<c:url value='/auth/login'/>" class="btn" style="background:#dc3545">
              <i class="fas fa-sign-out-alt"></i> Cerrar sesión
            </a>
          </div>
        </div>
      </div>
    </section>

    <!-- LISTA DE USUARIOS -->
    <section class="card" style="margin-top:20px;">
      <h4 style="color:var(--panel); margin-bottom:10px;">Usuarios registrados recientemente</h4>
      <table class="table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Correo</th>
            <th>Rol</th>
            <th>Fecha</th>
            <th>Acción</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="u" items="${usuarios}">
            <tr>
              <td>${u.idUsuario}</td>
              <td>${u.nombre}</td>
              <td>${u.correo}</td>
              <td>${u.rol}</td>
              <td>${u.fechaRegistro}</td>
              <td>
                <c:if test="${u.idUsuario != usuario.idUsuario}">
                  <button type="button" class="btn-danger" onclick="eliminarUsuario('${u.idUsuario}', '${u.nombre}')">
                    <i class="fas fa-trash"></i>
                  </button>
                </c:if>
                <c:if test="${u.idUsuario == usuario.idUsuario}">
                  <button type="button" class="btn-danger" disabled title="No puedes eliminar tu propio usuario">
                    <i class="fas fa-trash"></i>
                  </button>
                </c:if>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </section>

<!-- FORMULARIO DE EDICIÓN -->
<section class="form-editar">
  <h4>Editar Usuario</h4>
  <form method="post" action="<c:url value='/usuarios/editar'/>">
    <!-- Input oculto para enviar siempre el idUsuario -->
    <input type="hidden" name="idUsuario" id="idUsuarioHidden" value="${usuario.idUsuario}" />

    <label>Seleccionar Usuario</label>
    <select id="selectUsuario" name="selectUsuario" onchange="actualizarCampos()">
      <c:forEach var="u" items="${usuarios}">
        <option value="${u.idUsuario}" 
          data-nombre="${u.nombre}" 
          data-correo="${u.correo}" 
          data-rol="${u.rol}">
          ${u.idUsuario} - ${u.nombre}
        </option>
      </c:forEach>
    </select>

    <label>Nombre</label>
    <input type="text" id="nombre" name="nombre" value="${usuario.nombre}"/>

    <label>Correo</label>
    <input type="email" id="correo" name="correo" value="${usuario.correo}"/>

    <label>Rol</label>
    <input type="text" id="rol" name="rol" value="${usuario.rol}"/>

    <button type="submit" class="btn" style="background:var(--panel);margin-top:10px;">
      Guardar cambios
    </button>
  </form>
</section>

<script>
  // Llenar campos al cambiar usuario
  function actualizarCampos() {
    const select = document.getElementById("selectUsuario");
    const option = select.options[select.selectedIndex];

    document.getElementById("nombre").value = option.getAttribute("data-nombre");
    document.getElementById("correo").value = option.getAttribute("data-correo");
    document.getElementById("rol").value = option.getAttribute("data-rol");

    // Actualizar el input oculto con el id del usuario seleccionado
    document.getElementById("idUsuarioHidden").value = option.value;
  }

  // Confirmar y eliminar usuario
  function eliminarUsuario(id, nombre) {
    if (confirm("¿Seguro que deseas eliminar al usuario " + nombre + "?")) {
      window.location.href = "/usuarios/eliminar/" + id;
    }
  }
</script>
