USE [master]
GO
/****** Object:  Database [Prac_15]    Script Date: 16.06.2023 1:56:02 ******/
CREATE DATABASE [Prac_15]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prac_15', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS1\MSSQL\DATA\Prac_15.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prac_15_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS1\MSSQL\DATA\Prac_15_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Prac_15] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prac_15].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prac_15] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prac_15] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prac_15] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prac_15] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prac_15] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prac_15] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prac_15] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prac_15] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prac_15] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prac_15] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prac_15] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prac_15] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prac_15] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prac_15] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prac_15] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Prac_15] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prac_15] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prac_15] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prac_15] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prac_15] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prac_15] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prac_15] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prac_15] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Prac_15] SET  MULTI_USER 
GO
ALTER DATABASE [Prac_15] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prac_15] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prac_15] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prac_15] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prac_15] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Prac_15] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Prac_15] SET QUERY_STORE = OFF
GO
USE [Prac_15]
GO
/****** Object:  Table [dbo].[Вопрос]    Script Date: 16.06.2023 1:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Вопрос](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[НомерТеста] [int] NOT NULL,
	[НомерВопроса] [nvarchar](5) NOT NULL,
	[Вопрос] [nvarchar](150) NOT NULL,
	[Вариант1] [nvarchar](100) NOT NULL,
	[Вариант2] [nvarchar](100) NOT NULL,
	[Вариант3] [nvarchar](100) NOT NULL,
	[Ответ] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Вопрос] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Дисциплина]    Script Date: 16.06.2023 1:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Дисциплина](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Дисциплина] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[История]    Script Date: 16.06.2023 1:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[История](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Пользователь] [nvarchar](50) NOT NULL,
	[НомерТеста] [int] NOT NULL,
	[Результат] [nvarchar](50) NOT NULL,
	[КоличествоБаллов] [int] NOT NULL,
	[Время] [time](7) NOT NULL,
	[Дата] [date] NOT NULL,
 CONSTRAINT [PK_История] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 16.06.2023 1:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[Логин] [nvarchar](50) NOT NULL,
	[Пароль] [nvarchar](50) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NULL,
 CONSTRAINT [PK_Пользователь] PRIMARY KEY CLUSTERED 
(
	[Логин] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тест]    Script Date: 16.06.2023 1:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тест](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[НомерДисциплины] [int] NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Тест] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Вопрос] ON 

INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (1, 1, N'1', N'Цикл с параметром - это', N'алгоритмическая конструкция, где число повторений неизвестно заранее', N'алгоритмическая конструкция, где число повторений известно заранее', N'ничего не верно', N'алгоритмическая конструкция, где число повторений известно заранее')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (2, 1, N'2', N'Что значит ключевое слово "to"?', N'ничего не значит', N'параметр цикла уменьшается на единицу', N'параметр цикла увеличивается на единицу', N'параметр цикла увеличивается на единицу')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (3, 1, N'3', N'В языке Pascal повторение некоторой последовательности действий известное число раз выполняет оператор', N'while', N'if', N'for', N'for')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (4, 1, N'4', N'Сколько используется форм для записи оператора цикла с параметром в языке Паскаль?', N'1', N'2', N'3', N'2')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (5, 2, N'1', N'Что такое www?', N'Текстовый редактор', N'Всемирное хранилище информации, существующее на технической базе сети Интернет', N'Локальная сеть', N'Всемирное хранилище информации, существующее на технической базе сети Интернет')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (6, 2, N'2', N'Перемещаться пользователю по "паутине" помагают специальные программы', N'web-страницы', N'web-сайты', N'web-браузеры', N'web-браузеры')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (7, 2, N'3', N'Поисковой системой не является', N'Google', N'FireFox', N'Rambler', N'FireFox')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (8, 2, N'4', N'Глобальная компьютерная сеть, объединяющая многие сети это', N'Интернет', N'Локальная сеть типа звезда', N'Региональная сеть', N'Интернет')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (9, 2, N'5', N'Домен - это', N'единица измерения информации', N'название пограммы для осуществления связи между компьютерами', N'часть адреса, определяющая адрес компьютера сети', N'часть адреса, определяющая адрес компьютера сети')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (10, 3, N'1', N'Где родился Колумб?', N'в Венеции', N'в Генуе', N'в Барселоне', N'в Генуе')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (11, 3, N'2', N'Сколько кораблей было у Колумба в первом плавании к Америке?', N'2', N'3', N'4', N'3')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (12, 3, N'3', N'В каком году Колумб открыл Новый Свет?', N'1492', N'1498', N'1483', N'1492')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (13, 3, N'4', N'Чем вошел в историю Америго Веспуччи?', N'Путешествиями', N'Географическими открытиями', N'Эпистолярным искусством', N'Эпистолярным искусством')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (14, 3, N'5', N'Мореходы какого европейского государства открыли берег Бразилии?', N'Испании', N'Португалии', N'Италии', N'Португалии')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (15, 3, N'6', N'Кто первым обогнул Африку?', N'Бартоломеу Диаш', N'Педро Алвареш Кабрал', N'Диего Кан', N'Бартоломеу Диаш')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (16, 3, N'7', N'Что такое падран?', N'Тип парусного судна', N'Северо-восточный ветер в Средиземном море', N'Португальский каменный столб, устанавливаемый во время путешествий', N'Португальский каменный столб, устанавливаемый во время путешествий')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (17, 4, N'1', N'Как назывался первый пароход, преодолевший Атлантику с Запада на Восток?', N'Англия', N'Саванна', N'Прерия', N'Саванна')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (18, 4, N'2', N'Кто автор идеи путешествия из Европы в Китай север-Восточным проходом (вокруг Сибири)?', N'Английский купец Гроуленд', N'Нолландский мореплаватель Баренц', N'Русский дипломат Д. Герасимов', N'Русский дипломат Д. Герасимов')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (19, 4, N'3', N'Какова была цель первой русской кругосветной экспедиции 1803-1806 годов?', N'Открытие земель в Океании', N'Создание морской базы в Индокитае', N'Поиск кратчайшего пути из Балтики к поселениям Русской Америки', N'Поиск кратчайшего пути из Балтики к поселениям Русской Америки')
INSERT [dbo].[Вопрос] ([Код], [НомерТеста], [НомерВопроса], [Вопрос], [Вариант1], [Вариант2], [Вариант3], [Ответ]) VALUES (20, 4, N'4', N'	Как звали мореплавателя, первым обошедшим кругом землю?', N'Магеллан', N'Эль Кано', N'Дрейк', N'Эль Кано')
SET IDENTITY_INSERT [dbo].[Вопрос] OFF
GO
SET IDENTITY_INSERT [dbo].[Дисциплина] ON 

INSERT [dbo].[Дисциплина] ([Код], [Наименование]) VALUES (1, N'География')
INSERT [dbo].[Дисциплина] ([Код], [Наименование]) VALUES (2, N'Информатика')
SET IDENTITY_INSERT [dbo].[Дисциплина] OFF
GO
SET IDENTITY_INSERT [dbo].[История] ON 

INSERT [dbo].[История] ([Код], [Пользователь], [НомерТеста], [Результат], [КоличествоБаллов], [Время], [Дата]) VALUES (3, N'asd', 1, N'1', 1, CAST(N'00:07:52' AS Time), CAST(N'2023-09-20' AS Date))
INSERT [dbo].[История] ([Код], [Пользователь], [НомерТеста], [Результат], [КоличествоБаллов], [Время], [Дата]) VALUES (4, N'asd', 1, N'90', 3, CAST(N'10:10:10' AS Time), CAST(N'2010-10-10' AS Date))
INSERT [dbo].[История] ([Код], [Пользователь], [НомерТеста], [Результат], [КоличествоБаллов], [Время], [Дата]) VALUES (5, N'asd', 1, N'0', 2, CAST(N'00:00:02' AS Time), CAST(N'2023-06-16' AS Date))
INSERT [dbo].[История] ([Код], [Пользователь], [НомерТеста], [Результат], [КоличествоБаллов], [Время], [Дата]) VALUES (6, N'asd', 2, N'40', 2, CAST(N'00:00:06' AS Time), CAST(N'2023-06-16' AS Date))
INSERT [dbo].[История] ([Код], [Пользователь], [НомерТеста], [Результат], [КоличествоБаллов], [Время], [Дата]) VALUES (7, N'asd', 4, N'2', 1, CAST(N'00:00:05' AS Time), CAST(N'2023-06-16' AS Date))
INSERT [dbo].[История] ([Код], [Пользователь], [НомерТеста], [Результат], [КоличествоБаллов], [Время], [Дата]) VALUES (8, N'asd', 2, N'2', 2, CAST(N'00:00:02' AS Time), CAST(N'2023-06-16' AS Date))
INSERT [dbo].[История] ([Код], [Пользователь], [НомерТеста], [Результат], [КоличествоБаллов], [Время], [Дата]) VALUES (9, N'asd', 3, N'2', 3, CAST(N'00:00:03' AS Time), CAST(N'2023-06-16' AS Date))
SET IDENTITY_INSERT [dbo].[История] OFF
GO
INSERT [dbo].[Пользователь] ([Логин], [Пароль], [Фамилия], [Имя], [Отчество]) VALUES (N'asd', N'asdasd', N'asd', N'asd', N'asd')
INSERT [dbo].[Пользователь] ([Логин], [Пароль], [Фамилия], [Имя], [Отчество]) VALUES (N'login', N'password', N'Логинов', N'Сережа', N'Паролевич')
INSERT [dbo].[Пользователь] ([Логин], [Пароль], [Фамилия], [Имя], [Отчество]) VALUES (N'Speed', N'witch', N'Болезнов', N'Темочка', N'Гемороевич')
INSERT [dbo].[Пользователь] ([Логин], [Пароль], [Фамилия], [Имя], [Отчество]) VALUES (N'vatekeypykey', N'kaif1231', N'Манучарян', N'Мураз', N'Мастурбекович')
GO
SET IDENTITY_INSERT [dbo].[Тест] ON 

INSERT [dbo].[Тест] ([Код], [НомерДисциплины], [Название]) VALUES (1, 2, N'Циклы')
INSERT [dbo].[Тест] ([Код], [НомерДисциплины], [Название]) VALUES (2, 2, N'Интернет')
INSERT [dbo].[Тест] ([Код], [НомерДисциплины], [Название]) VALUES (3, 1, N'Знаменитые первооткрыватели')
INSERT [dbo].[Тест] ([Код], [НомерДисциплины], [Название]) VALUES (4, 1, N'Знаменитые экспедиции')
SET IDENTITY_INSERT [dbo].[Тест] OFF
GO
ALTER TABLE [dbo].[Вопрос]  WITH CHECK ADD  CONSTRAINT [FK_Вопрос_Тест] FOREIGN KEY([НомерТеста])
REFERENCES [dbo].[Тест] ([Код])
GO
ALTER TABLE [dbo].[Вопрос] CHECK CONSTRAINT [FK_Вопрос_Тест]
GO
ALTER TABLE [dbo].[История]  WITH CHECK ADD  CONSTRAINT [FK_История_Пользователь] FOREIGN KEY([Пользователь])
REFERENCES [dbo].[Пользователь] ([Логин])
GO
ALTER TABLE [dbo].[История] CHECK CONSTRAINT [FK_История_Пользователь]
GO
ALTER TABLE [dbo].[История]  WITH CHECK ADD  CONSTRAINT [FK_История_Тест] FOREIGN KEY([НомерТеста])
REFERENCES [dbo].[Тест] ([Код])
GO
ALTER TABLE [dbo].[История] CHECK CONSTRAINT [FK_История_Тест]
GO
ALTER TABLE [dbo].[Тест]  WITH CHECK ADD  CONSTRAINT [FK_Тест_Дисциплина] FOREIGN KEY([НомерДисциплины])
REFERENCES [dbo].[Дисциплина] ([Код])
GO
ALTER TABLE [dbo].[Тест] CHECK CONSTRAINT [FK_Тест_Дисциплина]
GO
USE [master]
GO
ALTER DATABASE [Prac_15] SET  READ_WRITE 
GO
