package com.example.demo.categoria;

public class Categoria {
    private String idCategoria;
    private String nombre;
    private String descripcion;
    private boolean estado; 

    public Categoria() {}

    public Categoria(String idCategoria, String nombre, String descripcion, boolean estado) {
        this.idCategoria = idCategoria;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.estado = estado;
    }

    public Categoria(String idCategoria, String nombre, String descripcion) {
        this(idCategoria, nombre, descripcion, true);
    }

    // getters y setters
    public String getIdCategoria() { return idCategoria; }
    public void setIdCategoria(String idCategoria) { this.idCategoria = idCategoria; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public boolean isEstado() { return estado; }
    public void setEstado(boolean estado) { this.estado = estado; }
}
