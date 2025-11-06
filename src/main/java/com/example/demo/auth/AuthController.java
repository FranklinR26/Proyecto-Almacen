package com.example.demo.auth;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.example.demo.usuario.Usuario;
import com.example.demo.usuario.UsuarioService;
import jakarta.servlet.http.HttpSession;

import java.time.LocalDate;

@Controller
@RequestMapping("/auth")
public class AuthController {

    private final UsuarioService usuarioService;

    public AuthController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    // Mostrar formulario de login
    @GetMapping("/login")
    public String mostrarLogin() {
        return "login"; // login.jsp
    }

    // Procesar login
    @PostMapping("/login")
    public String procesarLogin(@RequestParam String correo, 
                                @RequestParam String contrasena, 
                                Model model, 
                                HttpSession session) {
        Usuario usuario = usuarioService.obtenerPorCorreo(correo);

        if (usuario == null) {
            model.addAttribute("error", "Usuario no encontrado o eliminado");
            return "login";
        }

        if (!usuario.getContrasena().equals(contrasena)) {
            model.addAttribute("error", "Contraseña incorrecta");
            return "login";
        }

        // Credenciales correctas
        session.setAttribute("idUsuario", usuario.getIdUsuario());
        session.setAttribute("nombreUsuario", usuario.getNombre());
        session.setAttribute("rolUsuario", usuario.getRol());
        return "redirect:/home";
    }

    // Mostrar formulario de registro
    @GetMapping("/registro")
    public String mostrarRegistro() {
        return "registro"; // registro.jsp
    }

    // Procesar registro
    @PostMapping("/registro")
    public String procesarRegistro(@RequestParam String nombre,
                                   @RequestParam String correo,
                                   @RequestParam String contrasena,
                                   Model model) {
        // Validar si ya existe un usuario con ese correo
        Usuario existente = usuarioService.obtenerPorCorreo(correo);
        if (existente != null) {
            model.addAttribute("error", "El correo ya está registrado");
            return "registro";
        }

        // Crear nuevo usuario
        Usuario nuevo = new Usuario();
        nuevo.setIdUsuario("U" + System.currentTimeMillis()); // ID simple
        nuevo.setNombre(nombre);
        nuevo.setCorreo(correo);
        nuevo.setContrasena(contrasena);
        nuevo.setRol("Almacenero"); // rol por defecto
        nuevo.setFechaRegistro(LocalDate.now());
        nuevo.setEstado(true); // usuario activo

        usuarioService.registrarUsuario(nuevo);

        model.addAttribute("mensaje", "Registro exitoso. Ahora puedes iniciar sesión.");
        return "login";
    }

    // Mostrar perfil
    @GetMapping("/perfil")
    public String mostrarPerfil(HttpSession session, Model model) {
        String idUsuario = (String) session.getAttribute("idUsuario");

        if (idUsuario == null) {
            return "redirect:/auth/login";
        }

        Usuario usuario = usuarioService.obtenerUsuarioPorId(idUsuario);

        // Verificar si el usuario fue eliminado
        if (usuario == null || !usuario.isEstado()) {
            session.invalidate(); // cerrar sesión si estaba abierta
            return "redirect:/auth/login";
        }

        model.addAttribute("usuario", usuario);
        model.addAttribute("usuarios", usuarioService.listarUsuarios());
        return "perfil";
    }

    // Opcional: cerrar sesión
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/auth/login";
    }
}
