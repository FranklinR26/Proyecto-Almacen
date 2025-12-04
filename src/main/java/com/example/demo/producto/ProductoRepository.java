package com.example.demo.producto;

import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ProductoRepository implements ProductoDAO {

    private final JdbcTemplate jdbcTemplate;

    public ProductoRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Producto> productoRowMapper = (rs, rowNum) ->
        new Producto(
            rs.getString("id_producto"),
            rs.getString("nombre"),
            rs.getDouble("precio"),
            rs.getString("descripcion"),
            rs.getString("id_categoria"),
            rs.getInt("stock"),
            rs.getBoolean("estado")
        );


    @Override
    public List<Producto> listarProductos() {
        String sql = "SELECT * FROM producto WHERE estado = TRUE ORDER BY id_producto";
        return jdbcTemplate.query(sql, productoRowMapper);
    }

    @Override
    public Producto obtenerPorId(String idProducto) {
        String sql = "SELECT * FROM producto WHERE id_producto = ?";
        List<Producto> result = jdbcTemplate.query(sql, productoRowMapper, idProducto);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public void crearProducto(Producto producto) {
        String sql = "INSERT INTO producto (id_producto, nombre, precio, descripcion, id_categoria, stock) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, producto.getIdProducto(), producto.getNombre(), producto.getPrecio(), producto.getDescripcion(), producto.getIdCategoria(), producto.getStock());
    }

    @Override
    public void eliminarProducto(String idProducto) {
        String sql = "UPDATE producto SET estado = FALSE WHERE id_producto = ?";
        jdbcTemplate.update(sql, idProducto);
    }

    @Override
    public void actualizarProducto(Producto producto) {
        String sql = "UPDATE producto SET nombre = ?, precio = ?, descripcion = ?, id_categoria = ?, stock = ? WHERE id_producto = ?";
        jdbcTemplate.update(sql,
            producto.getNombre(),
            producto.getPrecio(),
            producto.getDescripcion(),
            producto.getIdCategoria(),
            producto.getStock(),
            producto.getIdProducto()
        );
    }

    @Override
    public Producto obtenerPorIdIncluyendoInactivos(String idProducto) {
        String sql = "SELECT * FROM producto WHERE id_producto = ?";
        List<Producto> result = jdbcTemplate.query(sql, productoRowMapper, idProducto);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public Producto obtenerPorNombreIncluyendoInactivos(String nombre) {
        String sql = "SELECT * FROM producto WHERE LOWER(nombre) = LOWER(?)";
        List<Producto> result = jdbcTemplate.query(sql, productoRowMapper, nombre);
        return result.isEmpty() ? null : result.get(0);
    }

}
