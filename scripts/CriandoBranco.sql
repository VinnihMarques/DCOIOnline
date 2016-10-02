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
	[usu_nome] [varchar](50) NULL,
	[usu_log] [varchar](50) NULL,
	[usu_sen] [varchar](200) NULL,
	PRIMARY KEY [usu_cod])
GO



/****** CRIANDO TABELA CLIENTE ******/
CREATE TABLE [dbo].[CLIENTE](
	[cli_cod] [int] IDENTITY(1,1) NOT NULL,
	[cli_nom] [varchar](200) NOT NULL,
	[cli_raz] [varchar](200) NOT NULL,
	[cli_cnpj] [varchar] UNIQUE(14) NOT NULL,
	[cli_ie] [varchar]UNIQUE (13) NULL,
	[cli_status] [bit] NULL,
	[cli_aten] [varchar](10) NULL,
	[cli_qtd_usu] [int] NULL,
	[cli_ana_prj] [varchar](20) NULL,
	[cli_hosp] [varchar](6) NOT NULL,
	[cli_id_hosp] [varchar](6)NOT NULL,
	[cli_dat_cad] datetime default getdate(),

PRIMARY KEY ([cli_cod]))

ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ((0)) FOR [cli_status]
GO

ALTER TABLE [dbo].[CLIENTE] WITH CHECK ADD CHECK  (([cli_hosp]='Tivit' OR [cli_hosp]='Amazon'))
GO

ALTER TABLE [dbo].[CLIENTE]  WITH CHECK ADD CHECK  (([cli_aten]='Premium' OR [cli_aten]='Padrão'))
GO

/****** CRIANDO TABELA UNIDADE DE NEGOCIO ******/
CREATE TABLE [dbo].[UNIDADE_NEGOCIO](
	[uni_cod] [int] IDENTITY(1,1) NOT NULL,
	[uni_nom] [varchar](200) NOT NULL,
	[uni_raz] [varchar](200),
	[uni_cnpj] [varchar](14) UNIQUE NOT NULL,
	[uni_ie]   [varchar](13) UNIQUE,
	[uni_im]   [varchar](13) UNIQUE,
	[uni_reg]   [varchar](20),
	[uni_status] [bit] NOT NULL,
	[uni_sig]   [varchar](2),
	[uni_dat_cad] datetime default getdate(),
	[cli_cod]  [int] NOT NULL,


PRIMARY KEY ([uni_cod]))

ALTER TABLE [dbo].[UNIDADE_NEGOCIO] ADD  DEFAULT ((0)) FOR [uni_status]
GO

ALTER TABLE [dbo].[UNIDADE_NEGOCIO] WITH CHECK ADD CHECK  (([uni_reg]='Simples Nacional' OR [uni_reg]='Normal'))
GO

ALTER TABLE [dbo].[UNIDADE_NEGOCIO]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Unineg] FOREIGN KEY([cli_cod])
REFERENCES [dbo].[CLIENTE] ([cli_cod])
ON UPDATE CASCADE
ON DELETE CASCADE
GO


/****** CRIANDO TABELA ENDEREÇO ******/
CREATE TABLE [dbo].[ENDERECO](
	[end_cod]  [int] IDENTITY(1,1) NOT NULL,
	[end_log]  [varchar](200) NOT NULL,
	[end_num]  [varchar](10),
	[end_bai]  [varchar](100)NOT NULL,
	[end_comp] [varchar](200),
	[end_cid]  [varchar](200)NOT NULL,
	[end_uf]   [varchar](2)NOT NULL,
	[uni_cod]  [int]NOT NULL,
	

PRIMARY KEY ([end_cod]))


ALTER TABLE [dbo].[ENDERECO]  WITH CHECK ADD  CONSTRAINT [FK_unineg_end] FOREIGN KEY([uni_cod])
REFERENCES [dbo].[UNIDADE_NEGOCIO] ([uni_cod])
ON UPDATE CASCADE
ON DELETE CASCADE
GO


/****** CRIANDO TABELA MODULO ******/

CREATE TABLE [dbo].[MODULO](
	[mod_cod] [int] IDENTITY(1,1) NOT NULL,
	[mod_nom] [varchar](60) NOT NULL,
	[mod_desc] [varchar](100) NULL,
	[mod_status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[mod_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[MODULO] ADD  DEFAULT ((0)) FOR [mod_status]
GO

/****** CRIANDO TABELA CLIENTE_MÓDULO ******/


CREATE TABLE [dbo].[CLIENTE_MODULO](
	[cli_cod] [int] NOT NULL,
	[mod_cod] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cli_cod] ASC,
	[mod_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[CLIENTE_MODULO]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Modulo] FOREIGN KEY([cli_cod])
REFERENCES [dbo].[CLIENTE] ([cli_cod])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CLIENTE_MODULO] CHECK CONSTRAINT [FK_Cliente_Modulo]
GO

ALTER TABLE [dbo].[CLIENTE_MODULO]  WITH CHECK ADD  CONSTRAINT [FK_Modulo_Cliente] FOREIGN KEY([mod_cod])
REFERENCES [dbo].[MODULO] ([mod_cod])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CLIENTE_MODULO] CHECK CONSTRAINT [FK_Modulo_Cliente]

GO/****** CRIANDO TABELA CONTATO ******/

CREATE TABLE [dbo].[CONTATO](
	[con_cod] [int] IDENTITY(1,1) NOT NULL,
	[con_tel] [int] NULL,
	[con_cel] [int] NULL,
	[con_fax] [int] NULL,
	[con_email] [varchar](100) NULL,
	[con_resp] [varchar](100) NULL,
	[cli_cod] [int] NOT NULL,
	
PRIMARY KEY CLUSTERED 
(
	[con_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[CONTATO]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Contato] FOREIGN KEY([cli_cod])
REFERENCES [dbo].[CLIENTE] ([cli_cod])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CONTATO] CHECK CONSTRAINT [FK_Cliente_Contato]
GO





/****** CARGA INICIAL NO BANCO DE DADOS Script Date: 05/09/2016 ******/

/****** INSERINDO DADOS NA TEBELA USUARIO ******/

insert into [USUARIO] values ('Vinícius Santos','visantos','v123s!@')
insert into [USUARIO] values ('Pedro Gonçalves','pgoncalves','123!@')
insert into [USUARIO] values ('Tulio Cruz','tcruz','123!@')
insert into [USUARIO] values ('Daniel Mendes','dmendes','123!@')
insert into [USUARIO] values ('Lucas Kewin','lkewin','123!@')
insert into [USUARIO] values ('Izabella Bernardo','ibernardo','123!@')
insert into [USUARIO] values ('Heitor Lusvardi','hlusvardi','123!@')
insert into [USUARIO] values ('Otávio Rojas','orojas','123!@')
insert into [USUARIO] values ('Karla Patrícia','kpatricia','123!@')





