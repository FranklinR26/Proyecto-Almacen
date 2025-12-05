<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>CRUD Producto - Almacén Pro</title>

  <link rel="stylesheet" href="<c:url value='/css/styles.css'/>"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

  <style>
    .alert {
      padding: 10px 15px;
      border-radius: 6px;
      margin-bottom: 15px;
      font-weight: 600;
      animation: fadeIn 0.3s ease-in-out;
    }
    .alert-success {
      background: #d1f7d7;
      border-left: 5px solid #28a745;
      color: #155724;
    }
    .alert-danger {
      background: #ffd2d2;
      border-left: 5px solid #dc3545;
      color: #721c24;
    }
    @keyframes fadeIn {
      from {opacity: 0;}
      to {opacity: 1;}
    }
  </style>
</head>
<body>
<div class="app">
  <!-- Sidebar -->
  <aside class="sidebar">
    <div>
      <div class="brand"><div class="logo"><i class="fas fa-warehouse"></i></div><h3>Almacén Pro</h3></div>
      <nav class="nav">
        <a href="<c:url value='/home'/>"><i class="fas fa-home"></i><span>Inicio</span></a>
        <a href="<c:url value='/catalogo'/>"><i class="fas fa-boxes"></i><span>Lista</span></a>
        <a href="<c:url value='/categoria/list'/>"><i class="fas fa-edit"></i><span>Gestión de Catálogo</span></a>
        <a href="<c:url value='/producto/list'/>" class="active"><i class="fas fa-box"></i><span>Gestión de Producto</span></a>
        <a href="<c:url value='/metricas'/>"><i class="fas fa-chart-line"></i><span>Métricas</span></a>
        <a href="<c:url value='/gestion'/>"><i class="fas fa-tasks"></i><span>Gestión de inventario</span></a>
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
      <div class="page-title">
        <h2><i class="fas fa-box" style="color:var(--panel-start)"></i> Gestión de Producto</h2>
      </div>
    </div>

    <!-- MENSAJES -->
    <c:if test="${not empty success}">
      <div class="alert alert-success">${success}</div>
    </c:if>
    <c:if test="${not empty error}">
      <div class="alert alert-danger">${error}</div>
    </c:if>

    <!-- Formulario Producto -->
    <section class="card">
      <h3>
        <c:choose>
          <c:when test="${modoEdicion}">Editar Producto</c:when>
          <c:otherwise>Registrar Producto</c:otherwise>
        </c:choose>
      </h3>

      <form 
        action="<c:choose>
                  <c:when test='${modoEdicion}'><c:url value='/producto/actualizar'/></c:when>
                  <c:otherwise><c:url value='/producto/crear'/></c:otherwise>
                </c:choose>" 
        method="post" 
        class="form-grid">

        <div class="form-group">
          <label for="codigo">Código</label>
          <input id="codigo" name="idProducto" type="text" 
                 value="${producto.idProducto}" 
                 <c:if test="${modoEdicion}">readonly</c:if> required/>
        </div>

        <div class="form-group">
          <label for="nombre">Nombre</label>
          <input id="nombre" name="nombre" type="text" 
                 value="${producto.nombre}" required/>
        </div>

        <div class="form-group">
          <label for="categoria">Categoría</label>
          <select id="categoria" name="idCategoria" required>
            <c:forEach var="cat" items="${categorias}">
              <option value="${cat.idCategoria}" 
                <c:if test="${modoEdicion && cat.idCategoria == producto.idCategoria}">selected</c:if>>
                ${cat.nombre}
              </option>
            </c:forEach>
          </select>
        </div>

        <div class="form-group">
          <label for="precio">Precio (S/)</label>
          <input id="precio" name="precio" type="number" step="0.01" 
                 value="${producto.precio}" required/>
        </div>

        <div class="form-group">
          <label for="descripcion">Descripción</label>
          <textarea id="descripcion" name="descripcion" rows="2">${producto.descripcion}</textarea>
        </div>

        <div style="display:flex;gap:8px;align-items:end">
          <button class="btn" type="submit">
            <c:choose>
              <c:when test="${modoEdicion}">Actualizar producto</c:when>
              <c:otherwise>Guardar producto</c:otherwise>
            </c:choose>
          </button>

          <c:if test="${modoEdicion}">
            <a href="<c:url value='/producto/list'/>" class="btn" style="background:#6c757d">Cancelar</a>
          </c:if>
        </div>
      </form>
    </section>

    <!-- Tabla Productos -->
    <section class="card">
      <h3>Productos registrados</h3>
      <div class="table-wrap">
        <table>
          <thead>
            <tr>
              <th>Código</th>
              <th>Nombre</th>
              <th>Categoría</th>
              <th>Precio</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="p" items="${productos}">
              <tr>
                <td>${p.idProducto}</td>
                <td>${p.nombre}</td>
                <td>
                  <c:forEach var="cat" items="${categorias}">
                    <c:if test="${cat.idCategoria == p.idCategoria}">
                      ${cat.nombre}
                    </c:if>
                  </c:forEach>
                </td>
                <td>${p.precio}</td>

                <td style="display:flex; gap:5px;">
                  <a href="<c:url value='/producto/editar/${p.idProducto}'/>" class="btn" style="background:#007bff">
                    <i class="fas fa-pen"></i> Editar
                  </a>
                  <a href="<c:url value='/producto/eliminar/${p.idProducto}'/>" class="btn" style="background:#dc3545" onclick="return confirm('¿Seguro que deseas eliminar este producto?')">
                    <i class="fas fa-trash"></i> Eliminar
                  </a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </section>

    <footer class="app-footer card">© 2025 Sistema de Almacén</footer>
  </main>
</div>
</body>
</html>
