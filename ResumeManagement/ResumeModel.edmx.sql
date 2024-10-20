
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/27/2024 11:25:58
-- Generated from EDMX file: G:\mvc practice\databaseFirst\databaseFirst\ResumeManagement\ResumeManagement\ResumeModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [newResumeDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_QualificationEntries_dbo_Employees_EmployeeId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[QualificationEntries] DROP CONSTRAINT [FK_dbo_QualificationEntries_dbo_Employees_EmployeeId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_QualificationEntries_dbo_Qualifications_QualificationId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[QualificationEntries] DROP CONSTRAINT [FK_dbo_QualificationEntries_dbo_Qualifications_QualificationId];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Employees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employees];
GO
IF OBJECT_ID(N'[dbo].[QualificationEntries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[QualificationEntries];
GO
IF OBJECT_ID(N'[dbo].[Qualifications]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Qualifications];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [EmployeeId] int IDENTITY(1,1) NOT NULL,
    [EmployeeName] nvarchar(20)  NOT NULL,
    [JoinDate] datetime  NOT NULL,
    [Picture] nvarchar(max)  NULL,
    [isActive] bit  NOT NULL,
    [Salary] int  NOT NULL
);
GO

-- Creating table 'QualificationEntries'
CREATE TABLE [dbo].[QualificationEntries] (
    [QualificationEntryId] int IDENTITY(1,1) NOT NULL,
    [EmployeeId] int  NOT NULL,
    [QualificationId] int  NOT NULL
);
GO

-- Creating table 'Qualifications'
CREATE TABLE [dbo].[Qualifications] (
    [QualificationId] int IDENTITY(1,1) NOT NULL,
    [QualificationName] nvarchar(20)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [EmployeeId] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([EmployeeId] ASC);
GO

-- Creating primary key on [QualificationEntryId] in table 'QualificationEntries'
ALTER TABLE [dbo].[QualificationEntries]
ADD CONSTRAINT [PK_QualificationEntries]
    PRIMARY KEY CLUSTERED ([QualificationEntryId] ASC);
GO

-- Creating primary key on [QualificationId] in table 'Qualifications'
ALTER TABLE [dbo].[Qualifications]
ADD CONSTRAINT [PK_Qualifications]
    PRIMARY KEY CLUSTERED ([QualificationId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [EmployeeId] in table 'QualificationEntries'
ALTER TABLE [dbo].[QualificationEntries]
ADD CONSTRAINT [FK_dbo_QualificationEntries_dbo_Employees_EmployeeId]
    FOREIGN KEY ([EmployeeId])
    REFERENCES [dbo].[Employees]
        ([EmployeeId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_QualificationEntries_dbo_Employees_EmployeeId'
CREATE INDEX [IX_FK_dbo_QualificationEntries_dbo_Employees_EmployeeId]
ON [dbo].[QualificationEntries]
    ([EmployeeId]);
GO

-- Creating foreign key on [QualificationId] in table 'QualificationEntries'
ALTER TABLE [dbo].[QualificationEntries]
ADD CONSTRAINT [FK_dbo_QualificationEntries_dbo_Qualifications_QualificationId]
    FOREIGN KEY ([QualificationId])
    REFERENCES [dbo].[Qualifications]
        ([QualificationId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_QualificationEntries_dbo_Qualifications_QualificationId'
CREATE INDEX [IX_FK_dbo_QualificationEntries_dbo_Qualifications_QualificationId]
ON [dbo].[QualificationEntries]
    ([QualificationId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------