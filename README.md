# Diseño de Base de Datos - HiLogic Solutions 💻

Este repositorio contiene el modelado de datos conceptual (MER) y lógico (Relacional) para **HiLogic Solutions**, una empresa de comercialización de tecnología. El proyecto aborda desafíos de escalabilidad, gestión de inventario y jerarquías complejas de personal y clientes.

## 📋 Descripción del Caso
HiLogic Solutions cuenta con 8 sucursales y planea expansión. El sistema de bases de datos diseñado soluciona problemas de:
- **Control de Inventario:** Gestión de productos, stock y precios.
- **Jerarquías de Clientes:** Segmentación en Clientes VIP (descuento porcentual) y Normales (descuento fijo).
- **Recursos Humanos:** Manejo de contratos diferenciados para trabajadores indefinidos (con beneficios) y pasantes.
- **Ventas:** Registro detallado de boletas y transacciones.

## 🛠 Herramientas y Metodología
- **Software:** Oracle SQL Data Modeler.
- **Modelo Extendido (MER-E):** Implementación de supertipos y subtipos para manejar especializaciones.
- **Notaciones:** Barker (Conceptual) y Bachman (Relacional/Ingeniería).

## 🚀 Puntos Fuertes del Diseño
1. **Manejo de Jerarquías:**
   - Implementación de herencia exclusiva para `Trabajadores` (Indefinido vs Pasante).
   - Especialización de `Clientes` según reglas de fidelización.
2. **Integridad de Datos:**
   - Uso de relaciones identificadoras para el detalle de ventas (`Detalle_Boleta`).
   - Restricciones de unicidad y obligatoriedad según reglas de negocio.
3. **Optimización de Tipos:**
   - Uso de `NUMBER(3,1)` para porcentajes precisos.
   - Definición correcta de claves compuestas.

---
**Autor:** Daniel Ceballos Troncoso 
**Carrera:** Analista Programador Computacional
