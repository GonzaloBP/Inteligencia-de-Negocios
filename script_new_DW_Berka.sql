/*
 * ER/Studio 8.0 SQL Code Generation
 * Company :      kne
 * Project :      ER-STUDIO-Modelo_Logico_Fisico.DM1
 * Author :       gonza
 *
 * Date Created : Wednesday, May 19, 2021 12:15:01
 * Target DBMS : Microsoft SQL Server 2008
 */

USE master
go
CREATE DATABASE DW_Berka
go
USE DW_Berka
go
/* 
 * TABLE: Dim_Disposicion 
 */

CREATE TABLE Dim_Disposicion(
    ID_Disposicion    int        NOT NULL,
    ID_Cliente        int        NOT NULL,
    ID_Cuenta         int        NOT NULL,
    Tipo              char(1)    NOT NULL,
    CONSTRAINT PK16 PRIMARY KEY NONCLUSTERED (ID_Disposicion)
)
go



IF OBJECT_ID('Dim_Disposicion') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Disposicion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Disposicion >>>'
go

/* 
 * TABLE: Dim_Distrito 
 */

CREATE TABLE Dim_Distrito(
    ID_Distrito        int             NOT NULL,
    Nombre_Distrito    nvarchar(50)    NOT NULL,
    Nro_Habitantes     int             NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (ID_Distrito)
)
go



IF OBJECT_ID('Dim_Distrito') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Distrito >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Distrito >>>'
go

/* 
 * TABLE: Dim_Prestamo 
 */

CREATE TABLE Dim_Prestamo(
    ID_Prestamo          int        NOT NULL,
    ID_Cuenta            int        NOT NULL,
    Fecha                date       NOT NULL,
    Cantidad_Prestamo    money      NOT NULL,
    Duracion             int        NOT NULL,
    Cantidad_Pagos       int        NOT NULL,
    Estado               char(1)    NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (ID_Prestamo)
)
go



IF OBJECT_ID('Dim_Prestamo') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Prestamo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Prestamo >>>'
go

/* 
 * TABLE: Dim_Tarjeta_Credito 
 */

CREATE TABLE Dim_Tarjeta_Credito(
    ID_Tarjeta_Credito      int             NOT NULL,
    Desde                   date            NOT NULL,
    Fecha_Emision           date            NOT NULL,
    Tipo_Tarjeta_Credito    nvarchar(50)    NOT NULL,
    Hasta                   date            NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY NONCLUSTERED (ID_Tarjeta_Credito, Desde)
)
go



IF OBJECT_ID('Dim_Tarjeta_Credito') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Tarjeta_Credito >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Tarjeta_Credito >>>'
go

/* 
 * TABLE: Dim_Tiempo 
 */

CREATE TABLE Dim_Tiempo(
    ID_Tiempo       int             NOT NULL,
    Fecha           date            NOT NULL,
    NroDia          smallint        IDENTITY(1,1),
    NroMes          tinyint         NOT NULL,
    NombreMes       nvarchar(10)    NULL,
    NroTrimestre    tinyint         NULL,
    NroSemestre     tinyint         NULL,
    NroAnio         tinyint         NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (ID_Tiempo)
)
go



IF OBJECT_ID('Dim_Tiempo') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Tiempo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Tiempo >>>'
go

/* 
 * TABLE: Dim_Transaccion 
 */

CREATE TABLE Dim_Transaccion(
    ID_Transaccion       int             NOT NULL,
    ID_Cuenta            int             NOT NULL,
    Fecha_Transaccion    date            NOT NULL,
    Tipo_Transaccion     nvarchar(10)    NOT NULL,
    Monto_Transaccion    money           NOT NULL,
    K_Symbol             nvarchar(10)    NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (ID_Transaccion)
)
go



IF OBJECT_ID('Dim_Transaccion') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Transaccion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Transaccion >>>'
go

/* 
 * TABLE: Hecho_Cuenta_Tarjeta_Credito 
 */

CREATE TABLE Hecho_Cuenta_Tarjeta_Credito(
    ID_Hecho                                                     int      NOT NULL,
    Cantidad_Total_Transacciones_De_Credito_Cuenta_Dia           int      NOT NULL,
    Monto_Total_Dinero_Transaccion_Credito_Dia                   money    NOT NULL,
    Promedio_Dinero_Transaccion_Credito_Dia                      money    NOT NULL,
    Cantidad_Total_Tarjetas_Credito_cuenta_dia                   int      NOT NULL,
    Cantidad_Tarjetas_Credito_Asociada_Cuenta_Junior_Dia         int      NOT NULL,
    Cantidad_Tarjetas_Credito_Asociada_Cuenta_Clasica_Dia        int      NOT NULL,
    Cantidad_Tarjetas_Credito_Asociada_Cuenta_Gold_Dia           int      NOT NULL,
    [Cantidad_Préstamos _Finalizados_Cuenta_Hasta_Dia]           int      NOT NULL,
    Monto_Total_Adeudado_Préstamo_Actual_hasta_Dia               money    NOT NULL,
    [Monto_Total_Pago_Recibido_Préstamo_Actual_Hasta_Dia.]       money    NOT NULL,
    [Monto_Total_Cuotas _Retrasadas _Préstamo_Cuenta_Hasta_Dia]  int      NOT NULL,
    ID_Tiempo                                                    int      NOT NULL,
    ID_Disposicion                                               int      NOT NULL,
    ID_Tarjeta_Credito                                           int      NOT NULL,
    Desde                                                        date     NOT NULL,
    ID_Distrito                                                  int      NOT NULL,
    ID_Transaccion                                               int      NOT NULL,
    ID_Prestamo                                                  int      NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (ID_Hecho)
)
go



IF OBJECT_ID('Hecho_Cuenta_Tarjeta_Credito') IS NOT NULL
    PRINT '<<< CREATED TABLE Hecho_Cuenta_Tarjeta_Credito >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Hecho_Cuenta_Tarjeta_Credito >>>'
go

/* 
 * TABLE: Hecho_Cuenta_Tarjeta_Credito 
 */

ALTER TABLE Hecho_Cuenta_Tarjeta_Credito ADD CONSTRAINT RefDim_Tiempo301 
    FOREIGN KEY (ID_Tiempo)
    REFERENCES Dim_Tiempo(ID_Tiempo)
go

ALTER TABLE Hecho_Cuenta_Tarjeta_Credito ADD CONSTRAINT RefDim_Disposicion311 
    FOREIGN KEY (ID_Disposicion)
    REFERENCES Dim_Disposicion(ID_Disposicion)
go

ALTER TABLE Hecho_Cuenta_Tarjeta_Credito ADD CONSTRAINT RefDim_Tarjeta_Credito321 
    FOREIGN KEY (ID_Tarjeta_Credito, Desde)
    REFERENCES Dim_Tarjeta_Credito(ID_Tarjeta_Credito, Desde)
go

ALTER TABLE Hecho_Cuenta_Tarjeta_Credito ADD CONSTRAINT RefDim_Distrito331 
    FOREIGN KEY (ID_Distrito)
    REFERENCES Dim_Distrito(ID_Distrito)
go

ALTER TABLE Hecho_Cuenta_Tarjeta_Credito ADD CONSTRAINT RefDim_Transaccion341 
    FOREIGN KEY (ID_Transaccion)
    REFERENCES Dim_Transaccion(ID_Transaccion)
go

ALTER TABLE Hecho_Cuenta_Tarjeta_Credito ADD CONSTRAINT RefDim_Prestamo351 
    FOREIGN KEY (ID_Prestamo)
    REFERENCES Dim_Prestamo(ID_Prestamo)
go


