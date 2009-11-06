/****************************************************
* Table Name: mcq_exam_master
****************************************************/

USE [CMP]
GO
/*****Object:  Table [dbo].[mcq_exam_master]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[mcq_exam_master](
	[exam_id] [varchar](25) NOT NULL,
	[exam_name] [varchar](50) NOT NULL,
	[exam_abbr] [varchar](50) NOT NULL,
	[total_qns] [numeric](5, 0) NOT NULL,
	[total_marks] [numeric](3, 0) NOT NULL,
	[pass_mark] [numeric](2, 0) NULL,
	[exam_duration] [numeric](10, 3) NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_mcq_exam_master] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF,
 ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


/****************************************************
* Table Name: mcq_section_master
****************************************************/
USE [CMP]
GO
/****** Object:  Table [dbo].[mcq_section_master]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[mcq_section_master](
	[exam_id] [varchar](25) NOT NULL,
	[section_id] [varchar](20) NOT NULL,
	[section_name] [varchar](50) NOT NULL,
	[section_abbr] [varchar](50) NOT NULL,
	[section_seq]  [numeric](3, 0) NOT NULL,
	[section_weight] [numeric](3, 0) NOT NULL,
	[total_simple_qns][numeric](3, 0) NOT NULL,
	[simple_qn_weight][numeric](3, 0) NOT NULL,
	[total_moderate_qns][numeric](3, 0) NOT NULL,
	[moderate_qn_weight][numeric](3, 0) NOT NULL,
	[total_complex_qns][numeric](3, 0) NOT NULL,
	[complex_qn_weight][numeric](3, 0) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_mcq_section_master] PRIMARY KEY CLUSTERED 
(
	[section_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF,
 ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[mcq_section_master]  WITH CHECK ADD  CONSTRAINT [fk_mcq_section_master]
 FOREIGN KEY([exam_id])
REFERENCES [dbo].[mcq_exam_master] ([exam_id])

GO
SET ANSI_PADDING OFF



/****************************************************
* Table Name: mcq_question_master
****************************************************/

USE [CMP]
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
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_mcq_quest_master] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF,
 ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
/***
GO
ALTER TABLE [dbo].[mcq_question_master]  WITH CHECK ADD  CONSTRAINT [fk_mcq_question_master]
 FOREIGN KEY([exam_id],[section_id])
REFERENCES [dbo].[mcq_section_master] ([exam_id],[section_id])
**/
GO
SET ANSI_PADDING OFF


/****************************************************
* Table Name: mcq_user_exam
****************************************************/

