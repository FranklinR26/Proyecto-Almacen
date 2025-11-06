package com.example.demo.config;

import com.example.demo.usuario.Usuario;
import com.example.demo.usuario.UsuarioService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.ui.Model;

@ControllerAdvice
public class UsuarioControllerAdvice {

    private final UsuarioService usuarioService;

    @Autowired
    public UsuarioControllerAdvice(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    /**
     * Este método se ejecuta antes de cualquier controlador y agrega el usuario
     * logueado al modelo, para que todos los JSP puedan usar ${usuario}.
     */
    @ModelAttribute
    public void agregarUsuarioAlModelo(HttpSession session, Model model) {
        String idUsuario = (String) session.getAttribute("idUsuario");
        if (idUsuario != null) {
            Usuario usuario = usuarioService.obtenerUsuarioPorId(idUsuario);
            if (usuario != null) {
                model.addAttribute("usuario", usuario);
            }
        }
    }
}
