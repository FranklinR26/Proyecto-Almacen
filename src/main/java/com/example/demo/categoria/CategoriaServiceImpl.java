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
    public Categoria obtenerPorIdIncluyendoInactivos(String idCategoria) {
        return categoriaDAO.obtenerPorIdIncluyendoInactivos(idCategoria);
    }

    @Override
    public Categoria obtenerPorNombreIncluyendoInactivos(String nombre) {
        return categoriaDAO.obtenerPorNombreIncluyendoInactivos(nombre);
    }

    @Override
    public void crearCategoria(Categoria categoria) {

        // Validar ID
        Categoria idExistente = categoriaDAO.obtenerPorIdIncluyendoInactivos(categoria.getIdCategoria());
        if (idExistente != null) {
            if (!idExistente.isEstado()) {
                throw new IllegalStateException(
                        "El código ingresado pertenece a una categoría inactiva. Reactívala para volver a usarla.");
            } else {
                throw new IllegalStateException(
                        "El código ingresado ya existe. Usa uno diferente.");
            }
        }

        // Validar nombre
        Categoria nombreExistente = categoriaDAO.obtenerPorNombreIncluyendoInactivos(categoria.getNombre());
        if (nombreExistente != null) {
            if (!nombreExistente.isEstado()) {
                throw new IllegalStateException(
                        "El nombre ingresado pertenece a una categoría inactiva. Reactívala para volver a usarla.");
            } else {
                throw new IllegalStateException(
                        "El nombre ingresado ya existe. Usa uno diferente.");
            }
        }

        categoriaDAO.crearCategoria(categoria);
    }

    @Override
    public void eliminarCategoria(String idCategoria) {
        int cantidadProductos = categoriaDAO.contarProductosPorCategoria(idCategoria);
        if (cantidadProductos > 0) {
            throw new IllegalStateException("No se puede eliminar la categoría porque tiene productos asociados.");
        }

        categoriaDAO.eliminarCategoria(idCategoria);
    }

    @Override
    public void actualizarCategoria(Categoria categoria) {
        categoriaDAO.actualizarCategoria(categoria);
    }
}
