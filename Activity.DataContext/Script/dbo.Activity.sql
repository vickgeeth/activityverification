USE [perks]
GO

/****** Object: Table [dbo].[Activity] Script Date: 5/1/2016 9:37:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Activity] (
    [ActivityId]   INT           IDENTITY (1, 1) NOT NULL,
    [HandleId]     INT           NOT NULL,
    [Description]  VARCHAR (500) NULL,
    [MomentInTime] DATETIME      NULL,
    [Indicator]    INT           NOT NULL
);