USE [CMP]
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
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_mcq_user_exam] PRIMARY KEY CLUSTERED 
(
	[user_exam_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF,
 ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


/****************************************************
* Table Name: mcq_exam_result
****************************************************/

USE [CMP]
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
	[total_time_taken][numeric](5, 2) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_mcq_exam_result] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC,
	[user_id] ASC,
	[qn_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF,
 ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


/****************************************************
* Table Name: mcq_exam_section_result
****************************************************/

USE [CMP]
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
	[marks][numeric](5, 2) NOT NULL,
	[duration][numeric](5, 2) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_mcq_exam_section_result] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC,
	[user_id] ASC,
	[section_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF



/****************************************************
* Table Name: survey_master
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[survey_master](
	[survey_id] [varchar](25) NOT NULL,
	[survey_name] [varchar](50) NULL,
	[survey_abbr] [varchar](50) NULL,
	[total_qns] [numeric](5, 0) NOT NULL,
  [created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
 CONSTRAINT [pk_survey_master] PRIMARY KEY CLUSTERED 
(
	[survey_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF


/****************************************************
* Table Name: survey_qn_master
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[survey_qn_master](
	[survey_id] [varchar](25) NOT NULL,
	[qn_id] [varchar](25) NOT NULL,
	[qn] [varchar](50) NULL,
	[qn_type] [varchar](25) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_survey_qn_master] PRIMARY KEY CLUSTERED 
(
	[survey_id] ASC,
  [qn_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF




/****************************************************
* Table Name: survey_choice_master
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[survey_choice_master](
	[survey_id] [varchar](25) NOT NULL,
	[qn_id] [varchar](25) NOT NULL,
	[choice] [varchar](50) NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_survey_choice_master] PRIMARY KEY CLUSTERED 
(
	[survey_id] ASC,
  [qn_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


/****************************************************
* Table Name: survey_result
****************************************************/

USE [CMP]
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
	[exam_dt]  [datetime] not NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_survey_result] PRIMARY KEY CLUSTERED 
(
	[user_survey_id] ASC,
  [survey_id] ASC,
  [user_id] ASC,
  [qn_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF



/****************************************************
* Table Name: module_master
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[module_master](
	[module_id] [varchar](25) NOT NULL,
	[module_name] [varchar](50	) NOT NULL,
	[module_remarks] [varchar](500) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_module_master] PRIMARY KEY CLUSTERED 
(
	[module_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF




/****************************************************
* Table Name: company_module
****************************************************/

USE [CMP]
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
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_company_module] PRIMARY KEY CLUSTERED 
(
	[company_module_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF



/****************************************************
* Table Name: cms_user_content_usage
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_user_content_usage](
	[user_id] [varchar](25) NOT NULL,
	[site_id] [varchar](50) NOT NULL,
	[cms_page_id] [varchar](25) NOT NULL,
	[duration_spend] [numeric](5, 0) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_cms_user_content_usage] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[site_id] ASC,
	[cms_page_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF



/****************************************************
* Table Name: company_sites
****************************************************/

USE [CMP]
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
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_company_sites] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF





/****************************************************
* Table Name: user_role
****************************************************/

USE [CMP]
GO
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
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_user_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[user_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF




/****************************************************
* Table Name: dap_module
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dap_module](
	[dap_id] [varchar](25) NOT NULL,
	[module_id] [varchar](25) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_dap_module] PRIMARY KEY CLUSTERED 
(
	[dap_id] ASC,
	[module_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF



/****************************************************
* Table Name: fap_list
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[fap_list](
	[fap_list_id] [varchar](25) NOT NULL,
	[functions] [varchar](50) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_fap_list] PRIMARY KEY CLUSTERED 
(
	[fap_list_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF




/****************************************************
* Table Name: company_master
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[company_master](
	[comp_id] [varchar](25) NOT NULL,
	[company_name] [varchar](100) NOT NULL,
	[comp_addr1] [varchar](150) NOT NULL,
	[comp_addr2] [varchar](150) NOT NULL,
	[comp_addr3] [varchar](150) NOT NULL,
	[postal_code] [varchar](12) NOT NULL,
	[comp_contact_person] [varchar](50) NOT NULL,
	[comp_contact_email] [varchar](50) NOT NULL,
	[comp_contact_no] [varchar](50) NOT NULL,
	[comp_subscr_date]  [datetime] not NULL,
	[comp_comm_mode] [varchar](12) NOT NULL,
	[created_date]  [datetime] not NULL,
	[valid_period_from]  [datetime] not NULL,
	[valid_period_to] [datetime] not NULL,
	[created_by] [varchar](50) NOT NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
	[comp_remarks] [varchar](500) NULL,
CONSTRAINT [pk_company_master] PRIMARY KEY CLUSTERED 
(
	[comp_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


/****************************************************
* Table Name: user_master
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_master](
	[user_master_key] [varchar](50) NOT NULL,
	[user_id] [varchar](25) NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[comp_id] [varchar](25) NOT NULL,
	[user_email_id] [varchar](50) NOT NULL,
	[user_password] [varchar](8) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
	[user_remarks] [varchar](500) NULL,
CONSTRAINT [pk_user_master] PRIMARY KEY CLUSTERED 
(
	[user_master_key] ASC,
	[user_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


/****************************************************
* Table Name: fap_master
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[fap_master](
	[fap_id] [varchar](25) NOT NULL,
	[fap_program_name] [varchar](50) NOT NULL,
	[fap_name] [varchar](50) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
	[fap_remarks] [varchar](500) NULL,
CONSTRAINT [pk_fap_master] PRIMARY KEY CLUSTERED 
(
	[fap_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF




/****************************************************
* Table Name: dap_master
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dap_master](
	[dap_id] [varchar](25) NOT NULL,
	[dap_data_name] [varchar](50) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
	[dap_remarks] [varchar](500) NULL,
CONSTRAINT [pk_dap_master] PRIMARY KEY CLUSTERED 
(
	[dap_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF



/****************************************************
* Table Name: cms_div
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_div](
	[site_id] [varchar](25) NOT NULL,
	[div_name] [varchar](50) NOT NULL,
	[div_sort] [varchar](50) NOT NULL,
	[parent_div_id] [varchar](50) NOT NULL,
	[is_internal] [varchar](50) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_cms_div] PRIMARY KEY CLUSTERED 
(
	[site_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


/****************************************************
* Table Name: cms_mod
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_mod](
	[site_id] [varchar](25) NOT NULL,
	[mod_name] [varchar](50) NOT NULL,
	[mod_path] [varchar](250) NOT NULL,
	[mod_edit_form] [varchar](550) NOT NULL,
	[mod_firendly_name] [varchar](50) NOT NULL,
	[is_admin] [varchar](10) NOT NULL,
	[can_show_mod_header] [varchar](10) NOT NULL,
	[is_view_state_enabled] [varchar](10) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_cms_mod] PRIMARY KEY CLUSTERED 
(
	[site_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF



/****************************************************
* Table Name: cms_mod_admin
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_mod_admin](
	[site_id] [varchar](25) NOT NULL,
	[prop_tab] [varchar](50) NOT NULL,
	[prop_tab_sort] [varchar](50) NOT NULL,
	[prop_group] [varchar](50) NOT NULL,
	[prop_group_sort] [varchar](50) NOT NULL,
	[prop_code] [varchar](50) NOT NULL,
	[prop_code_sort] [varchar](50) NOT NULL,
	[prop_caption] [varchar](50) NOT NULL,
	[prop_desc] [varchar](50) NOT NULL,		
	[prop_type] [varchar](50) NOT NULL,			
	[prop_input_values] [varchar](50) NOT NULL,	
	[prop_values] [varchar](50) NOT NULL,								
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_cms_mod_admin] PRIMARY KEY CLUSTERED 
(
	[site_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF



/****************************************************
* Table Name: cms_obj
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_obj](
	[site_id] [varchar](25) NOT NULL,
	[obj_name] [varchar](250) NOT NULL,
	[obj_type] [varchar](50) NOT NULL,
	[obj_desc] [varchar](250) NOT NULL,
	[is_internal] [varchar](50) NOT NULL,
	[prop_values] [varchar](50) NOT NULL,								
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_cms_obj] PRIMARY KEY CLUSTERED 
(
	[site_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF




/****************************************************
* Table Name: cms_mod_cj_category
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_mod_cj_category](
	[category_id] [varchar](25) NOT NULL,
	[category] [varchar](250) NOT NULL,
	[inserted_on] [datetime] NOT NULL,	
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_cms_mod_cj_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


/****************************************************
* Table Name: cms_mod_html
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_mod_html](
	[page_mod_id] [varchar](25) NOT NULL,
	[html_text] [varchar](5000) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_cms_mod_html] PRIMARY KEY CLUSTERED 
(
	[page_mod_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF



/****************************************************
* Table Name: cms_page_mod
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_page_mod](
	[page_id] [varchar](25) NOT NULL,
	[mod_id] [varchar](50) NOT NULL,
	[mod_title] [varchar](250) NOT NULL,
	[div_id] [varchar](50) NOT NULL,
	[is_published] [varchar](10) NOT NULL,
	[show_on_all_pages] [varchar](50) NOT NULL,
	[view_role] [varchar](50) NOT NULL,
	[edit_role] [varchar](50) NOT NULL,
	[delete_role] [varchar](50) NOT NULL,	
	[move_role] [varchar](50) NOT NULL,	
	[edit_contents_role] [varchar](50) NOT NULL,	
	[is_deleted] [varchar](50) NOT NULL,	
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_cms_page_mod] PRIMARY KEY CLUSTERED 
(
	[page_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


/****************************************************
* Table Name: cms_page
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_page](
	[site_id] [varchar](25) NOT NULL,
	[page_name] [varchar](50) NOT NULL,
	[page_caption] [varchar](50) NOT NULL,
	[page_sort] [varchar](50) NOT NULL,
	[meta_title] [varchar](250) NOT NULL,
	[meta_desc] [varchar](250) NOT NULL,
	[meta_keywords] [varchar](250) NOT NULL,
	[parent_page_id] [varchar](50) NOT NULL,
	[is_published] [varchar](10) NOT NULL,
	[is_root] [varchar](10) NOT NULL,
	[is_menu_item] [varchar](10) NOT NULL,
	[view_roles] [varchar](50) NOT NULL,
	[add_roles] [varchar](50) NOT NULL,
	[edit_roles] [varchar](50) NOT NULL,
	[delete_roles] [varchar](50) NOT NULL,
	[move_roles] [varchar](50) NOT NULL,
	[add_module_roles] [varchar](50) NOT NULL,
	[is_internal] [varchar](10) NOT NULL,
	[load_shared_roles] [varchar](50) NOT NULL,
	[is_deleted] [varchar](50) NOT NULL,
	[is_view_state_enabled] [varchar](50) NOT NULL,	
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_cms_page] PRIMARY KEY CLUSTERED 
(
	[site_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


/****************************************************
* Table Name: cms_col_ext
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_col_ext](
	[cms_col_id] [varchar](50) NOT NULL,
	[cms_col_ext_data] [varchar](250) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_cms_col_ext] PRIMARY KEY CLUSTERED 
(
	[cms_col_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


/****************************************************
* Table Name: cms_col_type
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_col_type](
	[site_id] [varchar](50) NOT NULL,
	[col_type] [varchar](250) NOT NULL,
	[col_data_type] [varchar](250) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_cms_col_type] PRIMARY KEY CLUSTERED 
(
	[site_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


/****************************************************
* Table Name: cms_page_exclude
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_page_exclude](
	[page_mod_id] [varchar](50) NOT NULL,
	[page_id] [varchar](50) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_cms_page_exclude] PRIMARY KEY CLUSTERED 
(
	[page_mod_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



/****************************************************
* Table Name: cms_site
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_site](
	[site_id] [varchar](50) NOT NULL,
	[site_url] [varchar](250) NOT NULL,
	[alias_site_id] [varchar](50) NOT NULL,
	[style_sheet] [varchar](250) NOT NULL,
	[site_version] [varchar](50) NOT NULL,
	[site_folder] [varchar](250) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_cms_site] PRIMARY KEY CLUSTERED 
(
	[site_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



/****************************************************
* Table Name: cms_col
****************************************************/

USE [CMP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms_col](
	[jmd_obj_id] [varchar](50) NOT NULL,
	[jmd_col_name] [varchar](250) NOT NULL,
	[jmd_caption] [varchar](250) NOT NULL,
	[jmd_type_id] [varchar](50) NOT NULL,
	[jmd_type_desc] [varchar](250) NOT NULL,
	[created_by] [varchar](50) NOT NULL,
	[created_date]  [datetime] not NULL,
	[modified_by][varchar](50) NOT NULL,
	[modified_date]  [datetime] NOT NULL,
	[delete_flag] [varchar](2) NULL,
CONSTRAINT [pk_cms_col] PRIMARY KEY CLUSTERED 
(
	[jmd_obj_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


/***************************** Added by Haiyang on 31-Oct-09 ************************/
-- 1. Delete orginal tables: FAP_List, FAP_Master
-- 2. Create new tables: FAP_List, FAP_Master and FAP_Function
-- 3. Insert value into FAP_Function, FAP_List and FAP_Master

-- drop existing original FAP_List table
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fap_list]') AND type in (N'U'))
DROP TABLE [dbo].[fap_list]

-- drop existing fap_master table
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fap_master]') AND type in (N'U'))
DROP TABLE [dbo].[fap_master]

-- add table FAP_Function
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


-- Add Table FAP_List
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

-- Add table FAP_Master
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

/********************************* End of Addition ********************************************/


/******************************* Added by Haiyang on 06-Nov-09 *******************************/
-- here to change the table structure for Module_Master

-- it serves the purposes:
-- 1. Add new table DAP_List
-- 2. drop table dap_module 
-- 3. modify table dap_master
-- 4. modify table module_master

-- 1. Add new table DAP_List
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


-- 2. Drop table dap_module
/****** Object:  Table [dbo].[dap_module]    Script Date: 11/06/2009 23:56:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dap_module]') AND type in (N'U'))
DROP TABLE [dbo].[dap_module]

-- 3.1 drop table dap_master

/****** Object:  Table [dbo].[dap_master]    Script Date: 11/06/2009 23:58:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dap_master]') AND type in (N'U'))
DROP TABLE [dbo].[dap_master]


-- 3.2 create new table DAP_Master

/****** Object:  Table [dbo].[DAP_Master]    Script Date: 11/07/2009 00:02:33 ******/
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


-- 4.1 drop original Module_Master first 

/****** Object:  Table [dbo].[module_master]    Script Date: 11/06/2009 23:25:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[module_master]') AND type in (N'U'))
DROP TABLE [dbo].[module_master]


-- 4.2 Add in new table Module_Master
/****** Object:  Table [dbo].[Module_Master]    Script Date: 11/06/2009 23:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Module_Master](
	[module_id] [int] IDENTITY(1,1) NOT NULL,
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

/****************************** End of Addition on 06-Nov-09 *********************************/