package com.example.demo.categoria;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/categoria")
public class CategoriaController {

    private final CategoriaService categoriaService;

    public CategoriaController(CategoriaService categoriaService) {
        this.categoriaService = categoriaService;
    }

    @GetMapping("/list")
    public String listarCategorias(Model model) {
        List<Categoria> categorias = categoriaService.listarCategorias();
        model.addAttribute("categorias", categorias);
        return "CRUD_catalogo"; //Vista JSP
    }

    @PostMapping("/crear")
    public String crearCategoria(@ModelAttribute Categoria categoria) {
        categoriaService.crearCategoria(categoria);
        return "redirect:/categoria/list";
    }

    @GetMapping("/eliminar/{id}")
    public String eliminarCategoria(@PathVariable("id") String idCategoria) {
        categoriaService.eliminarCategoria(idCategoria);
        return "redirect:/categoria/list";
    }

    @GetMapping("/editar/{id}")
    public String editarCategoria(@PathVariable("id") String idCategoria, Model model) {
        Categoria categoria = categoriaService.obtenerPorId(idCategoria);
        model.addAttribute("categoria", categoria);
        model.addAttribute("categorias", categoriaService.listarCategorias());
        model.addAttribute("modoEdicion", true);
        return "CRUD_catalogo";
    }

    @PostMapping("/actualizar")
    public String actualizarCategoria(@ModelAttribute Categoria categoria) {
        categoriaService.actualizarCategoria(categoria);
        return "redirect:/categoria/list";
    }
}
