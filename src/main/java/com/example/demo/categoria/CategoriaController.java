package com.example.demo.categoria;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/categoria")
public class CategoriaController {

    private final CategoriaService categoriaService;

    public CategoriaController(CategoriaService categoriaService) {
        this.categoriaService = categoriaService;
    }

    @GetMapping("/list")
    public String listarCategorias(Model model,
                                   @ModelAttribute("error") String error,
                                   @ModelAttribute("success") String success) {
        List<Categoria> categorias = categoriaService.listarCategorias();
        model.addAttribute("categorias", categorias);

        if (error != null && !error.isEmpty()) model.addAttribute("error", error);
        if (success != null && !success.isEmpty()) model.addAttribute("success", success);

        return "CRUD_catalogo";
    }

    @PostMapping("/crear")
    public String crearCategoria(Categoria categoria, RedirectAttributes attr) {
        try {
            categoriaService.crearCategoria(categoria);
            attr.addFlashAttribute("success", "Categoría creada correctamente.");
        } catch (IllegalStateException e) {
            attr.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/categoria/list";
    }

    @GetMapping("/eliminar/{id}")
    public String eliminarCategoria(@PathVariable("id") String idCategoria, RedirectAttributes attr) {
        try {
            categoriaService.eliminarCategoria(idCategoria);
            attr.addFlashAttribute("success", "Categoría eliminada correctamente.");
        } catch (IllegalStateException e) {
            attr.addFlashAttribute("error", e.getMessage());
        }

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
    public String actualizarCategoria(@ModelAttribute Categoria categoria, RedirectAttributes attr) {
        categoriaService.actualizarCategoria(categoria);
        attr.addFlashAttribute("success", "Categoría actualizada correctamente.");
        return "redirect:/categoria/list";
    }
}
