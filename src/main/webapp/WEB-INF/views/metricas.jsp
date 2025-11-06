<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title>Métricas - Almacén Pro</title>
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
                <a href="<c:url value='/metricas'/>" class="active"><i class="fas fa-chart-line"></i><span>Métricas</span></a>
                <a href="<c:url value='/gestion'/>"><i class="fas fa-tasks"></i><span>Gestión de inventario</span></a>
                <a href="<c:url value='/publicidad'/>"><i class="fas fa-ad"></i><span>Publicidad</span></a>
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

    <!-- MAIN -->
    <main class="main">
        <div class="topbar">
            <div class="page-title">
                <h2><i class="fas fa-chart-line" style="color:var(--panel-start)"></i> Métricas</h2>
            </div>
        </div>

        <!-- SECCIÓN PRINCIPAL -->
        <section class="card" style="text-align:center; padding:40px;">
            <h3><i class="fas fa-chart-bar" style="color:var(--panel-start)"></i> Panel de Métricas</h3>
            <p>Visualiza las métricas clave de ingresos y egresos mensuales de tu sistema de almacén.</p>
        </section>

        <!-- MÉTRICAS Y GRÁFICOS EXTENDIDOS -->
        <section class="content-metricas">
            <div class="metrics-summary">
                <div class="summary-card card-primary">
                    <div class="summary-icon"><i class="fas fa-arrow-up"></i></div>
                    <div class="summary-content">
                        <div class="summary-label">Valor ingresos por mes (S/)</div>
                        <div class="summary-value" id="valorIngresosTotal">-</div>
                    </div>
                </div>
                <div class="summary-card card-warning">
                    <div class="summary-icon"><i class="fas fa-arrow-down"></i></div>
                    <div class="summary-content">
                        <div class="summary-label">Valor egresos por mes (S/)</div>
                        <div class="summary-value" id="valorEgresosTotal">-</div>
                    </div>
                </div>
                <div class="summary-card card-success">
                    <div class="summary-icon"><i class="fas fa-box-open"></i></div>
                    <div class="summary-content">
                        <div class="summary-label">Cantidad productos ingresados</div>
                        <div class="summary-value" id="cantidadIngresosTotal">-</div>
                    </div>
                </div>
                <div class="summary-card card-info">
                    <div class="summary-icon"><i class="fas fa-warehouse"></i></div>
                    <div class="summary-content">
                        <div class="summary-label">Valor total del almacén (S/)</div>
                        <div class="summary-value" id="valorTotalAlmacen">-</div>
                    </div>
                </div>
            </div>
            <div class="charts-grid">
                <div class="chart-card">
                    <div class="chart-header"><h3>Valor ingresos mensuales (S/)</h3></div>
                    <div class="chart-body"><canvas id="valorIngresosChart"></canvas></div>
                </div>
                <div class="chart-card">
                    <div class="chart-header"><h3>Valor egresos mensuales (S/)</h3></div>
                    <div class="chart-body"><canvas id="valorEgresosChart"></canvas></div>
                </div>
                <div class="chart-card">
                    <div class="chart-header"><h3>Cantidad productos ingresados</h3></div>
                    <div class="chart-body"><canvas id="cantidadIngresosChart"></canvas></div>
                </div>
            </div>
        </section>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
        async function cargarMetricasExtendidas() {
            // Fetch nuevas métricas
            const valorIngresosRes = await fetch('/api/metricas/valor-ingresos-mensuales');
            const valorEgresosRes = await fetch('/api/metricas/valor-egresos-mensuales');
            const cantidadIngresosRes = await fetch('/api/metricas/cantidad-ingresos-mensuales');
            const valorIngresos = await valorIngresosRes.json();
            const valorEgresos = await valorEgresosRes.json();
            const cantidadIngresos = await cantidadIngresosRes.json();
            // Fetch valor total del almacén
            const valorAlmacenRes = await fetch('/api/metricas/valor-total-almacen');
            const valorAlmacen = await valorAlmacenRes.json();
            document.getElementById('valorTotalAlmacen').textContent = valorAlmacen;
            // Mostrar totales
            document.getElementById('valorIngresosTotal').textContent = valorIngresos.length ? valorIngresos[0].total : 0;
            document.getElementById('valorEgresosTotal').textContent = valorEgresos.length ? valorEgresos[0].total : 0;
            document.getElementById('cantidadIngresosTotal').textContent = cantidadIngresos.length ? cantidadIngresos[0].total : 0;
            document.getElementById('valorTotalAlmacen').textContent = valorAlmacen;
            // Validar datos para gráficos
            const safeLabels = (arr) => arr.length ? arr : ['Sin datos'];
            const safeData = (arr) => arr.length ? arr : [0];
            // Preparar datos para gráficos
            const meses = ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'];
            const labelsValorIngresos = safeLabels(valorIngresos.map(m => meses[m.mes-1] + ' ' + m.anio));
            const dataValorIngresos = safeData(valorIngresos.map(m => m.total));
            const labelsValorEgresos = safeLabels(valorEgresos.map(m => meses[m.mes-1] + ' ' + m.anio));
            const dataValorEgresos = safeData(valorEgresos.map(m => m.total));
            const labelsCantidadIngresos = safeLabels(cantidadIngresos.map(m => meses[m.mes-1] + ' ' + m.anio));
            const dataCantidadIngresos = safeData(cantidadIngresos.map(m => m.total));
            // Gráficos
            new Chart(document.getElementById('valorIngresosChart'), {
                type: 'bar',
                data: {
                    labels: labelsValorIngresos,
                    datasets: [
                        {
                            label: 'Valor ingresos',
                            data: dataValorIngresos,
                            backgroundColor: '#3498db'
                        }
                    ]
                },
                options: { responsive: true, plugins: { legend: { display: true } } }
            });
            new Chart(document.getElementById('valorEgresosChart'), {
                type: 'bar',
                data: {
                    labels: labelsValorEgresos,
                    datasets: [
                        {
                            label: 'Valor egresos',
                            data: dataValorEgresos,
                            backgroundColor: '#d49e3a'
                        }
                    ]
                },
                options: { responsive: true, plugins: { legend: { display: true } } }
            });
            new Chart(document.getElementById('cantidadIngresosChart'), {
                type: 'bar',
                data: {
                    labels: labelsCantidadIngresos,
                    datasets: [
                        {
                            label: 'Cantidad',
                            data: dataCantidadIngresos,
                            backgroundColor: '#27ae60'
                        }
                    ]
                },
                options: { responsive: true, plugins: { legend: { display: true } } }
            });
        }
        cargarMetricasExtendidas();
        </script>

        <footer class="app-footer card">© 2025 Sistema de Almacén</footer>
    </main>
</div>
</body>
</html>
