use DCOIONLINE



 /****** CRIANDO O BANCO DE DADOS  Script Date: 05/09/2016 ******/
  IF db_id('DCOIONLINE') IS NOT NULL
BEGIN
    DROP DATABASE [DCOIONLINE]
	CREATE DATABASE [DCOIONLINE]
END

ELSE
BEGIN
    CREATE DATABASE [DCOIONLINE]
END

USE [DCOIONLINE]
GO

/****** CRIANDO TABELAS DO BANCO    Script Date: 05/09/2016 ******/


/****** CRIANDO TABELA USUARIO ******/
CREATE TABLE [dbo].[USUARIO](
	[usu_cod] [int] PRIMARY KEY identity (1,1) NOT NULL,
	[usu_nome] [varchar](50) NOT NULL,
	[usu_log] [varchar](50) NOT NULL,
	[usu_sen] [varchar](200) NOT NULL,
	)
	
GO

/****** CRIANDO TABELA CLIENTE ******/
CREATE TABLE [dbo].[CLIENTE](
	[cli_cod] [int] PRIMARY KEY identity (1,1) NOT NULL,
	[cli_nom] [varchar](200) NOT NULL,
	[cli_raz] [varchar](200) NOT NULL,
	[cli_cnpj][varchar](14) NOT NULL,
	[cli_ie] [varchar](13) NULL,
	[cli_status] [bit] default 0,
	[cli_aten] [varchar](10) CHECK ([cli_aten]  IN( 'PADRÃO','PREMIUM')) NULL,
	[cli_qtd_usu] int NULL,
	[cli_ana_prj] [varchar](20) null
	)
	
GO

/****** CRIANDO TABELA CONTATO ******/
CREATE TABLE [dbo].[CONTATO](
	[con_cod] [int]PRIMARY KEY identity (1,1) NOT NULL,
	[con_tel] [int] NULL,
	[con_cel] [int] NULL,
	[con_fax] [int] NULL,
	[con_email] [varchar](100)NULL,
	[con_resp]  [varchar](100)NULL,
	[cli_cod]   [int] NOT NULL,
	CONSTRAINT FK_Cliente_Contato FOREIGN KEY (cli_cod)     
    REFERENCES CLIENTE (cli_cod)     
    ON DELETE CASCADE    
    ON UPDATE CASCADE  
	)
GO

/****** CRIANDO TABELA MODULO ******/
CREATE TABLE [dbo].[MODULO](
	[mod_cod]  [int]PRIMARY KEY identity (1,1) NOT NULL,
	[mod_nom]  [varchar](60) NOT NULL,
	[mod_desc] [varchar](100) NULL,
	[mod_status] [bit] default 0)

GO

/****** CRIANDO TABELA RELACIONAMENTO CLIENTE X MODULO ******/
CREATE TABLE [dbo].[CLIENTE_MODULO](
	[cli_cod]  [int] NOT NULL,
	[mod_cod]  [int] NOT NULL,
	primary key ([cli_cod],[mod_cod]),

	CONSTRAINT FK_Cliente_Modulo FOREIGN KEY (cli_cod)     
    REFERENCES CLIENTE    
    ON DELETE CASCADE    
    ON UPDATE CASCADE,

	CONSTRAINT FK_Modulo_Cliente FOREIGN KEY (mod_cod)     
    REFERENCES MODULO    
    ON DELETE CASCADE    
    ON UPDATE CASCADE,
	 )

GO

SET ANSI_PADDING OFF
GO

/****** CARGA INICIAL DE DADOS ******/


/****** INSERINDO DADOS NA TABELA USUARIO ******/
insert into TADM_USUSIS values ('Vinícius Santos','visantos','v123s!@')
insert into TADM_USUSIS values ('Pedro Gonçalves','pgoncalves','123!@')
insert into TADM_USUSIS values ('Tulio Cruz','tcruz','123!@')
insert into TADM_USUSIS values ('Daniel Mendes','dmendes','123!@')
insert into TADM_USUSIS values ('Lucas Kewin','lkewin','123!@')
insert into TADM_USUSIS values ('Izabella Bernardo','ibernardo','123!@')
insert into TADM_USUSIS values ('Heitor Lusvardi','hlusvardi','123!@')
insert into TADM_USUSIS values ('Otávio Rojas','orojas','123!@')
insert into TADM_USUSIS values ('Karla Patrícia','kpatricia','123!@')



