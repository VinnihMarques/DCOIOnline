use master


/****** CRIANDO O BANCO DE DADOS  Script Date: 05/09/2016 ******/

  IF db_id('DCOIONLINE2') IS NOT NULL
BEGIN
    DROP DATABASE [DCOIONLINE2]
	CREATE DATABASE [DCOIONLINE2]
END

ELSE
BEGIN
    CREATE DATABASE [DCOIONLINE2]
END

go
USE [DCOIONLINE2]
GO

/****** CRIANDO TABELAS DO BANCO    Script Date: 05/09/2016 ******/


/****** CRIANDO TABELA USUARIO ******/
CREATE TABLE [dbo].[USUARIO](
	[usu_cod] [int] PRIMARY KEY identity (1,1) NOT NULL,
	[usu_nome] [varchar](50) NULL,
	[usu_log] [varchar](50) NULL,
	[usu_sen] [varchar](200) NULL,
	)
GO

print 'TABELA USUARIO CRIADA COM SUCESSO'


/****** CRIANDO TABELA CLIENTE ******/
CREATE TABLE [dbo].[CLIENTE](
	[cli_cod] [int] IDENTITY(1,1) NOT NULL,
	[cli_nom] [varchar](200) NOT NULL,
	[cli_raz] [varchar](200) NOT NULL,
	[cli_cnpj] [varchar](14) UNIQUE NOT NULL,
	[cli_ie] [varchar](13) UNIQUE  NULL,
	[cli_status] [bit] NULL,
	[cli_aten] [varchar](10) NULL,
	[cli_qtd_usu] [int] NULL,
	[cli_ana_prj] [varchar](20) NULL,
	[cli_hosp] [varchar](6) NOT NULL,
	[cli_id_hosp] [varchar](6)NOT NULL,
	[cli_dat_cad] datetime default getdate(),

PRIMARY KEY ([cli_cod]))

GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ((0)) FOR [cli_status]
GO

ALTER TABLE [dbo].[CLIENTE] WITH CHECK ADD CHECK  (([cli_hosp]='Tivit' OR [cli_hosp]='Amazon'))
GO

ALTER TABLE [dbo].[CLIENTE]  WITH CHECK ADD CHECK  (([cli_aten]='Premium' OR [cli_aten]='Padrão'))
GO

print 'TABELA CLIENTE CRIADA COM SUCESSO'




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

print 'TABELA MODULO CRIADA COM SUCESSO'

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

print 'TABELA CLIENTE_MODULO CRIADA COM SUCESSO'

GO
/****** CRIANDO TABELA CONTATO ******/

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

ALTER TABLE [dbo].[CONTATO]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Contato] FOREIGN KEY([cli_cod])
REFERENCES [dbo].[CLIENTE] ([cli_cod])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CONTATO] CHECK CONSTRAINT [FK_Cliente_Contato]
GO

print 'TABELA CONTATO CRIADA COM SUCESSO'

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

GO

ALTER TABLE [dbo].[UNIDADE_NEGOCIO] ADD  DEFAULT ((0)) FOR [uni_status]
GO

ALTER TABLE [dbo].[UNIDADE_NEGOCIO] WITH CHECK ADD CHECK  (([uni_reg]='Simples Nacional' OR [uni_reg]='Normal'))
GO

ALTER TABLE [dbo].[UNIDADE_NEGOCIO]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Unineg] FOREIGN KEY([cli_cod])
REFERENCES [dbo].[CLIENTE] ([cli_cod])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

print 'TABELA USUARIO UNIDADE_NEGOCIO COM SUCESSO'

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

GO

ALTER TABLE [dbo].[ENDERECO]  WITH CHECK ADD  CONSTRAINT [FK_unineg_end] FOREIGN KEY([uni_cod])
REFERENCES [dbo].[UNIDADE_NEGOCIO] ([uni_cod])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

print 'TABELA ENDERECO CRIADA COM SUCESSO'


