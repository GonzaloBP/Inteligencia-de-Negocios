/*
 * ER/Studio 8.0 SQL Code Generation
 * Company :      kne
 * Project :      ER-STUDIO-Modelo_Logico_Fisico.DM1
 * Author :       gonza
 *
 * Date Created : Sunday, May 30, 2021 18:49:22
 * Target DBMS : Microsoft SQL Server 2008
 */

/* 
 * TABLE: Dim_Cliente 
 */

CREATE TABLE Dim_Cliente(
    ID_Cliente    int             IDENTITY(1,1),
    Genero        nvarchar(6)     NOT NULL,
    Age_Level     nvarchar(15)    NOT NULL,
    CONSTRAINT PK19 PRIMARY KEY NONCLUSTERED (ID_Cliente)
)
go



IF OBJECT_ID('Dim_Cliente') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Cliente >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Cliente >>>'
go

/* 
 * TABLE: Dim_Disposicion 
 */

CREATE TABLE Dim_Disposicion(
    ID_Disposicion    int             IDENTITY(1,1),
    Tipo              nvarchar(10)    NOT NULL,
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
    Nombre_Region      nvarchar(50)    NOT NULL,
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
    ID_Prestamo    int        IDENTITY(1,1),
    Estado         char(1)    NOT NULL,
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
    ID_Tarjeta_Credito      int             IDENTITY(1,1),
    Desde                   date            NOT NULL,
    Tipo_Tarjeta_Credito    nvarchar(30)    NOT NULL,
    Hasta                   date            NULL,
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
    NroDia          int             NOT NULL,
    NroMes          int             NOT NULL,
    NombreMes       nvarchar(10)    NOT NULL,
    NroTrimestre    int             NOT NULL,
    NroSemestre     int             NOT NULL,
    NroAnio         int             NOT NULL,
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
    ID_Transaccion      int             IDENTITY(1,1),
    Tipo_Transaccion    nvarchar(10)    NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (ID_Transaccion)
)
go



IF OBJECT_ID('Dim_Transaccion') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Transaccion >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Transaccion >>>'
go

/* 
 * TABLE: Hecho_Cuentas 
 */

CREATE TABLE Hecho_Cuentas(
    ID_Hecho                          int      IDENTITY(1,1),
    ID_Disposicion                    int      NOT NULL,
    ID_Tarjeta_Credito                int      NOT NULL,
    Desde                             date     NOT NULL,
    ID_Distrito                       int      NOT NULL,
    ID_Transaccion                    int      NOT NULL,
    ID_Prestamo                       int      NOT NULL,
    ID_Tiempo                         int      NOT NULL,
    ID_Cliente                        int      NOT NULL,
    Cantidad_Total_Transacciones      int      NOT NULL,
    Monto_Total_Dinero_Transaccion    money    NOT NULL,
    Promedio_Dinero_Transaccion       money    NOT NULL,
    Monto_Total_Adeudado_Préstamo     money    NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (ID_Hecho)
)
go



IF OBJECT_ID('Hecho_Cuentas') IS NOT NULL
    PRINT '<<< CREATED TABLE Hecho_Cuentas >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Hecho_Cuentas >>>'
go

/* 
 * TABLE: Hecho_Cuentas 
 */

ALTER TABLE Hecho_Cuentas ADD CONSTRAINT RefDim_Tiempo24 
    FOREIGN KEY (ID_Tiempo)
    REFERENCES Dim_Tiempo(ID_Tiempo)
go

ALTER TABLE Hecho_Cuentas ADD CONSTRAINT RefDim_Prestamo25 
    FOREIGN KEY (ID_Prestamo)
    REFERENCES Dim_Prestamo(ID_Prestamo)
go

ALTER TABLE Hecho_Cuentas ADD CONSTRAINT RefDim_Transaccion26 
    FOREIGN KEY (ID_Transaccion)
    REFERENCES Dim_Transaccion(ID_Transaccion)
go

ALTER TABLE Hecho_Cuentas ADD CONSTRAINT RefDim_Distrito27 
    FOREIGN KEY (ID_Distrito)
    REFERENCES Dim_Distrito(ID_Distrito)
go

ALTER TABLE Hecho_Cuentas ADD CONSTRAINT RefDim_Tarjeta_Credito28 
    FOREIGN KEY (ID_Tarjeta_Credito, Desde)
    REFERENCES Dim_Tarjeta_Credito(ID_Tarjeta_Credito, Desde)
go

ALTER TABLE Hecho_Cuentas ADD CONSTRAINT RefDim_Disposicion29 
    FOREIGN KEY (ID_Disposicion)
    REFERENCES Dim_Disposicion(ID_Disposicion)
go

ALTER TABLE Hecho_Cuentas ADD CONSTRAINT RefDim_Cliente36 
    FOREIGN KEY (ID_Cliente)
    REFERENCES Dim_Cliente(ID_Cliente)
go


