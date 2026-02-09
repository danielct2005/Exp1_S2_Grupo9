# Diseño de Base de Datos - Caso Retail Solari S.A.

Este repositorio contiene la solución para la Evaluación Sumativa de la Semana 5, correspondiente a la asignatura de **Base de Datos**. El proyecto consiste en la normalización y modelado de datos para la empresa "Retail Solari S.A.".

## 📋 Información del Estudiante
* **Nombre:** Daniel Ceballos
* **Carrera:** Analista Programador
* **Fecha:** Febrero 2026

## 🚀 Descripción del Proyecto
El objetivo principal fue transformar un modelo conceptual incompleto en un **Modelo Relacional Normalizado (3FN)**, respetando las reglas de negocio de una empresa de retail con presencia nacional.

### Entregables incluidos:
1.  **Modelo Entidad-Relación Extendido (MER-E):** En notación Barker, incluyendo jerarquías y atributos obligatorios/opcionales.
2.  **Modelo Relacional:** Normalizado hasta la Tercera Forma Normal (3FN), con definición de Claves Primarias (PK) y Foráneas (FK).
3.  **Script SQL (DDL):** Código generado para la creación de tablas en Oracle Database (11g/12c).

## 🛠️ Herramientas Utilizadas
* **Oracle SQL Developer Data Modeler** (Versión 24.3)

## 🔍 Decisiones de Diseño Clave
Para cumplir con los requerimientos del caso, se implementaron las siguientes lógicas:

* **Jerarquía de Proveedores:** Se utilizó una relación de **Supertipo/Subtipo** exclusiva para diferenciar entre *Empresas* (con sitio web opcional) y *Personas Naturales* (con nombre y apellido).
* **Normalización de Venta:** Se creó la entidad asociativa `DETALLE_BOLETA` para resolver la relación muchos-a-muchos entre Boletas y Productos.
* **Identificadores Compuestos:** Se utilizaron relaciones identificadoras para entidades dependientes como `MODELO` y `DETALLE_BOLETA`.
* **Reglas de Negocio:** Se configuraron atributos opcionales (ej. `fecha_vencimiento` en Productos) y obligatorios según el enunciado.

## 📂 Estructura del Repositorio
```text
├── Script_DDL.sql          # Código SQL para crear la base de datos
├── Modelo_Logico.png       # Captura del diagrama MER-E (Barker)
├── Modelo_Relacional.png   # Captura del diagrama de tablas
├── Solari_Design.dmd       # Archivo fuente de Data Modeler
└── README.md               # Este archivo
