package com.example.demo.usuario;

import java.util.List;

public interface UsuarioDAO {
    List<Usuario> listarUsuarios();
    Usuario obtenerUsuarioPorId(String idUsuario);
    void registrarUsuario(Usuario usuario);
    void eliminarUsuario(String idUsuario);
    Usuario obtenerPorCorreo(String correo);
    void actualizarUsuario(Usuario usuario);

}
