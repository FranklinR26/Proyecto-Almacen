package com.example.demo.producto;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class ProductoServiceImpl implements ProductoService {

    private final ProductoDAO productoDAO;

    public ProductoServiceImpl(ProductoDAO productoDAO) {
        this.productoDAO = productoDAO;
    }

    @Override
    public List<Producto> listarProductos() {
        return productoDAO.listarProductos();
    }

    @Override
    public Producto obtenerPorId(String idProducto) {
        return productoDAO.obtenerPorId(idProducto);
    }

    @Override
    public void crearProducto(Producto producto) {

        // Validar ID
        Producto idExistente = productoDAO.obtenerPorIdIncluyendoInactivos(producto.getIdProducto());
        if (idExistente != null) {
            if (!idExistente.isEstado()) {
                throw new IllegalStateException("El código ingresado pertenece a un producto inactivo. Reactívalo para volver a usarlo.");
            } else {
                throw new IllegalStateException("El código ingresado ya existe. Usa uno diferente.");
            }
        }

        // Validar nombre
        Producto nombreExistente = productoDAO.obtenerPorNombreIncluyendoInactivos(producto.getNombre());
        if (nombreExistente != null) {
            if (!nombreExistente.isEstado()) {
                throw new IllegalStateException("El nombre ingresado pertenece a un producto inactivo. Reactívalo para volver a usarlo.");
            } else {
                throw new IllegalStateException("El nombre ingresado ya existe. Usa uno diferente.");
            }
        }

        productoDAO.crearProducto(producto);
    }


    @Override
    public void eliminarProducto(String idProducto) {
        productoDAO.eliminarProducto(idProducto);
    }

    @Override
    public void actualizarProducto(Producto producto) {
        // aquí podrías validar (por ejemplo, verificar categoría existente) antes de actualizar
        productoDAO.actualizarProducto(producto);
    }

}
