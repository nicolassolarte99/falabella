USE [master]
GO
/****** Object:  Database [falabella_Seguros]    Script Date: 02/05/2019 6:32:06 ******/
CREATE DATABASE [falabella_Seguros]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'falabella_Seguros', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\falabella_Seguros.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'falabella_Seguros_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\falabella_Seguros_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [falabella_Seguros] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [falabella_Seguros].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [falabella_Seguros] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [falabella_Seguros] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [falabella_Seguros] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [falabella_Seguros] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [falabella_Seguros] SET ARITHABORT OFF 
GO
ALTER DATABASE [falabella_Seguros] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [falabella_Seguros] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [falabella_Seguros] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [falabella_Seguros] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [falabella_Seguros] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [falabella_Seguros] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [falabella_Seguros] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [falabella_Seguros] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [falabella_Seguros] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [falabella_Seguros] SET  DISABLE_BROKER 
GO
ALTER DATABASE [falabella_Seguros] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [falabella_Seguros] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [falabella_Seguros] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [falabella_Seguros] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [falabella_Seguros] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [falabella_Seguros] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [falabella_Seguros] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [falabella_Seguros] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [falabella_Seguros] SET  MULTI_USER 
GO
ALTER DATABASE [falabella_Seguros] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [falabella_Seguros] SET DB_CHAINING OFF 
GO
ALTER DATABASE [falabella_Seguros] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [falabella_Seguros] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [falabella_Seguros] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [falabella_Seguros] SET QUERY_STORE = OFF
GO
USE [falabella_Seguros]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [falabella_Seguros]
GO
/****** Object:  Table [dbo].[compania]    Script Date: 02/05/2019 6:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compania](
	[compania_Id] [int] IDENTITY(1,1) NOT NULL,
	[compania_Nombre] [nvarchar](max) NOT NULL,
	[compania_Direccion] [nvarchar](50) NOT NULL,
	[compania_Telefono] [numeric](12, 0) NOT NULL,
 CONSTRAINT [PK_compania] PRIMARY KEY CLUSTERED 
(
	[compania_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 02/05/2019 6:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[producto_Id] [int] IDENTITY(1,1) NOT NULL,
	[producto_Nombre] [nvarchar](max) NOT NULL,
	[producto_Tipo] [int] NOT NULL,
	[producto_Compania] [int] NOT NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[producto_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoProd]    Script Date: 02/05/2019 6:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoProd](
	[tipoProd_Id] [int] IDENTITY(1,1) NOT NULL,
	[tipoProd_Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tipoProd] PRIMARY KEY CLUSTERED 
(
	[tipoProd_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 02/05/2019 6:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[usuario_Id] [int] IDENTITY(1,1) NOT NULL,
	[usuario_Nombre] [nvarchar](max) NOT NULL,
	[usuario_Correo] [nvarchar](50) NOT NULL,
	[usuario_Pwd] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[usuario_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 02/05/2019 6:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[venta_Id] [int] NOT NULL,
	[venta_NomSolicitante] [nvarchar](max) NOT NULL,
	[venta_ApeSolicitante] [nvarchar](max) NOT NULL,
	[venta_TipoDocSolicitante] [nchar](10) NOT NULL,
	[venta_NumDocSolicitante] [numeric](15, 0) NOT NULL,
	[venta_TelSolicitante] [numeric](18, 0) NOT NULL,
	[venta_AgenteVenta] [int] NOT NULL,
	[venta_Producto] [int] NOT NULL,
	[venta_FechaReg] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_venta] PRIMARY KEY CLUSTERED 
(
	[venta_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_compania] FOREIGN KEY([producto_Compania])
REFERENCES [dbo].[compania] ([compania_Id])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_compania]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_tipoProd] FOREIGN KEY([producto_Tipo])
REFERENCES [dbo].[tipoProd] ([tipoProd_Id])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_tipoProd]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_producto] FOREIGN KEY([venta_Producto])
REFERENCES [dbo].[producto] ([producto_Id])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_producto]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_usuario] FOREIGN KEY([venta_AgenteVenta])
REFERENCES [dbo].[usuario] ([usuario_Id])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_usuario]
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 02/05/2019 6:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- sp_getUsuarioByLogin 'amartinez'
CREATE PROCEDURE [dbo].[sp_Login] (@userCorreo nvarchar(50), @userPwd nvarchar(50))
AS
BEGIN
	SELECT usuario_Nombre,
	usuario_Correo
	FROM usuario 
	WHERE usuario_Correo = @userCorreo and usuario_Pwd=@userPwd
END

GO
USE [master]
GO
ALTER DATABASE [falabella_Seguros] SET  READ_WRITE 
GO
