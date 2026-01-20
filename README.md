# Diseño de Base de Datos - BT&Airways ✈️

Este repositorio contiene el modelado conceptual y lógico de datos desarrollado para la aerolínea **BT&Airways**. El proyecto busca solucionar los problemas de gestión de información en la venta de vuelos y optimizar la escalabilidad de la compañía.

## 📋 Descripción del Caso
BT&Airways, con 25 años en el mercado y una proyección de triplicar sus vuelos (actualmente 35,000), requiere una reingeniería de su base de datos. Este diseño cubre las necesidades de:
- Gestión de Flota (Aviones).
- Programación de Vuelos y Reservas.
- Administración de Personal (Pilotos y Administrativos).
- Control de Pasajeros y Equipaje.

## 🛠 Herramientas Utilizadas
- **Software:** Oracle SQL Data Modeler.
- **Notaciones:**
  - Modelo Lógico (Barker).
  - Modelo Relacional (Bachman/Ingeniería de la Información).

## 📂 Contenido del Repositorio
1. **Modelo Entidad-Relación (MER):** Diagramas completos con entidades, atributos y relaciones normalizadas.
2. **Diccionario de Datos:** Definición de tipos de datos (`VARCHAR2`, `NUMBER`, `DATE`) optimizados para el negocio.
3. **Archivos Fuente:** Proyecto exportado en formato `.dmd` (Oracle Data Modeler).

## 🚀 Características del Diseño
- **Herencia de Entidades:** Implementación de supertipos/subtipos para la entidad `Empleado` (Pilotos vs Administrativos), optimizando el almacenamiento de datos comunes (RUT, Dirección) y específicos (Horas de vuelo, Licencias).
- **Entidades Débiles:** Modelado de la relación `Pasajero` - `Equipaje` como dependiente/identificadora.
- **Integridad Referencial:** Definición estricta de claves primarias (PK) y foráneas (FK).

---
**Autor:** Daniel Ceballos  --- Catalina Hillmer

**Carrera:** Analista Programador Computacional
