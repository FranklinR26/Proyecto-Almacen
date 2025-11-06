<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title>Gestión - Almacén Pro</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
</head>
<body>
<div class="app">
    <!-- SIDEBAR -->
    <aside class="sidebar">
        <div>
            <div class="brand">
                <div class="logo"><i class="fas fa-warehouse"></i></div><h3>Almacén Pro</h3>
            </div>
            <nav class="nav">
                <a href="<c:url value='/home'/>"><i class="fas fa-home"></i><span>Inicio</span></a>
                <a href="<c:url value='/catalogo'/>"><i class="fas fa-boxes"></i><span>Lista</span></a>
                <a href="<c:url value='/categoria/list'/>"><i class="fas fa-edit"></i><span>Gestión de Catálogo</span></a>
                <a href="<c:url value='/producto/list'/>"><i class="fas fa-box"></i><span>Gestión de Producto</span></a>
                <a href="<c:url value='/metricas'/>"><i class="fas fa-chart-line"></i><span>Métricas</span></a>
                <a href="<c:url value='/gestion'/>" class="active"><i class="fas fa-tasks"></i><span>Gestión de inventario</span></a>
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
            <div class="page-title">
                <h2><i class="fas fa-tasks" style="color:var(--panel-start)"></i> Gestión de Inventario</h2>
            </div>
        </div>

        <!-- Formulario para registrar entrada -->
        <section class="card">
            <div style="display:flex;gap:14px;flex-wrap:wrap">
                <!-- ENTRADA -->
                <div style="flex:1;min-width:300px">
                    <h4>Registrar Entrada</h4>
                    <form action="<c:url value='/movimientos/registrar'/>" method="post">
                        <input type="hidden" name="tipo" value="Entrada" />
                        <div class="form-group" style="position:relative">
                            <label for="buscarProducto">Código del producto</label>
                            <input id="buscarProducto" name="idProducto" type="text" placeholder="Escriba código o nombre..." required />
                        </div>
                        <div class="form-group">
                            <label for="cantidadE">Cantidad</label>
                            <input id="cantidadE" name="cantidad" type="number" min="1" value="1" required />
                        </div>
                        <div class="form-group">
                            <label for="almaceneroE">Almacenero Responsable</label>
                            <input id="idUsuarioE" name="idUsuario" type="hidden" value="${idUsuario}" />
                            <input type="text" value="${nombreUsuario}" readonly style="background:#f3f3f3; cursor:not-allowed;" />
                        </div>
                        <div style="margin-top:8px">
                            <button class="btn" type="submit">Registrar Entrada</button>
                        </div>
                    </form>
                </div>

                <!-- SALIDA -->
                <div style="flex:1;min-width:300px">
                    <h4>Registrar Salida</h4>
                    <form action="<c:url value='/movimientos/registrar'/>" method="post">
                        <input type="hidden" name="tipo" value="Salida" /> 
                        <div class="form-group" style="position:relative">
                            <label for="codigoS">Código del Producto</label>
                            <input id="codigoS" name="idProducto" type="text" placeholder="Escriba código o nombre..." required />
                        </div>
                        <div class="form-group">
                            <label for="cantidadS">Cantidad</label>
                            <input id="cantidadS" name="cantidad" type="number" min="1" value="1" required />
                        </div>
                        <div class="form-group">
                            <label for="almaceneroS">Almacenero Responsable</label>
                            <input id="idUsuarioS" name="idUsuario" type="hidden" value="${idUsuario}" />
                            <input type="text" value="${nombreUsuario}" readonly style="background:#f3f3f3; cursor:not-allowed;" />
                        </div>
                        <div style="margin-top:8px">
                            <button class="btn" type="submit">Registrar Salida</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>

        <!-- Tabla de movimientos -->
        <section class="card">
            <h4>Movimientos recientes</h4>
            <div class="table-wrap">
                <table id="tblMovimientos">
                    <thead>
                        <tr>
                            <th>Tipo</th>
                            <th>Detalle</th>
                            <th>Fecha</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="mov" items="${movimientos}">
                            <tr>
                                <td>${mov.tipoMovimiento}</td>
                                <td>${mov.cantidad} ${mov.idProducto}</td>
                                <td>${mov.fecha}</td>
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