/****** CRIANDO TABELA PROJETO******/
CREATE TABLE [dbo].[PROJETO](
	[proj_cod] [int] IDENTITY(1,1) NOT NULL,
	[proj_nom] [varchar](200) NOT NULL,
	[proj_desc] [varchar](500),
	[proj_status] [bit] NOT NULL,
	


PRIMARY KEY ([proj_cod]))

GO

ALTER TABLE [dbo].[PROJETO] ADD  DEFAULT ((0)) FOR [proj_status]
GO

print 'TABELA PROJETO CRIADA COM SUCESSO'


/****** CRIANDO TABELA PROJETO_UNIDADE******/
CREATE TABLE [dbo].[PROJETO_UNIDADE](
	[pro_uni_cod] [int] primary key IDENTITY(1,1) NOT NULL,
	[proj_cod] [int] NOT NULL,
	[uni_cod] [int] NOT NULL,
)

GO

ALTER TABLE [dbo].[PROJETO_UNIDADE]  WITH CHECK ADD  CONSTRAINT [FK_PROJETO_UNIDADE_PROJETO] FOREIGN KEY([proj_cod])
REFERENCES [dbo].[PROJETO] ([proj_cod])
ON UPDATE CASCADE
ON DELETE CASCADE

GO

ALTER TABLE [dbo].[PROJETO_UNIDADE]  WITH CHECK ADD  CONSTRAINT [FK_PROJETO_UNIDADE_UNIDADE_NEGOCIO] FOREIGN KEY([uni_cod])
REFERENCES [dbo].[UNIDADE_NEGOCIO] ([uni_cod])
ON UPDATE CASCADE
ON DELETE CASCADE


print 'TABELA PROJETO_UNIDADE CRIADA COM SUCESSO'

/****** CRIANDO TABELA AQUISICAO******/
CREATE TABLE [dbo].[AQUISICAO](
	[aqu_cod] [int] primary key IDENTITY(1,1) NOT NULL,
	[aqu_dat_cad] [datetime] NOT NULL,
	[aqu_email] [varchar](100),
	[aqu_ebuilder] [bit],
	[aqu_imp_cli] [bit],
	[aqu_imp_ev] [bit],
	[aqu_imp_inv] [bit],
	[aqu_imp_prec] [bit],
	[aqu_imp_prod] [bit],
	[aqu_imp_xml] [bit],
	[aqu_imp_cnab] [bit],
	[aqu_imp_ibpt] [bit],
	[aqu_can_ped_bol] [bit],
	[aqu_can_ped_car] [bit],
	[aqu_env_bol] [bit],
	[aqu_exp_sint] [bit],
	[aqu_consig] [bit],
	[aqu_dist_cor] [bit],
	[aqu_dist_proc] [bit],
	[aqu_dist_dir] [bit],
	[aqu_dist_tot] [bit],
	[aqu_dist_out] [bit],
	[aqu_hub_mel] [bit],
	[aqu_hub_cnova] [bit],
	[aqu_hub_b2w] [bit],
	[aqu_int_plat] [bit],
	[aqu_int_erp] [bit],
	[aqu_int_wms] [bit],
	[aqu_prod_sku] [bit],
	[aqu_prod_kit] [bit],
	[aqu_prod_simp] [bit],
	[aqu_prod_brin] [bit],
	[aqu_dash] [bit],
	[aqu_dash_email] [varchar](100),
	[pro_uni_cod] [int] NOT NULL)

GO


ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_ebuilder]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_imp_cli]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_imp_ev]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_imp_inv]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_imp_prec]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_imp_prod]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_imp_xml]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_imp_cnab]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_imp_ibpt]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_can_ped_bol]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_can_ped_car]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_env_bol]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_exp_sint]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_consig]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_dist_cor]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_dist_proc]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_dist_dir]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_dist_tot]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_dist_out]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_hub_mel]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_hub_cnova]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_hub_b2w]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_int_plat]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_int_erp]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_int_wms]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_prod_sku]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_prod_kit]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_prod_simp]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_prod_brin]
GO
ALTER TABLE [dbo].[AQUISICAO] ADD  DEFAULT ((0)) FOR [aqu_dash]
GO

