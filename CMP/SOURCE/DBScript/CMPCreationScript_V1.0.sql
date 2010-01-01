/****************************************************
* Table Name: mcq_exam_master
****************************************************/

USE [CMP_Temp]
GO
/*****Object:  Table [dbo].[mcq_exam_master]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcq_exam_master](
	[exam_id] [int] IDENTITY(1,1) NOT NULL,
	[exam_name] [varchar](50) NOT NULL,
	[exam_abbr] [varchar](50) NOT NULL,
	[total_qns] [numeric](5, 0) NOT NULL,
	[total_marks] [numeric](3, 0) NOT NULL,
	[pass_mark] [numeric](2, 0) NULL,
	[exam_duration] [numeric](10, 0) NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](50) NOT NULL,
	[modified_date] [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_mcq_exam_master] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO


/****************************************************
* Table Name: mcq_section_master
****************************************************/
USE [CMP_Temp]
GO
/****** Object:  Table [dbo].[mcq_section_master]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcq_section_master](
	[exam_id] [int] NOT NULL,
	[section_id] [int] IDENTITY(1,1) NOT NULL,
	[section_name] [varchar](50) NOT NULL,
	[section_abbr] [varchar](50) NOT NULL,
	[section_seq] [numeric](3, 0) NOT NULL,
	[section_weight] [numeric](3, 0) NOT NULL,
	[total_simple_qns] [numeric](3, 0) NOT NULL,
	[simple_qn_weight] [numeric](3, 0) NOT NULL,
	[total_moderate_qns] [numeric](3, 0) NOT NULL,
	[moderate_qn_weight] [numeric](3, 0) NOT NULL,
	[total_complex_qns] [numeric](3, 0) NOT NULL,
	[complex_qn_weight] [numeric](3, 0) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](50) NOT NULL,
	[modified_date] [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_mcq_section_master] PRIMARY KEY CLUSTERED 
(
	[section_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO



/****************************************************
* Table Name: mcq_question_master
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  Table [dbo].[mcq_question_master]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcq_question_master](
	[exam_id] [varchar](25) NOT NULL,
	[section_id] [varchar](20) NOT NULL,
	[question_id] [varchar](25) NOT NULL,
	[question_text] [varchar](250) NOT NULL,
	[exam_type] [varchar](25) NOT NULL,
	[question_level] [varchar](25) NOT NULL,
	[question_type] [varchar](10) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](50) NOT NULL,
	[modified_date] [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_mcq_quest_master] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO


/****** Object:  ForeignKey [fk_mcq_section_master]    Script Date: 12/11/2009 17:02:23 ******/
ALTER TABLE [dbo].[mcq_section_master]  WITH CHECK ADD  CONSTRAINT [fk_mcq_section_master] FOREIGN KEY([exam_id])
REFERENCES [dbo].[mcq_exam_master] ([exam_id])
GO
ALTER TABLE [dbo].[mcq_section_master] CHECK CONSTRAINT [fk_mcq_section_master]
GO

/****************************************************
* Table Name: mcq_user_exam
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcq_user_exam](
	[user_exam_id] [varchar](25) NOT NULL,
	[exam_id] [varchar](25) NOT NULL,
	[user_id] [varchar](10) NOT NULL,
	[qn_id] [varchar](25) NOT NULL,
	[choice_id] [varchar](25) NOT NULL,
	[exam_date] [datetime] NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](50) NOT NULL,
	[modified_date] [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_mcq_user_exam] PRIMARY KEY CLUSTERED 
(
	[user_exam_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO


/****************************************************
* Table Name: mcq_exam_result
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  Table [dbo].[mcq_exam_result]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcq_exam_result](
	[exam_id] [varchar](25) NOT NULL,
	[user_id] [varchar](10) NOT NULL,
	[qn_id] [varchar](25) NOT NULL,
	[result] [varchar](10) NULL,
	[total_time_taken] [numeric](5, 2) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](50) NOT NULL,
	[modified_date] [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_mcq_exam_result] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC,
	[user_id] ASC,
	[qn_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO


/****************************************************
* Table Name: mcq_exam_section_result
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  Table [dbo].[mcq_exam_section_result]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mcq_exam_section_result](
	[exam_id] [varchar](25) NOT NULL,
	[user_id] [varchar](10) NOT NULL,
	[section_id] [varchar](25) NOT NULL,
	[marks] [numeric](5, 2) NOT NULL,
	[duration] [numeric](5, 2) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](50) NOT NULL,
	[modified_date] [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_mcq_exam_section_result] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC,
	[user_id] ASC,
	[section_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO


/****************************************************
* Table Name: mcq_question_options
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  Table [dbo].[mcq_question_options]    Script Date: 12/11/2009 17:01:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mcq_question_options](
	[option_id] [int] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NOT NULL,
	[OptText] [nvarchar](max) NOT NULL,
	[isAnswer] [bit] NULL,
 CONSTRAINT [PK_mcq_question_options] PRIMARY KEY CLUSTERED 
(
	[option_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****************************************************
* Table Name: survey_master
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[survey_master](
	[survey_id] [int] IDENTITY(1,1) NOT NULL,
	[survey_name] [varchar](50) NULL,
	[survey_abbr] [varchar](50) NULL,
	[total_qns] [int] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](50) NOT NULL,
	[modified_date] [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_survey_master] PRIMARY KEY CLUSTERED 
(
	[survey_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO


/****************************************************
* Table Name: survey_choice_master
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[survey_choice_master](
	[qn_id] [int] IDENTITY(1,1) NOT NULL,
	[survey_id] [int] NOT NULL,
	[choice] [varchar](50) NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](50) NOT NULL,
	[modified_date] [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [PK_survey_choice_master_1] PRIMARY KEY CLUSTERED 
(
	[qn_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO


/****************************************************
* Table Name: survey_result
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[survey_result](
	[user_survey_id] [varchar](25) NOT NULL,
	[survey_id] [varchar](25) NOT NULL,
	[user_id] [varchar](10) NOT NULL,
	[qn_id] [varchar](25) NOT NULL,
	[survey_user_answer] [varchar](250) NULL,
	[exam_dt] [datetime] NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](50) NOT NULL,
	[modified_date] [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_survey_result] PRIMARY KEY CLUSTERED 
(
	[user_survey_id] ASC,
	[survey_id] ASC,
	[user_id] ASC,
	[qn_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO



/****************************************************
* Table Name: module_master
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Module_Master](
	[module_id] [int] NOT NULL,
	[module_name] [varchar](50) NOT NULL,
	[module_type] [varchar](50) NOT NULL,
	[module_remarks] [varchar](500) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](50) NOT NULL,
	[modified_date] [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_module_master] PRIMARY KEY CLUSTERED 
(
	[module_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO




/****************************************************
* Table Name: company_module
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[company_module](
	[company_module_id] [varchar](25) NOT NULL,
	[company_id] [varchar](50) NOT NULL,
	[module_id] [varchar](500) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](50) NOT NULL,
	[modified_date] [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_company_module] PRIMARY KEY CLUSTERED 
(
	[company_module_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO



/****************************************************
* Table Name: cms_user_content_usage
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_user_content_usage](
	[user_id] [int] NOT NULL,
	[site_id] [int] NOT NULL,
	[cms_page_id] [int] NOT NULL,
	[duration_spend] [numeric](5, 0) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](50) NOT NULL,
	[modified_date] [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_cms_user_content_usage] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[site_id] ASC,
	[cms_page_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO



/****************************************************
* Table Name: company_sites
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[company_sites](
	[company_id] [varchar](25) NOT NULL,
	[site_id] [varchar](50) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](50) NOT NULL,
	[modified_date] [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_company_sites] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO





/****************************************************
* Table Name: user_role
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMD_USER_ROLE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_ID] [int] NOT NULL,
	[ROLES] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_JMD_USER_ROLE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




/****************************************************
* Table Name: dap_master
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DAP_Master](
	[DAPMasterID] [int] IDENTITY(1,1) NOT NULL,
	[DAPListID] [int] NULL,
	[DAPModuleID] [int] NULL,
 CONSTRAINT [PK_DAP_Master] PRIMARY KEY CLUSTERED 
(
	[DAPMasterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****************************************************
* Table Name: dap_list
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  Table [dbo].[DAP_List]    Script Date: 11/06/2009 23:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DAP_List](
	[DAPListID] [int] IDENTITY(1,1) NOT NULL,
	[DAPName] [varchar](50) NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
	[Delete_Flag] [varchar](2) NULL,
	[DAP_Remark] [varchar](500) NULL,
 CONSTRAINT [PK_DAP_List] PRIMARY KEY CLUSTERED 
(
	[DAPListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO


/****************************************************
* Table Name: fap_list
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FAP_List](
	[FAPListID] [int] IDENTITY(1,1) NOT NULL,
	[FAPName] [varchar](50) NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
	[Delete_Flag] [varchar](2) NULL,
	[FAP_Remark] [varchar](500) NULL,
 CONSTRAINT [pk_fap_list] PRIMARY KEY CLUSTERED 
(
	[FAPListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO




/****************************************************
* Table Name: fap_master
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAP_Master](
	[FAPMasterID] [int] IDENTITY(1,1) NOT NULL,
	[FAPListID] [int] NULL,
	[FAPFunctionID] [int] NULL,
 CONSTRAINT [pk_fap_master] PRIMARY KEY CLUSTERED 
(
	[FAPMasterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****************************************************
* Table Name: fap_master
****************************************************/

