package com.example.demo.categoria;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class CategoriaServiceImpl implements CategoriaService {

    private final CategoriaDAO categoriaDAO;

    public CategoriaServiceImpl(CategoriaDAO categoriaDAO) {
        this.categoriaDAO = categoriaDAO;
    }

    @Override
    public List<Categoria> listarCategorias() {
        return categoriaDAO.listarCategorias();
    }

    @Override
    public Categoria obtenerPorId(String idCategoria) {
        return categoriaDAO.obtenerPorId(idCategoria);
    }

    @Override
    public void crearCategoria(Categoria categoria) {
        categoriaDAO.crearCategoria(categoria);
    }

    @Override
    public void eliminarCategoria(String idCategoria) {
        categoriaDAO.eliminarCategoria(idCategoria);
    }

    @Override
    public void actualizarCategoria(Categoria categoria) {
        categoriaDAO.actualizarCategoria(categoria);
    }
}
