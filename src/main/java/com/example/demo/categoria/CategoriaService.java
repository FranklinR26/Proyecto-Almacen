package com.example.demo.categoria;

import java.util.List;

public interface CategoriaService {
    List<Categoria> listarCategorias();
    Categoria obtenerPorId(String idCategoria);
    void crearCategoria(Categoria categoria);
    void eliminarCategoria(String idCategoria);
    void actualizarCategoria(Categoria categoria);
    Categoria obtenerPorIdIncluyendoInactivos(String idCategoria);
    Categoria obtenerPorNombreIncluyendoInactivos(String nombre);
}