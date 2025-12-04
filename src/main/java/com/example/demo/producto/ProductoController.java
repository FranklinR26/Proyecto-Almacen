package com.example.demo.producto;

import com.example.demo.categoria.CategoriaService; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/producto")
public class ProductoController {

    private final ProductoService productoService;
    private final CategoriaService categoriaService; 

    public ProductoController(ProductoService productoService, CategoriaService categoriaService) {
        this.productoService = productoService;
        this.categoriaService = categoriaService;
    }

    @GetMapping("/list")
    public String listarProductos(Model model) {
        List<Producto> productos = productoService.listarProductos();
        model.addAttribute("productos", productos);
        model.addAttribute("categorias", categoriaService.listarCategorias());
        return "CRUD_producto"; // Tu vista JSP
    }

    @PostMapping("/crear")
    public String crearProducto(@ModelAttribute Producto producto, RedirectAttributes attr) {
        try {
            productoService.crearProducto(producto);
            attr.addFlashAttribute("success", "Producto creado correctamente.");
        } catch (IllegalStateException e) {
            attr.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/producto/list";
    }


    @GetMapping("/eliminar/{id}")
    public String eliminarProducto(@PathVariable("id") String idProducto) {
        productoService.eliminarProducto(idProducto);
        return "redirect:/producto/list";
    }

    @GetMapping("/editar/{id}")
    public String editarProducto(@PathVariable("id") String idProducto, Model model) {
        Producto producto = productoService.obtenerPorId(idProducto);
        model.addAttribute("producto", producto);
        model.addAttribute("productos", productoService.listarProductos());
        model.addAttribute("categorias", categoriaService.listarCategorias()); 
        model.addAttribute("modoEdicion", true);
        return "CRUD_producto";
    }

    @PostMapping("/actualizar")
    public String actualizarProducto(@ModelAttribute Producto producto) {
        productoService.actualizarProducto(producto);
        return "redirect:/producto/list";
    }

}