/*******************************************************************************
   Social Media Database - Version 1.0
   Script: Social_Media_Database.sql
   Description: Creates and populates the Social Media database.
********************************************************************************/

/*******************************************************************************
   Drop Constraints
********************************************************************************/

/*******************************************************************************
   Drop Tables
********************************************************************************/

DROP TABLE [ecd].[Products];
GO

DROP TABLE [ecd].[Users];
GO

/*******************************************************************************
   Drop Schema
********************************************************************************/

DROP SCHEMA [ecd];
GO

/*******************************************************************************
   Create Schema
********************************************************************************/

CREATE SCHEMA [ecd];
GO

/*******************************************************************************
   Create Tables
********************************************************************************/

CREATE TABLE [ecd].[Users]
(
    [UserId] INT IDENTITY(1,1) NOT NULL,
    [UserFirstName] NVARCHAR(255) NOT NULL,
    [UserLastName] NVARCHAR(255) NOT NULL,
    [UserEmail] NVARCHAR(255) UNIQUE NOT NULL,
    [UserPassword] NVARCHAR(255) UNIQUE NOT NULL,
);
GO

CREATE TABLE [ecd].[Products]
(
    [ProductId] INT IDENTITY(1,1) NOT NULL,
    [ProductName] NVARCHAR(255) NOT NULL,
    [ProductQuantity] INT NOT NULL,
    [ProductPrice] MONEY NOT NULL,
    [ProductDescription] NVARCHAR(255),
    [ProductImage] NVARCHAR(255)
);
GO

/*******************************************************************************
   Create Primary Key Unique Indexes
********************************************************************************/

ALTER TABLE [ecd].[Users]
    ADD CONSTRAINT [PK_UserId]
    PRIMARY KEY ([UserId]);
GO

ALTER TABLE [ecd].[Products]
    ADD CONSTRAINT [PK_ProductId]
    PRIMARY KEY ([ProductId]);
GO

/*******************************************************************************
   Seed Database
********************************************************************************/

INSERT INTO [ecd].[Users] ([UserFirstName], [UserLastName], [UserEmail], [UserPassword])
    VALUES
        ('Peter', 'Parker', 'PParker@columbia.edu', 'AuntM@y46'),
        ('Tony', 'Stark', 'TStark@starkindustries.com', 'Pep%er07'),
        ('Thor', 'Odinson', 'TOdinson@valhalla.net', 'Mjoln!r1'),
        ('Steve', 'Rogers', 'SRogers@army.mil', 'GetSw0le!');
GO

INSERT INTO [ecd].[Products] ([ProductName], [ProductQuantity], [ProductPrice], [ProductDescription], [ProductImage])
    VALUES
        ('Altoid Mint', 2, 2.99, 'Curiously strong mints', 'https://www.altoids.com/sites/g/files/fnmzdf651/files/migrate-product-files/khgaap6bku2q9b8qrioh.png'),
        ('S3 Watch', 4, 399.99, 'More computing power than the space shuttle!', 'https://image-us.samsung.com/SamsungUS/home/mobile/wearables/pdp/sm-r760ndaaxar/gallery/S3_Frontier_Front_1600x1200.jpg?$product-details-jpg$'),
        ('Lenovo Thinkpad', 3, 599.94, 'Not the worst laptop... but not the best. Just... OK', 'https://p1-ofp.static.pub/medias/bWFzdGVyfHJvb3R8Mjc4NTk5fGltYWdlL3BuZ3xoMWEvaGQxLzEwODIyNzQwNDc1OTM0LnBuZ3w1MzRhMTMxYzE3YmY4MTgyOWNmYWIxNjA3OGVjNjMzZjBiM2JlNGI0ZDkyNGY3ZTRhOGU5MmI2OTVjNWE2ZTJl/lenovo-laptop-thinkpad-l14-intel-hero1.png');
GO