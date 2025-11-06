-- =====================================================
-- DATOS INICIALES
-- =====================================================

-- =====================================================
-- USUARIOS
-- =====================================================
INSERT INTO usuario (id_usuario, nombre, correo, contrasena, rol)
VALUES 
('U001', 'Juan Pérez', 'juan@almacenpro.com', '1234', 'Administrador'),
('U002', 'Ana Torres', 'anamt@almacenpro.com', '1234', 'Administrador');

-- =====================================================
-- CATEGORÍAS
-- =====================================================
INSERT INTO categoria (id_categoria, nombre, descripcion, estado)
VALUES 
('C001', 'Accesorios', 'Periféricos y artículos complementarios', TRUE),
('C002', 'Computadoras', 'Equipos portátiles y de escritorio', TRUE);

-- =====================================================
-- PRODUCTOS
-- =====================================================
INSERT INTO producto (id_producto, nombre, precio, descripcion, id_categoria, stock, estado)
VALUES
('P001', 'Mouse óptico', 35.50, 'Mouse USB ergonómico', 'C001', 20, TRUE),
('P002', 'Laptop Lenovo', 2800.00, 'Laptop de 14 pulgadas con SSD', 'C002', 15, TRUE);

-- =====================================================
-- MOVIMIENTOS DE INVENTARIO
-- =====================================================
INSERT INTO movimiento_inventario (id_movimiento, tipo_movimiento, cantidad, id_producto, id_usuario)
VALUES
('M000001', 'Entrada', 20, 'P001', 'U001'),
('M000002', 'Salida', 5, 'P002', 'U002');
