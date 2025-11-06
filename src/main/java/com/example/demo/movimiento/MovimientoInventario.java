package com.example.demo.movimiento;

import java.time.LocalDateTime;

public class MovimientoInventario {
    private String idMovimiento;
    private String tipoMovimiento; // Entrada o Salida
    private int cantidad;
    private LocalDateTime fecha;
    private String idProducto;
    private String idUsuario;

    public MovimientoInventario() {}

    public MovimientoInventario(String idMovimiento, String tipoMovimiento, int cantidad,
                                LocalDateTime fecha, String idProducto, String idUsuario) {
        this.idMovimiento = idMovimiento;
        this.tipoMovimiento = tipoMovimiento;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.idProducto = idProducto;
        this.idUsuario = idUsuario;
    }

    public String getIdMovimiento() {
        return idMovimiento;
    }

    public void setIdMovimiento(String idMovimiento) {
        this.idMovimiento = idMovimiento;
    }

    public String getTipoMovimiento() {
        return tipoMovimiento;
    }

    public void setTipoMovimiento(String tipoMovimiento) {
        this.tipoMovimiento = tipoMovimiento;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public LocalDateTime getFecha() {
        return fecha;
    }

    public void setFecha(LocalDateTime fecha) {
        this.fecha = fecha;
    }

    public String getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(String idProducto) {
        this.idProducto = idProducto;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }
}