USE [CMP_Temp]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FAP_Function](
	[FAPFunctionID] [int] IDENTITY(1,1) NOT NULL,
	[FAP_Function] [varchar](50) NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
	[Delete_Flag] [varchar](2) NULL,
	[Function_Remarks] [varchar](500) NULL,
 CONSTRAINT [PK_FAP_Function] PRIMARY KEY CLUSTERED 
(
	[FAPFunctionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO




/****************************************************
* Table Name: jmd_user
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  Table [dbo].[JMD_USER]    Script Date: 12/11/2009 16:59:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMD_USER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SITE_ID] [int] NOT NULL CONSTRAINT [DF_JMD_USER_SITE_ID]  DEFAULT ((0)),
	[USER_NAME] [nvarchar](50) NOT NULL,
	[USER_DISPLAY_NAME] [nvarchar](50) NOT NULL,
	[PASSWORD_HASH] [nvarchar](50) NOT NULL,
	[SALT] [nvarchar](50) NOT NULL,
	[IS_INTERNAL] [int] NOT NULL CONSTRAINT [DF_JMD_USER_IS_INTERNAL]  DEFAULT ((0)),
	[EMAIL] [nvarchar](50) NOT NULL CONSTRAINT [DF_JMD_USER_EMAIL]  DEFAULT (N'changedefault'),
	[STATUS] [int] NOT NULL CONSTRAINT [DF_JMD_USER_STATUS]  DEFAULT ((0)),
	[CREATION_DATE] [datetime] NOT NULL CONSTRAINT [DF_JMD_USER_CREATION_DATE]  DEFAULT (getdate()),
	[VALID_FROM] [datetime] NOT NULL CONSTRAINT [DF_JMD_USER_VALID_FROM]  DEFAULT (getdate()),
	[VALID_TO] [datetime] NOT NULL CONSTRAINT [DF_JMD_USER_VALID_TO]  DEFAULT (getdate()),
	[ACTIVATION_KEY] [nvarchar](100) NULL,
 CONSTRAINT [PK_JMD_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_JMD_USER_SITE_UNQ] UNIQUE NONCLUSTERED 
(
	[SITE_ID] ASC,
	[USER_NAME] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****************************************************
* Table Name: jmd_user_address
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  Table [dbo].[JMD_USER_ADDRESS]    Script Date: 12/11/2009 17:00:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMD_USER_ADDRESS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_ID] [int] NULL,
	[ADDRESS1] [nvarchar](150) NOT NULL,
	[ADDRESS2] [nvarchar](150) NULL,
	[ADDRESS3] [nvarchar](150) NULL,
	[CITY_ID] [int] NULL,
	[COUNTY_ID] [int] NULL,
	[STATE_ID] [int] NULL,
	[COUNTRY_ID] [int] NULL,
	[IS_PRIMARY] [int] NULL DEFAULT ((0)),
	[PHONE_HOME] [nvarchar](30) NULL,
	[PHONE_WORK] [nvarchar](30) NULL,
	[PHONE_CELL] [nvarchar](30) NULL,
	[EMAIL1] [nvarchar](50) NULL,
	[EMAIL2] [nvarchar](50) NULL,
	[EMAIL3] [nvarchar](50) NULL,
	[WEB1] [nvarchar](50) NULL,
	[WEB2] [nvarchar](50) NULL,
	[WEB3] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****************************************************
* Table Name: user_role
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 12/11/2009 17:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_role](
	[user_id] [varchar](25) NOT NULL,
	[role_id] [varchar](25) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[modified_by] [varchar](50) NOT NULL,
	[modified_date] [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_user_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO





/****************************************************
* Table Name: jmd_role
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  Table [dbo].[JMD_ROLE]    Script Date: 12/11/2009 16:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMD_ROLE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SITE_ID] [int] NOT NULL,
	[ROLE_NAME] [nvarchar](50) NOT NULL,
	[IS_INTERNAL] [int] NOT NULL,
	[PARENT_ROLE] [int] NULL,
 CONSTRAINT [PK_JMD_ROLE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_JMD_ROLE_SITE_UNQ] UNIQUE NONCLUSTERED 
(
	[SITE_ID] ASC,
	[ROLE_NAME] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




/****************************************************
* Table Name: company_master
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company_Master](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](100) NOT NULL,
	[CompanyAddress1] [varchar](150) NULL,
	[CompanyAddress2] [varchar](150) NULL,
	[CompanyAddress3] [varchar](150) NULL,
	[PostalCode] [varchar](12) NULL,
	[ContactPerson] [varchar](50) NULL,
	[ContactEmail] [varchar](50) NULL,
	[ContactNo] [varchar](50) NULL,
	[SubscribeDate] [datetime] NULL,
	[CommMode] [varchar](12) NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[ValidPeriod_From] [datetime] NULL,
	[ValidPeriod_To] [datetime] NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
	[Delete_Flag] [varchar](2) NULL,
	[Company_Remark] [varchar](500) NULL,
 CONSTRAINT [PK_Company_Master_1] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO


/****************************************************
* Table Name: user_master
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Master](
	[UserMasterID] [int] IDENTITY(1,1) NOT NULL,
	[UserListID] [int] NULL,
	[RoleListID] [int] NULL,
 CONSTRAINT [PK_User_Master] PRIMARY KEY CLUSTERED 
(
	[UserMasterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[Role_List]    Script Date: 11/08/2009 23:23:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role_List](
	[RoleListID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
	[Role_Remark] [varchar](500) NULL,
	[Delete_Flag] [varchar](2) NULL,
 CONSTRAINT [PK_Role_List] PRIMARY KEY CLUSTERED 
(
	[RoleListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[Role_DAP]    Script Date: 11/08/2009 22:43:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_DAP](
	[RoleDAPID] [int] IDENTITY(1,1) NOT NULL,
	[RoleListID] [int] NULL,
	[DAPListID] [int] NULL,
 CONSTRAINT [PK_Role_DAP] PRIMARY KEY CLUSTERED 
(
	[RoleDAPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[Role_FAP]    Script Date: 11/08/2009 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_FAP](
	[RoleFAPID] [int] IDENTITY(1,1) NOT NULL,
	[RoleListID] [int] NULL,
	[FAPListID] [int] NULL,
 CONSTRAINT [PK_Role_FAP] PRIMARY KEY CLUSTERED 
(
	[RoleFAPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[UserAdmin_List]    Script Date: 11/17/2009 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAdmin_List](
	[UserAdminListID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[UserAdminName] [varchar](50) NULL,
	[UserAdminPass] [varchar](50) NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
	[Delete_Flag] [varchar](2) NULL,
	[UserAdmin_Remark] [varchar](500) NULL,
 CONSTRAINT [PK_UserAdmin_List] PRIMARY KEY CLUSTERED 
(
	[UserAdminListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO



/****** Object:  Table [dbo].[UserAdmin_Master]    Script Date: 11/15/2009 17:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAdmin_Master](
	[UserAdminMasterID] [int] IDENTITY(1,1) NOT NULL,
	[UserAdminListID] [int] NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_UserAdmin_Master] PRIMARY KEY CLUSTERED 
(
	[UserAdminMasterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[User_List]    Script Date: 11/22/2009 09:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_List](
	[UserListID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserAdminID] [int] NULL,
	[UserPass] [varchar](50) NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Modified_By] [varchar](50) NULL,
	[Modified_Date] [datetime] NULL,
	[User_Remark] [varchar](500) NULL,
	[Delete_Flag] [char](2) NULL,
 CONSTRAINT [PK_User_List] PRIMARY KEY CLUSTERED 
(
	[UserListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO




/****************************************************
* Table Name: jmd_div
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMD_DIV](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SITE_ID] [int] NOT NULL,
	[DIV_NAME] [nvarchar](50) NOT NULL,
	[DIV_SORT] [int] NOT NULL CONSTRAINT [DF_JMD_DIV_DIV_SORT]  DEFAULT ((0)),
	[PARENT_DIV_ID] [int] NULL,
	[IS_INTERNAL] [int] NOT NULL CONSTRAINT [DF_JMD_DIV_IS_INTERNAL]  DEFAULT ((0)),
 CONSTRAINT [PK_JMD_PANE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****************************************************
* Table Name: jmd_mod
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMD_MOD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SITE_ID] [int] NOT NULL,
	[MOD_NAME] [nvarchar](255) NULL,
	[MOD_PATH] [nvarchar](1000) NULL,
	[MOD_EDIT_FORM] [nvarchar](255) NULL,
	[MOD_FRIENDLY_NAME] [nvarchar](255) NULL,
	[IS_ADMIN] [int] NULL,
	[CAN_SHOW_MOD_HEADER] [int] NULL DEFAULT ((1)),
	[IS_VIEWSTATE_ENABLED] [int] NOT NULL CONSTRAINT [DF_JMD_MOD_IS_VIEWSTATE_ENABLED]  DEFAULT ((1)),
 CONSTRAINT [PK_MOD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****************************************************
* Table Name: jmd_mod_admin
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMD_MOD_ADMIN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SITE_ID] [int] NULL,
	[PROP_TAB] [nvarchar](50) NULL,
	[PROP_TAB_SORT] [int] NULL,
	[PROP_GROUP] [nvarchar](50) NULL,
	[PROP_GROUP_SORT] [int] NULL,
	[PROP_CODE] [nvarchar](50) NULL,
	[PROP_CODE_SORT] [int] NULL,
	[PROP_CAPTION] [nvarchar](100) NULL,
	[PROP_DESC] [nvarchar](255) NULL,
	[PROP_TYPE] [int] NULL,
	[PROP_INPUT_VALUES] [nvarchar](2000) NULL,
	[PROP_VALUE] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****************************************************
* Table Name: jmd_obj
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMD_OBJ](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SITE_ID] [int] NULL,
	[OBJ_NAME] [nvarchar](100) NOT NULL,
	[OBJ_TYPE] [int] NULL,
	[OBJ_DESC] [nvarchar](1000) NULL,
	[PARENT_OBJ_ID] [int] NULL,
	[IS_INTERNAL] [int] NULL,
	[CREATION_DATE] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




/****************************************************
* Table Name: jmd_mod_cj_category
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JMD_MOD_CJ_CATEGORY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CATEGORY] [varchar](250) NOT NULL,
	[INSERTED_ON] [datetime] NULL DEFAULT (getdate()),
 CONSTRAINT [PK_MOD_CJ_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


/****************************************************
* Table Name: jmd_mod_html
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMD_MOD_HTML](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PAGE_MOD_ID] [int] NOT NULL,
	[HTML_TEXT] [text] NOT NULL,
	[TITLE] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_MOD_HTML] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



/****************************************************
* Table Name: jmd_page_mod
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMD_PAGE_MOD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PAGE_ID] [int] NOT NULL,
	[MOD_ID] [int] NOT NULL,
	[MOD_TITLE] [nvarchar](50) NULL,
	[DIV_ID] [int] NOT NULL,
	[SORT] [int] NOT NULL,
	[IS_PUBLISHED] [int] NOT NULL,
	[SHOW_ON_ALL_PAGES] [int] NOT NULL CONSTRAINT [DF_JMD_PAGE_MOD_SHOW_ON_ALL_PAGES]  DEFAULT ((0)),
	[VIEW_ROLE] [nvarchar](1000) NOT NULL CONSTRAINT [DF_JMD_PAGE_MOD_VIEW_ROLE]  DEFAULT (N'Admin'),
	[EDIT_ROLE] [nvarchar](1000) NOT NULL CONSTRAINT [DF_JMD_PAGE_MOD_EDIT_ROLE]  DEFAULT (N'Admin'),
	[DELETE_ROLE] [nvarchar](1000) NOT NULL CONSTRAINT [DF_JMD_PAGE_MOD_DELETE_ROLE]  DEFAULT (N'Admin'),
	[MOVE_ROLE] [nvarchar](1000) NOT NULL CONSTRAINT [DF_JMD_PAGE_MOD_MOVE_ROLE]  DEFAULT (N'Admin'),
	[EDIT_CONTENTS_ROLE] [nvarchar](1000) NOT NULL CONSTRAINT [DF_JMD_PAGE_MOD_EDIT_CONTENTS_ROLE]  DEFAULT (N'Admin'),
	[IS_DELETED] [int] NULL CONSTRAINT [DF_JMD_PAGE_MOD_IS_DELETED]  DEFAULT ((0)),
 CONSTRAINT [PK_JMD_PAGE_MOD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****************************************************
* Table Name: jmd_page
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMD_PAGE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SITE_ID] [int] NOT NULL,
	[PAGE_NAME] [nvarchar](255) NOT NULL,
	[PAGE_CAPTION] [nvarchar](50) NULL,
	[PAGE_SORT] [int] NOT NULL CONSTRAINT [DF_JMD_PAGE_PAGE_SORT]  DEFAULT ((0)),
	[META_TITLE] [nvarchar](255) NOT NULL,
	[META_DESC] [nvarchar](1000) NOT NULL,
	[META_KEYWORDS] [nvarchar](1000) NOT NULL,
	[PARENT_PAGE_ID] [int] NULL,
	[IS_PUBLISHED] [int] NULL,
	[IS_ROOT] [int] NULL CONSTRAINT [DF_JMD_PAGE_IS_ROOT]  DEFAULT ((0)),
	[IS_MENU_ITEM] [int] NULL CONSTRAINT [DF_JMD_PAGE_IS_MENU_ITEM]  DEFAULT ((1)),
	[VIEW_ROLES] [nvarchar](1000) NOT NULL CONSTRAINT [DF_JMD_PAGE_AUTH_ROLE]  DEFAULT (N'Admin'),
	[ADD_ROLES] [nvarchar](1000) NOT NULL CONSTRAINT [DF_JMD_PAGE_ADD_ROLES]  DEFAULT (N'Admin'),
	[EDIT_ROLES] [nvarchar](1000) NOT NULL CONSTRAINT [DF_JMD_PAGE_EDIT_ROLES]  DEFAULT (N'Admin'),
	[DELETE_ROLES] [nvarchar](1000) NOT NULL CONSTRAINT [DF_JMD_PAGE_DELETE_ROLES]  DEFAULT (N'Admin'),
	[MOVE_ROLES] [nvarchar](1000) NOT NULL CONSTRAINT [DF_JMD_PAGE_MOVE_ROLES]  DEFAULT (N'Admin'),
	[ADD_MODULE_ROLES] [nvarchar](1000) NOT NULL CONSTRAINT [DF_JMD_PAGE_ADD_MODULE_ROLES]  DEFAULT (N'Admin'),
	[IS_INTERNAL] [int] NOT NULL CONSTRAINT [DF_JMD_PAGE_IS_INTERNAL]  DEFAULT ((0)),
	[LOAD_SHARED_MODULES] [int] NULL CONSTRAINT [DF_JMD_PAGE_LOAD_SHARED_MODULES]  DEFAULT ((1)),
	[IS_DELETED] [int] NULL CONSTRAINT [DF_JMD_PAGE_IS_DELETED]  DEFAULT ((0)),
	[IS_VIEWSTATE_ENABLED] [int] NOT NULL CONSTRAINT [DF_JMD_PAGE_IS_VIEWSTATE_ENABLED]  DEFAULT ((1)),
 CONSTRAINT [PK_JMD_PAGE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****************************************************
* Table Name: jmd_col_ext
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMD_COL_EXT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[JMD_COL_ID] [int] NULL,
	[COL_EXT_DATA] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****************************************************
* Table Name: jmd_col_type
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMD_COL_TYPE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SITE_ID] [int] NULL,
	[COL_TYPE] [nvarchar](50) NULL,
	[COL_DATA_TYPE] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****************************************************
* Table Name: jmd_page_mod_exclude
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMD_PAGE_MOD_EXCLUDE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PAGE_MOD_ID] [int] NULL,
	[PAGE_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****************************************************
* Table Name: jmd_site
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JMD_SITE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SITE_URL] [nvarchar](255) NOT NULL,
	[ALIAS_SITE_ID] [int] NULL,
	[STYLE_SHEET] [nvarchar](255) NULL CONSTRAINT [DF__JMD_SITE__STYLE___20C1E124]  DEFAULT ('Default.css'),
	[SITE_VERSION] [nvarchar](20) NULL,
	[SITE_FOLDER] [nvarchar](255) NULL,
	[COMPANYID] [int] NULL,
	[CREATED_BY] [varchar](50) NULL,
	[CREATED_DATE] [datetime] NULL,
	[MODIFIED_BY] [varchar](50) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[DELETE_FLAG] [varchar](2) NULL,
 CONSTRAINT [PK_SITE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO



/****************************************************
* Table Name: jmd_col
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JMD_COL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[JMD_OBJ_ID] [int] NULL,
	[JMD_COL_NAME] [nvarchar](50) NULL,
	[JMD_COL_CAPTION] [nvarchar](50) NULL,
	[JMD_COL_TYPE_ID] [int] NULL,
	[JMD_COL_DESC] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CMS_SITE_OUTLINE]    Script Date: 12/11/2009 16:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CMS_SITE_OUTLINE](
	[SITE_ID] [int] NOT NULL,
	[PAGE_ID] [int] IDENTITY(1,1) NOT NULL,
	[PAGE_NAME] [varchar](250) NOT NULL,
	[PAGE_REMARK] [varchar](250) NOT NULL,
	[SORT_NUMBER] [int] NOT NULL,
	[IS_OUTLINE] [varchar](1) NOT NULL,
	[CREATED_BY] [varchar](50) NOT NULL,
	[CREATED_DATE] [datetime] NOT NULL,
	[MODIFIED_BY] [varchar](50) NOT NULL,
	[MODIFIED_DATE] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[CMS_SITE_TREEVIEW]    Script Date: 12/11/2009 16:52:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CMS_SITE_TREEVIEW](
	[SITE_ID] [int] NOT NULL,
	[PAGE_ID] [int] NOT NULL,
	[CHILD_PAGE_ID] [int] NOT NULL,
	[CHILD_SORT_PAGE_NUM] [int] NOT NULL,
	[CREATED_BY] [varchar](50) NOT NULL,
	[CREATED_DATE] [datetime] NOT NULL,
	[MODIFIED_BY] [varchar](50) NOT NULL,
	[MODIFIED_DATE] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO





-- Insert values into FAP_Function
INSERT INTO [FAP_Function]([FAP_Function],[Created_By],[Created_Date],[Modified_By],[Modified_Date],[Delete_Flag],[Function_Remarks])
VALUES ('Take Exam', 'Haiyang', '10/10/2009 12:00:00 AM', 'Haiyang', '10/10/2009 12:00:00 AM',0,'Able to take exam')

INSERT INTO [FAP_Function]([FAP_Function],[Created_By],[Created_Date],[Modified_By],[Modified_Date],[Delete_Flag],[Function_Remarks])
VALUES ('Take Exercise', 'Haiyang', '10/10/2009 12:00:00 AM', 'Haiyang', '10/10/2009 12:00:00 AM',0,'Able to take exercise')

INSERT INTO [FAP_Function]([FAP_Function],[Created_By],[Created_Date],[Modified_By],[Modified_Date],[Delete_Flag],[Function_Remarks])
VALUES ('Print Certificate', 'Haiyang', '10/10/2009 12:00:00 AM', 'Haiyang', '10/10/2009 12:00:00 AM',0,'Able to print certificate')

INSERT INTO [FAP_Function]([FAP_Function],[Created_By],[Created_Date],[Modified_By],[Modified_Date],[Delete_Flag],[Function_Remarks])
VALUES ('Create User Admin', 'Haiyang', '10/10/2009 12:00:00 AM', 'Haiyang', '10/10/2009 12:00:00 AM',0,'Able to create user admin')

INSERT INTO [FAP_Function]([FAP_Function],[Created_By],[Created_Date],[Modified_By],[Modified_Date],[Delete_Flag],[Function_Remarks])
VALUES ('Create User', 'Haiyang', '10/10/2009 12:00:00 AM', 'Haiyang', '10/10/2009 12:00:00 AM',0,'Able to create user')

INSERT INTO [FAP_Function]([FAP_Function],[Created_By],[Created_Date],[Modified_By],[Modified_Date],[Delete_Flag],[Function_Remarks])
VALUES ('Create Module', 'Haiyang', '10/10/2009 12:00:00 AM', 'Haiyang', '10/10/2009 12:00:00 AM',0,'Able to create module')


-- Insert values into FAP_List
INSERT INTO [FAP_List]([FAPName],[Created_By],[Created_Date],[Modified_By],[Modified_Date],[Delete_Flag],[FAP_Remark])
VALUES ('Portal Admin', 'Haiyang', '10/10/2009 12:00:00 AM', 'Haiyang', '10/10/2009 12:00:00 AM', 0, 'FAP for portal admin')

INSERT INTO [FAP_List]([FAPName],[Created_By],[Created_Date],[Modified_By],[Modified_Date],[Delete_Flag],[FAP_Remark])
VALUES ('User Admin', 'Haiyang', '10/10/2009 12:00:00 AM', 'Haiyang', '10/10/2009 12:00:00 AM', 0, 'FAP for user admin')

INSERT INTO [FAP_List]([FAPName],[Created_By],[Created_Date],[Modified_By],[Modified_Date],[Delete_Flag],[FAP_Remark])
VALUES ('User', 'Haiyang', '10/10/2009 12:00:00 AM', 'Haiyang', '10/10/2009 12:00:00 AM', 0, 'FAP for user')


-- Insert values into FAP_Master

INSERT INTO [FAP_Master]([FAPListID],[FAPFunctionID]) VALUES (2,1)
INSERT INTO [FAP_Master]([FAPListID],[FAPFunctionID]) VALUES (2,2)
INSERT INTO [FAP_Master]([FAPListID],[FAPFunctionID]) VALUES (0,1)
INSERT INTO [FAP_Master]([FAPListID],[FAPFunctionID]) VALUES (0,2)
INSERT INTO [FAP_Master]([FAPListID],[FAPFunctionID]) VALUES (1,1)
INSERT INTO [FAP_Master]([FAPListID],[FAPFunctionID]) VALUES (1,2)
INSERT INTO [FAP_Master]([FAPListID],[FAPFunctionID]) VALUES (3,3)
INSERT INTO [FAP_Master]([FAPListID],[FAPFunctionID]) VALUES (3,4)



/****************************************************
* SP Name: JMD_MOD_CJ_CATEGORY_SAVE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_MOD_CJ_CATEGORY_SAVE]    Script Date: 12/11/2009 16:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_MOD_CJ_CATEGORY_SAVE]
  @ID INT ,
  @CATEGORY VARCHAR(250)
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  if not exists ( Select * From JMD_MOD_CJ_CATEGORY Where ID = @ID )
  begin
    Insert into JMD_MOD_CJ_CATEGORY
    (
      Category
    ) 
    values    
    (
      @Category
    )
  end
  else
  begin
    Update
      JMD_MOD_CJ_CATEGORY
    Set
		Category = @Category
    Where
      ID = @ID
  end
GO
/****** Object:  StoredProcedure [dbo].[JMD_MOD_HTML_SAVE]    Script Date: 12/11/2009 16:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Select * from JMD_MOD_HTML
CREATE PROCEDURE [dbo].[JMD_MOD_HTML_SAVE]
  @Page_Mod_Id int,
  @Title nvarchar(255),
  @HTML_Text Text
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  If not exists ( Select * From JMD_MOD_HTML where page_mod_id = @Page_Mod_Id)
  begin
    Insert into JMD_MOD_HTML
    (
        Page_Mod_Id,
        Title,
        HTML_Text 
    )
    values
    (
        @Page_Mod_Id,
        @Title,
        @HTML_Text 
    )
  end
  else
  begin
    Update
      JMD_MOD_HTML
    Set
        Title = @Title,
        HTML_Text = @HTML_Text
    Where
      Page_Mod_Id = @Page_Mod_Id
  end
GO





/****************************************************
* SP Name: JMD_MOD_HTML_Select
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_MOD_HTML_Select]    Script Date: 12/11/2009 16:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************
  NAME: JMD_MOD_HTML
  PURPOSE: HTML Module
EXEC JMD_MOD_HTML_Select 7

*****************************************************************************/
CREATE PROCEDURE [dbo].[JMD_MOD_HTML_Select]
  @Page_Mod_Id Int
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Select
    Title, HTML_Text
  From
    JMD_MOD_HTML        
  Where
    Page_Mod_Id = @Page_Mod_Id
GO



/****************************************************
* SP Name: JMD_OBJ_SELECT
****************************************************/

USE [CMP_Temp]
GO

/****** Object:  StoredProcedure [dbo].[JMD_OBJ_SELECT]    Script Date: 12/11/2009 16:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_OBJ_SELECT]
  @JMD_OBJ_ID int
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Select
    *
  From  
    JMD_OBJ
  Where
    Id = @JMD_OBJ_ID
GO



/****************************************************
* View Name: JMD_PAGE_MOD_SELECT
****************************************************/

USE [CMP_Temp]
GO


/****** Object:  View [dbo].[JMD_PAGE_MOD_SELECT]    Script Date: 12/11/2009 17:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[JMD_PAGE_MOD_SELECT]
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.

	Author: Ajay Handa
	NAME: JMD_PAGE_MOD_SELECT
	PURPOSE: Consolidated Select of Page Modules
	
	WI: 650 - Delete / Undelete Page Modules. Filter 
		IS_DELETED Flag can now have 3 values:
		0 = Not Deleted
		1 = Deleted			
		5 = Permanently Deleted :) Leaving the possibility of doing undo using SQL
	WI:979: Enable/Disable view state by module 	
*/
  Select
    a.*, 
    Page_Mod_Id = b.Id, b.Mod_Id, b.Mod_Title, b.Div_Id, Mod_Sort = b.Sort, 
    Mod_View_Role = b.View_Role,
    Mod_Edit_Role = b.Edit_Role, Mod_Delete_Role = b.Delete_Role, 
    Mod_Move_Role = b.Move_Role, Mod_Edit_Contents_Role = b.Edit_Contents_Role,
    Is_Mod_Published = b.Is_Published, b.Show_On_All_Pages,
	Is_Mod_Deleted = b.Is_Deleted, 
    c.Mod_Name, c.Mod_Path, c.Mod_Edit_Form, c.Mod_Friendly_Name, c.Is_Admin,
    c.CAN_SHOW_MOD_HEADER, MOD_IS_VIEWSTATE_ENABLED = c.IS_VIEWSTATE_ENABLED,
    d.Div_Name, d.Div_Sort, d.Parent_Div_Id
  From
    JMD_PAGE a
    Left Outer Join JMD_PAGE_MOD b on a.Id = b.Page_Id
    Left Outer Join JMD_MOD c on c.Id = b.Mod_Id
    Left Outer Join JMD_DIV d on d.Id = b.Div_Id  
  Where
    Coalesce(b.Is_Deleted,0) < 5
GO
/****** Object:  StoredProcedure [dbo].[JMD_USER_ROLE_SAVE]    Script Date: 12/11/2009 16:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_USER_ROLE_SAVE]
  @User_Id int,
  @Roles nvarchar(1000)
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/
  if not exists ( Select * From JMD_USER_ROLE where [user_id] = @User_Id)
  begin
    Insert into JMD_USER_ROLE
    (
      [User_Id], Roles
    )
    values
    (
      @User_Id, @Roles
    )
  end
  else
  begin
    Update
      JMD_USER_ROLE
    Set
      Roles = @Roles
    Where
      [User_Id] = @User_Id
  end
GO



/****************************************************
* SP Name: JMD_PAGE_MOD_DELETE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_PAGE_MOD_DELETE]    Script Date: 12/11/2009 16:50:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_PAGE_MOD_DELETE]
  @Page_Mod_Id int,
  @Action int
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
	
	Author: Ajay Handa
	Purpose: To Delete/Recycle/Undo Recycle a page module
	
	WI:650: Manage module delete/undelete
*/

  Update
    JMD_PAGE_MOD
  Set
    Is_Deleted = @Action
  Where
    Id = @Page_Mod_Id
GO


/****************************************************
* SP Name: JMD_PAGE_MOD_EXCLUDE_SELECT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_PAGE_MOD_EXCLUDE_SELECT]    Script Date: 12/11/2009 16:51:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_PAGE_MOD_EXCLUDE_SELECT]
  @Page_Id int
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Select
    *
  From
    JMD_PAGE_MOD_EXCLUDE
  Where
    Page_Id = @Page_Id
GO



/****************************************************
* View Name: JMD_COL_SELECT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  View [dbo].[JMD_COL_SELECT]    Script Date: 12/11/2009 17:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[JMD_COL_SELECT]
AS
Select
    a.*, 
    b.COL_EXT_DATA,
    c.Col_Type 
  From
    JMD_COL a
  Inner Join 
    JMD_COL_TYPE c On a.JMD_COL_TYPE_ID = c.ID 
  Left Outer Join 
    JMD_COL_EXT b On a.ID = b.Jmd_Col_Id
GO




/****************************************************
* SP Name: JMD_COL_EXT_SAVE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_COL_EXT_SAVE]    Script Date: 12/11/2009 16:50:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[JMD_COL_EXT_SAVE]
  @JMD_COL_EXT_ID INT ,
  @JMD_COL_ID INT,
  @COL_EXT_DATA TEXT
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/
  if not exists ( Select * from JMD_COL_EXT where Id = @JMD_COL_EXT_ID )
  begin
    insert into JMD_COL_EXT 
    (
      JMD_COL_ID, COL_EXT_DATA
    )
    values
    (
      @JMD_COL_ID, @COL_EXT_DATA
    )
  end
  else
  begin
    Update
      JMD_COL_EXT
    Set
      COL_EXT_DATA = @COL_EXT_DATA
    Where
      JMD_COL_ID = @JMD_COL_ID
  end
GO




/****************************************************
* Function Name: JMD_GET_SITE_ID
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  UserDefinedFunction [dbo].[JMD_GET_SITE_ID]    Script Date: 12/11/2009 17:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************
  NAME: JMD_GET_SITE_ID
  PURPOSE: Returns SITE_ID for the given Site_URL
  Example: Select dbo.JMD_GET_SITE_ID('JMDCMS.Web')
  Select * From JMD_Site
  Update jmd_site set alias_site_id =5 where id = 6
*****************************************************************************/

CREATE FUNCTION [dbo].[JMD_GET_SITE_ID]
(
	 @Site_URL nvarchar(255)
)
RETURNS int
AS
BEGIN
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

	-- Declare the return variable here
	DECLARE 
    @Site_Id int,
    @Alias_Site_Id int
    
  Select
    @Alias_Site_Id = 0

	-- Add the T-SQL statements to compute the return value here
	Select
    @Site_Id = Id, @Alias_Site_Id = Alias_Site_Id
  From
    JMD_Site
  Where
    Site_URL = @Site_URL
 
  If ( coalesce(@Alias_Site_Id,0) <> 0)
  begin
    Select @Site_Id = @Alias_Site_Id
  end

	-- Return the result of the function
	RETURN Coalesce(@Site_Id,0)

END
GO




/****************************************************
* SP Name: JMD_SITE_INSERT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_SITE_INSERT]    Script Date: 12/11/2009 16:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************
  NAME: JMD_SITE_INSERT
  PURPOSE: Insert procedure for JMD_SITE Table
*****************************************************************************/
CREATE PROCEDURE [dbo].[JMD_SITE_INSERT]
  @SITE_URL nvarchar(255),
  @ALIAS_SITE_ID int = null,
  @STYLE_SHEET nvarchar(255),
  @SITE_VERSION nvarchar(20),
  @SITE_FOLDER nvarchar(255)
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Insert into JMD_SITE
  (
    SITE_URL, ALIAS_SITE_ID, Style_Sheet, Site_Version, Site_Folder
  )
  values
  (
    @SITE_URL, @ALIAS_SITE_ID, @Style_Sheet, @Site_Version, @Site_Folder
  )   
  Return @@Identity
GO




/****************************************************
* SP Name: JMD_COL_SAVE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_COL_SAVE]    Script Date: 12/11/2009 16:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_COL_SAVE]
  @JMD_COL_ID INT,
  @JMD_OBJ_ID INT,
  @JMD_COL_NAME NVARCHAR(50),
  @JMD_COL_CAPTION NVARCHAR(50),
  @JMD_COL_DESC Text,
  @JMD_COL_TYPE_ID INT,
  @COL_EXT_DATA Text
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @TableName nvarchar(100),
    @Col_Data_Type nvarchar(50),
    @Col_Id Int,
    @Jmd_Col_Ext_Id int

  Select
    @TableName = 'JMD_'+Convert(Varchar(50),Site_Id)+'_'++OBJ_NAME
  From
    JMD_OBJ
  Where
    ID = @JMD_OBJ_ID

  if not exists ( Select * From sysobjects where object_name(ID) = @TableName and Type = 'U' )
  begin
      Exec('Create Table '+@TableName+'(ID int identity(1,1) primary key not null)')
  end  

  if NOT exists ( select * from jmd_col where id = @JMD_COL_ID )
  begin 
    insert into jmd_col
    (
      jmd_obj_id, jmd_col_name, jmd_col_caption, jmd_col_desc, jmd_col_type_Id
    )
    values
    (
      @jmd_obj_id, @jmd_col_name, @jmd_col_caption, @jmd_col_desc, @jmd_col_type_Id
    )
    Select
      @Col_Id = SCOPE_IDENTITY() 

    if not exists ( 
      Select * From syscolumns 
        Where  object_name(id) = @TableName and 
              [Name] = @JMD_COL_NAME 
          )
    begin
      Select
        @Col_Data_Type = Col_Data_Type
      From
        JMD_Col_Type
      Where
        Id = @JMD_COL_TYPE_ID
        
      exec('Alter Table '+@TableName+' Add '+@JMD_COL_NAME+' '+@Col_Data_Type+' NULL ' )
    end

    Exec 
      JMD_COL_EXT_SAVE '0', @Col_Id, @COL_EXT_DATA

  end
  else
  begin
    Update
      JMD_COL
    Set
      jmd_obj_id = @jmd_obj_id,
      jmd_col_name = @jmd_col_name, 
      jmd_col_caption = @jmd_col_caption, 
      jmd_col_desc = @jmd_col_desc, 
      jmd_col_type_Id = @jmd_col_Type_Id
    Where
      Id = @Jmd_Col_Id

    Select
      @Jmd_Col_Ext_Id = ID
    From
      JMD_COL_EXT
    Where
      JMD_COL_ID = @Jmd_Col_Id

    Select
      @Jmd_Col_Ext_Id = Coalesce(@Jmd_Col_Ext_Id,0)

    Exec 
      JMD_COL_EXT_SAVE @Jmd_Col_Ext_Id , @Jmd_Col_Id, @COL_EXT_DATA

  end
GO





/****************************************************
* SP Name: JMD_OBJ_SAVE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_OBJ_SAVE]    Script Date: 12/11/2009 16:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_OBJ_SAVE]
  @JMD_OBJ_ID INT ,
  @SITE_URL nvarchar(255),
  @OBJ_NAME NVARCHAR(100),
  @OBJ_TYPE INT,
  @OBJ_DESC NVARCHAR(1000),
  @PARENT_OBJ_ID INT,
  @IS_INTERNAL INT
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL) 

  if not exists ( Select * From JMD_OBJ Where ID = @JMD_OBJ_ID )
  begin
    Insert into JMD_OBJ
    (
      Site_Id, Obj_Name, Obj_Type, Obj_Desc, Parent_Obj_Id, Is_Internal
    ) 
    values    
    (
      @Site_Id, @Obj_Name, @Obj_Type, @Obj_Desc, @Parent_Obj_Id, @Is_Internal
    )
  end
  else
  begin
    Update
      JMD_OBJ
    Set
      Site_Id = @Site_Id,
      Obj_Name = @Obj_Name,
      Obj_Type = @Obj_Type,
      Obj_Desc = @Obj_Desc,
      Parent_Obj_Id = @Parent_Obj_Id,
      Is_Internal = @Is_Internal
    Where
      Id = @Jmd_Obj_Id
  end
GO





/****************************************************
* SP Name: JMD_OBJ_SELECT_TABLES
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_OBJ_SELECT_TABLES]    Script Date: 12/11/2009 16:50:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_OBJ_SELECT_TABLES]
  @Site_URL nvarchar(255)
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL) 

  Select
    *
  From  
    JMD_OBJ
  Where
    Site_Id = @Site_Id and
    Obj_Type = 1
GO





/****************************************************
* Function Name: JMD_GET_TABLE_NAME
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  UserDefinedFunction [dbo].[JMD_GET_TABLE_NAME]    Script Date: 12/11/2009 17:05:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[JMD_GET_TABLE_NAME]
(
	 @Site_URL nvarchar(255),
   @Obj_Id int
)
RETURNS nvarchar(100)
AS
BEGIN
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

	-- Declare the return variable here
	DECLARE 
    @Site_Id int,
    @Obj_Name nvarchar(100),
    @Table_Name nvarchar(120)
    
  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL) 

  Select
    @Obj_Name = Obj_Name
  From
    JMD_OBJ
  Where
    Id = @Obj_Id

  Select
    @Table_Name = 'JMD_'+Convert(varchar(20),@Site_Id)+'_'+@Obj_Name
    
	-- Return the result of the function
	RETURN @Table_Name

END
GO





/****************************************************
* SP Name: JMD_COL_SELECT_COLUMNS
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_COL_SELECT_COLUMNS]    Script Date: 12/11/2009 16:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_COL_SELECT_COLUMNS]
  @JMD_OBJ_ID INT
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Select
    a.*, b.Obj_Name, b.Obj_Desc
  From
    JMD_COL_SELECT a
  Inner Join
    JMD_OBJ b On a.jmd_Obj_Id = b.Id
  Where
    JMD_OBJ_ID = @JMD_OBJ_ID
GO





/****************************************************
* SP Name: JMD_MOD_BreadCrumbs
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_MOD_BreadCrumbs]    Script Date: 12/11/2009 16:50:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Select * from jmd_page
*/
CREATE PROCEDURE [dbo].[JMD_MOD_BreadCrumbs]
  @Site_URL nvarchar(255),
  @Page_Name nvarchar(255)
As

/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int,
    @SeqCtr int,
    @Parent_Page_Id int,
    @Parent_Page_Name nvarchar(255),
    @Parent_Page_Caption nvarchar(255),
    @Page_Caption nvarchar(255)


  Select
    @SeqCtr = 1000

  
  
  Create table #BreadCrumbs
  (
    Seq int,
    Page_Name nvarchar(255),
    Page_Caption nvarchar(255)
  )
  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  
  
  if exists ( select * from JMD_PAGE 
              where 
               Site_id = @Site_Id and 
                Page_Name = @Page_Name and
                Coalesce(Parent_Page_Id,0) <> 0 )
  begin

    Select
      @Page_Caption = Page_Caption,
      @Parent_Page_Id = Parent_Page_Id, 
      @Parent_Page_Name = ( Select Page_Name From JMD_Page  b where b.Id = a.Parent_Page_Id ),
      @Parent_Page_Caption = ( Select Page_Caption From JMD_Page  b where b.Id = a.Parent_Page_Id ) 
    From
      JMD_Page a
    Where
       Site_id = @Site_Id and 
       Page_Name = @Page_Name

    Insert into #BreadCrumbs
    (
      Seq, Page_Name, Page_Caption
    )
    values
    (
      @SeqCtr, @Page_Name, @Page_Caption
    )

    while ( Coalesce(@Parent_Page_Id,0) <> 0 )
    begin

      Select
        @SeqCtr = @SeqCtr - 1

      Insert into #BreadCrumbs
      (
        Seq, Page_Name, Page_Caption
      )
      values
      (
        @SeqCtr,@Parent_Page_Name, @Parent_Page_Caption
      )

      Select
        @Parent_Page_Id = Parent_Page_Id, 
        @Parent_Page_Name = ( Select Page_Name From JMD_Page  b where b.Id = a.Parent_Page_Id ),
        @Parent_Page_Caption = ( Select Page_Caption From JMD_Page  b where b.Id = a.Parent_Page_Id )

      From
        JMD_Page a
      Where
         Site_id = @Site_Id and 
         Page_Name = @Parent_Page_Name
      
      if ( coalesce(@SeqCtr,0) <= 0 )
      begin
        break
      end

    end
  end
/*
  else
  begin
    
    Insert into #BreadCrumbs
    (
      Seq, Page_Name
    )
    values
    (
      10000, @Page_Name
    )
    
  end
*/
  Select
    *
  From
    #BreadCrumbs
  Order By
    Seq
GO





/****************************************************
* SP Name: JMD_MAIN_MENU
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_MAIN_MENU]    Script Date: 12/11/2009 16:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************
  NAME: JMD_MAIN_MENU
  PURPOSE: Main Menu
  Exec JMD_MAIN_MENU 'JMDCMS.Web'
  select * from jmd_site
  select * from jmd_page
*****************************************************************************/
CREATE PROCEDURE [dbo].[JMD_MAIN_MENU]
  @Site_URL nvarchar(255)
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id Int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  if ( Coalesce(@Site_Id,0) != 0 )
  begin
    Select
      *
    From
      JMD_Page
    Where
      Site_Id = @Site_Id and
      Is_Root = 1
    Order By
      Page_Sort
  end
  else
  begin
    Select
      Error = 'No Site Defined for the URL'
  end
GO






/****************************************************
* SP Name: JMD_MOD_HTML_LEFT_MENU
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_MOD_HTML_LEFT_MENU]    Script Date: 12/11/2009 16:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************
  NAME: JMD_MOD_HTML_LEFT_MENU
  PURPOSE: Left Vertical Menu
*****************************************************************************/
CREATE PROCEDURE [dbo].[JMD_MOD_HTML_LEFT_MENU]
  @Site_URL nvarchar(255),
  @Page_Name nvarchar(255)
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.

	WI:1436 - Filter out the deleted pages.

*/

  Declare
    @Site_Id int,
    @Page_Id int,
    @Page_Caption  nvarchar(50),
    @Parent_Page_Id int,
    @Parent_Page_Name nvarchar(50),
    @Parent_Page_Caption nvarchar(50),
    @View_Roles nvarchar(1000)

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  
  Select
    @Page_Id = Id, @Page_Caption = Page_Caption, 
    @Parent_Page_Id = Parent_Page_Id, @View_Roles = View_Roles
  From
    JMD_Page
  Where
    Site_Id = @Site_Id and
    Page_Name = @Page_Name

  if not exists 
    ( 
      Select * From JMD_PAGE
        Where
          Parent_Page_Id = @Page_Id and
          Is_Menu_Item = 1 and
          Is_Published = 1 and
		  Is_Deleted = 0	
    )
  begin
    Select
      @Page_Id = Id, @Page_Name = Page_Name, @Page_Caption = Page_Caption, 
      @Parent_Page_Id = Parent_Page_Id, @View_Roles = View_Roles
    From
      JMD_Page
    Where
      Site_Id = @Site_Id and
      Id = @Parent_Page_Id
  end
    


  if ( Coalesce(@Parent_Page_Id,-1) != -1 )
  begin
    Select
      @Parent_Page_Name = Page_Name, 
      @Parent_Page_Caption = Page_Caption, @View_Roles = View_Roles
    From
      JMD_PAGE
    Where
      Site_Id = @Site_Id and
      Id = @Parent_Page_Id and
	  Is_Deleted = 0
  end
  
  -- Current Page and Parent Page
  Select
    Page_Id = @Page_Id, Page_Name = @Page_Name, Page_Caption = @Page_Caption, 
    Parent_Page_Name = @Parent_Page_Name, Parent_Page_Caption = @Parent_Page_Caption,
    View_Roles = @View_Roles

  -- Child Pages
  Select
    Page_Name, Page_Caption, View_Roles, Page_Sort, 
    Is_Menu_Item, Is_Published, Is_Deleted
  From
    JMD_PAGE
  Where
    Parent_Page_Id = @Page_Id and
	Is_Deleted = 0
  Order By
    Page_Sort
GO





/****************************************************
* SP Name: JMD_PAGE_MOD_SAVE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_PAGE_MOD_SAVE]    Script Date: 12/11/2009 16:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_PAGE_MOD_SAVE]
  @Page_Mod_Id int,
  @Site_URL nvarchar(255),
  @PAGE_Name nvarchar(255),
  @MOD_ID int,
  @MOD_TITLE nvarchar(50),
  @DIV_ID int,
  @IS_PUBLISHED int,
  @SHOW_ON_ALL_PAGES int,
  @VIEW_ROLE nvarchar(1000),
  @EDIT_ROLE nvarchar(1000),
  @DELETE_ROLE nvarchar(1000),
  @MOVE_ROLE nvarchar(1000),
  @EDIT_CONTENTS_ROLE nvarchar(1000),
  @Mod_Sort Int = null
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.

	WI:650: Procedure now returns a return value i.e. Page Mod ID
	WI:650:RaisError if the page does not exist
*/
			
  Declare
    @Page_Id int,
    @Site_Id int,
    @Sort int,
	@ReturnValue int
	
  Select
    @ReturnValue = 0	

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  
  Select
    @Page_Id = Id
  From
    JMD_Page
  Where
    Site_Id = @Site_Id and
    Page_Name = @Page_Name

  -- WI:650:RaisError if the page does not exist
  if (Coalesce(@Page_Id,0) = 0)
  begin
    RaisError('Page "%s" does not exist.', 16,-1,@Page_Name)
    Return -1
  end

  if ( @Page_Mod_Id = 0 )
  begin
    
    if ( Coalesce(@Mod_Sort,0) = 0)
    begin
      Select
        @Sort = Max(Sort) 
      From
        JMD_PAGE_MOD
      Where
        Page_Id = @Page_Id and
        Div_Id = @Div_Id

      Select
        @Sort = Coalesce(@Sort,0)+5
    end
    else
    begin
      Select
        @Sort = @Mod_Sort
    end
      
    Insert into JMD_PAGE_MOD
    (
      PAGE_ID,
      MOD_ID,
      MOD_TITLE,
      DIV_ID,
      IS_PUBLISHED,
      SHOW_ON_ALL_PAGES,
      VIEW_ROLE,
      EDIT_ROLE,
      DELETE_ROLE,
      MOVE_ROLE,
      EDIT_CONTENTS_ROLE,
      SORT
    )
    values
    (
      @PAGE_ID,
      @MOD_ID,
      @MOD_TITLE,
      @DIV_ID,
      @IS_PUBLISHED,
      @SHOW_ON_ALL_PAGES,
      @VIEW_ROLE,
      @EDIT_ROLE,
      @DELETE_ROLE,
      @MOVE_ROLE,
      @EDIT_CONTENTS_ROLE,
      @SORT
    )
	Select
		@ReturnValue = @@Identity
  end
  else
  begin
    Update
      JMD_PAGE_MOD
      SET
        PAGE_ID = @PAGE_ID,
        MOD_ID = @MOD_ID,
        MOD_TITLE = @MOD_TITLE,
        DIV_ID = @DIV_ID,
        IS_PUBLISHED = @IS_PUBLISHED,
        SHOW_ON_ALL_PAGES = @SHOW_ON_ALL_PAGES,
        VIEW_ROLE = @VIEW_ROLE,
        EDIT_ROLE = @EDIT_ROLE,
        DELETE_ROLE = @DELETE_ROLE, 
        MOVE_ROLE = @MOVE_ROLE,
        EDIT_CONTENTS_ROLE = @EDIT_CONTENTS_ROLE,
        Sort = @Mod_Sort
    Where
      Id = @Page_Mod_Id

	Select
		@ReturnValue = @Page_Mod_Id

  end
Return @ReturnValue
GO




/****************************************************
* SP Name: JMD_PAGE_SELECT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_PAGE_SELECT]    Script Date: 12/11/2009 16:51:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_PAGE_SELECT]
  @Site_URL nvarchar(255),
  @Page_Name nvarchar(255),
  @Filter nvarchar(1000) = null  
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.

	Name: JMD_PAGE_SELECT
	Author: Ajay Handa
	Purpose: Returns result set of pages for given criteria
	Work Item ID: 651 - Page Manager to manage published, unpublished and deleted pages.
	
*/

  Declare
    @Site_Id int,
	@Sql nvarchar(4000)

  Set
    @Sql = ''
	
  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)    
  
  If (@Filter is not null)
  begin  	
  Set
	@Sql =
	'Select
		*, 
		Published = Case IS_PUBLISHED When 1 Then ''Y'' Else ''N'' End, 
		Deleted = Case IS_DELETED When 1 Then ''Y'' Else ''N'' End, 
		Parent_Page_Name = ( Select Page_Name From JMD_PAGE b where b.Id = a.Parent_Page_Id )
	From
		JMD_PAGE a
	Where
		a.Site_Id = '+Convert(varchar(50),@Site_Id)+' and Is_Internal = 0 '+ @Filter

	Exec(@Sql)
  end	
  else
  begin
	Select
		*, Parent_Page_Name = ( Select Page_Name From JMD_PAGE b where b.Id = a.Parent_Page_Id )
	From
		JMD_PAGE a
	Where
		a.Site_Id = @Site_Id and
		a.Page_Name = @Page_Name
  end
GO





/****************************************************
* SP Name: JMD_PAGE_DELETE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_PAGE_DELETE]    Script Date: 12/11/2009 16:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Exec
  JMD_PAGE_DELETE
  'JMDCMS.Web',
  'contact'
select * from jmd_page
update jmd_page set is_deleted = 0
*/
CREATE PROCEDURE [dbo].[JMD_PAGE_DELETE]
  @Site_URL nvarchar(255),
  @Page_Name nvarchar(255)
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int,
    @Is_Internal int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)    

  Select
    @Is_Internal = Is_Internal
  From
    JMD_Page
  Where
    Site_Id = @Site_Id and
    Page_Name = @Page_Name

  if ( Coalesce(@Is_Internal,0) = 1 )
  begin
    RaisError('You are trying to delete an Internal Page. Internal pages can not be deleted.', 16,-1)
    return -1
  end
  else
  begin
    if exists 
      ( 
      Select * From JMD_Page
      Where
        Site_Id = @Site_Id and
        Page_Name = @Page_Name and
        Coalesce(Is_Deleted,0) = 0
      )
    begin
      Update
        JMD_Page
      Set
        Is_Deleted = 1
      Where
        Site_Id = @Site_Id and
        Page_Name = @Page_Name 
    end
    else
    begin
      Update
        JMD_Page
      Set
        Is_Deleted = 0
      Where
        Site_Id = @Site_Id and
        Page_Name = @Page_Name 
    end
    return 0
  end
GO





/****************************************************
* SP Name: JMD_PAGE_MOD_EXCLUDE_SAVE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_PAGE_MOD_EXCLUDE_SAVE]    Script Date: 12/11/2009 16:51:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 Exec JMD_PAGE_MOD_EXCLUDE_SAVE
   '0', 'JMDCMS.Web', 'addPage',210

select * from JMD_PAGE_MOD_EXCLUDE

 Exec JMD_LOAD_MODS 'JMDCMS.Web' ,'addPage' 
select * from jmd_page_mod where id = 210

*/
CREATE PROCEDURE [dbo].[JMD_PAGE_MOD_EXCLUDE_SAVE]
  @JMD_PAGE_MOD_EXCLUDE_ID int,
  @Site_URL nvarchar(255),
  @Page_Name nvarchar(255),
  @Page_Mod_Id int
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int,
    @Page_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL) 

  Select
     @Page_Id = Id
  From
    JMD_Page
  Where
    Site_Id = @Site_Id and
    Page_Name = @Page_Name

  If not exists ( Select * from JMD_PAGE_MOD_EXCLUDE where Id = @JMD_PAGE_MOD_EXCLUDE_ID )
  begin
    Insert into JMD_PAGE_MOD_EXCLUDE
    (
      Page_Mod_Id, Page_Id
    )
    values
    (
      @Page_Mod_Id, @Page_Id
    )
  end
  else
  begin
    Update
      JMD_PAGE_MOD_EXCLUDE
    Set
      Page_Mod_Id = @Page_Mod_Id,
      Page_Id = @Page_Id
    Where
      Id = @JMD_PAGE_MOD_EXCLUDE_ID
  end
