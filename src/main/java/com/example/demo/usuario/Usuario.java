package com.example.demo.usuario;

import java.time.LocalDate;

public class Usuario {
    private String idUsuario;
    private String nombre;
    private String correo;
    private String contrasena;
    private String rol;
    private LocalDate fechaRegistro;
    private boolean estado;

    public Usuario() {}

    // Constructor completo
    public Usuario(String idUsuario, String nombre, String correo, String contrasena, String rol, LocalDate fechaRegistro, boolean estado) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.correo = correo;
        this.contrasena = contrasena;
        this.rol = rol;
        this.fechaRegistro = fechaRegistro;
        this.estado = estado;
    }

    // Constructor simplificado para usuarios nuevos (fecha actual, estado = true)
    public Usuario(String idUsuario, String nombre, String correo, String contrasena, String rol) {
        this(idUsuario, nombre, correo, contrasena, rol, LocalDate.now(), true);
    }

    // Constructor que recibe fecha y asume estado = true
    public Usuario(String idUsuario, String nombre, String correo, String contrasena, String rol, LocalDate fechaRegistro) {
        this(idUsuario, nombre, correo, contrasena, rol, fechaRegistro, true);
    }

    // Getters y Setters
    public String getIdUsuario() { return idUsuario; }
    public void setIdUsuario(String idUsuario) { this.idUsuario = idUsuario; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }

    public String getContrasena() { return contrasena; }
    public void setContrasena(String contrasena) { this.contrasena = contrasena; }

    public String getRol() { return rol; }
    public void setRol(String rol) { this.rol = rol; }

    public LocalDate getFechaRegistro() { return fechaRegistro; }
    public void setFechaRegistro(LocalDate fechaRegistro) { this.fechaRegistro = fechaRegistro; }

    public boolean isEstado() { return estado; }
    public void setEstado(boolean estado) { this.estado = estado; }
}