ALTER TABLE [dbo].[AQUISICAO]  WITH CHECK ADD  CONSTRAINT [FK_AQUISICAO_PROJETO_UNIDADE] FOREIGN KEY([pro_uni_cod])
REFERENCES [dbo].[PROJETO_UNIDADE] ([pro_uni_cod])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

print 'TABELA AQUISICAO CRIADA COM SUCESSO'

/****** CRIANDO TABELA PLATAFORMA ******/
CREATE TABLE [dbo].[PLATAFORMA](
	[plat_cod] [int] primary key IDENTITY(1,1) NOT NULL,
	[plat_nom] [VARCHAR](100),
	[plat_con_tec] [VARCHAR](60),
	[plat_url_adm] [VARCHAR](300),
	[plat_usu] [VARCHAR](60),
	[plat_sen] [VARCHAR](60),
	[plat_url_loja] [VARCHAR](300),
	[plat_chave] [VARCHAR](100),
	[pro_uni_cod] [int]NOT NULL)
	
	
GO

ALTER TABLE [dbo].[PLATAFORMA]  WITH CHECK ADD  CONSTRAINT [FK_PLATAFORMA_PROJETO_UNIDADE] FOREIGN KEY([pro_uni_cod])
REFERENCES [dbo].[PROJETO_UNIDADE] ([pro_uni_cod])
ON UPDATE CASCADE
ON DELETE CASCADE

GO

print 'TABELA PLATAFORMA CRIADA COM SUCESSO'

/****** CRIANDO TABELA DISTRIBUIDOR LOGÍSTICO ******/
CREATE TABLE [dbo].[DISTRIBUIDOR_LOGISTICO](
	[dist_cod] [int] primary key IDENTITY(1,1) NOT NULL,
	[dist_nom] [VARCHAR](300) NOT NULL,
	[dist_cnpj] [varchar](14),
	[dist_cod_adm] [varchar](50),
	[dist_car_pst] [varchar](50),
	[dist_url_sigp] [varchar](200),
	[dist_sigp_usu] [varchar](50),
	[dist_sigp_sen] [varchar](50),
	[dist_url_ws_homo] [varchar](200),
	[dist_usu_homo] [varchar](50),
	[dist_sen_homo] [varchar](50),
	[dist_url_ws_prod] [varchar](200),
	[dist_usu_prod] [varchar](50),
	[dist_sen_prod] [varchar](50),
	[pro_uni_cod] [int] NOT NULL)
		
GO

ALTER TABLE [dbo].[DISTRIBUIDOR_LOGISTICO]  WITH CHECK ADD  CONSTRAINT [FK_DISTRIBUIDOR_LOGISTICO_PROJETO_UNIDADE] FOREIGN KEY([pro_uni_cod])
REFERENCES [dbo].[PROJETO_UNIDADE] ([pro_uni_cod])
ON UPDATE CASCADE
ON DELETE CASCADE

GO

print 'TABELA DISTRIBUIDOR LOGISTICO CRIADA COM SUCESSO'

/****** CRIANDO TABELA HUB ******/
CREATE TABLE [dbo].[HUB](
	[hub_cod] [int] primary key IDENTITY(1,1) NOT NULL,
	[hub_contato] [VARCHAR](100),
	[hub_email] [VARCHAR](100),
	[hub_meli_ofc] [bit],
	[hub_tip_anun] [VARCHAR](30),
	[hub_tip_env] [VARCHAR](30),
	[hub_full_fil] [bit],
	[hub_col_cross] [bit],
	[hub_cus_var] [bit],
	[hub_ent_comb] [bit],
	[hub_rep] [bit],
	[hub_url_rep] [VARCHAR](100),
	[pro_uni_cod] [int] NOT NULL)

