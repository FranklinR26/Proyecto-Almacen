package com.example.demo.categoria;

import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class CategoriaRepository implements CategoriaDAO {

    private final JdbcTemplate jdbcTemplate;

    public CategoriaRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Categoria> categoriaRowMapper = (rs, rowNum) ->
        new Categoria(
            rs.getString("id_categoria"),
            rs.getString("nombre"),
            rs.getString("descripcion"),
            rs.getBoolean("estado")
        );

    @Override
    public List<Categoria> listarCategorias() {
        String sql = "SELECT * FROM categoria WHERE estado = TRUE ORDER BY id_categoria";
        return jdbcTemplate.query(sql, categoriaRowMapper);
    }

    @Override
    public Categoria obtenerPorId(String idCategoria) {
        String sql = "SELECT * FROM categoria WHERE id_categoria = ?";
        List<Categoria> result = jdbcTemplate.query(sql, categoriaRowMapper, idCategoria);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public void crearCategoria(Categoria categoria) {
        String sql = "INSERT INTO categoria (id_categoria, nombre, descripcion) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, categoria.getIdCategoria(), categoria.getNombre(), categoria.getDescripcion());
    }

    @Override
    public void eliminarCategoria(String idCategoria) {
        String sql = "UPDATE categoria SET estado = FALSE WHERE id_categoria = ?";
        jdbcTemplate.update(sql, idCategoria);
    }

    @Override
    public void actualizarCategoria(Categoria categoria) {
        String sql = "UPDATE categoria SET nombre = ?, descripcion = ? WHERE id_categoria = ?";
        jdbcTemplate.update(sql, categoria.getNombre(), categoria.getDescripcion(), categoria.getIdCategoria());
    }

    @Override
    public int contarProductosPorCategoria(String idCategoria) {
        String sql = "SELECT COUNT(*) FROM producto WHERE id_categoria = ? AND estado = TRUE";
        return jdbcTemplate.queryForObject(sql, Integer.class, idCategoria);
    }

    @Override
    public Categoria obtenerPorIdIncluyendoInactivos(String idCategoria) {
        String sql = "SELECT * FROM categoria WHERE id_categoria = ?";
        List<Categoria> result = jdbcTemplate.query(sql, categoriaRowMapper, idCategoria);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public Categoria obtenerPorNombreIncluyendoInactivos(String nombre) {
        String sql = "SELECT * FROM categoria WHERE LOWER(nombre) = LOWER(?)";
        List<Categoria> result = jdbcTemplate.query(sql, categoriaRowMapper, nombre);
        return result.isEmpty() ? null : result.get(0);
    }

}