GO





/****************************************************
* SP Name: JMD_PAGE_AUTH
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_PAGE_AUTH]    Script Date: 12/11/2009 16:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************
  NAME: JMD_PAGE_AUTH
  PURPOSE: 
Select * from JMD_PAGE
Exec JMD_PAGE_AUTH 'JMDCMS.Web','Default'
*****************************************************************************/
CREATE PROCEDURE [dbo].[JMD_PAGE_AUTH]
  @Site_URL nvarchar(255),
  @Page_Name nvarchar(255)

As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  -- AUTHENTICATION OF USER
  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  
  
  Select
    View_Roles, Add_Roles, Edit_Roles, 
    Delete_Roles, Move_Roles, Add_Module_Roles
  From
    JMD_PAGE
  Where
    Site_Id = @Site_Id and
    Page_Name = @Page_Name and
    Is_Published = 1 and
    Is_Deleted = 0
GO





/****************************************************
* SP Name: JMD_PAGE_SAVE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_PAGE_SAVE]    Script Date: 12/11/2009 16:51:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************
  NAME: JMD_PAGE_SAVE
  PURPOSE: To Insert record into JMD_PAGE Table
*****************************************************************************/
CREATE PROCEDURE [dbo].[JMD_PAGE_SAVE]
  @Page_Id int,
  @Site_URL nvarchar(255),
  @PAGE_NAME nvarchar(255),
  @PAGE_CAPTION nvarchar(255),
  @META_TITLE nvarchar(255),
  @META_DESC nvarchar(1000),
  @META_KEYWORDS nvarchar(1000),
  @PARENT_PAGE_NAME nvarchar(255) = null,
  @IS_PUBLISHED int,
  @IS_ROOT int,
  @IS_MENU_ITEM int,
  @VIEW_ROLES NVARCHAR(1000),
  @ADD_ROLES NVARCHAR(1000),
  @EDIT_ROLES NVARCHAR(1000),
  @DELETE_ROLES NVARCHAR(1000),
  @MOVE_ROLES NVARCHAR(1000),
  @ADD_MODULE_ROLES NVARCHAR(1000),
  @IS_INTERNAL int,
  @Load_Shared_Modules int,
  @iPage_Sort Int = null,
  @Is_ViewState_Enabled Int = null,
  @Return_Page_Id int = null output 

