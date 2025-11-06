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
        // Buscar si existe otro usuario con ese correo
        Usuario porCorreo = usuarioDAO.obtenerPorCorreo(usuario.getCorreo());
        if (porCorreo != null && !porCorreo.getIdUsuario().equals(usuario.getIdUsuario())) {
            // Hay otro usuario con el mismo correo -> lanzar excepción controlada
            throw new IllegalArgumentException("El correo '" + usuario.getCorreo() + "' ya está en uso por otro usuario.");
        }
        // Si todo ok, actualizar
        usuarioDAO.actualizarUsuario(usuario);
    }

}
