USE [Crud_Storepocedure]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/10/2020 6:09:37 PM ******/
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
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[AddNewEmployee]    Script Date: 4/10/2020 6:09:37 PM ******/
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
			@IsActive
		
	)
	end	
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployeeRecored]    Script Date: 4/10/2020 6:09:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetbyIdEmployee]    Script Date: 4/10/2020 6:09:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 4/10/2020 6:09:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 4/10/2020 6:09:37 PM ******/
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
	IsActive= @IsActive
	where Id = @EmpId

   end
GO