As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.

	Name: JMD_PAGE_SAVE
	Author: Ajay Handa
	Purpose: Inserts or update the page record.
	Work Item ID: 651
	WI:979: Enable/Disable view state by Page
	
*/

  Declare
    @Site_Id int,
    @Parent_Page_Id int,
    /*@Return_Page_Id int,*/
    @Page_Sort int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  if ( isnull(@PARENT_PAGE_NAME,'') != '' )
  begin
    Select
      @Parent_Page_Id = Id
    From
      JMD_Page
    Where
      Site_Id = @Site_Id and
      Page_Name = @PARENT_PAGE_NAME
  end

  if not exists ( Select * From JMD_PAGE where Id = @Page_Id )
  begin

    Select
      @Page_Sort = Max(Page_Sort)
    From
      JMD_PAGE
    Where
      Site_Id = @Site_Id and
      Parent_Page_Id = @Parent_Page_Id

    if (@IS_ROOT = 1)
    begin
      Select @PARENT_PAGE_ID = null

      Select
         @Page_Sort = Max(Page_Sort)
       From
         JMD_PAGE
       Where
         Site_Id = @Site_Id and
         Is_Root = 1
    end

    Select
      @Page_Sort = Coalesce(@Page_Sort,0)+10
    Insert into JMD_PAGE
    (
      SITE_ID,
      PAGE_NAME,
      PAGE_CAPTION,
      META_TITLE,
      META_DESC,
      META_KEYWORDS,
      PARENT_PAGE_ID,
      IS_PUBLISHED,
      IS_ROOT,
      IS_MENU_ITEM,
      VIEW_ROLES,
      ADD_ROLES,
      EDIT_ROLES,
      DELETE_ROLES,
      MOVE_ROLES,
      ADD_MODULE_ROLES,
      IS_INTERNAL,
      PAGE_SORT,
      Load_Shared_Modules,
      Is_ViewState_Enabled
    )
    values
    (
      @SITE_ID,
      @PAGE_NAME,
      @PAGE_CAPTION,
      @META_TITLE,
      @META_DESC,
      @META_KEYWORDS,
      @PARENT_PAGE_ID,
      @IS_PUBLISHED,
      @IS_ROOT,
      @IS_MENU_ITEM,
      @VIEW_ROLES,
      @ADD_ROLES,
      @EDIT_ROLES,
      @DELETE_ROLES,
      @MOVE_ROLES,
      @ADD_MODULE_ROLES,
      @IS_INTERNAL,
      @PAGE_SORT,
      @Load_Shared_Modules,
      Coalesce(@Is_ViewState_Enabled,1)
    )
    Select
      @Return_Page_Id = @@Identity
  end
  else
  begin
    Update
      JMD_PAGE
    Set
      SITE_ID = @SITE_ID,
      PAGE_NAME = @PAGE_NAME,
      PAGE_CAPTION = @PAGE_CAPTION,
      META_TITLE = @META_TITLE,
      META_DESC = @META_DESC,
      META_KEYWORDS = @META_KEYWORDS ,
      PARENT_PAGE_ID = @PARENT_PAGE_ID,
      IS_PUBLISHED = @IS_PUBLISHED,
      IS_ROOT = @IS_ROOT,
      IS_MENU_ITEM = @IS_MENU_ITEM,
      VIEW_ROLES = @VIEW_ROLES,
      ADD_ROLES = @ADD_ROLES,
      EDIT_ROLES = @EDIT_ROLES, 
      DELETE_ROLES = @DELETE_ROLES,
      MOVE_ROLES = @MOVE_ROLES,
      ADD_MODULE_ROLES = @ADD_MODULE_ROLES,
      IS_INTERNAL = @IS_INTERNAL,
      Load_Shared_Modules = @Load_Shared_Modules,
      Page_Sort = @iPage_Sort,
      Is_ViewState_Enabled = Coalesce(@Is_ViewState_Enabled,1)

    Where
      Id = @Page_Id
    Select
      @Return_Page_Id = Coalesce(@Page_Id,0)
  end

  /*return @Return_Page_Id*/
