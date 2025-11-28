package com.example.demo.producto;

import java.util.List;

public interface ProductoService {
    List<Producto> listarProductos();
    Producto obtenerPorId(String idProducto);
    void crearProducto(Producto producto);
    void eliminarProducto(String idProducto);
    void actualizarProducto(Producto producto);
}