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
