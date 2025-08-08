-- Crear Base de Datos
CREATE DATABASE Netflix;
GO

USE Netflix;
GO

-- Crear Tablas
CREATE TABLE actor (
    actor_id INT PRIMARY KEY,
    actor NVARCHAR(500) NOT NULL -- NVARCHAR para leer caracteres chinos
);
GO

CREATE TABLE country (
    country_id INT PRIMARY KEY,
    country NVARCHAR(500) NOT NULL
);
GO

CREATE TABLE genre (
    genre_id INT PRIMARY KEY,
    genre NVARCHAR(500) NOT NULL
);
GO

CREATE TABLE show (
    show_id VARCHAR(100) PRIMARY KEY,
    type VARCHAR(50),
    title NVARCHAR(500),
    director NVARCHAR(500),
    date_added DATE,
    release_year INT,
    rating_ages VARCHAR(50),
	description TEXT,
    time INT,
    unit_time VARCHAR(50)
);
GO

CREATE TABLE record_show (
    id INT PRIMARY KEY,
    show_id VARCHAR(100),
    actor_id INT,
    country_id INT,
    genre_id INT,
    FOREIGN KEY (show_id) REFERENCES show(show_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
    FOREIGN KEY (country_id) REFERENCES country(country_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);
GO

-- Importar data desde los archivos CSV
BULK INSERT actor
FROM 'D:\BACKUP ROS\Christopher Rosales\Python\actor.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    DATAFILETYPE = 'char'
);
GO

BULK INSERT country
FROM 'D:\BACKUP ROS\Christopher Rosales\Python\country.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    DATAFILETYPE = 'char'
);
GO

BULK INSERT genre
FROM 'D:\BACKUP ROS\Christopher Rosales\Python\genre.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    DATAFILETYPE = 'char'
);
GO

BULK INSERT show
FROM 'D:\BACKUP ROS\Christopher Rosales\Python\show.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    DATAFILETYPE = 'char'
);
GO

BULK INSERT record_show
FROM 'D:\BACKUP ROS\Christopher Rosales\Python\record_show.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    DATAFILETYPE = 'char'
);
GO

SELECT * FROM actor
SELECT * FROM country
SELECT * FROM genre
SELECT * FROM show
SELECT * FROM record_show