GO




/****************************************************
* SP Name: JMD_SITE_DELETE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_SITE_DELETE]    Script Date: 12/11/2009 16:51:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_SITE_DELETE]
  @Site_URL nvarchar(255)
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  Delete jmd_page_mod where page_id in 
    ( Select id from jmd_page where site_id = @Site_Id )

 Delete JMD_PAGE_MOD_EXCLUDE where page_id in 
    ( Select id from jmd_page where site_id = @Site_Id )

  Delete jmd_page where site_id = @Site_Id
  Delete jmd_user_role where [user_id] in 
    ( Select id from jmd_user where site_id = @Site_Id )
  Delete jmd_user where site_id = @Site_Id
  Delete jmd_role where site_id = @Site_Id
  Delete jmd_div where site_id = @Site_Id

  Delete jmd_mod where site_id = @Site_Id
  Delete jmd_site where id = @Site_Id
GO





/****************************************************
* SP Name: JMD_LOAD_MODS
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_LOAD_MODS]    Script Date: 12/11/2009 16:50:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_LOAD_MODS]
  @Site_URL nvarchar(255),
  @Page_Name nvarchar(255)
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int,
    @Page_Id int,
    @Load_Shared_Modules int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  if ( Coalesce(@Site_Id,0) != 0 )
  begin

    Select
      @Load_Shared_Modules = Load_Shared_Modules
    From
      Jmd_Page
    Where
      Site_Id = @Site_Id and
      Page_Name = @Page_Name    

    if ( Coalesce(@Load_Shared_Modules,0) = 1 )
    begin
      Select
        *
      From
        JMD_PAGE_MOD_SELECT
      Where
        Site_Id = @Site_Id and
        ( Page_Name = @Page_Name OR Show_On_All_Pages = 1 ) 
      Order By
        Parent_Div_Id, Div_Sort, Mod_Sort
    end
    else
    begin
      Select
        *
      From
        JMD_PAGE_MOD_SELECT
      Where
        Site_Id = @Site_Id and
        ( Page_Name = @Page_Name OR Show_On_All_Pages = 1 ) and
        ( Div_Name not in ('Left','Right','Center') Or Page_Name = @Page_Name)
      Order By
        Parent_Div_Id, Div_Sort, Mod_Sort
    end
  end
  else
  begin
    Select
      Error = 'No Site Defined for the URL'
  end

  Select
    @Page_Id = Id
  From
    JMD_Page
  Where
    Site_Id = @Site_Id and
    Page_Name = @Page_Name

  Exec 
    JMD_PAGE_MOD_EXCLUDE_Select @Page_Id
GO




/****************************************************
* SP Name: JMD_PAGE_MOD_SELECT_Sp
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_PAGE_MOD_SELECT_Sp]    Script Date: 12/11/2009 16:51:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[JMD_PAGE_MOD_SELECT_Sp]
  @Page_Mod_Id int
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Select
    *
  From
    JMD_PAGE_MOD_Select
  Where
    Page_Mod_Id = @Page_Mod_Id
GO




/****************************************************
* SP Name: JMD_USER_ROLE_INIT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_USER_ROLE_INIT]    Script Date: 12/11/2009 16:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
  Select * from jmd_user
  Select * from jmd_Role
  JMD_USER_ROLE_SAVE
    @User_Id int,
    @Roles nvarchar(1000)
*/
CREATE PROCEDURE [dbo].[JMD_USER_ROLE_INIT]
  @Site_URL nvarchar(255)
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/
  Declare
    @Admin_User_Id int,
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  Select
    @Admin_User_Id = Id
  From
    JMD_USER
  Where
    Site_Id = @Site_Id and
    [User_Name] = 'Admin' 
  
  Exec
    JMD_USER_ROLE_SAVE
      @Admin_User_Id, 'Admin'
GO




/****************************************************
* SP Name: JMD_COL_SELECT_COL
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_COL_SELECT_COL]    Script Date: 12/11/2009 16:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
  Exec   JMD_COL_SELECT_COL 7
*/
CREATE PROCEDURE [dbo].[JMD_COL_SELECT_COL]
  @JMD_COL_ID INT
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Select
    *
  From
    JMD_COL_SELECT
  Where
    ID = @JMD_COL_ID
GO




