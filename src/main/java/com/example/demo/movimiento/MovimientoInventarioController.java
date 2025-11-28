package com.example.demo.movimiento;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/movimientos")
public class MovimientoInventarioController {

    private final MovimientoInventarioService movimientoService;

    public MovimientoInventarioController(MovimientoInventarioService movimientoService) {
        this.movimientoService = movimientoService;
    }

    @GetMapping("/list")
    public String listarMovimientos(Model model, HttpSession session) {
        // 🔹 Obtener movimientos
        List<MovimientoInventario> movimientos = movimientoService.listarMovimientos();
        model.addAttribute("movimientos", movimientos);

        // 🔹 Agregar datos del usuario logueado a la vista
        model.addAttribute("idUsuario", session.getAttribute("idUsuario"));
        model.addAttribute("nombreUsuario", session.getAttribute("nombreUsuario"));

        return "gestion"; // tu vista JSP de gestión de inventario
    }

    @PostMapping("/registrar")
    public String registrarMovimiento(
            @RequestParam String tipo,
            @RequestParam int cantidad,
            @RequestParam String idProducto,
            @RequestParam String idUsuario,
            Model model,
            HttpSession session
    ) {
        try {
            MovimientoInventario movimiento = new MovimientoInventario(
                    UUID.randomUUID().toString().substring(0, 8),
                    tipo,
                    cantidad,
                    LocalDateTime.now(),
                    idProducto,
                    idUsuario
            );

            movimientoService.registrarMovimiento(movimiento);
            return "redirect:/movimientos/list";

        } catch (IllegalArgumentException e) {

            // Volvemos a cargar todo lo necesario para que el JSP funcione
            model.addAttribute("movimientos", movimientoService.listarMovimientos());
            model.addAttribute("idUsuario", session.getAttribute("idUsuario"));
            model.addAttribute("nombreUsuario", session.getAttribute("nombreUsuario"));

            // enviamos el mensaje
            model.addAttribute("error", e.getMessage());

            return "gestion"; // volver al JSP con el error visible
        }
    }

    @GetMapping("/eliminar/{id}")
    public String eliminarMovimiento(@PathVariable("id") String idMovimiento) {
        movimientoService.eliminarMovimiento(idMovimiento);
        return "redirect:/movimientos/list";
    }
}
