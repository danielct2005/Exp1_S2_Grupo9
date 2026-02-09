-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-02-09 12:26:06 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE BOLETA 
    ( 
     numero_boleta        INTEGER  NOT NULL , 
     fecha                DATE  NOT NULL , 
     monto_total          INTEGER  NOT NULL , 
     CLIENTE_rut_cliente  VARCHAR2 (12)  NOT NULL , 
     SUCURSAL_id_sucursal INTEGER  NOT NULL 
    ) 
;

ALTER TABLE BOLETA 
    ADD CONSTRAINT BOLETA_PK PRIMARY KEY ( numero_boleta ) ;

CREATE TABLE CATEGORIA 
    ( 
     id_categoria INTEGER  NOT NULL , 
     descripcion  VARCHAR2 (50)  NOT NULL 
    ) 
;

ALTER TABLE CATEGORIA 
    ADD CONSTRAINT CATEGORIA_PK PRIMARY KEY ( id_categoria ) ;

CREATE TABLE CLIENTE 
    ( 
     rut_cliente VARCHAR2 (12)  NOT NULL , 
     nombres     VARCHAR2 (50)  NOT NULL , 
     apellidos   VARCHAR2 (50)  NOT NULL , 
     direccion   VARCHAR2 (100)  NOT NULL 
    ) 
;

ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( rut_cliente ) ;

CREATE TABLE COMUNA 
    ( 
     id_comuna INTEGER  NOT NULL , 
     nombre    VARCHAR2 (50)  NOT NULL 
    ) 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_PK PRIMARY KEY ( id_comuna ) ;

