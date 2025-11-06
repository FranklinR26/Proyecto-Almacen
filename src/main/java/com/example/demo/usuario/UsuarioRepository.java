package com.example.demo.usuario;

import java.sql.Date;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioRepository implements UsuarioDAO {

    private final JdbcTemplate jdbcTemplate;

    public UsuarioRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Usuario> usuarioRowMapper = (rs, rowNum) ->
        new Usuario(
            rs.getString("id_usuario"),
            rs.getString("nombre"),
            rs.getString("correo"),
            rs.getString("contrasena"),
            rs.getString("rol"),
            rs.getDate("fecha_registro").toLocalDate(),
            rs.getBoolean("estado")
        );

    @Override
    public List<Usuario> listarUsuarios() {
        String sql = "SELECT * FROM usuario WHERE estado = TRUE ORDER BY fecha_registro DESC";
        return jdbcTemplate.query(sql, usuarioRowMapper);
    }

    @Override
    public Usuario obtenerUsuarioPorId(String idUsuario) {
        String sql = "SELECT * FROM usuario WHERE id_usuario = ?";
        List<Usuario> result = jdbcTemplate.query(sql, usuarioRowMapper, idUsuario);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public void registrarUsuario(Usuario usuario) {

        String sqlUltimoId = "SELECT id_usuario FROM usuario ORDER BY id_usuario DESC LIMIT 1";
        String ultimoId = null;

        try {
            ultimoId = jdbcTemplate.queryForObject(sqlUltimoId, String.class);
        } catch (Exception e) {
        }

        String nuevoId;
        if (ultimoId != null && ultimoId.matches("U\\d{3}")) {
            int numero = Integer.parseInt(ultimoId.substring(1)) + 1;
            nuevoId = String.format("U%03d", numero);
        } else {
            nuevoId = "U001";
        }

        String sql = "INSERT INTO usuario (id_usuario, nombre, correo, contrasena, rol, fecha_registro, estado) VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
            nuevoId,
            usuario.getNombre(),
            usuario.getCorreo(),
            usuario.getContrasena(),
            usuario.getRol(),
            Date.valueOf(usuario.getFechaRegistro()),
            true
        );
    }


    @Override
    public void eliminarUsuario(String idUsuario) {
        String sql = "UPDATE usuario SET estado = FALSE WHERE id_usuario = ?";
        jdbcTemplate.update(sql, idUsuario);
    }

    @Override
    public Usuario obtenerPorCorreo(String correo) {
        String sql = "SELECT * FROM usuario WHERE correo = ? AND estado = TRUE";
        List<Usuario> result = jdbcTemplate.query(sql, usuarioRowMapper, correo);
        return result.isEmpty() ? null : result.get(0);
    }

    @Override
    public void actualizarUsuario(Usuario usuario) {
        String sql = "UPDATE usuario SET nombre = ?, correo = ?, rol = ? WHERE id_usuario = ?";
        jdbcTemplate.update(sql,
            usuario.getNombre(),
            usuario.getCorreo(),
            usuario.getRol(),
            usuario.getIdUsuario()
        );
    }


}
