USE [master]
GO
/****** Object:  Database [Crud_Storepocedure]    Script Date: 16-07-2020 17:27:20 ******/
CREATE DATABASE [Crud_Storepocedure]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Crud_Storepocedure', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Crud_Storepocedure.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Crud_Storepocedure_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Crud_Storepocedure_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Crud_Storepocedure] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Crud_Storepocedure].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Crud_Storepocedure] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET ARITHABORT OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Crud_Storepocedure] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Crud_Storepocedure] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Crud_Storepocedure] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Crud_Storepocedure] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Crud_Storepocedure] SET  MULTI_USER 
GO
ALTER DATABASE [Crud_Storepocedure] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Crud_Storepocedure] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Crud_Storepocedure] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Crud_Storepocedure] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Crud_Storepocedure] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Crud_Storepocedure]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 16-07-2020 17:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Salary] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[JoinDate] [varchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[AddNewEmployee]    Script Date: 16-07-2020 17:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddNewEmployee]
(
@Name varchar(50),
@City varchar(50),
@Address varchar(50),
@Salary  varchar(50),
@Gender varchar(50),
@JoinDate varchar(50),
@IsActive bit
)
as 
begin
	Insert	into Employee
	values(
			@Name,
			@City,
			@Address,
			@Salary,
			@Gender,
			@JoinDate,
			@IsActive
		
		
	)
	end	
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployeeRecored]    Script Date: 16-07-2020 17:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[DeleteEmployeeRecored]
(
@EmpId int
)
as 
begin 
Delete from Employee where Id = @EmpId
End
GO
/****** Object:  StoredProcedure [dbo].[GetbyIdEmployee]    Script Date: 16-07-2020 17:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetbyIdEmployee](
@empId int
)
as 
begin 
	Select * from Employee where Id = @empId
end
GO
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 16-07-2020 17:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetEmployees]
as 
begin 
	Select * from Employee
End
GO
/****** Object:  StoredProcedure [dbo].[Shorting_and_Pagination]    Script Date: 16-07-2020 17:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[Shorting_and_Pagination]

-- EXEC Shorting_and_Pagination
 -- SP Parameters 
 (
 @Search varchar(50) = 'Man' , 
  @PageNo INT = 1  ,
  @PageSize INT = 25,  
  @SortColumn varchar(20) = '',
  @SortOrder varchar(4) = '' ,
  @StartDate varchar(20) = '2020-06-01',
  @EndDate varchar(20) = '2020-06-06',
  @StartTime varchar(20) ='',
  @EndTime varchar(20) =''
  )
  as
 -- Local Variables  
 DECLARE @SortCol NVARCHAR(20)		
 DECLARE @FirstRec INT  
 DECLARE @LastRec INT  
 DECLARE @TotalRows INT  
 SET @Search = LTRIM(RTRIM(@Search))  
 SET @SortCol = LTRIM(RTRIM(@SortColumn))  
 SET @FirstRec = ( @PageNo - 1 ) * 10  
 SET @LastRec = ( @PageNo * 10 + 1 )  
 SET @TotalRows = @FirstRec - @LastRec + 1  
 -- common table expression  
 IF (@StartTime='' AND @EndTime = '')
  IF (@StartDate='' And @EndDate = '')
 WITH CTE_Results  
 AS (
 SELECT ROW_NUMBER() OVER (ORDER BY  
      CASE WHEN @SortCol = 'Name' AND @SortOrder='ASC'  
           THEN Name  
      END ASC,  
      CASE WHEN @SortCol = 'Name' AND @SortOrder='DESC'  
           THEN Name  
      END DESC,  
      CASE WHEN @SortCol = 'City' AND @SortOrder='ASC'  
           THEN City  
      END ASC,  
      CASE WHEN @SortCol = 'City' AND @SortOrder='DESC'  
           THEN City  
      END DESC,  
	   CASE WHEN @SortCol = 'Salary' AND @SortOrder='ASC'  
           THEN Salary  
      END ASC,  
      CASE WHEN @SortCol = 'Salary' AND @SortOrder='DESC'  
           THEN Salary  
      END DESC,  
	   CASE WHEN @SortCol = 'Gender' AND @SortOrder='ASC'  
           THEN Gender  
      END ASC,  
      CASE WHEN @SortCol = 'Gender' AND @SortOrder='DESC'  
           THEN Gender  
      END DESC,    
	   CASE WHEN @SortCol = 'SrNo' AND @SortOrder='ASC'  
           THEN Gender  
      END ASC,  
      CASE WHEN @SortCol = 'SrNo' AND @SortOrder='DESC'  
           THEN Id  
      END DESC 
	  
 ) AS RowNum,  
      Count(*) over () AS TotalCount,  
      Id,  
      Name,  
      City,  
      Address,  
      Salary,
	  Gender,
	  Convert(varchar (20), Cast(JoinDate as time(0))) as tim,
	Convert(varchar(20),FORMAT(Cast( JoinDate as Date), 'MM/dd/yyyy', 'en-us')) as JoinDate,
	  IsActive  
      FROM [dbo].[Employee]  
     WHERE
	 (@Search IS NULL OR Name LIKE '%' + @Search + '%')  
	 OR (@Search IS NULL OR City LIKE '%' + @Search + '%')  
   OR (@Search IS NULL OR Salary LIKE '%' + @Search + '%')
    OR (@Search IS NULL OR Gender LIKE '%' + @Search + '%') 
	OR (@Search IS NULL OR Id LIKE '%' + @Search + '%') 
	 AND (Cast(JoinDate as time(0)) BETWEEN @StartTime and @EndTime)
	-- EXEC Shorting_and_Pagination
 )  
 SELECT  
   TotalCount,  
   RowNum,  
      ID,  
      Name,  
      City,  
      Address,  
      Salary,
	  Gender,
	 Convert(varchar (20), Cast(JoinDate as time(0))) as tim,
	 Convert(varchar(20),FORMAT(Cast( JoinDate as Date), 'MM/dd/yyyy', 'en-us'))as JoinDate,
	  IsActive  
 FROM CTE_Results AS Result  
 WHERE RowNum > @FirstRec AND RowNum < @LastRec 
 ORDER BY RowNum ASC 
 else	

  WITH CTE_Results 
   
 AS (
  
 SELECT ROW_NUMBER() OVER (ORDER BY  
      CASE WHEN @SortCol = 'Name' AND @SortOrder='ASC'  
           THEN Name  
      END ASC,  
      CASE WHEN @SortCol = 'Name' AND @SortOrder='DESC'  
           THEN Name  
      END DESC ,
	    CASE WHEN @SortCol = 'City' AND @SortOrder='ASC'  
           THEN City  
      END ASC,  
      CASE WHEN @SortCol = 'City' AND @SortOrder='DESC'  
           THEN City  
      END DESC,  
	   CASE WHEN @SortCol = 'Salary' AND @SortOrder='ASC'  
           THEN Salary  
      END ASC,  
      CASE WHEN @SortCol = 'Salary' AND @SortOrder='DESC'  
           THEN Salary  
      END DESC,  
	   CASE WHEN @SortCol = 'Gender' AND @SortOrder='ASC'  
           THEN Gender  
      END ASC,  
      CASE WHEN @SortCol = 'Gender' AND @SortOrder='DESC'  
           THEN Gender  
      END DESC
	  
 ) AS RowNum,  
      Count(*) over () AS TotalCount,  
      Id,  
      Name,  
      City,  
      Address,  
      Salary,
	  Gender,
	Convert(varchar(20),FORMAT(Cast( JoinDate as Date), 'MM/dd/yyyy', 'en-us')) as JoinDate,
	  IsActive  
      FROM [dbo].[Employee]  
     WHERE
	 (Cast(JoinDate as Date) BETWEEN @StartDate and @EndDate)
	 AND(@Search IS NULL OR Name LIKE '%' + @Search + '%')  
	
	-- EXEC Shorting_and_Pagination
 )  
 SELECT  
   TotalCount,  
   RowNum,  
      ID,  
      Name,  
      City,  
      Address,  
      Salary,
	  Gender,
	Convert(varchar(20),FORMAT(Cast( JoinDate as Date), 'MM/dd/yyyy', 'en-us')) as JoinDate,
	  IsActive  
 FROM CTE_Results AS Result  
 WHERE RowNum > @FirstRec AND RowNum < @LastRec 
 ORDER BY RowNum ASC 
 else
  WITH CTE_Results  
 AS (
 SELECT ROW_NUMBER() OVER (ORDER BY  
      CASE WHEN @SortCol = 'Name' AND @SortOrder='ASC'  
           THEN Name  
      END ASC,  
      CASE WHEN @SortCol = 'Name' AND @SortOrder='DESC'  
           THEN Name  
      END DESC ,
	    CASE WHEN @SortCol = 'City' AND @SortOrder='ASC'  
           THEN City  
      END ASC,  
      CASE WHEN @SortCol = 'City' AND @SortOrder='DESC'  
           THEN City  
      END DESC,  
	   CASE WHEN @SortCol = 'Salary' AND @SortOrder='ASC'  
           THEN Salary  
      END ASC,  
      CASE WHEN @SortCol = 'Salary' AND @SortOrder='DESC'  
           THEN Salary  
      END DESC,  
	   CASE WHEN @SortCol = 'Gender' AND @SortOrder='ASC'  
           THEN Gender  
      END ASC,  
      CASE WHEN @SortCol = 'Gender' AND @SortOrder='DESC'  
           THEN Gender  
      END DESC ,
	   CASE WHEN @SortCol = 'JoinDate' AND @SortOrder='ASC'  
           THEN JoinDate  
      END ASC,  
      CASE WHEN @SortCol = 'JoinDate' AND @SortOrder='DESC'  
           THEN JoinDate  
      END DESC 

	  
 ) AS RowNum,  
      Count(*) over () AS TotalCount,  
      Id,  
      Name,  
      City,  
      Address,  
      Salary,
	  Gender,
		Convert(varchar(20),FORMAT(Cast( JoinDate as Date), 'MM/dd/yyyy', 'en-us')) as JoinDate,
	  IsActive  
      FROM [dbo].[Employee]  
     WHERE
	 (Cast(JoinDate as time(0)) BETWEEN @StartTime and @EndTime)
	 AND(@Search IS NULL OR Name LIKE '%' + @Search + '%')  
	
	
	-- EXEC Shorting_and_Pagination
 )  
 SELECT  
   TotalCount,  
   RowNum,  
      ID,  
      Name,  
      City,  
      Address,  
      Salary,
	  Gender,
	Convert(varchar(20),FORMAT(Cast( JoinDate as Date), 'MM/dd/yyyy', 'en-us')) as JoinDate,
	  IsActive  
 FROM CTE_Results AS Result  
 WHERE RowNum > @FirstRec AND RowNum < @LastRec 
 ORDER BY RowNum ASC 
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 16-07-2020 17:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateEmployee](
@EmpId int,  
   @Name varchar (50),  
   @City varchar (50),  
   @Address varchar (50),  
   @Salary varchar(50),
   @Gender varchar(50),
   @JoinDate varchar(50),
   @IsActive bit
   )
   as
   begin
	Update Employee
	set	
	Name = @Name,
	City = @City,
	Address = @Address,
	Salary = @Salary,
	Gender = @Gender,
	JoinDate = @JoinDate,
	IsActive= @IsActive
	where Id = @EmpId

   end
GO
USE [master]
GO
ALTER DATABASE [Crud_Storepocedure] SET  READ_WRITE 
GO