ALTER TABLE [dbo].[HUB] ADD  DEFAULT ((0)) FOR [hub_meli_ofc]
GO
ALTER TABLE [dbo].[HUB] ADD  DEFAULT ((0)) FOR [hub_full_fil]
GO
ALTER TABLE [dbo].[HUB] ADD  DEFAULT ((0)) FOR [hub_col_cross]
GO
ALTER TABLE [dbo].[HUB] ADD  DEFAULT ((0)) FOR [hub_cus_var]
GO
ALTER TABLE [dbo].[HUB] ADD  DEFAULT ((0)) FOR [hub_ent_comb]
GO
ALTER TABLE [dbo].[HUB] ADD  DEFAULT ((0)) FOR [hub_url_rep]
GO

ALTER TABLE [dbo].[HUB]  WITH CHECK ADD  CONSTRAINT [FK_HUB_PROJETO_UNIDADE] FOREIGN KEY([pro_uni_cod])
REFERENCES [dbo].[PROJETO_UNIDADE] ([pro_uni_cod])
ON UPDATE CASCADE
ON DELETE CASCADE

GO

print 'TABELA HUB CRIADA COM SUCESSO'

/****** CRIANDO TABELA GATEWAY PAGAMENTO ******/
CREATE TABLE [dbo].[GATEWAY_PAGAMENTO](
	[gat_cod] [int] primary key IDENTITY(1,1) NOT NULL,
	[gat_nom] [VARCHAR](100),
	[gat_afi_adq] [bit],
	[gat_chave_loja_homo] [VARCHAR](100),
	[gat_usu_homo] [VARCHAR](50),
	[gat_sen_homo] [VARCHAR](50),
	[gat_chave_loja_prod] [VARCHAR](100),
	[gat_usu_prod] [VARCHAR](50),
	[gat_sen_prod] [VARCHAR](50),
	[pro_uni_cod] [int] NOT NULL)

ALTER TABLE [dbo].[GATEWAY_PAGAMENTO] ADD  DEFAULT ((0)) FOR [gat_afi_adq]
GO

ALTER TABLE [dbo].[GATEWAY_PAGAMENTO]  WITH CHECK ADD  CONSTRAINT [FK_GATEWAY_PAGAMENTO_PROJETO_UNIDADE] FOREIGN KEY([pro_uni_cod])
REFERENCES [dbo].[PROJETO_UNIDADE] ([pro_uni_cod])
ON UPDATE CASCADE
ON DELETE CASCADE

GO

print 'TABELA GATEWAY_PAGAMENTO CRIADA COM SUCESSO'


/****** CRIANDO TABELA ANÁLISE DE RISCO ******/
CREATE TABLE [dbo].[ANALISE_RISCO](
	[ana_cod] [int] primary key IDENTITY(1,1) NOT NULL,
	[ana_nom] [VARCHAR](100),
	[ana_chave_loja_homo] [VARCHAR](100),
	[ana_usu_homo] [VARCHAR](50),
	[ana_sen_homo] [VARCHAR](50),
	[ana_chave_loja_prod] [VARCHAR](100),
	[ana_usu_prod] [VARCHAR](50),
	[ana_sen_prod] [VARCHAR](50),
	[pro_uni_cod] [int] NOT NULL)

ALTER TABLE [dbo].[ANALISE_RISCO]  WITH CHECK ADD  CONSTRAINT [FK_ANALISE_RISCO_PROJETO_UNIDADE] FOREIGN KEY([pro_uni_cod])
REFERENCES [dbo].[PROJETO_UNIDADE] ([pro_uni_cod])
ON UPDATE CASCADE
ON DELETE CASCADE

GO

print 'TABELA ANALISE_RISCO CRIADA COM SUCESSO'





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





