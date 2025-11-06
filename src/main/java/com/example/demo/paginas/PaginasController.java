package com.example.demo.paginas;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaginasController {

    @GetMapping("/")
    public String inicio(HttpSession session) {
        if (session.getAttribute("idUsuario") != null) {
            return "redirect:/home";
        }
        return "redirect:/auth/login";
    }

    @GetMapping("/ayuda")
    public String ayuda() {
        return "ayuda";
    }

    @GetMapping("/contacto")
    public String contacto() {
        return "contacto";
    }

    @GetMapping("/home")
    public String home() {
        return "index";
    }

    @GetMapping("/publicidad")
    public String publicidad() {
        return "publicidad";
    }

    @GetMapping("/metricas")
    public String metricas() {
        return "metricas";
    }

    @GetMapping("/gestion")
    public String redirigirGestion() {
        return "redirect:/movimientos/list";
    }

    @GetMapping("/perfil")
    public String mostrarPerfil() {
        return "redirect:/auth/perfil";
    }
}
