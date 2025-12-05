<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title>Inicio - Almacén Pro</title>

    <!-- ESTILOS -->
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

    <!-- MAIN -->
    <main class="main">

        <div class="topbar">
            <h2><i class="fas fa-home icon-red"></i> Panel de Bienvenida</h2>
        </div>

        <!-- SECCIÓN BIENVENIDA -->
        <section class="welcome">
            <div class="welcome-left">
                <h1>¡Bienvenido a Almacén Pro!</h1>
                <p>Gestiona tu inventario de manera eficiente con nuestro sistema fácil de usar.</p>
            </div>
            <div class="welcome-icon">
                <i class="fas fa-warehouse"></i>
            </div>
        </section>

        <!-- CARACTERÍSTICAS -->
        <section class="section">
            <h2 class="section-title">Características Principales</h2>

            <div class="grid-3">
                <div class="card feature">
                    <i class="fas fa-boxes feature-icon"></i>
                    <h3>Gestión de Catálogo</h3>
                    <p>Organiza productos en categorías de forma rápida.</p>
                </div>

                <div class="card feature">
                    <i class="fas fa-tasks feature-icon"></i>
                    <h3>Gestión de Productos</h3>
                    <p>Controla el inventario en tiempo real.</p>
                </div>

                <div class="card feature">
                    <i class="fas fa-chart-line feature-icon"></i>
                    <h3>Reportes</h3>
                    <p>Obtén análisis detallados del stock.</p>
                </div>
            </div>
        </section>

        <!-- ACCESOS DIRECTOS -->
        <section class="section">
            <h2 class="section-title">Accesos Directos</h2>

            <div class="grid-3">

                <a href="<c:url value='/categoria/list'/>" class="access">
                    <i class="fas fa-folder-plus access-icon"></i>
                    <div>
                        <h4>Categorías</h4>
                        <p>Gestiona tus categorías</p>
                    </div>
                    <i class="fas fa-arrow-right access-arrow"></i>
                </a>

                <a href="<c:url value='/producto/list'/>" class="access">
                    <i class="fas fa-box access-icon"></i>
                    <div>
                        <h4>Productos</h4>
                        <p>Administra tu inventario</p>
                    </div>
                    <i class="fas fa-arrow-right access-arrow"></i>
                </a>

                <a href="<c:url value='/metricas'/>" class="access">
                    <i class="fas fa-chart-bar access-icon"></i>
                    <div>
                        <h4>Métricas</h4>
                        <p>Consulta análisis avanzados</p>
                    </div>
                    <i class="fas fa-arrow-right access-arrow"></i>
                </a>

            </div>
        </section>

        <footer class="app-footer">
            <p>© 2025 Sistema de Almacén - Todos los derechos reservados</p>
        </footer>

    </main>
</div>
</body>
</html>
