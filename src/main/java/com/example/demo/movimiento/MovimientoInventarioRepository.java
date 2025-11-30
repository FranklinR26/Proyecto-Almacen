package com.example.demo.movimiento;

import java.sql.Timestamp;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MovimientoInventarioRepository implements MovimientoInventarioDAO {

    private final JdbcTemplate jdbcTemplate;

    public MovimientoInventarioRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<MovimientoInventario> movimientoRowMapper = (rs, rowNum) ->
        new MovimientoInventario(
            rs.getString("id_movimiento"),
            rs.getString("tipo_movimiento"),
            rs.getInt("cantidad"),
            rs.getTimestamp("fecha").toLocalDateTime(),
            rs.getString("id_producto"),
            rs.getString("id_usuario")
        );

    @Override
    public List<MovimientoInventario> listarMovimientos() {
        String sql = "SELECT * FROM movimiento_inventario ORDER BY fecha DESC";
        return jdbcTemplate.query(sql, movimientoRowMapper);
    }

    // 🔍 Verifica si el producto existe
    private boolean productoExiste(String idProducto) {
        String sql = "SELECT COUNT(*) FROM producto WHERE id_producto = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, idProducto);
        return count != null && count > 0;
    }

    // 🔍 Obtiene el stock actual
    private int obtenerStockActual(String idProducto) {
        String sql = "SELECT stock FROM producto WHERE id_producto = ?";
        Integer stock = jdbcTemplate.queryForObject(sql, Integer.class, idProducto);
        return stock != null ? stock : 0;
    }

    @Override
    public void registrarMovimiento(MovimientoInventario movimiento) {

        // ❗ 1. Validar que el producto exista
        if (!productoExiste(movimiento.getIdProducto())) {
            throw new IllegalArgumentException(
                "El producto con ID '" + movimiento.getIdProducto() + "' no existe en la base de datos."
            );
        }

        // 🔹 2. Generar código automático
        String sqlUltimo = "SELECT id_movimiento FROM movimiento_inventario ORDER BY id_movimiento DESC LIMIT 1";
        String ultimoCodigo = jdbcTemplate.query(sqlUltimo, rs -> rs.next() ? rs.getString(1) : null);

        String nuevoCodigo;
        if (ultimoCodigo == null) {
            nuevoCodigo = "M000001";
        } else {
            int numero = Integer.parseInt(ultimoCodigo.substring(1));
            nuevoCodigo = String.format("M%06d", numero + 1);
        }
        movimiento.setIdMovimiento(nuevoCodigo);

        // 🔹 3. Validar tipo
        String tipo = movimiento.getTipoMovimiento().toLowerCase();
        if (!tipo.equals("entrada") && !tipo.equals("salida")) {
            throw new IllegalArgumentException("Tipo de movimiento no válido: " + movimiento.getTipoMovimiento());
        }

        // ❗ 4. Validar stock si es salida
        int stockActual = obtenerStockActual(movimiento.getIdProducto());
        if (tipo.equals("salida") && movimiento.getCantidad() > stockActual) {
            throw new IllegalArgumentException(
                "Stock insuficiente. Solo hay " + stockActual + " unidades disponibles."
            );
        }

        // 🔹 5. Registrar movimiento
        String sqlInsert = """
            INSERT INTO movimiento_inventario (id_movimiento, tipo_movimiento, cantidad, fecha, id_producto, id_usuario)
            VALUES (?, ?, ?, ?, ?, ?)
        """;

        jdbcTemplate.update(sqlInsert,
            movimiento.getIdMovimiento(),
            movimiento.getTipoMovimiento(),
            movimiento.getCantidad(),
            Timestamp.valueOf(movimiento.getFecha()),
            movimiento.getIdProducto(),
            movimiento.getIdUsuario()
        );

        // 🔹 6. Actualizar stock
        String sqlUpdateStock = tipo.equals("entrada")
                ? "UPDATE producto SET stock = stock + ? WHERE id_producto = ?"
                : "UPDATE producto SET stock = stock - ? WHERE id_producto = ?";

        jdbcTemplate.update(sqlUpdateStock, movimiento.getCantidad(), movimiento.getIdProducto());
    }

    @Override
    public void eliminarMovimiento(String idMovimiento) {
        String sql = "DELETE FROM movimiento_inventario WHERE id_movimiento = ?";
        jdbcTemplate.update(sql, idMovimiento);
    }

    // ---- MÉTRICAS ----

    public List<MetricaMensualDTO> obtenerIngresosPorMes() {
        String sql = "SELECT EXTRACT(YEAR FROM fecha) AS anio, EXTRACT(MONTH FROM fecha) AS mes, SUM(cantidad) AS total " +
                "FROM movimiento_inventario WHERE tipo_movimiento = 'Entrada' " +
                "GROUP BY anio, mes ORDER BY anio DESC, mes DESC";
        return jdbcTemplate.query(sql, (rs, rowNum) ->
                new MetricaMensualDTO(
                        rs.getInt("anio"),
                        rs.getInt("mes"),
                        rs.getInt("total")
                )
        );
    }

    public List<MetricaMensualDTO> obtenerEgresosPorMes() {
        String sql = "SELECT EXTRACT(YEAR FROM fecha) AS anio, EXTRACT(MONTH FROM fecha) AS mes, SUM(cantidad) AS total " +
                "FROM movimiento_inventario WHERE tipo_movimiento = 'Salida' " +
                "GROUP BY anio, mes ORDER BY anio DESC, mes DESC";
        return jdbcTemplate.query(sql, (rs, rowNum) ->
                new MetricaMensualDTO(
                        rs.getInt("anio"),
                        rs.getInt("mes"),
                        rs.getInt("total")
                )
        );
    }

    public List<MetricaMensualDTO> obtenerValorIngresosPorMes() {
        String sql = "SELECT EXTRACT(YEAR FROM fecha) AS anio, EXTRACT(MONTH FROM fecha) AS mes, SUM(mi.cantidad * p.precio) AS total " +
                "FROM movimiento_inventario mi JOIN producto p ON mi.id_producto = p.id_producto " +
                "WHERE mi.tipo_movimiento = 'Entrada' " +
                "GROUP BY anio, mes ORDER BY anio DESC, mes DESC";
        return jdbcTemplate.query(sql, (rs, rowNum) ->
                new MetricaMensualDTO(
                        rs.getInt("anio"),
                        rs.getInt("mes"),
                        rs.getInt("total")
                )
        );
    }

    public List<MetricaMensualDTO> obtenerValorEgresosPorMes() {
        String sql = "SELECT EXTRACT(YEAR FROM fecha) AS anio, EXTRACT(MONTH FROM fecha) AS mes, SUM(mi.cantidad * p.precio) AS total " +
                "FROM movimiento_inventario mi JOIN producto p ON mi.id_producto = p.id_producto " +
                "WHERE mi.tipo_movimiento = 'Salida' " +
                "GROUP BY anio, mes ORDER BY anio DESC, mes DESC";
        return jdbcTemplate.query(sql, (rs, rowNum) ->
                new MetricaMensualDTO(
                        rs.getInt("anio"),
                        rs.getInt("mes"),
                        rs.getInt("total")
                )
        );
    }

    public List<MetricaMensualDTO> obtenerCantidadIngresosPorMes() {
        String sql = "SELECT EXTRACT(YEAR FROM fecha) AS anio, EXTRACT(MONTH FROM fecha) AS mes, SUM(cantidad) AS total " +
                "FROM movimiento_inventario WHERE tipo_movimiento = 'Entrada' " +
                "GROUP BY anio, mes ORDER BY anio DESC, mes DESC";
        return jdbcTemplate.query(sql, (rs, rowNum) ->
                new MetricaMensualDTO(
                        rs.getInt("anio"),
                        rs.getInt("mes"),
                        rs.getInt("total")
                )
        );
    }

    public double obtenerValorTotalAlmacen() {
        String sql = "SELECT SUM(stock * precio) AS total FROM producto WHERE estado = TRUE";
        Double total = jdbcTemplate.queryForObject(sql, Double.class);
        return total != null ? total : 0.0;
    }
}
