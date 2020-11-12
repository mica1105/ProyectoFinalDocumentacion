/*
Created		11/11/2020
Modified		12/11/2020
Project		
Model		
Company		
Author		
Version		
Database		MS SQL 7 
*/


Create table [Enfermero] (
	[Id] Integer Identity NOT NULL,
	[Nombre] Varchar(50) NOT NULL,
	[Apellido] Varchar(50) NOT NULL,
	[Dni] Varchar(8) NOT NULL,
	[Telefono] Varchar(10) NOT NULL,
	[Domicilio] Varchar(50) NOT NULL,
	[Email] Varchar(30) NOT NULL,
	[Password] Varchar(50) NOT NULL,
Primary Key  ([Id])
) 
go

Create table [Paciente] (
	[Id] Integer Identity NOT NULL,
	[Nombre] Varchar(50) NOT NULL,
	[Apellido] Varchar(50) NOT NULL,
	[Dni] Varchar(8) NOT NULL,
	[Edad] Integer NOT NULL,
	[Domicilio] Varchar(50) NOT NULL,
	[Telefono] Varchar(10) NOT NULL,
	[Patologias] Varchar(100) NOT NULL,
	[Medicacion] Varchar(50) NOT NULL,
Primary Key  ([Id])
) 
go

Create table [Visita] (
	[Id] Integer Identity NOT NULL,
	[PacienteId] Integer NOT NULL,
	[EnfermeroId] Integer NOT NULL,
	[FechaYHora] Datetime NOT NULL,
	[Estado] Integer NOT NULL,
	[Intervenciones] Varchar(50) NOT NULL,
Primary Key  ([Id],[PacienteId],[EnfermeroId])
) 
go

Create table [CSV] (
	[Id] Integer Identity NOT NULL,
	[VisitaId] Integer NOT NULL,
	[PacienteId] Integer NOT NULL,
	[EnfermeroId] Integer NOT NULL,
	[TA] Varchar(15) NOT NULL,
	[FC] Varchar(10) NOT NULL,
	[SO2] Varchar(10) NOT NULL,
	[T°] Varchar(10) NOT NULL,
	[HGT] Char(10) NULL,
Primary Key  ([Id],[VisitaId],[PacienteId],[EnfermeroId])
) 
go

Create table [AdmDeFarmacos] (
	[Id] Integer Identity NOT NULL,
	[VisitaId] Integer NOT NULL,
	[PacienteId] Integer NOT NULL,
	[EnfermeroId] Integer NOT NULL,
	[Via] Varchar(10) NOT NULL,
	[Medicacion] Varchar(20) NOT NULL,
	[Dosis] Varchar(10) NOT NULL,
	[RA] Bit NULL,
	[Observaciones] Varchar(50) NULL,
Primary Key  ([Id],[VisitaId],[PacienteId],[EnfermeroId])
) 
go

Create table [Curacion] (
	[Id] Integer Identity NOT NULL,
	[IdVisita] Integer NOT NULL,
	[PacienteId] Integer NOT NULL,
	[EnfermeroId] Integer NOT NULL,
	[Tipo] Varchar(20) NOT NULL,
	[Ubicacion] Varchar(20) NOT NULL,
	[Extencion] Decimal(2,2) NOT NULL,
	[Infeccion] Bit NULL,
	[Observacione] Varchar(50) NULL,
Primary Key  ([Id],[IdVisita],[PacienteId],[EnfermeroId])
) 
go


Alter table [Visita] add  foreign key([EnfermeroId]) references [Enfermero] ([Id]) 
go
Alter table [Visita] add  foreign key([PacienteId]) references [Paciente] ([Id]) 
go
Alter table [CSV] add  foreign key([VisitaId],[PacienteId],[EnfermeroId]) references [Visita] ([Id],[PacienteId],[EnfermeroId]) 
go
Alter table [AdmDeFarmacos] add  foreign key([VisitaId],[PacienteId],[EnfermeroId]) references [Visita] ([Id],[PacienteId],[EnfermeroId]) 
go
Alter table [Curacion] add  foreign key([IdVisita],[PacienteId],[EnfermeroId]) references [Visita] ([Id],[PacienteId],[EnfermeroId]) 
go


Set quoted_identifier on
go

Set quoted_identifier off
go