/****************************************************
* SP Name: JMD_USER_SAVE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_USER_SAVE]    Script Date: 12/11/2009 16:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************
  NAME: JMD_USER_SAVE
  PURPOSE: User Insert / Update
 Select * from JMD_USER
  
*****************************************************************************/
CREATE PROCEDURE [dbo].[JMD_USER_SAVE]
  @User_Id int,
  @Site_URL nvarchar(255),
  @User_Name nvarchar(50),
  @User_Display_Name nvarchar(50),
  @Password_Hash nvarchar(50),
  @Salt nvarchar(50),
  @Is_Internal int,
  @Email nvarchar(50)
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/
  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  if not exists ( Select * from jmd_user where id = @User_Id)
  begin
    Insert into JMD_USER
    (
      Site_Id,
      [User_Name],
      User_Display_Name,
      Password_Hash,
      Salt,
      Is_Internal,
      Email

    )
    values
    (
      @Site_Id,
      @User_Name,
      @User_Display_Name,
      @Password_Hash,
      @Salt,
      @Is_Internal,
      @Email
    )
  end
  else
  begin
    Update
      JMD_USER
    Set
      Site_Id = @Site_Id,
      [User_Name] = @User_Name,
      User_Display_Name = @User_Display_Name,
      Password_Hash = @Password_Hash,
      Salt = @Salt,
      Is_Internal = @Is_Internal,
      Email = @Email
    Where
      Id = @User_Id
  end
GO




/****************************************************
* SP Name: JMD_USER_INSERT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_USER_INSERT]    Script Date: 12/11/2009 16:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************
  NAME: JMD_USER_INSERT
  PURPOSE: User Insert
*****************************************************************************/
CREATE PROCEDURE [dbo].[JMD_USER_INSERT]
  @User_Id int,
  @Site_URL nvarchar(255),
  @User_Name nvarchar(50),
  @User_Display_Name nvarchar(50),
  @Password_Hash nvarchar(50),
  @Salt nvarchar(50),
  @Email nvarchar(50)
As

/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  if not exists ( Select * from JMD_USER where Id = @User_Id)
  begin
    Insert into JMD_USER
    (
      Site_Id,
      [User_Name],
      User_Display_Name,
      Password_Hash,
      Salt,
      Email
    )
    values
    (
      @Site_Id,
      @User_Name,
      @User_Display_Name,
      @Password_Hash,
      @Salt,
      @Email
    )
  end
  else
  begin
    if ( @Password_Hash != '0' )
    begin
      Update
        JMD_USER
      Set
        [User_Name] = @User_Name,
        User_Display_Name = @User_Display_Name,
        Password_Hash = @Password_Hash,
        Salt = @Salt,
        Email = @Email
      Where
        ID = @User_Id
    end
    else
    begin
      Update
        JMD_USER
      Set
        [User_Name] = @User_Name,
        User_Display_Name = @User_Display_Name,
        Email = @Email
      Where
        ID = @User_Id
    end
  end
GO




/****************************************************
* SP Name: JMD_USER_AUTH
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_USER_AUTH]    Script Date: 12/11/2009 16:51:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_USER_AUTH]
  @Site_URL nvarchar(255),
  @User_Name nvarchar(50)
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
	
	WI:764: New user registeration, Activation mechanism.
*/

  -- AUTHENTICATION OF USER
  Declare
    @Site_Id int,
    @User_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  
  
  Select
    @User_Id = Id
  From
    JMD_User
  Where
    Site_Id = @Site_Id and
    [User_Name] = @User_Name and
    IsNull(Activation_Key,'') = ''
  
  Select
    Password_Hash, Salt
  From
    JMD_USER
  Where
    Site_Id = @Site_Id and 
    [User_Name] = @User_Name  and
    IsNull(Activation_Key,'') = ''

  Select
    Roles
  From
    JMD_USER_ROLE
  Where
    [User_Id] = @User_Id
GO




/****************************************************
* SP Name: JMD_USER_DELETE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_USER_DELETE]    Script Date: 12/11/2009 16:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_USER_DELETE]
  @Site_URL nvarchar(255),
  @User_Id int
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  if not exists ( Select * From JMD_USER
      where     
        Site_Id = @Site_Id and
        Id = @User_Id and
        Coalesce(Is_Internal,0) = 1 )
  begin
    Delete
      JMD_USER
    Where
      Site_Id = @Site_Id and
      Id = @User_Id
  end
  else
  begin
    RaisError('Internal User can not be deleted. Your User Id and IP will be banned for this action.',16, -1)
  end
GO





/****************************************************
* SP Name: JMD_USER_SELECT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_USER_SELECT]    Script Date: 12/11/2009 16:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_USER_SELECT]
  @Site_URL nvarchar(255),
  @User_Id int = null
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/
  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  
  
  if ( Coalesce(@User_Id,0) = 0)
  begin
    Select
      a.*, 
      User_Role_Id = b.Id, b.Roles
    From
      JMD_User a
    Left Outer Join 
      JMD_USER_ROLE b On b.User_Id = a.Id
    Where
      Site_Id = @Site_Id
  end
  else
  begin
    Select
      a.*, 
      User_Role_Id = b.Id, b.Roles
    From
      JMD_User a
    Left Outer Join 
      JMD_USER_ROLE b On b.User_Id = a.Id
    Where
      Site_Id = @Site_Id and
      a.Id = @User_Id 
  end
GO





/****************************************************
* SP Name: JMD_ROLE_SELECT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_ROLE_SELECT]    Script Date: 12/11/2009 16:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_ROLE_SELECT]
  @Site_URL nvarchar(255),
  @Role_Id int = null
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id Int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  if ( Coalesce(@Role_Id,0) = 0)
  begin
    Select
       *
    From
      JMD_ROLE
    Where
      Site_Id = @Site_Id
    Order By
      ROLE_Name
  end
  else
  begin
    Select
       *
    From
      JMD_ROLE
    Where
      Site_Id = @Site_Id and
      Id = @Role_Id
  end
GO





/****************************************************
* SP Name: JMD_ROLE_DELETE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_ROLE_DELETE]    Script Date: 12/11/2009 16:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_ROLE_DELETE]
  @Site_URL nvarchar(255),
  @Role_Id int
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  if not exists ( Select * From JMD_ROLE 
      where     
        Site_Id = @Site_Id and
        Id = @Role_Id and
        Coalesce(Is_Internal,0) = 1 )
  begin
    Delete
      JMD_ROLE
    Where
      Site_Id = @Site_Id and
      Id = @Role_Id
  end
  else
  begin
    RaisError('Internal Roles can not be deleted. Your User Id and IP will be banned for this action.',16, -1)
  end
GO





/****************************************************
* SP Name: JMD_ROLE_SAVE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_ROLE_SAVE]    Script Date: 12/11/2009 16:51:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_ROLE_SAVE]
  @Role_Id int,
  @Site_URL nvarchar(255),
  @Role_Name nvarchar(50),
  @Is_Internal int = 0,
  @Parent_Role int = NULL
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  if not exists ( Select * from JMD_ROLE where id = @Role_Id)
  begin
    Insert into JMD_ROLE
    (
      Site_Id, Role_Name, Is_Internal, Parent_Role
    )
    values
    (
      @Site_Id, @Role_Name, @Is_Internal, @Parent_Role
    )
  end
  else
  begin
    Update
      JMD_ROLE
    Set
      Site_Id = @Site_Id,
      Role_Name = @Role_Name,
      Is_Internal = @Is_Internal,
      Parent_Role = @Parent_Role
    Where
      Id = @Role_Id
  end
GO





/****************************************************
* SP Name: JMD_COL_TYPE_SAVE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_COL_TYPE_SAVE]    Script Date: 12/11/2009 16:50:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_COL_TYPE_SAVE]
  @JMD_COL_TYPE_ID INT ,
  @SITE_URL NVARCHAR(255),
  @COL_TYPE NVARCHAR(50),
  @COL_DATA_TYPE NVARCHAR(50)
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)    

  if not exists ( Select * from JMD_COL_TYPE Where id = @JMD_COL_TYPE_ID )
  begin
    Insert into JMD_COL_TYPE
    (
      SITE_ID,
      COL_TYPE,
      COL_DATA_TYPE
    )
    values
    (
      @SITE_ID,
      @COL_TYPE,
      @COL_DATA_TYPE
    )
  end
  else
  begin
    Update
      JMD_COL_TYPE
    Set
      SITE_ID = @SITE_ID,
      COL_TYPE = @COL_TYPE,
      COL_DATA_TYPE = @COL_DATA_TYPE
    Where
      Id = @JMD_COL_TYPE_ID     
  end
GO





/****************************************************
* SP Name: JMD_COL_TYPE_SELECT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_COL_TYPE_SELECT]    Script Date: 12/11/2009 16:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
  Select * from jmd_col_type
*/
CREATE PROCEDURE [dbo].[JMD_COL_TYPE_SELECT]
  @SITE_URL nvarchar(255)
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL) 

  Select
    * 
  From
    JMD_COL_TYPE
  Where
    Site_Id = @Site_Id
  Order By Col_Type
GO





/****************************************************
* SP Name: JMD_DIV_SAVE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_DIV_SAVE]    Script Date: 12/11/2009 16:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
  Select * From JMD_DIV
sp_help jmd_div
*/
CREATE PROCEDURE [dbo].[JMD_DIV_SAVE]
  @Div_Id int,
  @Site_URL nvarchar(255),
  @Div_Name nvarchar(50),
  @Div_Sort int,
  @Parent_Div_Id int,
  @Is_Internal int
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  if not exists ( Select * from JMD_DIV where id = @Div_Id)
  begin
    Insert into JMD_DIV
    (
      Site_Id, Div_Name, Div_Sort, Parent_Div_Id, Is_Internal
    )
    values
    (
      @Site_Id, @Div_Name, @Div_Sort, @Parent_Div_Id, @Is_Internal
    )
  end
  else
  begin
    Update
      JMD_DIV
    Set
      Site_Id = @Site_Id,
      Div_Name = @Div_Name,
      Div_Sort = @Div_Sort,
      Parent_Div_Id = @Parent_Div_Id,
      Is_Internal = @Is_Internal
    Where
      Id = @Div_Id
  end
GO





/****************************************************
* SP Name: JMD_DIV_SELECT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_DIV_SELECT]    Script Date: 12/11/2009 16:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_DIV_SELECT]
  @Site_URL nvarchar(255)
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id Int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

    Select
       Id, DIV_NAME
    From
      JMD_DIV
    Where
      Site_Id = @Site_Id
    Order By
      Div_Name
GO





/****************************************************
* SP Name: JMD_SITE_SELECT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_SITE_SELECT]    Script Date: 12/11/2009 16:51:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_SITE_SELECT]
    @Site_URL nvarchar(255)
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  Select
    *
  From
    JMD_SITE
  Where
    Id = @Site_Id
GO





/****************************************************
* SP Name: JMD_SITE_ALIAS
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_SITE_ALIAS]    Script Date: 12/11/2009 16:51:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_SITE_ALIAS]
	@JMD_SITE_URL nvarchar(255),
	@JMD_SITE_ALIAS_URL nvarchar(255)
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.

	Name: JMD_SITE_ALIAS
	Author: Ajay Handa
	Purpose: To create alias for an existing site
	Work Item ID: 591

*/
Declare
	@Site_Id Int

Select
	@Site_Id = dbo.JMD_GET_SITE_ID(@JMD_SITE_ALIAS_URL)


If Coalesce(@Site_Id,0) <> 0
Begin
	RaisError('Site [%s] already exists.',16,1,@JMD_SITE_ALIAS_URL)	
	Return -1
End

Set
	@Site_Id = null

Select
	@Site_Id = dbo.JMD_GET_SITE_ID(@JMD_SITE_URL)

If Coalesce(@Site_Id,0) <> 0
Begin
  Execute JMD_SITE_INSERT 
		@JMD_SITE_ALIAS_URL, 
		@Site_Id, 
		'', 
		'', 
		''
End
Else
Begin
	RaisError('Site [%s] does not exists.',16,1,@JMD_SITE_URL)
	Return -1
End	
	Return 0
GO





/****************************************************
* SP Name: JMD_MOD_SAVE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_MOD_SAVE]    Script Date: 12/11/2009 16:50:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_MOD_SAVE]
  @Mod_Id int,
  @Site_URL nvarchar(255),
  @Mod_Name nvarchar(255),
  @Mod_Path nvarchar(1000),
  @Mod_Edit_Form nvarchar(255),
  @Mod_Friendly_Name nvarchar(255),
  @Is_Admin int,
  @Can_Show_Mod_Header int  
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  if not exists ( Select * from JMD_MOD where Id = @Mod_Id )
  begin
    Insert into JMD_MOD
    (
      Site_Id, Mod_Name, Mod_Path, Mod_Edit_Form, 
      Mod_Friendly_Name, Is_Admin, Can_Show_Mod_Header
    )
    values
    (
      @Site_Id, @Mod_Name, @Mod_Path, @Mod_Edit_Form, 
      @Mod_Friendly_Name, @Is_Admin, @Can_Show_Mod_Header
    )
  end
  else
  begin
    Update
      JMD_MOD
    Set
      Site_Id = @Site_Id,
      Mod_Name = @Mod_Name,
      Mod_Path = @Mod_Path,
      Mod_Edit_Form = @Mod_Edit_Form,
      Mod_Friendly_Name = @Mod_Friendly_Name,
      Is_Admin = @Is_Admin,
      Can_Show_Mod_Header = @Can_Show_Mod_Header
    Where
      Id = @Mod_Id
  end
GO





/****************************************************
* SP Name: JMD_MOD_SELECT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_MOD_SELECT]    Script Date: 12/11/2009 16:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_MOD_SELECT]
  @Site_URL nvarchar(255),
  @Show_Admin int
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Declare
    @Site_Id Int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  if ( Coalesce(@Show_Admin,0) = 0 )
  begin
    Select
       Id, Mod_Friendly_Name
    From
      JMD_MOD
    Where
      Site_Id = @Site_Id and
      Is_Admin != 1
    Order by 
      Mod_Friendly_Name
  end
  else
  begin
    Select
       Id, Mod_Friendly_Name
    From
      JMD_MOD
    Where
      Site_Id = @Site_Id
    Order by 
      Mod_Friendly_Name
  end
GO





/****************************************************
* SP Name: JMD_MOD_ADMIN_INIT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_MOD_ADMIN_INIT]    Script Date: 12/11/2009 16:50:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_MOD_ADMIN_INIT]
	@SITE_URL nvarchar(255)
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
	
	Author: Ajay Handa
	Purpose: Initialize default Admin Configuration Options
	
	WI: 650 - Admin Module
*/
  Declare
    @Site_Id int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  
  
/*******************************************************************
	PROP_TYPE Values
	1 = Text
	2 = CheckBox
	3 = CheckBoxList
	4 = Radio Buttons
	5 = Combo Box
	6 = List Box
*/
/*******************************************************************
   Module Admin Options
*/
Delete JMD_MOD_ADMIN
	
