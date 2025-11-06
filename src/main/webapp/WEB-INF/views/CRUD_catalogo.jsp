<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>CRUD Catálogo - Almacén Pro</title>

  <link rel="stylesheet" href="<c:url value='/css/styles.css'/>" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
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
          <a href="<c:url value='/categoria/list'/>" class="active"><i class="fas fa-edit"></i><span>Gestión de Catálogo</span></a>
          <a href="<c:url value='/producto/list'/>"><i class="fas fa-box"></i><span>Gestión de Producto</span></a>
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
          <h2><i class="fas fa-edit" style="color:var(--panel-start)"></i> Gestión del Catálogo</h2>
        </div>
      </div>

      <!-- Formulario -->
      <section class="card">
        <h3>
          <c:choose>
            <c:when test="${modoEdicion}">Editar categoría</c:when>
            <c:otherwise>Registrar nueva categoría</c:otherwise>
          </c:choose>
        </h3>

        <form action="<c:choose>
                        <c:when test='${modoEdicion}'><c:url value='/categoria/actualizar'/></c:when>
                        <c:otherwise><c:url value='/categoria/crear'/></c:otherwise>
                      </c:choose>"
              method="post"
              class="form-grid">

          <div class="form-group">
            <label for="codigoC">Código de categoría</label>
            <input id="codigoC" name="idCategoria" type="text"
                  value="${categoria.idCategoria}" placeholder="Ej: C001"
                  required
                  <c:if test="${modoEdicion}">readonly</c:if> />
          </div>

          <div class="form-group">
            <label for="nombreC">Nombre de la categoría</label>
            <input id="nombreC" name="nombre" type="text"
                  value="${categoria.nombre}" placeholder="Ej: Accesorios" required />
          </div>

          <div class="form-group" style="grid-column:1/3">
            <label for="descripcionC">Descripción</label>
            <textarea id="descripcionC" name="descripcion" rows="2">${categoria.descripcion}</textarea>
          </div>

          <div style="display:flex;align-items:end">
            <button class="btn" type="submit">
              <c:choose>
                <c:when test="${modoEdicion}">Actualizar categoría</c:when>
                <c:otherwise>Guardar categoría</c:otherwise>
              </c:choose>
            </button>
          </div>
        </form>
      </section>


      <!-- Tabla -->
      <section class="card">
        <h3 style="color:var(--panel-start)">Categorías registradas</h3>
        <div class="table-wrap">
          <table id="tblCatalogo">
            <thead>
              <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Acciones</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="cat" items="${categorias}">
                <tr>
                  <td>${cat.idCategoria}</td>
                  <td>${cat.nombre}</td>
                  <td>${cat.descripcion}</td>
                  <td>
                    <a href="<c:url value='/categoria/editar/${cat.idCategoria}'/>" class="btn" style="background:#007bff">
                      <i class="fas fa-edit"></i> Editar
                    </a>
                    <a href="<c:url value='/categoria/eliminar/${cat.idCategoria}'/>" class="btn" style="background:#dc3545">
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
