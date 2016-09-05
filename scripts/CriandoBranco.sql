USE [DCOIONLINE]
GO

/****** Object:  Table [dbo].[TADM_USUSIS]    Script Date: 30/08/2016 20:02:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TADM_USUSIS](
	[usu_cod] [int] identity (1,1) NOT NULL,
	[usu_nome] [varchar](50) NULL,
	[usu_log] [varchar](50) NULL,
	[usu_sen] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[usu_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

insert into TADM_USUSIS values ('Vinícius Santos','visantos','v123s!@')
insert into TADM_USUSIS values ('Pedro Gonçalves','pgoncalves','123!@')
insert into TADM_USUSIS values ('Tulio Cruz','tcruz','123!@')
insert into TADM_USUSIS values ('Daniel Mendes','dmendes','123!@')
insert into TADM_USUSIS values ('Lucas Kewin','lkewin','123!@')
insert into TADM_USUSIS values ('Izabella Bernardo','ibernardo','123!@')
insert into TADM_USUSIS values ('Heitor Lusvardi','hlusvardi','123!@')
insert into TADM_USUSIS values ('Otávio Rojas','orojas','123!@')
insert into TADM_USUSIS values ('Karla Patrícia','kpatricia','123!@')

select * from TADM_USUSIS