Insert Into JMD_MOD_ADMIN
(
	Site_Id, Prop_Tab, Prop_Tab_Sort, Prop_Group, Prop_Group_Sort,
	Prop_Code, Prop_Code_Sort, Prop_Caption, Prop_Desc, Prop_Type,
	Prop_Input_Values, Prop_Value
)
values
(
	@Site_Id, 'Options', 1, 'Modules', 1,
	'ShowDelMods', 1, 'Show Deleted Modules', 'Show Deleted Modules', 2,
	'False', 'False'
)

Insert Into JMD_MOD_ADMIN
(
	Site_Id, Prop_Tab, Prop_Tab_Sort, Prop_Group, Prop_Group_Sort,
	Prop_Code, Prop_Code_Sort, Prop_Caption, Prop_Desc, Prop_Type,
	Prop_Input_Values, Prop_Value
)
values
(
	@Site_Id, 'Options', 1, 'Modules', 1,
	'ShowUnPubMods', 1, 'Show Unpublished Modules', 'Show Unpublished Modules', 2,
	'False', 'False'
)
GO





/****************************************************
* SP Name: JMD_PAGE_MOD_INIT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_PAGE_MOD_INIT]    Script Date: 12/11/2009 16:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_PAGE_MOD_INIT]
  @Site_URL nvarchar(255)
AS

/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.

	Name: JMD_PAGE_MOD_INIT
	Author: Ajay Handa
	Purpose: Initializes default modules on default page at site creation.
	
	Modifications:
	WI:783 - Admin;Guests Access Changed to Admin;Guests;Registered 
    WI:650 - Add admin module, Default values assigned to page header 
    WI:650: Module manager module removed, will be added in next version
    powered by message removed, Footer added default text footer.
    
*/

  Declare
    @Site_Id int,
    @Mod_Id int,
    @Div_Id int,
    @PageModId int

  Select
    @Site_Id = dbo.JMD_GET_SITE_ID(@Site_URL)  

  /***************************************************************************
    Page: Login
    Module: Login.ascx
    Div: Center
  */
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'Login.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'login', @Mod_Id, 'Login',  @Div_Id, 1, 0, 
      'Admin;Guests;Registered', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: NewUser
    Module: NewUser.ascx
    Div: Center
  */
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'NewUser.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'NewUser', @Mod_Id, 'New User',  @Div_Id, 1, 0, 
      'Admin;Guests;Registered', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: AddPage
    Module: AddPage.ascx
    Div: MiddleFull
  */   
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'AddPage.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'AddPage', @Mod_Id, 'Add Page',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: AddModule
    Module: AddModule.ascx
    Div: MiddleFull
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'AddModule.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'AddModule', @Mod_Id, 'Add Module',  @Div_Id, 1, 0, 
      'Admin;Guests;Registered', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: JMDHTMLEdit
    Module: JMDHTMLEdit.ascx
    Div: MiddleFull
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'JMDHTMLEdit.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'JMDHTMLEdit', @Mod_Id, 'Edit Module Contents',  @Div_Id, 1, 0, 
      'Admin;Registered', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: Default
    Module: MenuTop.ascx
    Div: Top
  */ 
  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Top'

  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'MenuTop.ascx'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'Default', @Mod_Id, 'MenuTop',  @Div_Id, 1, 1, 
      'Admin;Guests;Registered;', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: Default
    Module: JMDHTML.ascx
    Div: Header
  */ 
  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Header'

  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'JMDHTML.ascx'

  Execute
    @PageModId = JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'Default', @Mod_Id, ' ',  @Div_Id, 1, 1, 
      'Admin;Guests;Registered;', 'Admin','Admin','Admin','Admin' 

  Execute
    JMD_MOD_HTML_SAVE
      @PageModId, --@Page_Mod_Id int,
      '', --@Title nvarchar(255),
      '<br /><br /><h1>LOGO</h1><br /><br />' --@HTML_Text Text

  /***************************************************************************
    Page: Default
    Module: MenuMain.ascx
    Div: MainMenu
  */ 
  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'MainMenu'

  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'MenuMain.ascx'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'Default', @Mod_Id, 'MenuMain',  @Div_Id, 1, 1, 
      'Admin;Guests;Registered;', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: Default
    Module: BreadCrumbs.ascx
    Div: SubHeader
  */ 
  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'SubHeader'

  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'BreadCrumbs.ascx'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'Default', @Mod_Id, 'BreadCrumbs',  @Div_Id, 1, 1, 
      'Admin;Guests;Registered;', 'Admin','Admin','Admin','Admin' 



  /***************************************************************************
    Page: BrowseForms
    Module: BrowseForms.ascx
    Div: Center
  */ 
  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'BrowseForms.ascx'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'BrowseForms', @Mod_Id, 'BrowseForms',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: BrowseForms
    Module: BrowseForms.ascx
    Div: Center
  */ 
  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'NewForm.ascx'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'NewForm', @Mod_Id, 'NewForm',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 


  /***************************************************************************
    Page: NewCol
    Module: NewCol.ascx
    Div: Center
  */ 
  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'NewCol.ascx'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'NewCol', @Mod_Id, 'NewCol',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 

 /***************************************************************************
    Page: BrowseCols
    Module: BrowseCols.ascx
    Div: Center
  */ 
  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'BrowseCols.ascx'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'BrowseCols', @Mod_Id, 'BrowseCols',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 

/***************************************************************************
    Page: NewRecord
    Module: NewRecord.ascx
    Div: Center
  */ 
  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'NewRecord.ascx'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'NewRecord', @Mod_Id, 'NewRecord',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin'

/***************************************************************************
    Page: DF
    Module: DynamicForms.ascx
    Div: Center
  */ 
  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'DynamicForms.ascx'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'DF', @Mod_Id, 'DF',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 

/***************************************************************************
    Page: LookupDialog
    Module: LookupDialog.ascx
    Div: Center
  */ 
  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'LookupDialog.ascx'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'LookupDialog', @Mod_Id, 'LookupDialog',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 


  /***************************************************************************
    Page: DeletePage
    Module: DeletePage.ascx
    Div: Center
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'DeletePage.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'DeletePage', @Mod_Id, 'Delete Page',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: Default
    Module: JMDHTML.ascx
    Div: Center
    Purpose: Welcome Message with initial site creation.
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'JMDHTML.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'Default', @Mod_Id, 'Welcome',  @Div_Id, 1, 0, 
      'Admin;Guests;Registered', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: Default
    Module: JMDHTML.ascx
    Div: Footer
    Purpose: Footer HTML Init
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'JMDHTML.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Footer'

  Execute
    @PageModId = JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'Default', @Mod_Id, ' ',  @Div_Id, 1, 1, 
      'Admin;Guests;Registered', 'Admin','Admin','Admin','Admin' 

  Execute
    JMD_MOD_HTML_SAVE
      @PageModId, --@Page_Mod_Id int,
      '', --@Title nvarchar(255),
      'FOOTER' --@HTML_Text Text
      

  /***************************************************************************
    Page: Default
    Module: JMDHTML.ascx
    Div: PoweredBy
    Purpose: Powered By Message
  */ 
/*
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'JMDHTML.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'PoweredBy'


  Execute
    @PageModId = JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'Default', @Mod_Id, ' ',  @Div_Id, 1, 1, 
      'Admin;Guests;Registered', 'Admin','Admin','Admin','Admin' 

  Execute
    JMD_MOD_HTML_SAVE
      @PageModId, --@Page_Mod_Id int,
      '', --@Title nvarchar(255),
      'powered by <a href="http://www.jmdcms.com">JMDCMS.com</a><br />copyright   2007 ' --@HTML_Text Text

*/
  /***************************************************************************
    Page: Default
    Module: JMDHTMLMenuLeft.ascx
    Div: Left
  */ 

  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'JMDHTMLMenuLeft.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Left'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'Default', @Mod_Id, 'Menu',  @Div_Id, 1, 1, 
      'Admin;Guests;Registered', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: DeletePage
    Module: DeletePage.ascx
    Div: Center
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'DeletePageModule.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'DeletePageModule', @Mod_Id, 'Delete Page Module',  @Div_Id, 1, 0, 
      'Admin;Registered', 'Admin','Admin','Admin','Admin' 


  /***************************************************************************
    Page: Users
    Module: Users.ascx
    Div: Center
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'Users.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'Users', @Mod_Id, 'Users Admin',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: DeleteUser
    Module: DeleteUser.ascx
    Div: Center
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'DeleteUser.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'DeleteUser', @Mod_Id, 'Delete User',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 




  /***************************************************************************
    Page: Pages
    Module: Pages.ascx
    Div: Center
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'Pages.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'Pages', @Mod_Id, 'Pages Admin',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: Modules
    Module: Modules.ascx
    Div: Center
    WI:650: Module manager module removed, will be added in next version
  */ 
/*
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'Modules.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'Modules', @Mod_Id, 'Modules Admin',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 
*/
  /***************************************************************************
    Page: Roles
    Module: Roles.ascx
    Div: Center
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'Roles.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'Roles', @Mod_Id, 'Roles Admin',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: AddRole
    Module: AddRole.ascx
    Div: Center
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'AddRole.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'AddRole', @Mod_Id, 'Manage Roles',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: DeleteRole
    Module: DeleteRole.ascx
    Div: Center
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'DeleteRole.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'DeleteRole', @Mod_Id, 'Delete Role',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 

  /***************************************************************************
    Page: UserRoles
    Module: UserRoles.ascx
    Div: Center
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'UserRoles.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'UserRoles', @Mod_Id, 'User Roles',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 


  /***************************************************************************
    Page: SMO
    Module: SMO.ascx
    Div: Center
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'SMO.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'SMO', @Mod_Id, 'SQL Server Management',  @Div_Id, 1, 0, 
      'Admin;Registered', 'Admin','Admin','Admin','Admin' 


  /***************************************************************************
    Page: Admin
    Module: Admin.ascx
    Div: Center
    WI:650 - Add admin module
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'Admin.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'Admin', @Mod_Id, 'Site Administration',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin' 

	Execute DBO.JMD_MOD_ADMIN_INIT
		@Site_URL



  /***************************************************************************
    Page: FileManager
    Module: FileManager.ascx
    Div: Center
    WI:650 - File Manager Module
  */ 
  Select
    @Mod_Id = Id
  From
    JMD_MOD
  Where
    Site_Id = @Site_Id and
    Mod_Name = 'FileManager.ascx'

  Select
    @Div_Id = Id
  From
    JMD_DIV
  Where
    Site_Id = @Site_Id and
    Div_Name = 'Center'

  Execute
    JMD_PAGE_MOD_SAVE
      '0',  @Site_URL, 'FileManager', @Mod_Id, 'File Manager',  @Div_Id, 1, 0, 
      'Admin', 'Admin','Admin','Admin','Admin'
GO





/****************************************************
* SP Name: JMD_COL_TYPE_INIT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_COL_TYPE_INIT]    Script Date: 12/11/2009 16:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
JMD_COL_TYPE_SAVE
  @JMD_COL_TYPE_ID INT ,
  @SITE_URL NVARCHAR(255),
  @COL_TYPE NVARCHAR(50),
  @COL_DATA_TYPE NVARCHAR(50)

Exec JMD_COL_TYPE_INIT 'JMDCMS.Web'
select * from JMD_COL_TYPE
delete jmd_col

SP_TABLES
SELECT * FROM JMD_29_VEH
As
*/
CREATE PROCEDURE [dbo].[JMD_COL_TYPE_INIT]
  @SITE_URL NVARCHAR(255)
AS

/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Delete JMD_COL_TYPE

  Exec JMD_COL_TYPE_SAVE
    '0', @SITE_URL, 'SingleLine', 'nvarchar(100)'

  Exec JMD_COL_TYPE_SAVE
    '0', @SITE_URL, 'MultiLine', 'Text'

  Exec JMD_COL_TYPE_SAVE
    '0', @SITE_URL, 'RadioButton', 'nvarchar(100)'

  Exec JMD_COL_TYPE_SAVE
    '0', @SITE_URL, 'ComboBox', 'nvarchar(100)'

  Exec JMD_COL_TYPE_SAVE
    '0', @SITE_URL, 'ListBox', 'nvarchar(100)'

  Exec JMD_COL_TYPE_SAVE
    '0', @SITE_URL, 'Lookup', 'nvarchar(100)'

  Exec JMD_COL_TYPE_SAVE
    '0', @SITE_URL, 'CheckBox', 'nvarchar(100)'

  Exec JMD_COL_TYPE_SAVE
    '0', @SITE_URL, 'CheckBoxList', 'nvarchar(100)'

  Exec JMD_COL_TYPE_SAVE
    '0', @SITE_URL, 'Money', 'nvarchar(30)'

  Exec JMD_COL_TYPE_SAVE
    '0', @SITE_URL, 'Number', 'nvarchar(30)'

  Exec JMD_COL_TYPE_SAVE
    '0', @SITE_URL, 'DateTime', 'DateTime'
GO





