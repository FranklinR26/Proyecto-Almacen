package com.example.demo.movimiento;

import java.util.List;

public interface MovimientoInventarioService {
    List<MovimientoInventario> listarMovimientos();
    void registrarMovimiento(MovimientoInventario movimiento);
    void eliminarMovimiento(String idMovimiento);
}
