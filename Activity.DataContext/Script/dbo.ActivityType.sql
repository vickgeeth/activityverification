USE [perks]
GO

/****** Object: Table [dbo].[ActivityType] Script Date: 5/1/2016 9:38:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ActivityType] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [ActType]           VARCHAR (1)   NOT NULL,
    [InvoiceIdentifier] VARCHAR (250) NULL,
    [ActivityId]        INT           NOT NULL,
    [ReasonId]          INT           NULL
);


