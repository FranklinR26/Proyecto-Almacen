package com.example.demo.usuario;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class UsuarioServiceImpl implements UsuarioService {

    private final UsuarioDAO usuarioDAO;

    public UsuarioServiceImpl(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

    @Override
    public List<Usuario> listarUsuarios() {
        return usuarioDAO.listarUsuarios();
    }

    @Override
    public Usuario obtenerUsuarioPorId(String idUsuario) {
        return usuarioDAO.obtenerUsuarioPorId(idUsuario);
    }

    @Override
    public void registrarUsuario(Usuario usuario) {
        usuarioDAO.registrarUsuario(usuario);
    }

    @Override
    public void eliminarUsuario(String idUsuario) {
        usuarioDAO.eliminarUsuario(idUsuario);
    }

    @Override
    public Usuario obtenerPorCorreo(String correo) {
        return usuarioDAO.obtenerPorCorreo(correo);
    }

    @Override
    public void actualizarUsuario(Usuario usuario) {
        Usuario porCorreo = usuarioDAO.obtenerPorCorreo(usuario.getCorreo());

        // Solo lanzar excepción si existe otro usuario distinto con ese correo
        if (porCorreo != null && !porCorreo.getIdUsuario().trim().equals(usuario.getIdUsuario().trim())) {
            throw new IllegalArgumentException(
                "El correo '" + usuario.getCorreo() + "' ya está en uso por otro usuario."
            );
        }

        // Actualizar normalmente
        usuarioDAO.actualizarUsuario(usuario);
    }

}
