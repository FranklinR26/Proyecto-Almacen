package com.example.demo.movimiento;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class MovimientoInventarioServiceImpl implements MovimientoInventarioService {

    private final MovimientoInventarioDAO movimientoDAO;

    public MovimientoInventarioServiceImpl(MovimientoInventarioDAO movimientoDAO) {
        this.movimientoDAO = movimientoDAO;
    }

    @Override
    public List<MovimientoInventario> listarMovimientos() {
        return movimientoDAO.listarMovimientos();
    }

    @Override
    public void registrarMovimiento(MovimientoInventario movimiento) {
        movimientoDAO.registrarMovimiento(movimiento);
    }

    @Override
    public void eliminarMovimiento(String idMovimiento) {
        movimientoDAO.eliminarMovimiento(idMovimiento);
    }
}
