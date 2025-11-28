package com.example.demo.home;

import com.example.demo.producto.ProductoService;
import com.example.demo.movimiento.MovimientoInventarioService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    private final ProductoService productoService;
    private final MovimientoInventarioService movimientoService;

    public HomeController(ProductoService productoService,
                          MovimientoInventarioService movimientoService) {
        this.productoService = productoService;
        this.movimientoService = movimientoService;
    }

    @GetMapping({"/","/home"})
    public String home(Model model) {

        // ⭐ Estadísticas principales
        model.addAttribute("totalProductos", productoService.contarProductos());
        model.addAttribute("stockBajo", productoService.contarStockBajo(5));

        // ⭐ Últimos movimientos (actividad reciente)
        model.addAttribute("ultimosMovimientos",
                movimientoService.listarMovimientos()
                    .stream()
                    .limit(5)
                    .toList()
        );

        return "index"; // tu JSP
    }
}
