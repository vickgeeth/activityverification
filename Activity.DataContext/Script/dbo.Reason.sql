USE [perks]
GO

/****** Object: Table [dbo].[Reason] Script Date: 5/1/2016 9:38:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Reason] (
    [ReasonId]    INT           IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (200) NULL
);