CREATE TABLE DETALLE_BOLETA 
    ( 
     cantidad             INTEGER  NOT NULL , 
     precio_momento       INTEGER  NOT NULL , 
     subtotal             INTEGER  NOT NULL , 
     BOLETA_numero_boleta INTEGER  NOT NULL , 
     PRODUCTO_sku         VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE DETALLE_BOLETA 
    ADD CONSTRAINT DETALLE_BOLETA_PK PRIMARY KEY ( BOLETA_numero_boleta, PRODUCTO_sku ) ;

CREATE TABLE MARCA 
    ( 
     id_marca INTEGER  NOT NULL , 
     nombre   VARCHAR2 (50)  NOT NULL 
    ) 
;

ALTER TABLE MARCA 
    ADD CONSTRAINT MARCA_PK PRIMARY KEY ( id_marca ) ;

CREATE TABLE MODELO 
    ( 
     id_modelo      INTEGER  NOT NULL , 
     descripcion    VARCHAR2 (100)  NOT NULL , 
     MARCA_id_marca INTEGER  NOT NULL 
    ) 
;

ALTER TABLE MODELO 
    ADD CONSTRAINT MODELO_PK PRIMARY KEY ( id_modelo, MARCA_id_marca ) ;

CREATE TABLE PRODUCTO 
    ( 
     sku                    VARCHAR2 (20)  NOT NULL , 
     nombre                 VARCHAR2 (50)  NOT NULL , 
     precio_unitario        INTEGER  NOT NULL , 
     fecha_vencimiento      DATE , 
     CATEGORIA_id_categoria INTEGER  NOT NULL , 
     MODELO_id_modelo       INTEGER  NOT NULL , 
     PROVEEDOR_id_proveedor INTEGER  NOT NULL , 
     MODELO_MARCA_id_marca  INTEGER  NOT NULL 
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_PK PRIMARY KEY ( sku ) ;

CREATE TABLE PROVEEDOR 
    ( 
     id_proveedor   INTEGER  NOT NULL , 
     telefono       VARCHAR2 (15)  NOT NULL , 
     direccion      VARCHAR2 (100)  NOT NULL , 
     tipo_proveedor VARCHAR2 (1)  NOT NULL 
    ) 
;

ALTER TABLE PROVEEDOR 
    ADD CONSTRAINT PROVEEDOR_PK PRIMARY KEY ( id_proveedor ) ;

CREATE TABLE PROVEEDOR_EMPRESA 
    ( 
     id_proveedor INTEGER  NOT NULL , 
     sitio_web    VARCHAR2 (100) 
    ) 
;

ALTER TABLE PROVEEDOR_EMPRESA 
    ADD CONSTRAINT PROVEEDOR_EMPRESA_PK PRIMARY KEY ( id_proveedor ) ;

CREATE TABLE PROVEEDOR_PERSONA 
    ( 
     id_proveedor INTEGER  NOT NULL , 
     nombres      VARCHAR2 (50)  NOT NULL , 
     apellidos    VARCHAR2 (50)  NOT NULL 
    ) 
;

ALTER TABLE PROVEEDOR_PERSONA 
    ADD CONSTRAINT PROVEEDOR_PERSONA_PK PRIMARY KEY ( id_proveedor ) ;

CREATE TABLE SUCURSAL 
    ( 
     id_sucursal      INTEGER  NOT NULL , 
     direccion        VARCHAR2 (100)  NOT NULL , 
     COMUNA_id_comuna INTEGER  NOT NULL 
    ) 
;

ALTER TABLE SUCURSAL 
    ADD CONSTRAINT SUCURSAL_PK PRIMARY KEY ( id_sucursal ) ;

ALTER TABLE BOLETA 
    ADD CONSTRAINT BOLETA_CLIENTE_FK FOREIGN KEY 
    ( 
     CLIENTE_rut_cliente
    ) 
    REFERENCES CLIENTE 
    ( 
     rut_cliente
    ) 
;

ALTER TABLE BOLETA 
    ADD CONSTRAINT BOLETA_SUCURSAL_FK FOREIGN KEY 
    ( 
     SUCURSAL_id_sucursal
    ) 
    REFERENCES SUCURSAL 
    ( 
     id_sucursal
    ) 
;

ALTER TABLE DETALLE_BOLETA 
    ADD CONSTRAINT DETALLE_BOLETA_BOLETA_FK FOREIGN KEY 
    ( 
     BOLETA_numero_boleta
    ) 
    REFERENCES BOLETA 
    ( 
     numero_boleta
    ) 
;

ALTER TABLE DETALLE_BOLETA 
    ADD CONSTRAINT DETALLE_BOLETA_PRODUCTO_FK FOREIGN KEY 
    ( 
     PRODUCTO_sku
    ) 
    REFERENCES PRODUCTO 
    ( 
     sku
    ) 
;

ALTER TABLE MODELO 
    ADD CONSTRAINT MODELO_MARCA_FK FOREIGN KEY 
    ( 
     MARCA_id_marca
    ) 
    REFERENCES MARCA 
    ( 
     id_marca
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_CATEGORIA_FK FOREIGN KEY 
    ( 
     CATEGORIA_id_categoria
    ) 
    REFERENCES CATEGORIA 
    ( 
     id_categoria
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_MODELO_FK FOREIGN KEY 
    ( 
     MODELO_id_modelo,
     MODELO_MARCA_id_marca
    ) 
    REFERENCES MODELO 
    ( 
     id_modelo,
     MARCA_id_marca
    ) 
;

ALTER TABLE PRODUCTO 
    ADD CONSTRAINT PRODUCTO_PROVEEDOR_FK FOREIGN KEY 
    ( 
     PROVEEDOR_id_proveedor
    ) 
    REFERENCES PROVEEDOR 
    ( 
     id_proveedor
    ) 
;

ALTER TABLE PROVEEDOR_EMPRESA 
    ADD CONSTRAINT PROVEEDOR_EMPRESA_PROVEEDOR_FK FOREIGN KEY 
    ( 
     id_proveedor
    ) 
    REFERENCES PROVEEDOR 
    ( 
     id_proveedor
    ) 
;

ALTER TABLE PROVEEDOR_PERSONA 
    ADD CONSTRAINT PROVEEDOR_PERSONA_PROVEEDOR_FK FOREIGN KEY 
    ( 
     id_proveedor
    ) 
    REFERENCES PROVEEDOR 
    ( 
     id_proveedor
    ) 
;

ALTER TABLE SUCURSAL 
    ADD CONSTRAINT SUCURSAL_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_id_comuna
    ) 
    REFERENCES COMUNA 
    ( 
     id_comuna
    ) 
;

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             23
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0
