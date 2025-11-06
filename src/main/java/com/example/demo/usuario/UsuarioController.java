package com.example.demo.usuario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

    private final UsuarioService usuarioService;

    public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    // Lista de usuarios activos
    @GetMapping("/list")
    public String listarUsuarios(HttpSession session, Model model) {
        // Obtener usuario logueado desde sesión
        String idSesion = (String) session.getAttribute("idUsuario");
        Usuario usuarioActual = null;

        if (idSesion != null) {
            usuarioActual = usuarioService.obtenerUsuarioPorId(idSesion);
        }

        // Lista de usuarios activos
        List<Usuario> usuarios = usuarioService.listarUsuarios();

        model.addAttribute("usuario", usuarioActual);
        model.addAttribute("usuarios", usuarios);

        return "perfil"; // JSP asociado al perfil o lista de usuarios
    }

    // Registro de nuevo usuario
    @PostMapping("/registrar")
    public String registrarUsuario(
        @RequestParam String nombre,
        @RequestParam String correo,
        @RequestParam String contrasena,
        @RequestParam(defaultValue = "Administrador") String rol
    ) {
        Usuario nuevo = new Usuario(
            UUID.randomUUID().toString().substring(0, 8),
            nombre,
            correo,
            contrasena,
            rol,
            LocalDate.now()
        );
        usuarioService.registrarUsuario(nuevo);
        return "redirect:/usuarios/list";
    }

    // Eliminación lógica de usuario
    @GetMapping("/eliminar/{id}")
    public String eliminarUsuario(@PathVariable("id") String idUsuario) {
        usuarioService.eliminarUsuario(idUsuario);
        return "redirect:/usuarios/list";
    }

    // Perfil del usuario logueado
    @GetMapping({"/perfil", "/auth/perfil"})
    public String mostrarPerfil(HttpSession session, Model model) {
        String idSesion = (String) session.getAttribute("idUsuario");

        if (idSesion == null) {
            return "redirect:/auth/login";
        }

        Usuario usuarioActual = usuarioService.obtenerUsuarioPorId(idSesion);

        if (usuarioActual == null) {
            return "redirect:/auth/login";
        }

        List<Usuario> usuarios = usuarioService.listarUsuarios();

        model.addAttribute("usuario", usuarioActual);
        model.addAttribute("usuarios", usuarios);

        return "perfil";
    }

    // Edición de usuario
    @PostMapping("/editar")
    public String editarUsuario(@RequestParam String idUsuario,
                                @RequestParam String nombre,
                                @RequestParam String correo,
                                @RequestParam String rol,
                                HttpSession session) {
        Usuario existente = usuarioService.obtenerUsuarioPorId(idUsuario);
        if (existente != null) {
            existente.setNombre(nombre);
            existente.setCorreo(correo);
            existente.setRol(rol);
            usuarioService.actualizarUsuario(existente);

            // 🔹 Actualizar sesión si es el usuario logueado
            String idSesion = (String) session.getAttribute("idUsuario");
            if (idSesion != null && idSesion.equals(idUsuario)) {
                session.setAttribute("nombreUsuario", nombre);
                session.setAttribute("rolUsuario", rol);
            }
        }

        return "redirect:/usuarios/list";
    }
}