/****************************************************
* SP Name: JMD_MOD_INIT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_MOD_INIT]    Script Date: 12/11/2009 16:50:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
  Select * From JMD_MOD
  Exec JMD_MOD_SAVE
    0, 'JMDCMS.Web', 'NewRecord.ascx', '\Modules\Forms\',Null, 'Dynamic Forms', 1, 0 
*/
CREATE PROCEDURE [dbo].[JMD_MOD_INIT]
  @SITE_URL nvarchar(255)
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  /***************************************************************************
	Author: Ajay Handa
	Purpose: Initialized default modules at the time of new site creation

	WI:650:handaajay15:mar/18/2007 - Add Admin module
	WI:650:handaajay15:mar/18/2007 - Add File Manager Module
	JMDHTMLEdit module - Header controls removed
  */
  /***************************************************************************
   * PAGE MANAGEMENT MODULES
  */
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'Pages.ascx', '\Modules\Admin\',Null, 'Pages Admin', 1, 0 

  -- AddPage.ascx
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'AddPage.ascx', '\Modules\Admin\',Null, 'Add Page', 1, 0 

  -- DeletePage.ascx
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'DeletePage.ascx', '\Modules\Admin\',Null, 'Delete Page', 1, 0 


  -- Login.ascx
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'Login.ascx', '\Modules\Admin\',Null, 'Login', 1, 0 

  -- AddModule.ascx
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'AddModule.ascx', '\Modules\Admin\',Null, 'Add Module', 1, 0 

  -- JMDHTMLMenuLeft.ascx
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'JMDHTMLMenuLeft.ascx', '\Modules\JMDHTML\',Null, 'HTML Menu', 0, 0 

  -- JMDHTML.ascx
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'JMDHTML.ascx', '\Modules\JMDHTML\','JMDHTMLEdit.aspx', 'HTML Doc', 0, 1 

  -- JMDHTMLEdit.ascx
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'JMDHTMLEdit.ascx', '\Modules\JMDHTML\',Null, 'HTML Edit', 1, 0 

  -- MenuTop.ascx
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'MenuTop.ascx', '\Modules\Core\',Null, 'Top Menu', 1, 0 

  -- MenuTop.ascx
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'MenuMain.ascx', '\Modules\Core\',Null, 'Main Menu', 1, 0 

  -- BrowseForms.ascx
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'BrowseForms.ascx', '\Modules\Forms\',Null, 'Browse Forms', 1, 0 

  -- NewForm.ascx
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'NewForm.ascx', '\Modules\Forms\',Null, 'New Form', 1, 0 

  -- NewCol.ascx
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'BrowseCols.ascx', '\Modules\Forms\',Null, 'Browse Columns', 1, 0 

  -- NewCol.ascx
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'NewCol.ascx', '\Modules\Forms\',Null, 'New Column', 1, 0 

  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'NewRecord.ascx', '\Modules\Forms\',Null, 'Dynamic Forms', 1, 0 

  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'DynamicForms.ascx', '\Modules\Research\',Null, 'Dynamic Forms', 1, 0 

  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'LookupDialog.ascx', '\Modules\Forms\',Null, 'Lookup Dialog', 1, 0 

  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'DeletePageModule.ascx', '\Modules\Admin\',Null, 'Delete Page Module', 1, 0 

  /***************************************************************************
   * Administration  MODULES
  */

  -- WI: 650 - Add Admin module
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'Admin.ascx', '\Modules\Admin\',Null, 'Site Administration', 1, 0 

  -- WI:650:handaajay15:mar/18/2007 - Add File Manager Module
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'FileManager.ascx', '\Modules\Admin\',Null, 'File Manager', 1, 0 

  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'Users.ascx', '\Modules\Admin\',Null, 'Users Admin', 1, 0 

  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'NewUser.ascx', '\Modules\Admin\',Null, 'New User', 1, 0 

  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'UserRoles.ascx', '\Modules\Admin\',Null, 'New User', 1, 0 

  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'DeleteUser.ascx', '\Modules\Admin\',Null, 'New User', 1, 0 

  /***************************************************************************
   * ROLES MANAGEMENT MODULES
  */
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'Roles.ascx', '\Modules\Admin\',Null, 'Roles Admin', 1, 0 
 
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'AddRole.ascx', '\Modules\Admin\',Null, 'Add Role', 1, 0 

  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'DeleteRole.ascx', '\Modules\Admin\',Null, 'Delete Role', 1, 0 

  /***************************************************************************
   * MODULE MANAGEMENT MODULES
  */
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'Modules.ascx', '\Modules\Admin\',Null, 'Modules Admin', 1, 0 

  /***************************************************************************
   * SMO MANAGEMENT MODULES
  */
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'SMO.ascx', '\Modules\SMO\',Null, 'SQL Server Management', 1, 0 

  /***************************************************************************
   * BREADCRUMBS
  */
  Exec JMD_MOD_SAVE
    0, @SITE_URL, 'BreadCrumbs.ascx', '\Modules\Core\',Null, 'Bread Crumbs', 1, 0 


GO




/****************************************************
* SP Name: JMD_PAGE_INIT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_PAGE_INIT]    Script Date: 12/11/2009 16:50:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_PAGE_INIT]
  @Site_URL nvarchar(255)
AS

/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.

	Name: JMD_PAGE_INIT
	Author: Ajay Handa
	Purpose: Initializes the default pages on new site creation.
	Work Item ID: 783 - Resolved guests and registered users conflict.
	WI:650:handaajay15 - Mar/17/2007 Site Administration
		Page FileManager Added 
	WI:650:handaajay15 - Mar/17/2007 - Module Manager Page Removed.

*/
  Declare
    @Page_Id int

  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'default','Home','Home Page', 'Home Page', 'Home Page', 
    Null, 1, 1, 1, 'Admin;Guests;Registered;', 'Admin', 'Admin','Admin','Admin','Admin',1,1

  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'login','Login','Login', 'Login', 'Login', 
    Null, 1, 0, 0, 'Admin;Guests;Registered;', 'Admin', 'Admin','Admin','Admin','Admin',1,0

  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'NewUser','New User','NewUser', 'NewUser', 'NewUser', 
    Null, 1, 0, 0, 'Admin;Guests;Registered;', 'Admin', 'Admin','Admin','Admin','Admin',1,0

  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'AddPage','Add Page','AddPage', 'AddPage', 'AddPage', 
    Null, 1, 0, 0, 'Admin;Registered;', 'Admin', 'Admin','Admin','Admin','Admin',1,0
  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'AddModule','Add Module','Add Module', 'Add Module', 'Add Module', 
    Null, 1, 0, 0, 'Admin;Registered;', 'Admin', 'Admin','Admin','Admin','Admin',1,0

  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'JMDHTMLEdit','Edit Module Contents','Edit Module Contents', 'Edit Module Contents', 'Edit Module Contents', 
    Null, 1, 0, 0, 'Admin;Registered;', 'Admin', 'Admin','Admin','Admin','Admin',1,0

 Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'BrowseForms','Browse Forms','Browse Forms', 'Browse Forms', 'Browse Forms', 
    Null, 1, 0, 0, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,1

Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'NewForm','New Form','New Form', 'New Form', 'New Form', 
    Null, 1, 0, 0, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,0

Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'NewCol','New Field','New Field', 'New Field', 'New Field', 
    Null, 1, 0, 0, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,0

Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'BrowseCols','Browse Columns','Browse Columns', 'Browse Columns', 'Browse Columns', 
    Null, 1, 0, 0, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,1

Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'DF','Dynamic Forms','DF', 'DF', 'DF', 
    Null, 1, 0, 0, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,1

Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'NewRecord','New Record','New Record', 'New Record', 'New Record', 
    Null, 1, 0, 0, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,0

Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'LookupDialog','LookupDialog','LookupDialog', 'LookupDialog', 'LookupDialog', 
    Null, 1, 0, 0, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,0

  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'DeletePage','Delete Page','Delete Page', 'Delete Page', 'Delete Page', 
    Null, 1, 0, 0, 'Admin;Registered;', 'Admin', 'Admin','Admin','Admin','Admin',1,0

  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'DeletePageModule','Delete Page Module','Delete Page Module', 'Delete Page Module', 'Delete Page Module', 
    Null, 1, 0, 0, 'Admin;Registered;', 'Admin', 'Admin','Admin','Admin','Admin',1,0

  -- Admin Page
  Exec
    @Page_Id = JMD_PAGE_SAVE
    0,  @Site_URL, 'Admin','Admin','Site Administration', 'Site Administration', 'Site Administration', 
    Null, 1, 0, 1, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,1

  -- Admin Page Child: Users
  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'Users','Users','Users Administration', 'Users Administration', 'Users Administration', 
    'Admin', 1, 0, 1, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,1

  -- Admin Page Child: Roles
  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'Roles','Roles','Roles Administration', 'Roles Administration', 'Roles Administration', 
    'Admin', 1, 0, 1, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,1

  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'AddRole','AddRole','Manage Roles', 'Manage Roles', 'Manage Roles', 
    'Admin', 1, 0, 0, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,0

  Exec
    JMD_PAGE_SAVE
 0,  @Site_URL, 'DeleteRole','DeleteRole','Manage Roles', 'Manage Roles', 'Manage Roles', 
    'Admin', 1, 0, 0, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,0

  -- Admin Page Child: Pages
  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'Pages','Pages','Pages Administration', 'Pages Administration', 'Pages Administration', 
    'Admin', 1, 0, 1, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,0

  -- WI:650:handaajay15 - File Manager Page 
  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'FileManager','FileManager','File Manager', 'File Manager', 'File Manager', 
    'Admin', 1, 0, 1, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,0


/* WI:650:Module Manager will done after release 3.0.0.0
  -- Admin Page Child: Modules
  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'Modules','Modules','Modules Administration', 'Modules Administration', 'Modules Administration', 
    'Admin', 1, 0, 1, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,0
*/
  -- Admin Page Child: UserRoles
  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'UserRoles','User Roles','User Roles', 'User Roles', 'User Roles', 
    Null, 1, 0, 0, 'Admin', 'Admin', 'Admin','Admin','Admin','Admin',1,0

  -- Admin User Delete
  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'DeleteUser','Delete User','Delete User', 'Delete User', 'Delete User', 
    Null, 1, 0, 0, 'Admin;Registered', 'Admin', 'Admin','Admin','Admin','Admin',1,0

  -- SQL Server Management Page
  Exec
    JMD_PAGE_SAVE
    0,  @Site_URL, 'SMO','SQL Server Management','SQL Server Management', 'SQL Server Management', 'SQL Server Management', 
    Null, 1, 0, 0, 'Admin;Registered', 'Admin', 'Admin','Admin','Admin','Admin',1,0
GO





/****************************************************
* SP Name: JMD_ROLE_INIT
****************************************************/

USE [CMP_Temp]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_ROLE_INIT]
  @SITE_URL nvarchar(255)
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Exec 
    JMD_ROLE_SAVE 0,@Site_URL, 'Admin', 1, null
  Exec 
    JMD_ROLE_SAVE 0,@Site_URL, 'Registered', 1, null
  Exec 
    JMD_ROLE_SAVE 0,@Site_URL, 'Guests', 1, null
GO




/****************************************************
* SP Name: JMD_USER_INIT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_USER_INIT]    Script Date: 12/11/2009 16:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[JMD_USER_INIT]
  @Site_URL nvarchar(255),
  @Password_Hash nvarchar(50),
  @Salt nvarchar(50),
  @Email nvarchar(50)
As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Execute
    JMD_USER_SAVE
      0, @SITE_URL, 'Admin', 'Admin', @Password_Hash, @Salt, 1, @Email
GO





/****************************************************
* SP Name: JMD_DIV_INIT
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_DIV_INIT]    Script Date: 12/11/2009 16:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Exec JMD_DIV_INIT
  'JMDCMS.Web'
select * from jmd_div
*/
CREATE PROCEDURE [dbo].[JMD_DIV_INIT]
  @SITE_URL nvarchar(255)
AS
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.
*/

  Execute
    JMD_DIV_SAVE 0, @Site_URL, 'Top', 100, Null, 1
  Execute
    JMD_DIV_SAVE 0, @Site_URL, 'Header', 200, Null, 0
  Execute
    JMD_DIV_SAVE 0, @Site_URL, 'MainMenu', 300, Null, 1
  Execute
    JMD_DIV_SAVE 0, @Site_URL, 'SubHeader', 400, Null, 0
  Execute
    JMD_DIV_SAVE 0, @Site_URL, 'Left', 500, Null, 0
  Execute
    JMD_DIV_SAVE 0, @Site_URL, 'Right', 600, Null, 0
  Execute
    JMD_DIV_SAVE 0, @Site_URL, 'Center', 700, Null, 0
  Execute
    JMD_DIV_SAVE 0, @Site_URL, 'Footer', 800, Null, 0
  Execute
    JMD_DIV_SAVE 0, @Site_URL, 'PoweredBy', 900, Null, 1
GO


/****************************************************
* SP Name: JMD_SITE_CREATE
****************************************************/

USE [CMP_Temp]
GO
/****** Object:  StoredProcedure [dbo].[JMD_SITE_CREATE]    Script Date: 12/11/2009 16:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************
  NAME: JMD_SITE_CREATE
  PURPOSE: Site Creation...
*****************************************************************************/
CREATE PROCEDURE [dbo].[JMD_SITE_CREATE]
  @SITE_URL nvarchar(255),
  @Email nvarchar(50),
  @STYLE_SHEET nvarchar(255) = 'Userfiles/Style/JMDCMS/jmdcms.css',
  @SITE_VERSION nvarchar(20) = '',
  @SITE_FOLDER nvarchar(255) = ''

As
/*
	Copyright (C) 2007  Ajay Handa - jmdcms.com 
	This program is free software; 
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	License for more details.
	Some rights reserved. Please read License.txt for details.
	Removing above copyright message is a violation of license terms.

	Author: Ajay Handa
	Purpose: New Site Creation
	WI:650:handaajay15:Mar/18/07: Transaction Implemented
*/
SET XACT_ABORT ON
BEGIN TRANSACTION

  Declare
    @Site_Id int,
    @Page_Id int

  /*
    Table: JMD_SITE
    Check and Insert new site record.
  */
  Execute 
    @Site_Id = JMD_SITE_INSERT @SITE_URL, null, 
      @STYLE_SHEET, @SITE_VERSION, @SITE_FOLDER

  /***************************************************************************
    Table: JMD_MOD
    Check and Insert Default Roles.
  */
  Execute 
    JMD_MOD_INIT @Site_URL
  /***************************************************************************
    Table: JMD_DIV
    Check and Insert DIVS.
  */
  Execute 
    JMD_DIV_INIT @Site_URL
  /***************************************************************************
    Table: JMD_ROLE
    Check and Insert Default Roles.
  */
  Execute 
    JMD_ROLE_INIT @Site_URL

  /***************************************************************************
    Table: JMD_USER
    Check and Insert Default Users.
  */
    Execute 
      JMD_USER_INIT @Site_URL, '57B71C1931CDCE26AC585E9FEC647B480C924D76', 
      'AHNWuE0=', @Email
  /*
    Table: JMD_USER_ROLE
    Check and Insert Default User Roles.
  */
    Execute 
      JMD_USER_ROLE_INIT @Site_URL
  /*
    Table: JMD_PAGE
    Check and Insert Default page.
  */
    Execute 
      JMD_PAGE_INIT @Site_URL
  /*
    Table: JMD_PAGE_MOD
    Check and Insert DEFAULT MODULES ON PAGE
  */
    Execute 
      JMD_PAGE_MOD_INIT @Site_URL

	 
COMMIT
GO

	/***************************************************************************
    Table: PortalAdmin_List
    Create table PortalAdmin_List
  */
  
  /****** Object:  Table [dbo].[PortalAdmin_List]    Script Date: 01/01/2010 22:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PortalAdmin_List](
	[PortalAdminID] [int] IDENTITY(1,1) NOT NULL,
	[PortalAdminName] [varchar](50) NULL,
	[PortalAdminPass] [varchar](50) NULL,
 CONSTRAINT [PK_PortalAdmin_List] PRIMARY KEY CLUSTERED 
(
	[PortalAdminID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
