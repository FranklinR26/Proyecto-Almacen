package com.example.demo.producto;

public class Producto {
    private String idProducto;
    private String nombre;
    private double precio;
    private String descripcion;
    private String idCategoria;
    private boolean estado;
    private int stock;

    public Producto() {}

    public Producto(String idProducto, String nombre, double precio, String descripcion, String idCategoria, int stock, boolean estado) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.descripcion = descripcion;
        this.idCategoria = idCategoria;
        this.stock = stock;
        this.estado = estado;
    }

    public Producto(String idProducto, String nombre, double precio, String descripcion, String idCategoria) {
        this(idProducto, nombre, precio, descripcion, idCategoria, 0, true);
    }

    // Getters y Setters
    public String getIdProducto() { return idProducto; }
    public void setIdProducto(String idProducto) { this.idProducto = idProducto; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public double getPrecio() { return precio; }
    public void setPrecio(double precio) { this.precio = precio; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public String getIdCategoria() { return idCategoria; }
    public void setIdCategoria(String idCategoria) { this.idCategoria = idCategoria; }

    public boolean isEstado() { return estado; }
    public void setEstado(boolean estado) { this.estado = estado; }

    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }
}
