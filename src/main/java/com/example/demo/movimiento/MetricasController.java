package com.example.demo.movimiento;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.demo.movimiento.MetricaMensualDTO;
import com.example.demo.movimiento.MovimientoInventarioRepository;
import java.util.List;

@RestController
@RequestMapping("/api/metricas")
public class MetricasController {
    private final MovimientoInventarioRepository movimientoRepo;

    @Autowired
    public MetricasController(MovimientoInventarioRepository movimientoRepo) {
        this.movimientoRepo = movimientoRepo;
    }

    @GetMapping("/ingresos-mensuales")
    public List<MetricaMensualDTO> ingresosMensuales() {
        return movimientoRepo.obtenerIngresosPorMes();
    }

    @GetMapping("/egresos-mensuales")
    public List<MetricaMensualDTO> egresosMensuales() {
        return movimientoRepo.obtenerEgresosPorMes();
    }

    @GetMapping("/valor-ingresos-mensuales")
    public List<MetricaMensualDTO> valorIngresosMensuales() {
        return movimientoRepo.obtenerValorIngresosPorMes();
    }

    @GetMapping("/valor-egresos-mensuales")
    public List<MetricaMensualDTO> valorEgresosMensuales() {
        return movimientoRepo.obtenerValorEgresosPorMes();
    }

    @GetMapping("/cantidad-ingresos-mensuales")
    public List<MetricaMensualDTO> cantidadIngresosMensuales() {
        return movimientoRepo.obtenerCantidadIngresosPorMes();
    }

    @GetMapping("/valor-total-almacen")
    public double valorTotalAlmacen() {
        return movimientoRepo.obtenerValorTotalAlmacen();
    }
}