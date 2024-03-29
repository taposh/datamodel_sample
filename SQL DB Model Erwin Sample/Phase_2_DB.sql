SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MQIncomingMessageLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MQIncomingMessageLog](
	[MQIncomingMessageLogGID] [int] NOT NULL,
	[BureauNumber] [varchar](20) NULL,
	[JobClassCode] [varchar](20) NULL,
	[Suffix] [varchar](20) NULL,
	[Territory] [int] NULL,
	[UpdateType] [varchar](20) NULL,
	[UpdateIndicator] [varchar](20) NULL,
	[EffectiveDate] [datetime] NULL,
	[OfficeAssignedFlag] [bit] NULL,
	[IfAnyFlag] [bit] NULL,
	[USLHFlag] [bit] NULL,
	[DateReceived] [datetime] NULL,
	[DateProcessed] [datetime] NULL,
	[StatusFlagLID] [int] NULL,
	[BACUpdateStatusLID] [int] NULL,
	[WCRUpdateStatusLID] [int] NULL,
	[CreateUserFID] [int] NULL,
	[UpdateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [XPKMQIncomingMessageLog] PRIMARY KEY CLUSTERED 
(
	[MQIncomingMessageLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_DDTSDocuments_NumberOfCopies]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_DDTSDocuments_NumberOfCopies]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_DDTSPrinter_ACTIVE]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_DDTSPrinter_ACTIVE]
	AS 1'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USRSummary]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USRSummary](
	[USRSummaryGID] [datetime] NOT NULL,
	[USRID] [datetime] NULL,
	[EmployerFID] [datetime] NULL,
	[InsurerFID] [datetime] NULL,
	[PolicyFID] [datetime] NULL,
	[ReportLevel] [datetime] NULL,
	[CorrectionNumber] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[ReportedExposureTotal] [datetime] NULL,
	[ReportedPremiumTotal] [datetime] NULL,
	[AuthorizedExposureTotal] [datetime] NULL,
	[AuthorizedPremiumTotal] [datetime] NULL,
	[ExposureRecordCount] [datetime] NULL,
	[ReportedIndemnityTotal] [datetime] NULL,
	[LossRecordCount] [datetime] NULL,
	[EstimatedExposureIndicator] [datetime] NULL,
	[RiskId] [datetime] NULL,
	[PolicyTypeIDCodeCoverage] [datetime] NULL,
	[PolicyTypeIDCodePlanIndicator] [datetime] NULL,
	[PolicyTypeIDNonStdIndicator] [datetime] NULL,
	[InsuredName] [datetime] NULL,
	[InsuredAddress] [datetime] NULL,
	[StatusLID] [datetime] NULL,
	[OriginalReportLevel] [datetime] NULL,
	[OriginalCorrectionNumber] [datetime] NULL,
 CONSTRAINT [XPKUSRSummary] PRIMARY KEY CLUSTERED 
(
	[USRSummaryGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MQMessageErrorTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MQMessageErrorTypes](
	[MQMessageErrorTypeGID] [int] NOT NULL,
	[ErrorCode] [datetime] NULL,
	[ErrorDescription] [varchar](20) NULL,
	[IsActive] [bit] NULL,
	[CreateUserFID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateUserFID] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [XPKMQMessageErrorTypes] PRIMARY KEY CLUSTERED 
(
	[MQMessageErrorTypeGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Workqueue__IsBoo__6A276FFF]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__Workqueue__IsBoo__6A276FFF]
	AS 0'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Workqueue__IsLas__2918C6B1]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__Workqueue__IsLas__2918C6B1]
	AS 0'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USRSummaryAuditTransaction]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USRSummaryAuditTransaction](
	[USRSummaryAuditTransactionGID] [datetime] NOT NULL,
	[USRSummaryHistoryGID] [datetime] NOT NULL,
	[USRSummaryGID] [datetime] NOT NULL,
	[TransactionStatusLID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
 CONSTRAINT [XPKUSRSummaryAuditTransaction] PRIMARY KEY CLUSTERED 
(
	[USRSummaryAuditTransactionGID] ASC,
	[USRSummaryHistoryGID] ASC,
	[USRSummaryGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__WorkQueue__IsAct__02F31DC9]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__WorkQueue__IsAct__02F31DC9]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__WorkQueue__IsAct__03E74202]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__WorkQueue__IsAct__03E74202]
	AS 1'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USRSummaryExclusions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USRSummaryExclusions](
	[USRSummaryExclusionGID] [datetime] NOT NULL,
	[USRSummaryGID] [datetime] NOT NULL,
	[Description] [datetime] NULL,
 CONSTRAINT [XPKUSRSummaryExclusions] PRIMARY KEY CLUSTERED 
(
	[USRSummaryExclusionGID] ASC,
	[USRSummaryGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Workqueue__IsAct__28EDDE28]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__Workqueue__IsAct__28EDDE28]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Workqueue__IsAct__27F9B9EF]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__Workqueue__IsAct__27F9B9EF]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Employer_IsRateable]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_Employer_IsRateable]
	AS 0'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Employer_IsBlocked]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_Employer_IsBlocked]
	AS 0'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PDSurveyDataSamplingDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PDSurveyDataSamplingDetails](
	[PDSurveyDataSamplingDetailsGID] [datetime] NOT NULL,
	[PolicyEffectiveFromDate] [datetime] NULL,
	[PolicyEffectiveToDate] [datetime] NULL,
	[AccidentYear] [datetime] NULL,
	[DataSamplingStatusLID] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdatedDate] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
 CONSTRAINT [XPKPDSurveyDataSamplingDetails] PRIMARY KEY CLUSTERED 
(
	[PDSurveyDataSamplingDetailsGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Employer_IsActive]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_Employer_IsActive]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Employer__Genera__62A020DA]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__Employer__Genera__62A020DA]
	AS 0'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Insurer_IsActive]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_Insurer_IsActive]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Insurer__IsEligi__507BE13E]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__Insurer__IsEligi__507BE13E]
	AS 0'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USRSummaryHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USRSummaryHistory](
	[USRSummaryHistoryGID] [datetime] NOT NULL,
	[EmployerFID] [datetime] NULL,
	[InsurerFID] [datetime] NULL,
	[PolicyFID] [datetime] NULL,
	[CorrectionNumber] [datetime] NULL,
	[ReportedExposureTotal] [datetime] NULL,
	[ReportedPremiumTotal] [datetime] NULL,
	[AuthorizedExposureTotal] [datetime] NULL,
	[AuthorizedPremiumTotal] [datetime] NULL,
	[ExposureRecordCount] [datetime] NULL,
	[ReportedIndemnityTotal] [datetime] NULL,
	[ReportedMedicalTotal] [datetime] NULL,
	[AuthorizedIndemnityTotal] [datetime] NULL,
	[AuthorizedMedicalTotal] [datetime] NULL,
	[SummaryLossRecordCount] [datetime] NULL,
	[EstimatedExposureIndicator] [datetime] NULL,
	[RiskId] [datetime] NULL,
	[PolicyTypeIdCodeCoverage] [datetime] NULL,
	[PolicyTypeIdCodePlanIndicator] [datetime] NULL,
	[PolicyTypeNonStdIndicator] [datetime] NULL,
	[InsuredName] [datetime] NULL,
	[InsuredAddress] [datetime] NULL,
	[OriginalCorrectionNumber] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [XPKUSRSummaryHistory] PRIMARY KEY CLUSTERED 
(
	[USRSummaryHistoryGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PDSurveyErrorType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PDSurveyErrorType](
	[PDSurveyErrorTypeGID] [datetime] NOT NULL,
	[ErrorCode] [datetime] NULL,
	[ErrorDescription] [datetime] NULL,
	[ValidationRuleStoredprocedure] [datetime] NULL,
	[ErrorMessage] [datetime] NULL,
	[isApprovable] [datetime] NULL,
	[isActive] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdatedDate] [datetime] NULL,
 CONSTRAINT [XPKPDSurveyErrorType] PRIMARY KEY CLUSTERED 
(
	[PDSurveyErrorTypeGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Insurer__Control__226D919A]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__Insurer__Control__226D919A]
	AS 14'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Insurer__CheckCe__58E0795C]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__Insurer__CheckCe__58E0795C]
	AS 0'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PDSurveyExcludedInsurers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PDSurveyExcludedInsurers](
	[PDServerExcludedInsurersGID] [datetime] NOT NULL,
	[InsurerFID] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdatedDate] [datetime] NULL,
 CONSTRAINT [XPKPDSurveyExcludedInsurers] PRIMARY KEY CLUSTERED 
(
	[PDServerExcludedInsurersGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Departmen__IsAct__77568294]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__Departmen__IsAct__77568294]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Policy__IsActive__1022305E]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__Policy__IsActive__1022305E]
	AS 1'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PDSurveyMLReports]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PDSurveyMLReports](
	[PDSurveyMLReportGID] [datetime] NOT NULL,
	[PDSurveyDataFID] [datetime] NOT NULL,
	[ReportNumber] [datetime] NULL,
	[Speciality] [datetime] NULL,
	[Requestor] [datetime] NULL,
	[Cost] [datetime] NULL,
	[ServiceDate] [datetime] NULL,
	[PDSurveyDataSamplingDetailsFID] [datetime] NOT NULL,
 CONSTRAINT [XPKPDSurveyMLReports] PRIMARY KEY CLUSTERED 
(
	[PDSurveyMLReportGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CityAbbre__IsAct__756E3A22]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__CityAbbre__IsAct__756E3A22]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InsurerTPELocationMap_IsActive]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_InsurerTPELocationMap_IsActive]
	AS 1'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Policy](
	[PolicyGID] [datetime] NOT NULL,
	[InsurerFID] [int] NULL,
	[CarrierCodeTransIssueDate] [datetime] NULL,
	[PolicyNumber] [varchar](20) NULL,
	[PolicyNumberTransIssueDate] [datetime] NULL,
	[CertificateNumber] [varchar](20) NULL,
	[CertNumberTransIssueDate] [datetime] NULL,
	[PolicyEffectiveDate] [datetime] NULL,
	[PolicyEffectiveTransIssueDate] [datetime] NULL,
	[PolicyExpirationDate] [datetime] NULL,
	[PolicyExpirationTransIssueDate] [datetime] NULL,
	[CancellationEffectiveDate] [datetime] NULL,
	[PolicyTypeLID] [int] NULL,
	[PolicyTypeReasonLID] [int] NULL,
	[TransactionCode] [datetime] NULL,
	[TransactionIssueDate] [datetime] NULL,
	[TPEFID] [int] NULL,
	[TPETransIssuedDate] [datetime] NULL,
	[EmpLeasingPolicyTypeCodeLID] [int] NULL,
	[EmpLeasingPolicyTypeCodeIssueDate] [datetime] NULL,
	[PolicyTermCodeLID] [int] NULL,
	[PolicyTermCodeTransIssueDate] [datetime] NULL,
	[PolicyChangeEffectiveDate] [datetime] NULL,
	[PolicyChangeExpirationDate] [datetime] NULL,
	[CreatedByTransactionTypeLID] [datetime] NULL,
	[IsRenewable] [bit] NULL,
	[ReInstatementEffectiveDate] [datetime] NULL,
	[CoverageTypeLID] [bit] NULL,
	[EstimatedStateStdPremiumTotal] [int] NULL,
	[IsAuditable] [bit] NULL,
	[ARDFID] [int] NULL,
	[NextARDFID] [datetime] NULL,
	[IsLargeEAP] [bit] NULL,
	[CityAbbreviationFID] [varchar](20) NULL,
	[SplittedCount] [int] NULL,
	[InsurerTPELocationMapFID] [int] NULL,
	[OriginalPolicyNumber] [varchar](20) NULL,
	[PolicyPrefix] [varchar](20) NULL,
	[PolicyBody] [varchar](20) NULL,
	[PolicySuffix] [varchar](20) NULL,
	[MFPolicyNumber] [varchar](20) NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicy] PRIMARY KEY CLUSTERED 
(
	[PolicyGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmployerPolicyMapping_IsOriginal]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_EmployerPolicyMapping_IsOriginal]
	AS 0'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmployerPolicyMapping_IsActive]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_EmployerPolicyMapping_IsActive]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PolicyAdd__IsAct__11165497]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__PolicyAdd__IsAct__11165497]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Configura__IsAct__7969B38F]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__Configura__IsAct__7969B38F]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__InsurerGr__IsAct__01D41107]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__InsurerGr__IsAct__01D41107]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Correspon__IsAct__76625E5B]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__Correspon__IsAct__76625E5B]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DocumentE__IsAct__7A32EF3F]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__DocumentE__IsAct__7A32EF3F]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__LinkedDoc__IsAct__03BC5979]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__LinkedDoc__IsAct__03BC5979]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmployerBAC_OfficeAssigned]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_EmployerBAC_OfficeAssigned]
	AS 0'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmployerBAC_IfAny]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_EmployerBAC_IfAny]
	AS 0'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmployerBAC_USLH]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_EmployerBAC_USLH]
	AS 0'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmployerBAC_IsActive]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_EmployerBAC_IsActive]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EmployerBAC_Lotus]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_EmployerBAC_Lotus]
	AS 0'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__JobClassi__IsAct__02C83540]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__JobClassi__IsAct__02C83540]
	AS 1'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuditRulesConfiguration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AuditRulesConfiguration](
	[AuditRulesConfigurationGID] [datetime] NOT NULL,
	[AuditThreshold] [datetime] NULL,
	[SummaryAuditThreshold] [datetime] NULL,
	[IsActive] [datetime] NULL,
	[ExecutiveOfficersMinPayroll] [datetime] NULL,
	[ExecutiveOfficersMaxPayroll] [datetime] NULL,
	[EffectiveFromDate] [datetime] NULL,
	[EffectiveToDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [XPKAuditRulesConfiguration] PRIMARY KEY CLUSTERED 
(
	[AuditRulesConfigurationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CorrespondenceTemplate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CorrespondenceTemplate](
	[CorrespondenceTemplateGID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateFileName] [varchar](20) NULL,
	[TemplateName] [varchar](20) NULL,
	[IsBulkCorrespondence] [int] NULL,
	[SignatorFID] [datetime] NULL,
	[Subject] [varchar](20) NULL,
	[Keywords] [varchar](20) NULL,
 CONSTRAINT [PK__CorrespondenceTe__2E34E38E] PRIMARY KEY CLUSTERED 
(
	[CorrespondenceTemplateGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyEmployerNames]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyEmployerNames](
	[PolicyEmployerNamesGID] [uniqueidentifier] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[NameCodeTypeLID] [int] NULL,
	[NameLinkIdentifier] [datetime] NULL,
	[NameCategoryLID] [int] NULL,
	[InsuredName] [varchar](20) NULL,
	[NameFEIN] [int] NULL,
	[ContinuationSequenceNumber] [int] NULL,
	[NameLinkCounterIdentifier] [int] NULL,
	[PolicyChangeEffectiveDate] [datetime] NULL,
	[PolicyChangeExpirationDate] [datetime] NULL,
	[IssueDate] [datetime] NULL,
	[IsPrimary] [bit] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyEmployerNames] PRIMARY KEY CLUSTERED 
(
	[PolicyEmployerNamesGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CorrespondenceTransaction]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CorrespondenceTransaction](
	[TransactionGID] [int] IDENTITY(1,1) NOT NULL,
	[EntityTypeLID] [int] NOT NULL,
	[TransactionReferenceFID] [int] NOT NULL,
	[TransactionStatusLID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [XPKCorrespondenceTransaction] PRIMARY KEY CLUSTERED 
(
	[TransactionGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyErrorType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyErrorType](
	[ErrorTypeGID] [datetime] NOT NULL,
	[ErrorCode] [varchar](20) NULL,
	[ErrorCategoryLID] [int] NULL,
	[ErrorDescription] [datetime] NULL,
	[SeverityLID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyErrorType] PRIMARY KEY CLUSTERED 
(
	[ErrorTypeGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CTAPayrollCauseDifference]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CTAPayrollCauseDifference](
	[CTAPayrollCauseDifferenceGID] [datetime] NOT NULL,
	[PayrollCauseLID] [datetime] NULL,
	[CTATestAuditMasterRecordDetailFID] [int] NULL,
 CONSTRAINT [XPKCTAPayrollCauseDifference] PRIMARY KEY CLUSTERED 
(
	[CTAPayrollCauseDifferenceGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyExposureAssociation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyExposureAssociation](
	[PolicyExposureAssociationGID] [int] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[ClassCode] [int] NULL,
	[JobClassificationFID] [int] NULL,
	[ExposureCoverageCodeLID] [int] NULL,
	[ExposurePeriodEffectiveDate] [datetime] NULL,
	[EstimatedExposureAmount] [int] NULL,
	[ClassificationWording] [varchar](20) NULL,
	[JobClassificationSuffixFID] [datetime] NULL,
	[NameLinkIdentifier] [int] NULL,
	[StateCodeLink] [int] NULL,
	[ExposureRecordLink] [int] NULL,
	[NameLinkCounterIdentifier] [int] NULL,
	[PolicyChangeEffectiveDate] [datetime] NULL,
	[PolicyChangeExpirationDate] [datetime] NULL,
	[IssueDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyExposureAssociation] PRIMARY KEY CLUSTERED 
(
	[PolicyExposureAssociationGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DDTSEmailNotification]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DDTSEmailNotification](
	[DDTSEmailNotificationGID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeLID] [int] NULL,
	[StatusLID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK__DDTSEmailNotific__45DA288E] PRIMARY KEY CLUSTERED 
(
	[DDTSEmailNotificationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyGeneral]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyGeneral](
	[PolicyGeneralGID] [datetime] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[PriorPolicyNumber] [char](18) NULL,
	[PriorCertNumber] [varchar](20) NULL,
	[FieldWrapUpCodeLID] [varchar](20) NULL,
	[FieldWrapUpIssueDate] [datetime] NULL,
	[BusinessSegmentIdentifier] [datetime] NULL,
	[BusinessSegmentName] [varchar](20) NULL,
	[BusinessSegmentIDIssueDate] [datetime] NULL,
	[ProducerName] [varchar](20) NULL,
	[ProducerNameIssueDate] [datetime] NULL,
	[LegalNatureOfInsuredLID] [int] NULL,
	[LegalNatureOfInsuredLIDIssueDate] [datetime] NULL,
	[TextotherLegalNatureofInsured] [varchar](20) NULL,
	[TextotherLegalNatureofInsuredIssueDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyGeneral] PRIMARY KEY CLUSTERED 
(
	[PolicyGeneralGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DDTSFTPAddress]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DDTSFTPAddress](
	[DDTSFTPAddressGID] [int] IDENTITY(1,1) NOT NULL,
	[FTPAddress] [varchar](20) NULL,
	[FTPUserName] [varchar](20) NULL,
	[FTPPassWord] [varchar](20) NULL,
	[FTPZipPassword] [varchar](20) NULL,
 CONSTRAINT [PK__DDTSFTPAddress__55D98BEB] PRIMARY KEY CLUSTERED 
(
	[DDTSFTPAddressGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CTATestAuditMasterRecordClaimDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CTATestAuditMasterRecordClaimDetail](
	[CTATestAuditMasterRecordDetailFID] [int] NOT NULL,
	[ClaimNumber] [int] NULL,
	[AccidentDate] [datetime] NULL,
	[ReportedDate] [datetime] NULL,
	[ClassClaimAssignedToByInsurer] [int] NULL,
	[ClassPayrollAssignedToByInsurer] [int] NULL,
	[ClassAssignedByTestAudit] [int] NULL,
	[CauseOfClaimDifferenceLID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [int] NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdateUserFID] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyExmodAssociation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyExmodAssociation](
	[PolicyExmodAssociationGID] [int] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[ReportBureauNumber] [varchar](20) NULL,
	[ExModFactor] [int] NOT NULL,
	[ExmodStatusCodeLID] [int] NULL,
	[ExmodEffectiveDate] [datetime] NULL,
	[IssueDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyExmodAssociation] PRIMARY KEY CLUSTERED 
(
	[PolicyExmodAssociationGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyMatchingLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyMatchingLog](
	[PolicyMatchingLogGID] [int] NOT NULL,
	[PolicyTransactionDetailFID] [datetime] NULL,
	[Message] [varchar](20) NULL,
	[TimeStamp] [datetime] NULL,
	[DataBaseName] [varchar](20) NULL,
	[DBServerName] [varchar](20) NULL,
	[Severity] [varchar](20) NULL,
 CONSTRAINT [XPKPolicyMatchingLog] PRIMARY KEY CLUSTERED 
(
	[PolicyMatchingLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DDTSInspectionReportRequest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DDTSInspectionReportRequest](
	[DDTSInspectionReportRequestGID] [int] NOT NULL,
	[InspectionReportTypeLID] [int] NULL,
	[CreateUserFID] [int] NOT NULL,
	[UpdateUserFID] [int] NULL,
	[StatusLID] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[EmployerGID] [int] NULL,
 CONSTRAINT [XPKDDTSInspectionReportRequest] PRIMARY KEY CLUSTERED 
(
	[DDTSInspectionReportRequestGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyMatchingThresholdConfiguration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyMatchingThresholdConfiguration](
	[PolicyMatchingThresholdConfigurationGID] [int] NOT NULL,
	[MatchTypeLID] [int] NULL,
	[ThresholdValue] [int] NULL,
 CONSTRAINT [XPKPolicyMatchingThresholdConfiguration] PRIMARY KEY CLUSTERED 
(
	[PolicyMatchingThresholdConfigurationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DDTSMetaData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DDTSMetaData](
	[DDTSMetaDataGID] [int] IDENTITY(1,1) NOT NULL,
	[InsurerFID] [datetime] NULL,
	[PolicyFID] [datetime] NULL,
	[EmployerFID] [datetime] NULL,
	[RatingInsurerIssuingofficeMappingFID] [int] NULL,
	[ReleaseDate] [datetime] NULL,
	[StatOffice] [varchar](20) NULL,
	[LetterDate] [datetime] NULL,
	[IsWithDrawn] [int] NULL,
	[NAICGroupFID] [datetime] NULL,
	[EntityFID] [int] NULL,
 CONSTRAINT [PK__DDTSMetaData__42174E6A] PRIMARY KEY CLUSTERED 
(
	[DDTSMetaDataGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DDTSSystemBatch]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DDTSSystemBatch](
	[DDTSBatchGID] [int] IDENTITY(1,1) NOT NULL,
	[DocTypeLID] [int] NULL,
	[StartRunDate] [datetime] NULL,
	[EndRunDate] [datetime] NULL,
	[StatusLID] [int] NULL,
	[ProcessedFileCount] [int] NULL,
	[ErrorFileCount] [int] NULL,
	[ProcessTypeLID] [int] NULL,
 CONSTRAINT [PK__DDTSSystemBatch__53F14379] PRIMARY KEY CLUSTERED 
(
	[DDTSBatchGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyParentChildMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyParentChildMapping](
	[PolicyParentChildMappingGID] [int] NOT NULL,
	[ParentPolicyFID] [int] NULL,
	[ChildPolicyFID] [int] NULL,
	[RelationTypeLID] [int] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyParentChildMapping] PRIMARY KEY CLUSTERED 
(
	[PolicyParentChildMappingGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyRetroPremiumRatingEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyRetroPremiumRatingEndorsement](
	[PolicySubmissionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[PolicyRetroPremiumRatingEndorsementGID] [int] NULL,
 CONSTRAINT [XPKPolicyRetroPremiumRatingEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionEndorsementGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployerBACHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployerBACHistory](
	[EmployerBACHistoryGID] [datetime] NOT NULL,
	[BureauNumber] [varchar](20) NULL,
	[JobClassCode] [varchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateDeleted] [datetime] NULL,
	[OfficeAssigned] [datetime] NULL,
	[IfAny] [datetime] NULL,
	[USLH] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[JobClassCodeSuffix] [varchar](20) NULL,
	[Route] [varchar](20) NULL,
	[Source] [varchar](20) NULL,
	[Comments] [varchar](20) NULL,
	[ClassWording] [varchar](20) NULL,
	[ClassCodeGroup] [varchar](20) NULL,
 CONSTRAINT [XPKEmployerBACHistory] PRIMARY KEY CLUSTERED 
(
	[EmployerBACHistoryGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ErrorType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ErrorType](
	[ErrorTypeGID] [datetime] NOT NULL,
	[ErrorCategoryLID] [int] NULL,
	[ErrorCode] [varchar](20) NULL,
	[ErrorDescription] [datetime] NULL,
	[ErrorTypeFieldLevelLID] [int] NULL,
	[AuditRuleStoredProcedure] [varchar](100) NULL,
	[SeverityLID] [int] NULL,
	[ErrorRecordTypeLID] [datetime] NULL,
	[ReportLevel] [datetime] NULL,
	[IsActive] [bit] NULL,
	[RecordLevel] [datetime] NULL,
	[SupressAtHigherLevel] [datetime] NULL,
	[CanbeApproved] [datetime] NULL,
	[FixErrorStoredProcedure] [datetime] NULL,
	[ReportComparisionOperator] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
 CONSTRAINT [XPKErrorType] PRIMARY KEY CLUSTERED 
(
	[ErrorTypeGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionDetails](
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[SubmissionType] [datetime] NULL,
	[ETRDataProviderEmail] [varchar](20) NULL,
	[ETRDatatypeCode] [varchar](20) NULL,
	[ETRTransVersionId] [varchar](20) NULL,
	[ETRSubmissionTypeCode] [datetime] NULL,
	[ETRDataproviderCode] [int] NULL,
	[ETRDataProviderContactName] [datetime] NULL,
	[ETRPhoneNumber] [varchar](20) NULL,
	[ETRPhoneExtension] [varchar](20) NULL,
	[ETRFaxNumber] [varchar](20) NULL,
	[ETRProcessDate] [datetime] NULL,
	[ETRContactStreet] [varchar](20) NULL,
	[ETRContactCity] [varchar](20) NULL,
	[ETRContactState] [varchar](20) NULL,
	[ETRContactZip] [varchar](20) NULL,
	[ETRDataProviderTypeCode] [datetime] NULL,
	[ETRTPEFEIN] [int] NULL,
	[ETRErrorReportingCode] [datetime] NULL,
	[SCRRecordTotals] [int] NULL,
	[SCRHeaderRecordsTotal] [datetime] NULL,
	[SCREarliestTransactionDate] [datetime] NULL,
	[SCRLatestTransactionDate] [datetime] NULL,
	[TransactionCount] [int] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicySubmissionDetails] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ErrorTypeRoleMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ErrorTypeRoleMapping](
	[ErrorTypeRoleMappingGID] [datetime] NOT NULL,
	[SummaryErrorTypeFID] [datetime] NULL,
	[RoleFID] [datetime] NULL,
	[IsActive] [datetime] NULL,
 CONSTRAINT [XPKErrorTypeRoleMapping] PRIMARY KEY CLUSTERED 
(
	[ErrorTypeRoleMappingGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionEndorsement](
	[PolicySubmissionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[RecordTypeCode] [varchar](20) NULL,
	[EndorsementNumber] [varchar](20) NULL,
	[BureauVersionIdentifier] [varchar](20) NULL,
	[CarrierVersionIdentifier] [varchar](20) NULL,
	[InsuredName] [varchar](20) NULL,
	[EndorsementEffectiveDate] [datetime] NULL,
	[EndorsementExpirationDate] [datetime] NULL,
	[EndorsementSequenceNumber] [int] NULL,
	[EndorsementSerialNumber] [int] NULL,
	[IsActive] [datetime] NULL,
	[CreateUserFID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [int] NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [XPKPolicySubmissionEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionEndorsementGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsurerGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InsurerGroup](
	[InsurerGroupGID] [int] NOT NULL,
	[InsurerGroupCode] [char](4) NULL,
	[InsurerGroupName] [varchar](200) NULL,
	[GroupTypeLID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [int] NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdateUserFID] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKInsurerGroup] PRIMARY KEY CLUSTERED 
(
	[InsurerGroupGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionEndorsementRecord]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionEndorsementRecord](
	[PolicySubmissionEndorsementRecordGID] [datetime] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[EndorsementNumber] [int] NULL,
	[BureauVersionIdentifier] [varchar](20) NULL,
	[CarrierVersionIdentifier] [varchar](20) NULL,
	[PolicyChangeEffectiveDate] [datetime] NULL,
	[PolicyChangeExpirationDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdateDate] [varchar](20) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicySubmissionEndorsementRecord] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionEndorsementRecordGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionClassRateChangeEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionClassRateChangeEndorsement](
	[PolicySubmissionClassRateChangeEndorsementGID] [int] NOT NULL,
	[PolicySubmissionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[ExposurePeriodEffectiveDate] [datetime] NULL,
	[ClassificationCodeRevisionCode] [datetime] NULL,
	[ClassificationCode] [int] NULL,
	[ACTCoverageCode] [int] NULL,
	[EstimatedExposureAmount] [int] NULL,
	[ClassWordingSuffix] [varchar](20) NULL,
	[NameLinkIdentifier] [int] NULL,
	[StateCodeLink] [int] NULL,
	[ExposureRecordLink] [int] NULL,
 CONSTRAINT [XPKPolicySubmissionClassRateChangeEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionClassRateChangeEndorsementGID] ASC,
	[PolicySubmissionEndorsementGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployerStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployerStatus](
	[EmployerStatusGID] [datetime] NOT NULL,
	[EmployerFID] [varchar](20) NULL,
	[EmployerStatusLID] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [XPKEmployerStatus] PRIMARY KEY CLUSTERED 
(
	[EmployerStatusGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobClassGroupMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[JobClassGroupMapping](
	[JobClassGroupMappingGID] [datetime] NOT NULL,
	[JobClassificationGroupFID] [datetime] NULL,
	[JobClassificationFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
 CONSTRAINT [XPKJobClassGroupMapping] PRIMARY KEY CLUSTERED 
(
	[JobClassGroupMappingGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobClassification]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[JobClassification](
	[JobClassificationGID] [int] NOT NULL,
	[JobClassCode] [varchar](20) NOT NULL,
	[JobDescription] [varchar](100) NOT NULL,
	[EffectiveFromDate] [datetime] NOT NULL,
	[EffectiveToDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [int] NOT NULL,
	[LastUpdateUserFID] [int] NOT NULL,
	[LastUpdateDate] [datetime] NULL,
	[ClassCodeTypeLID] [int] NULL,
	[ClassCodeClassificationTypeLID] [datetime] NULL,
	[OfficeAssigned] [datetime] NULL,
	[IsActive] [bit] NULL,
	[ClassCodeSymbol] [char](4) NULL,
	[ManufacturerCodeLID] [int] NULL,
	[IndustryGroupLID] [int] NULL,
	[ExcludedForTestSelection] [bit] NULL,
	[DualWageLID] [int] NULL,
	[CompanionDualWage] [varchar](4) NULL,
	[ThresholdTypeLID] [int] NULL,
	[ThresholdValue] [int] NULL,
	[ThresholdEffectiveFromDate] [datetime] NULL,
	[NAICS] [varchar](6) NULL,
	[RetroHazardGroup] [varchar](2) NULL,
	[ILDG] [varchar](2) NULL,
	[MLDG] [varchar](2) NULL,
	[PerCapitaClass] [bit] NULL,
	[PerRaceClass] [bit] NULL,
	[ExcludedForOriginalSelection] [bit] NULL,
	[CTAReviewRequired] [bit] NULL,
	[ExcludedForRenewalSelection] [bit] NULL,
 CONSTRAINT [XPKJobClassification] PRIMARY KEY CLUSTERED 
(
	[JobClassificationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionTransaction]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionTransaction](
	[PolicySubmissionTransactionGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsFID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[StatusLID] [int] NULL,
	[SubmissionTypeLID] [int] NULL,
	[MatchedEmployerFID] [int] NULL,
	[MatchedSetNumber] [varchar](20) NULL,
	[MatchedPolicyFID] [int] NULL,
	[CreateUserFID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdatedUserFID] [int] NULL,
	[LastUpdateDate] [datetime] NULL,
 CONSTRAINT [XPKPolicySubmissionTransaction] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionTransactionGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsFID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobClassificationSuffix]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[JobClassificationSuffix](
	[JobClassificationSuffixGID] [int] NOT NULL,
	[JobClassificationFID] [int] NOT NULL,
	[Suffix] [varchar](5) NOT NULL,
	[Description] [varchar](255) NULL,
	[EffectiveFromDate] [datetime] NULL,
	[EffectiveToDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [int] NULL,
	[LastUpdateUserFID] [int] NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKJobClassificationSuffix] PRIMARY KEY CLUSTERED 
(
	[JobClassificationSuffixGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobScheduleConfiguration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[JobScheduleConfiguration](
	[JobScheduleConfigurationGID] [datetime] NOT NULL,
	[JobName] [datetime] NULL,
	[JobDescription] [datetime] NULL,
	[JobType] [datetime] NULL,
	[ParentJobFID] [datetime] NULL,
	[ScheduledDateTime] [datetime] NULL,
	[IsActive] [datetime] NULL,
 CONSTRAINT [XPKJobScheduleConfiguration] PRIMARY KEY CLUSTERED 
(
	[JobScheduleConfigurationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionTransName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionTransName](
	[PolicySubmissionTransNameGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[NameCodeType] [int] NULL,
	[NameLinkIdentifier] [datetime] NULL,
	[EmployerClientCompanyCode] [char](1) NULL,
	[InsuredName] [varchar](20) NULL,
	[NameFEIN] [int] NULL,
	[ContinuationSequenceNumber] [int] NULL,
	[NameLinkCounterIdentifier] [int] NULL,
	[PolicyChangeEffectiveDate] [datetime] NULL,
	[PolicyChangeExpirationDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicySubmissionTransName] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionTransNameGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LatestBNSetPolicy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LatestBNSetPolicy](
	[LatestBNSetPolicyGID] [datetime] NOT NULL,
	[EmployerFID] [int] NULL,
	[SetNumber] [varchar](20) NULL,
	[PolicyFID] [int] NULL,
 CONSTRAINT [XPKLatestBNSetPolicy] PRIMARY KEY CLUSTERED 
(
	[LatestBNSetPolicyGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionTransStatePremium]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionTransStatePremium](
	[PolicySubmissionTransStatePremiumGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[StateAddDeleteCode] [varchar](20) NULL,
	[ReportBureauNumber] [varchar](20) NULL,
	[ReportedCarrierCode] [int] NULL,
	[CalifCarrierCode] [datetime] NULL,
	[ExModFactor] [int] NOT NULL,
	[ExmodStatusCode] [int] NULL,
	[EstimatedStateStdPremiumTotal] [int] NULL,
	[ExmodEffectiveDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicySubmissionTransStatePremium] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionTransStatePremiumGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LateLargeUSRCriteria]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LateLargeUSRCriteria](
	[LateLargeUSRCriteriaGID] [datetime] NOT NULL,
	[FinalPremium] [datetime] NULL,
	[PolicyInceptionStartDate] [datetime] NULL,
	[PolicyInceptionEndDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [XPKLateLargeUSRCriteria] PRIMARY KEY CLUSTERED 
(
	[LateLargeUSRCriteriaGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_JobScheduleConfigurationDetail_IsStartJob]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_JobScheduleConfigurationDetail_IsStartJob]
	AS 0'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Submission_Log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Submission_Log](
	[SubmissionLogGID] [int] NOT NULL,
	[FileName] [char](50) NULL,
	[ReceivedDate] [datetime] NULL,
	[ProcessedDate] [datetime] NULL,
	[SubmissionID] [int] NULL,
	[IsActive] [bit] NULL,
	[ReportedSubmissionType] [char](1) NULL,
	[RejectionComments] [char](60) NULL,
	[SystemSubmissionStatusLID] [int] NULL,
 CONSTRAINT [XPKSubmission_Log] PRIMARY KEY CLUSTERED 
(
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatchedBNSet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MatchedBNSet](
	[MachedBNSetGID] [datetime] NOT NULL,
	[PolicyTransactionDetailFID] [int] NULL,
	[EmployerFID] [int] NULL,
	[SetNumber] [varchar](20) NULL,
	[TotalPoints] [int] NULL,
	[PolicyFID] [int] NULL,
	[ExceedsThreshold] [bit] NULL,
 CONSTRAINT [XPKMatchedBNSet] PRIMARY KEY CLUSTERED 
(
	[MachedBNSetGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Lookup__IsActive__05A4A1EB]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__Lookup__IsActive__05A4A1EB]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__LookupTyp__IsAct__08810E96]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__LookupTyp__IsAct__08810E96]
	AS 1'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SummaryActions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SummaryActions](
	[SummaryActionGID] [datetime] NOT NULL,
	[JobScheduleConfigurationDetailGID] [datetime] NOT NULL,
	[JobScheduleConfigurationGID] [datetime] NOT NULL,
	[SummaryActionDescription] [datetime] NULL,
	[SummaryActionTypeLID] [datetime] NULL,
	[SummaryActionStatusLID] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [datetime] NULL,
 CONSTRAINT [XPKSummaryActions] PRIMARY KEY CLUSTERED 
(
	[SummaryActionGID] ASC,
	[JobScheduleConfigurationDetailGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__WorkContr__IsAct__270595B6]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF__WorkContr__IsAct__270595B6]
	AS 1'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_DDTSDocuments_Resend]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[DF_DDTSDocuments_Resend]
	AS 0'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SummaryRollupDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SummaryRollupDetails](
	[SummaryRollupDetailGID] [datetime] NOT NULL,
	[JobScheduleConfigurationDetailGID] [datetime] NOT NULL,
	[JobScheduleConfigurationGID] [datetime] NOT NULL,
	[SummaryActionGID] [datetime] NOT NULL,
	[PolicyYear] [datetime] NULL,
	[SummaryReportLevel] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
 CONSTRAINT [XPKSummaryRollupDetails] PRIMARY KEY CLUSTERED 
(
	[SummaryRollupDetailGID] ASC,
	[JobScheduleConfigurationDetailGID] ASC,
	[JobScheduleConfigurationGID] ASC,
	[SummaryActionGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MQIncomingMessageProcessErrors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MQIncomingMessageProcessErrors](
	[MQIncomingMessageProcessErrorsID] [int] NOT NULL,
	[MQIncomingMessageLogFID] [int] NULL,
	[MQMessageErrorTypeFID] [int] NULL,
	[ErrorDescription] [varchar](20) NULL,
	[CreateUserFID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateUserFID] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [XPKMQIncomingMessageProcessErrors] PRIMARY KEY CLUSTERED 
(
	[MQIncomingMessageProcessErrorsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PDSurveyDataErrors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PDSurveyDataErrors](
	[PDSurveyDataErrorGID] [datetime] NOT NULL,
	[PDSurveyErrorTypeFID] [datetime] NOT NULL,
	[PDSurveyDataFID] [datetime] NOT NULL,
	[isApproved] [datetime] NULL,
	[PDSurveyDataSamplingDetailsFID] [datetime] NOT NULL,
 CONSTRAINT [XPKPDSurveyDataErrors] PRIMARY KEY CLUSTERED 
(
	[PDSurveyDataErrorGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PDSurveyDisputeMechanismMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PDSurveyDisputeMechanismMapping](
	[PDSurveyDisputeMechanismMappingGID] [datetime] NOT NULL,
	[PDSurveyDataFID] [datetime] NOT NULL,
	[DisputeMechanismLID] [datetime] NULL,
	[PDSurveyDataSamplingDetailsFID] [datetime] NOT NULL,
 CONSTRAINT [XPKPDSurveyDisputeMechanismMapping] PRIMARY KEY CLUSTERED 
(
	[PDSurveyDisputeMechanismMappingGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PDSurveyData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PDSurveyData](
	[PDSurveyDataGID] [datetime] NOT NULL,
	[PDSurveyDataSamplingDetailsFID] [datetime] NOT NULL,
	[SurveyID] [datetime] NULL,
	[SurveyYear] [datetime] NULL,
	[SurveyStatusLID] [datetime] NULL,
	[SurveyLevel] [datetime] NULL,
	[LossFID] [datetime] NULL,
	[ClaimNumber] [datetime] NULL,
	[AccidentDate] [datetime] NULL,
	[InsurerFID] [datetime] NULL,
	[NAICGroupFID] [datetime] NULL,
	[PolicyFID] [datetime] NULL,
	[InjuryType] [datetime] NULL,
	[ClaimStatusLID] [datetime] NULL,
	[ReportedDate] [datetime] NULL,
	[isResolved] [datetime] NULL,
	[ResolvedDate] [datetime] NULL,
	[ResolutionMethodLID] [datetime] NULL,
	[PDRBeforeAppo] [datetime] NULL,
	[PDRAfterAppo] [datetime] NULL,
	[Indemnity] [datetime] NULL,
	[Medical] [datetime] NULL,
	[IsRepByAttorney] [datetime] NULL,
	[WorkersLegalCost] [datetime] NULL,
	[InsurerLegalCost] [datetime] NULL,
	[ArbitrationFees] [datetime] NULL,
	[OtherAllocated] [datetime] NULL,
	[EducationVoucherIncurred] [datetime] NULL,
	[OtherVRIncurred] [datetime] NULL,
	[isPhysicianPreDes] [datetime] NULL,
	[TD] [datetime] NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[WCABCode] [datetime] NULL,
	[WeeksPD1] [datetime] NULL,
	[WeeksPD2] [datetime] NULL,
	[WeeksPD3] [datetime] NULL,
	[EmploymentStatusLID] [datetime] NULL,
	[ZipCode] [datetime] NULL,
	[ACTComments] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdatedDate] [datetime] NULL,
	[SuppressionState] [datetime] NULL,
 CONSTRAINT [XPKPDSurveyData] PRIMARY KEY CLUSTERED 
(
	[PDSurveyDataGID] ASC,
	[PDSurveyDataSamplingDetailsFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USRSummaryAuditError]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USRSummaryAuditError](
	[USRSummaryAuditErrorGID] [datetime] NOT NULL,
	[USRSummaryHistoryGID] [datetime] NOT NULL,
	[USRID] [datetime] NULL,
	[ErrorCode] [datetime] NULL,
	[ErrorRecordFID] [datetime] NULL,
	[ComparisonValue] [datetime] NULL,
	[IsActive] [datetime] NULL,
	[ErrorTypeFID] [datetime] NULL,
	[ReportLevel] [datetime] NULL,
	[CorrectionNumber] [datetime] NULL,
	[IsApproved] [datetime] NULL,
	[IsUSLH] [datetime] NULL,
	[SeverityTypeLID] [datetime] NULL,
 CONSTRAINT [XPKUSRSummaryAuditError] PRIMARY KEY CLUSTERED 
(
	[USRSummaryAuditErrorGID] ASC,
	[USRSummaryHistoryGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USRSummaryTotal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USRSummaryTotal](
	[USRSummaryTotalGID] [datetime] NOT NULL,
	[USRSummaryGID] [datetime] NOT NULL,
	[USRSummaryHistoryGID] [datetime] NOT NULL,
	[ReportedTotalExposureNonPerCapita] [datetime] NULL,
	[TotalExposureNonPerCapita] [datetime] NULL,
	[ReportedTotalIncurredIndemnity] [datetime] NULL,
	[TotalIncurredIndemnity] [datetime] NULL,
	[ReportedTotalIncurredMedical] [datetime] NULL,
	[TotalIncurredMedical] [datetime] NULL,
	[SubjectPurePremium] [datetime] NULL,
	[ModifiedPurePremium] [datetime] NULL,
	[ReportedFinalPremium] [datetime] NULL,
	[FinalPremium] [datetime] NULL,
	[Code9897PurePremium] [datetime] NULL,
	[Code0990PurePremium] [datetime] NULL,
	[LossRecordCount] [datetime] NULL,
	[ExposureRecordCount] [datetime] NULL,
	[OriginalReportLevel] [datetime] NULL,
	[OriginalCorrectionNumber] [datetime] NULL,
	[CorrectionNumber] [datetime] NULL,
 CONSTRAINT [XPKUSRSummaryTotal] PRIMARY KEY CLUSTERED 
(
	[USRSummaryTotalGID] ASC,
	[USRSummaryGID] ASC,
	[USRSummaryHistoryGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USRSummaryLossHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USRSummaryLossHistory](
	[USRSummaryLossHistoryGID] [datetime] NOT NULL,
	[USRSummaryHistoryGID] [datetime] NOT NULL,
	[ClaimNumber] [datetime] NULL,
	[InjuryTypeLID] [datetime] NULL,
	[JobClassificationFID] [datetime] NULL,
	[IndemnityLossAmount] [datetime] NULL,
	[MedicalLossAmount] [datetime] NULL,
	[AccidentDate] [datetime] NULL,
	[FraudulentIndicatorLID] [datetime] NULL,
	[StateJurisdication] [datetime] NULL,
	[AdjustExpenseAmount] [datetime] NULL,
	[SSNNumber] [datetime] NULL,
	[PaidIndemnity] [datetime] NULL,
	[PaidMedical] [datetime] NULL,
	[LossTypeLID] [datetime] NULL,
	[RecoveryTypeLID] [datetime] NULL,
	[CoverageTypeLID] [datetime] NULL,
	[SettlementTypeLID] [datetime] NULL,
	[VoucherIndicator] [datetime] NULL,
	[VoucherTotal] [datetime] NULL,
	[WeeklyWages] [datetime] NULL,
	[PercentageDisability] [datetime] NULL,
	[GrossIncurred] [datetime] NULL,
	[LossID] [datetime] NULL,
	[ClaimStatusLID] [datetime] NULL,
	[CatastropheNumber] [datetime] NULL,
	[CoverageExceptionLID] [datetime] NULL,
	[ReportLevel] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[ClaimCount] [datetime] NULL,
	[CorrectionNumber] [datetime] NULL,
	[IsActive] [datetime] NULL,
	[ACTTypeLID] [datetime] NULL,
	[OccupationDescription] [datetime] NULL,
	[ClaimType] [datetime] NULL,
	[InjuryPartCode] [datetime] NULL,
	[InjuryCauseCode] [datetime] NULL,
 CONSTRAINT [XPKUSRSummaryLossHistory] PRIMARY KEY CLUSTERED 
(
	[USRSummaryLossHistoryGID] ASC,
	[USRSummaryHistoryGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyAddress]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyAddress](
	[PolicyAddressGID] [datetime] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[TypeofAddressLID] [int] NULL,
	[ForeignAddressIndicator] [varchar](20) NULL,
	[AddressStructureCodeLID] [int] NULL,
	[StreetAddress] [datetime] NULL,
	[CityName] [datetime] NULL,
	[StateCode] [datetime] NULL,
	[PostalZipCode] [datetime] NULL,
	[AddressFreeForm] [varchar](20) NULL,
	[NameLinkIdentifier] [varchar](20) NULL,
	[StateCodeLink] [varchar](20) NULL,
	[ExposureLocationLink] [datetime] NULL,
	[GeographicArea] [char](1) NULL,
	[CountryCode] [int] NULL,
	[NameLinkCounterIdentifier] [datetime] NULL,
	[PolicyChangeEffectiveDate] [datetime] NULL,
	[PolicyChangeExpirationDate] [datetime] NULL,
	[IssueDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyAddress] PRIMARY KEY CLUSTERED 
(
	[PolicyAddressGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyAddressHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyAddressHistory](
	[PolicyAddressGID] [datetime] NOT NULL,
	[PolicyEmployerNamesGID] [datetime] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[PolicyTransactionDetailFID] [int] NULL,
	[ChangeTypeLID] [varchar](20) NULL,
	[ProcessedDate] [datetime] NULL,
	[TypeofAddressLID] [int] NULL,
	[ForeignAddressIndicator] [varchar](20) NULL,
	[AddressStructureCodeLID] [int] NULL,
	[StreetAddress] [datetime] NULL,
	[CityName] [datetime] NULL,
	[StateCode] [datetime] NULL,
	[PostalZipCode] [datetime] NULL,
	[AddressFreeForm] [varchar](20) NULL,
	[NameLinkIdentifier] [varchar](20) NULL,
	[StateCodeLink] [varchar](20) NULL,
	[ExposureLocationLink] [datetime] NULL,
	[GeographicArea] [char](1) NULL,
	[CountryCode] [int] NULL,
	[NameLinkCounterIdentifier] [datetime] NULL,
	[PolicyChangeEffectiveDate] [datetime] NULL,
	[PolicyChangeExpirationDate] [datetime] NULL,
	[IssueDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [XPKPolicyAddressHistory] PRIMARY KEY CLUSTERED 
(
	[PolicyAddressGID] ASC,
	[PolicyEmployerNamesGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyAuditLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyAuditLog](
	[PolicyTransactionsGID] [varchar](20) NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[PolicySubmissionTransactionFID] [int] NULL,
	[CreatedbyTransactionTypeLID] [int] NULL,
	[TransactionIssueDate] [datetime] NULL,
	[TransactionRecordLID] [varchar](20) NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
 CONSTRAINT [XPKPolicyAuditLog] PRIMARY KEY CLUSTERED 
(
	[PolicyTransactionsGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployerPolicyMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployerPolicyMapping](
	[EmployerPolicyMappingGID] [datetime] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[SetNumber] [datetime] NULL,
	[BNRelationTypeLID] [int] NULL,
	[IsOriginal] [bit] NULL,
	[OwnershipChangeDate] [datetime] NULL,
	[LinkedEmployerPolicyMappingFid] [int] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[EmployerFID] [int] NULL,
 CONSTRAINT [XPKEmployerPolicyMapping] PRIMARY KEY CLUSTERED 
(
	[EmployerPolicyMappingGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyNameHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyNameHistory](
	[PolicyNameHistoryGID] [uniqueidentifier] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[PolicyTransactionDetailFID] [int] NULL,
	[ChangeTypeLID] [varchar](20) NULL,
	[ProcessedDate] [datetime] NULL,
	[NameCodeTypeLID] [int] NULL,
	[NameLinkIdentifier] [datetime] NULL,
	[NameCategoryLID] [int] NULL,
	[InsuredName] [varchar](20) NULL,
	[NameFEIN] [int] NULL,
	[ContinuationSequenceNumber] [int] NULL,
	[NameLinkCounterIdentifier] [int] NULL,
	[PolicyChangeEffectiveDate] [datetime] NULL,
	[PolicyChangeExpirationDate] [datetime] NULL,
	[IssueDate] [datetime] NULL,
	[IsPrimary] [bit] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [XPKPolicyNameHistory] PRIMARY KEY CLUSTERED 
(
	[PolicyNameHistoryGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyHistory](
	[PolicyHistoryGID] [datetime] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[PolicyTransactionDetailFID] [int] NULL,
	[ChangeTypeLID] [varchar](20) NULL,
	[ProcessedDate] [datetime] NULL,
	[InsurerFID] [int] NULL,
	[CarrierCodeTransIssueDate] [datetime] NULL,
	[PolicyNumber] [varchar](20) NULL,
	[PolicyNumberTransIssueDate] [datetime] NULL,
	[CertNumber] [varchar](20) NULL,
	[CertNumberTransIssueDate] [datetime] NULL,
	[PolicyEffectiveDate] [datetime] NULL,
	[PolicyEffectiveTransIssueDate] [datetime] NULL,
	[PolicyExpirationDate] [datetime] NULL,
	[PolicyExpirationTransIssueDate] [datetime] NULL,
	[CancellationEffectiveDate] [datetime] NULL,
	[PolicyTypeLID] [int] NULL,
	[PolicyTypeReasonLID] [int] NULL,
	[TransactionCode] [datetime] NULL,
	[TransactionIssueDate] [datetime] NULL,
	[TPEFID] [int] NULL,
	[TPETransIssuedDate] [datetime] NULL,
	[EmpLeasingPolicyTypeCodeLID] [int] NULL,
	[EmpLeasingPolicyTypeCodeIssueDate] [datetime] NULL,
	[PolicyTermCodeLID] [int] NULL,
	[PolicyTermCodeTransIssueDate] [datetime] NULL,
	[PolicyChangeEffectiveDate] [datetime] NULL,
	[PolicyChangeExpirationDate] [datetime] NULL,
	[CreatedByTransactionTypeLID] [datetime] NULL,
	[IsRenewable] [bit] NULL,
	[ReInstatementEffectiveDate] [datetime] NULL,
	[CoverageTypeLID] [bit] NULL,
	[EstimatedStateStdPremiumTotal] [int] NULL,
	[IsAuditable] [bit] NULL,
	[ARDFID] [int] NULL,
	[NextARDFID] [datetime] NULL,
	[IsLargeEAP] [bit] NULL,
	[CityAbbreviationFID] [varchar](20) NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [XPKPolicyHistory] PRIMARY KEY CLUSTERED 
(
	[PolicyHistoryGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyGeneralHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyGeneralHistory](
	[PolicyGeneralHistoryGID] [datetime] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[PolicyTransactionDetailFID] [int] NULL,
	[ChangeTypeLID] [varchar](20) NULL,
	[ProcessedDate] [datetime] NULL,
	[PriorPolicyNumber] [char](18) NULL,
	[PriorCertNumber] [varchar](20) NULL,
	[FieldWrapUpCodeLID] [varchar](20) NULL,
	[FieldWrapUpIssueDate] [datetime] NULL,
	[BusinessSegmentIdentifier] [datetime] NULL,
	[BusinessSegmentName] [varchar](20) NULL,
	[BusinessSegmentIDIssueDate] [datetime] NULL,
	[ProducerName] [varchar](20) NULL,
	[ProducerNameIssueDate] [datetime] NULL,
	[LegalNatureOfInsuredLID] [int] NULL,
	[LegalNatureOfInsuredLIDIssueDate] [datetime] NULL,
	[TextotherLegalNatureofInsured] [varchar](20) NULL,
	[TextotherLegalNatureofInsuredIssueDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [XPKPolicyGeneralHistory] PRIMARY KEY CLUSTERED 
(
	[PolicyGeneralHistoryGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyFormsHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyFormsHistory](
	[PolicyFormsHistoryGID] [int] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[PolicyTransactionDetailFID] [int] NULL,
	[ChangeTypeLID] [varchar](20) NULL,
	[ProcessedDate] [datetime] NULL,
	[TransactionIssueDate] [datetime] NULL,
	[EndorsementNumber] [int] NULL,
	[BureauVersionIdentifier] [int] NULL,
	[CarrierVersionIdentifier] [int] NULL,
	[ChangeEffectiveDate] [datetime] NULL,
	[ChangeExpirationDate] [datetime] NULL,
	[FormFID] [int] NULL,
	[HasExtraDetails] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
 CONSTRAINT [XPKPolicyFormsHistory] PRIMARY KEY CLUSTERED 
(
	[PolicyFormsHistoryGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyExmodHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyExmodHistory](
	[PolicyExmodAssociationGID] [int] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[PolicyTransactionDetailFID] [int] NULL,
	[ChangeTypeLID] [varchar](20) NULL,
	[ProcessedDate] [datetime] NULL,
	[ReportBureauNumber] [varchar](20) NULL,
	[ExModFactor] [int] NOT NULL,
	[ExmodStatusCodeLID] [int] NULL,
	[ExmodEffectiveDate] [datetime] NULL,
	[IssueDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [XPKPolicyExmodHistory] PRIMARY KEY CLUSTERED 
(
	[PolicyExmodAssociationGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyEndorsement](
	[PolicyEndorsementGID] [int] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[RecordTypeLId] [varchar](20) NULL,
	[EndorsementNumber] [varchar](20) NULL,
	[BureauVersionID] [varchar](20) NULL,
	[CarrierVersionID] [varchar](20) NULL,
	[StateCodeLID] [int] NULL,
	[FormFID] [int] NULL,
	[InsuredName] [varchar](20) NULL,
	[PolicyChangeEffectiveDate] [datetime] NULL,
	[PolicyChangeExpirationDate] [datetime] NULL,
	[EndorsementSequenceNumber] [int] NULL,
	[EndorsementSerialNumber] [int] NULL,
	[HasVariableText] [bit] NULL,
	[HasExtraDetails] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicyEndorsementGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyClassificationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyClassificationHistory](
	[PolicyClassificationHistoryGID] [int] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[PolicyTransactionDetailFID] [int] NULL,
	[ChangeTypeLID] [varchar](20) NULL,
	[ProcessedDate] [datetime] NULL,
	[ClassCode] [int] NULL,
	[JobClassificationFID] [int] NULL,
	[ExposureCoverageCodeLID] [int] NULL,
	[ExposurePeriodEffectiveDate] [datetime] NULL,
	[EstimatedExposureAmount] [int] NULL,
	[ClassificationWording] [varchar](20) NULL,
	[JobClassificationSuffixFID] [datetime] NULL,
	[NameLinkIdentifier] [int] NULL,
	[StateCodeLink] [int] NULL,
	[ExposureRecordLink] [int] NULL,
	[NameLinkCounterIdentifier] [int] NULL,
	[PolicyChangeEffectiveDate] [datetime] NULL,
	[PolicyChangeExpirationDate] [datetime] NULL,
	[IssueDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [XPKPolicyClassificationHistory] PRIMARY KEY CLUSTERED 
(
	[PolicyClassificationHistoryGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LSRToCTACorrespondenceTransaction]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LSRToCTACorrespondenceTransaction](
	[PolicyFID] [datetime] NOT NULL,
	[TestAuditPolicyFID] [int] NOT NULL,
	[EmployerGID] [int] NULL,
 CONSTRAINT [PK_LSRToCTACorrespondanceTransaction] PRIMARY KEY CLUSTERED 
(
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyNameAddrMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyNameAddrMapping](
	[PolicyNameAddrMappingGID] [int] NOT NULL,
	[PolicyEmployerNamesGID] [uniqueidentifier] NOT NULL,
	[PolicyAddressGID] [datetime] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyNameAddrMapping] PRIMARY KEY CLUSTERED 
(
	[PolicyNameAddrMappingGID] ASC,
	[PolicyEmployerNamesGID] ASC,
	[PolicyAddressGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyAddrExposureMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyAddrExposureMapping](
	[PolicyAddrExposureMappingGID] [int] NOT NULL,
	[PolicyAddressGID] [datetime] NOT NULL,
	[PolicyExposureAssociationGID] [int] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyAddrExposureMapping] PRIMARY KEY CLUSTERED 
(
	[PolicyAddrExposureMappingGID] ASC,
	[PolicyAddressGID] ASC,
	[PolicyExposureAssociationGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyCAFAlternateCoverageInfoEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyCAFAlternateCoverageInfoEndorsement](
	[PolicyCAFAlternateCoverageInfoEndorsementGID] [int] NOT NULL,
	[PolicyEndorsementGID] [int] NOT NULL,
	[PolicyCAF10EndorsementGID] [int] NOT NULL,
	[PolicyCAF11EndorsementGID] [int] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[AlternateCoverageInsuredName] [varchar](60) NULL,
	[AlternateCoverageInsurerCode] [int] NULL,
	[AlternateCoverageInsurerName] [varchar](30) NULL,
	[AlternateCoveragePolicyNumber] [varchar](18) NULL,
	[AlternateCoverageCertNumber] [int] NULL,
	[AlternateCoveragePolicyInceptionDate] [datetime] NULL,
	[AlternateCoveragePolicyExpirationDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyCAFAlternateCoverageInfoEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicyCAFAlternateCoverageInfoEndorsementGID] ASC,
	[PolicyEndorsementGID] ASC,
	[PolicyCAF10EndorsementGID] ASC,
	[PolicyCAF11EndorsementGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CorrespondenceTemplateEntity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CorrespondenceTemplateEntity](
	[CorrespondenceTemplateEntityGID] [int] IDENTITY(1,1) NOT NULL,
	[CorrespondenceTemplateFID] [int] NULL,
	[EntityTypeLID] [int] NOT NULL,
 CONSTRAINT [PK__CorrespondenceTe__593F3D24] PRIMARY KEY CLUSTERED 
(
	[CorrespondenceTemplateEntityGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyEmployeeLeasingAddress]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyEmployeeLeasingAddress](
	[PolicyEmployeeLeasingAddressGID] [int] NOT NULL,
	[PolicyEndorsementGID] [int] NOT NULL,
	[PolicyEmployeeLeasingNamesGID] [int] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[Address] [varchar](20) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](20) NULL,
	[Zip] [datetime] NULL,
	[AddressFreeForm] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyEmployeeLeasingAddress] PRIMARY KEY CLUSTERED 
(
	[PolicyEmployeeLeasingAddressGID] ASC,
	[PolicyEndorsementGID] ASC,
	[PolicyEmployeeLeasingNamesGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyMultipurposeTextEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyMultipurposeTextEndorsement](
	[PolicyMultipurposeTextEndorsementGID] [int] NOT NULL,
	[PolicyEndorsementGID] [int] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[EndorsementLine] [varchar](80) NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyMultipurposeTextEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicyMultipurposeTextEndorsementGID] ASC,
	[PolicyEndorsementGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyEmployeeLeasingNames]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyEmployeeLeasingNames](
	[PolicyEmployeeLeasingNamesGID] [int] NOT NULL,
	[PolicyEndorsementGID] [int] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[Name] [varchar](20) NULL,
	[SequenceNumber] [int] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyEmployeeLeasingNames] PRIMARY KEY CLUSTERED 
(
	[PolicyEmployeeLeasingNamesGID] ASC,
	[PolicyEndorsementGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyCAF10Endorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyCAF10Endorsement](
	[PolicyCAF10EndorsementGID] [int] NOT NULL,
	[PolicyEndorsementGID] [int] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[TitletenWording] [varchar](73) NULL,
	[EmployeeName] [varchar](30) NULL,
	[OperationName] [varchar](30) NULL,
	[OperationTitle] [varchar](20) NULL,
	[LocationAddress] [varchar](60) NULL,
	[ClassificationSuffix] [int] NULL,
	[ClassificationWording] [varchar](30) NULL,
	[ClassificationCode] [varchar](20) NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyCAF10Endorsement] PRIMARY KEY CLUSTERED 
(
	[PolicyCAF10EndorsementGID] ASC,
	[PolicyEndorsementGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyExclusionEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyExclusionEndorsement](
	[PolicyExclusionEndorsementGID] [int] NOT NULL,
	[PolicyEndorsementGID] [int] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[NameExcluded] [varchar](20) NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CreateUserFID] [datetime] NULL,
 CONSTRAINT [XPKPolicyExclusionEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicyExclusionEndorsementGID] ASC,
	[PolicyEndorsementGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyGroupEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyGroupEndorsement](
	[PolicyGroupEndorsementGID] [int] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[PolicyEndorsementGID] [int] NOT NULL,
	[GroupName] [varchar](80) NULL,
	[GroupInsuranceEffectiveDate] [datetime] NULL,
	[GroupInsuranceExpirationDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyGroupEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicyGroupEndorsementGID] ASC,
	[PolicyFID] ASC,
	[PolicyEndorsementGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyCAF11Endorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicyCAF11Endorsement](
	[PolicyCAF11EndorsementGID] [int] NOT NULL,
	[PolicyEndorsementGID] [int] NOT NULL,
	[PolicyFID] [datetime] NOT NULL,
	[ExcludedOperationDescription] [varchar](80) NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicyCAF11Endorsement] PRIMARY KEY CLUSTERED 
(
	[PolicyCAF11EndorsementGID] ASC,
	[PolicyEndorsementGID] ASC,
	[PolicyFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DDTSStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DDTSStatus](
	[DDTSStatusGID] [int] IDENTITY(1,1) NOT NULL,
	[DDTSDocFID] [int] NOT NULL,
	[DeliveryStatusLID] [int] NULL,
	[ResendAttempts] [int] NOT NULL,
	[DeliveryNotes] [varchar](20) NULL,
	[DeliveryDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[DDTSBatchFID] [int] NULL,
 CONSTRAINT [XPKDDTSStatus] PRIMARY KEY CLUSTERED 
(
	[DDTSStatusGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DDTSEmailNotificationDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DDTSEmailNotificationDetails](
	[DDTSEmailNotificationDetailsGID] [int] IDENTITY(1,1) NOT NULL,
	[DDTSEmailNotificationFID] [int] NULL,
 CONSTRAINT [PK__DDTSEmailNotific__4C87261D] PRIMARY KEY CLUSTERED 
(
	[DDTSEmailNotificationDetailsGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DDTSInspectionReportDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DDTSInspectionReportDetails](
	[DDTSInspectionReportDetailsGID] [int] NOT NULL,
	[DDTSInspectionReportRequestFID] [int] NULL,
	[DocSharepointGUID] [varchar](40) NULL,
	[CreateUserFID] [int] NULL,
	[UpdateUserFID] [int] NULL,
	[StatusLID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [XPKDDTSInspectionReportDetails] PRIMARY KEY CLUSTERED 
(
	[DDTSInspectionReportDetailsGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DDTSInspectionReportAnnualManualClassInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DDTSInspectionReportAnnualManualClassInfo](
	[DDTSInspectionReportAnnualManualClassInfoID] [int] NOT NULL,
	[DDTSInspectionReportRequestFID] [int] NULL,
	[EffectiveDate] [datetime] NULL,
	[CreateUserFID] [int] NULL,
	[UpdateUserFID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [int] NULL,
	[JobClassificationGID] [int] NOT NULL,
 CONSTRAINT [XPKDDTSInspectionReportAnnualManualClassInfo] PRIMARY KEY CLUSTERED 
(
	[DDTSInspectionReportAnnualManualClassInfoID] ASC,
	[JobClassificationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DDTSInspectionReportRecipients]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DDTSInspectionReportRecipients](
	[DDTSInspectionReportRecipientsGID] [int] NOT NULL,
	[DDTSInspectionReportRequestFID] [int] NULL,
	[CreateUserFID] [int] NOT NULL,
	[UpdateUserFID] [datetime] NOT NULL,
	[DocSharepointGUID] [varchar](40) NULL,
	[InsReptCoverLetterTypeLID] [int] NOT NULL,
	[StatusLID] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[EmployerGID] [int] NULL,
	[InsurerGID] [int] NULL,
 CONSTRAINT [XPKDDTSInspectionReportRecipients] PRIMARY KEY CLUSTERED 
(
	[DDTSInspectionReportRecipientsGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkQueue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkQueue](
	[WorkQueueGID] [datetime] NOT NULL,
	[DepartmentGID] [int] NOT NULL,
	[WorkDescription] [datetime] NULL,
	[WorkStatusLID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[WorkTypeLID] [datetime] NULL,
	[ErrorTypeFID] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[PrimaryEntityFID] [datetime] NULL,
	[WorkSubTypeLID] [datetime] NULL,
	[PrimaryEntityTypeLID] [datetime] NULL,
	[SecondaryEntityTypeLID] [datetime] NULL,
	[SecondaryEntityFID] [datetime] NULL,
	[OwnerFID] [datetime] NULL,
	[ErrorRecordTypeLID] [datetime] NULL,
	[WorkStateLID] [datetime] NULL,
	[ErrorRecordFID] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[EmployerFID] [datetime] NULL,
	[ComparisionValue] [datetime] NULL,
	[LastActionLevel] [datetime] NULL,
	[DiaryDueDate] [datetime] NULL,
	[ApprovalReason] [datetime] NULL,
	[NextActionLevel] [datetime] NULL,
	[ActionLevelOneLID] [datetime] NULL,
	[ActionLevelTwoLID] [datetime] NULL,
	[ActionLevelThreeLID] [datetime] NULL,
	[IsActive] [datetime] NULL,
	[AssignedByUserFID] [datetime] NULL,
	[CSTicketNumber] [datetime] NULL,
	[HasNotes] [datetime] NULL,
	[HasLinkedDocument] [datetime] NULL,
	[DepartmentFID] [datetime] NULL,
	[IsBookMarked] [datetime] NULL,
	[ReportLevel] [datetime] NULL,
	[InsurerFID] [datetime] NULL,
	[TPEFID] [datetime] NULL,
	[IsLastAction] [datetime] NULL,
	[AdditionalInfo] [datetime] NULL,
	[SeverityTypeLID] [datetime] NULL,
	[HasDiaryRun] [datetime] NULL,
	[Route] [datetime] NULL,
	[EmployerGID] [int] NULL,
 CONSTRAINT [XPKWorkQueue] PRIMARY KEY CLUSTERED 
(
	[WorkQueueGID] ASC,
	[DepartmentGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionErrors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionErrors](
	[PolicySubmissionErrorsGID] [int] NOT NULL,
	[ErrorTypeGID] [datetime] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[RecordTypeCode] [varchar](20) NULL,
	[FieldName] [datetime] NULL,
	[FieldValue] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicySubmissionErrors] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionErrorsGID] ASC,
	[ErrorTypeGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionTransactionDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionTransactionDetail](
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[TransFileContent] [varbinary](1) NULL,
	[LNKCarrierCode] [varchar](20) NULL,
	[InsurerFID] [datetime] NULL,
	[LNKPolicyNumber] [varchar](20) NULL,
	[LNKCertNumber] [varchar](20) NULL,
	[LNKPolicyEffectiveDate] [datetime] NULL,
	[LNKTransactionIssueDate] [datetime] NULL,
	[LNKTransactionCode] [datetime] NULL,
	[TransactionStatusLID] [int] NULL,
	[TransReferenceNo] [int] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicySubmissionTransactionDetail] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsurerGroupAssociation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InsurerGroupAssociation](
	[InsurerGroupAssociationGID] [int] IDENTITY(1,1) NOT NULL,
	[InsurerGroupFID] [int] NULL,
	[InsurerFID] [int] NULL,
	[CreateUserFID] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastUpdateUserFID] [datetime] NOT NULL,
	[LastUpdateDate] [datetime] NOT NULL,
	[EffectiveFromDate] [datetime] NULL,
	[EffectiveToDate] [datetime] NULL,
 CONSTRAINT [PK__InsurerGroupAsso__20C1E124] PRIMARY KEY CLUSTERED 
(
	[InsurerGroupAssociationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionAddressChangeEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionAddressChangeEndorsement](
	[PolicySubmissionAddressChangeEndorsementGID] [int] NOT NULL,
	[PolicySubmissionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[RevisedAddressRecordTypeCode] [int] NULL,
	[RevisedAddressStructureCode] [int] NULL,
	[RevisedAddressStreet] [datetime] NULL,
	[RevisedAddressCity] [varchar](20) NULL,
	[RevisedAddressState] [varchar](20) NULL,
	[RevisedAddressZip] [varchar](20) NULL,
	[RevisedNameLinkIdentifier] [int] NULL,
	[RevisedStateCodeLink] [int] NULL,
	[RevisedExposureLinkforLocationCode] [int] NULL,
	[RevisedGeographicArea] [varchar](20) NULL,
	[RevisedCountryCode] [varchar](20) NULL,
	[AddressRevisionCode] [varchar](20) NULL,
	[PolicyChangeEffectiveDate] [datetime] NULL,
 CONSTRAINT [XPKPolicySubmissionAddressChangeEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionAddressChangeEndorsementGID] ASC,
	[PolicySubmissionEndorsementGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionCAFAltCovgInfoEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionCAFAltCovgInfoEndorsement](
	[PolicySubmissionCAFAltCovgInfoEndorsementGID] [int] NOT NULL,
	[PolicySubmissionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[AlternateCoverageInsuredName] [varchar](60) NULL,
	[AlternateCoverageInsurerCode] [int] NULL,
	[AlternateCoverageInsurerName] [varchar](30) NULL,
	[AlternateCoveragePolicyNumber] [varchar](18) NULL,
	[AlternateCoverageCertNumber] [int] NULL,
	[AlternateCoveragePolicyInceptionDate] [datetime] NULL,
	[AlternateCoveragePolicyExpirationDate] [datetime] NULL,
 CONSTRAINT [XPKPolicySubmissionCAFAltCovgInfoEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionCAFAltCovgInfoEndorsementGID] ASC,
	[PolicySubmissionEndorsementGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionCAF11Endorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionCAF11Endorsement](
	[PolicySubmissionCAF11EndorsementGID] [int] NOT NULL,
	[PolicySubmissionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[ExcludedOperationDescription] [varchar](80) NULL,
 CONSTRAINT [XPKPolicySubmissionCAF11Endorsement] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionCAF11EndorsementGID] ASC,
	[PolicySubmissionEndorsementGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionCAF10Endorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionCAF10Endorsement](
	[PolicySubmissionCAF10EndorsementGID] [int] NOT NULL,
	[PolicySubmissionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[TitletenWording] [varchar](73) NULL,
	[EmployeeName] [varchar](30) NULL,
	[OperationName] [varchar](30) NULL,
	[OperationTitle] [varchar](20) NULL,
	[LocationAddress] [varchar](60) NULL,
	[ClassificationCode] [int] NULL,
	[ClassificationSuffix] [int] NULL,
	[ClassificationWording] [varchar](30) NULL,
 CONSTRAINT [XPKPolicySubmissionCAF10Endorsement] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionCAF10EndorsementGID] ASC,
	[PolicySubmissionEndorsementGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionDataElementChangeEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionDataElementChangeEndorsement](
	[PolicySubmissionDataElementChangeEndorsementGID] [int] NOT NULL,
	[PolicySubmissionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[RevisedCarrierCode] [int] NULL,
	[RevisedPolicyNumber] [varchar](18) NULL,
	[RevisedPolicyEffectiveDate] [datetime] NULL,
	[RevisedPolicyExpirationDate] [datetime] NULL,
	[RevisedLegalNatureofInsuredCode] [varchar](20) NULL,
	[RevisedTextOtherLegalNatureofInsuredCode] [varchar](20) NULL,
	[RevisedEndorsementNumber] [int] NULL,
	[RevisedBureauVersionID] [varchar](20) NULL,
	[RevisedCarrierIdentifier] [varchar](20) NULL,
	[RevisedProducerName] [varchar](20) NULL,
	[RevisedBureauNumber] [varchar](20) NULL,
	[RevisedCode] [int] NULL,
 CONSTRAINT [XPKPolicySubmissionDataElementChangeEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionDataElementChangeEndorsementGID] ASC,
	[PolicySubmissionEndorsementGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionEmployeeLeasingEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionEmployeeLeasingEndorsement](
	[PolicySubmissionEmployeeLeasingEndorsementGID] [int] NOT NULL,
	[PolicySubmissionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[Name] [varchar](79) NULL,
	[StreetAddress] [varchar](101) NULL,
	[CityName] [varchar](20) NULL,
	[StateCode] [varchar](20) NULL,
	[PostalZipCode] [varchar](20) NULL,
 CONSTRAINT [XPKPolicySubmissionEmployeeLeasingEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionEmployeeLeasingEndorsementGID] ASC,
	[PolicySubmissionEndorsementGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionPeriodEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionPeriodEndorsement](
	[PolicySubmissionPeriodEndorsementGID] [int] NOT NULL,
	[PolicySubmissionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[EffectiveDateFirstPolicyPeriod] [datetime] NULL,
	[ExpirationDateFirstPolicyPeriod] [datetime] NULL,
	[EffectiveDateSecondPolicyPeriod] [datetime] NULL,
	[ExpirationDateSecondPolicyPeriod] [datetime] NULL,
	[EffectiveDateThirdPolicyPeriod] [datetime] NULL,
	[ExpirationDateThirdPolicyPeriod] [datetime] NULL,
 CONSTRAINT [XPKPolicySubmissionPeriodEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionPeriodEndorsementGID] ASC,
	[PolicySubmissionEndorsementGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionGroupEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionGroupEndorsement](
	[PolicySubmissionGroupEndorsementGID] [int] NOT NULL,
	[PolicySubmissionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[GroupName] [varchar](80) NULL,
	[GroupInsuranceEffectiveDate] [datetime] NULL,
	[GroupInsuranceExpirationDate] [datetime] NULL,
 CONSTRAINT [XPKPolicySubmissionGroupEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionGroupEndorsementGID] ASC,
	[PolicySubmissionEndorsementGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionMultipurposeTextEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionMultipurposeTextEndorsement](
	[PolicySubmissionMultipurposeTextEndorsementGID] [int] NOT NULL,
	[PolicySubmissionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[EndorsementLine] [varchar](80) NULL,
 CONSTRAINT [XPKPolicySubmissionMultipurposeTextEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionMultipurposeTextEndorsementGID] ASC,
	[PolicySubmissionEndorsementGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionNameChangeEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionNameChangeEndorsement](
	[PolicySubmissionNameChangeEndorsementGID] [int] NOT NULL,
	[PolicySubmissionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[RevisedNameRecordTypeCode] [int] NULL,
	[RevisedNameLinkIdentifier] [int] NULL,
	[RevisedInsuredName] [varchar](90) NULL,
	[RevisedFEIN] [varchar](9) NULL,
	[RevisedContinuationSequenceNumber] [int] NULL,
	[RevisedLegalNatureofEntityCode] [int] NULL,
	[RevisedTextOtherLegalNatureEntityCode] [varchar](20) NULL,
	[RevisedStateCode] [varchar](20) NULL,
	[RevisedStateUnemploymentNumber] [int] NULL,
	[NameRevisionCode] [varchar](20) NULL,
	[RevisedEmployerClientCode] [varchar](20) NULL,
	[PolicyChangeEffectiveDate] [datetime] NULL,
	[RevisedNameLinkCounterIdentifier] [varchar](2) NULL,
 CONSTRAINT [XPKPolicySubmissionNameChangeEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionNameChangeEndorsementGID] ASC,
	[PolicySubmissionEndorsementGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionModChangeEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionModChangeEndorsement](
	[PolicySubmissionModChangeEndorsementGID] [int] NOT NULL,
	[PolicySubmissionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[ModificationEffectiveDate] [datetime] NULL,
	[ExmodFactor] [int] NULL,
	[ExmodStatusCode] [int] NULL,
 CONSTRAINT [XPKPolicySubmissionModChangeEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionModChangeEndorsementGID] ASC,
	[PolicySubmissionEndorsementGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionExclusionEndorsement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionExclusionEndorsement](
	[PolicySubmissionExclusionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionEndorsementGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[NameExcluded] [varchar](20) NULL,
 CONSTRAINT [XPKPolicySubmissionExclusionEndorsement] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionExclusionEndorsementGID] ASC,
	[PolicySubmissionEndorsementGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CTAInsurerGroupConfiguration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CTAInsurerGroupConfiguration](
	[CTAInsurerGroupConfigurationGID] [int] NOT NULL,
	[InsurerGroupFID] [int] NULL,
	[FrequencyForTestAuditSelection] [int] NULL,
	[MaximumOutOfStatePercentage] [int] NULL,
	[MaximumFinalPremium] [int] NULL,
	[TestAuditTypeLID] [int] NULL,
	[TestAuditSelectionTypeLID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [int] NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdateUserFID] [int] NULL,
 CONSTRAINT [XPKCTAInsurerGroupConfiguration] PRIMARY KEY CLUSTERED 
(
	[CTAInsurerGroupConfigurationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CTATestAuditSelectionData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CTATestAuditSelectionData](
	[CTATestAuditSelectionDataGID] [int] NOT NULL,
	[InsurerGroupQuotaFID] [int] NULL,
	[RunDate] [datetime] NULL,
	[RunQuota] [int] NULL,
	[TargetQuota] [int] NULL,
	[TestAuditPoliciesSelected] [int] NULL,
	[ShortFall] [int] NULL,
	[OutOfStatePolicies] [int] NULL,
	[ManualSelectionPolicyCount] [int] NULL,
	[TestAuditSelectionTypeLID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [int] NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastUpdateUserFID] [int] NULL,
 CONSTRAINT [XPKCTATestAuditSelectionData] PRIMARY KEY CLUSTERED 
(
	[CTATestAuditSelectionDataGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USRSummaryTotalsByClass]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USRSummaryTotalsByClass](
	[USRSummaryTotalByClassGID] [datetime] NOT NULL,
	[USRSummaryGID] [datetime] NOT NULL,
	[ExposureAmountTotal] [datetime] NULL,
	[LossAmountTotal] [datetime] NULL,
	[IndemnityCount] [datetime] NULL,
	[PurePremium] [datetime] NULL,
	[JobClassificationGID] [int] NOT NULL,
 CONSTRAINT [XPKUSRSummaryTotalsByClass] PRIMARY KEY CLUSTERED 
(
	[USRSummaryTotalByClassGID] ASC,
	[USRSummaryGID] ASC,
	[JobClassificationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USRSummaryExposure]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USRSummaryExposure](
	[USRSummaryExposureGID] [datetime] NOT NULL,
	[USRSummaryGID] [datetime] NOT NULL,
	[EffectiveDate] [datetime] NULL,
	[ExposureAmount] [datetime] NULL,
	[AuthorizedPremium] [datetime] NULL,
	[ReportedPremium] [datetime] NULL,
	[ExposureID] [datetime] NULL,
	[IsActive] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsEdited] [datetime] NULL,
	[BatchDate] [datetime] NULL,
	[ExposureACTCoverageCodeLID] [datetime] NULL,
	[CorrectionNumber] [datetime] NULL,
	[JobClassificationCode] [datetime] NULL,
	[OriginalReportLevel] [datetime] NULL,
	[OriginalCorrectionNumber] [datetime] NULL,
	[JobClassificationGID] [int] NOT NULL,
 CONSTRAINT [XPKUSRSummaryExposure] PRIMARY KEY CLUSTERED 
(
	[USRSummaryExposureGID] ASC,
	[USRSummaryGID] ASC,
	[JobClassificationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USRSummaryLoss]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USRSummaryLoss](
	[USRSummaryLossGID] [datetime] NOT NULL,
	[USRSummaryGID] [datetime] NOT NULL,
	[ClaimNumber] [datetime] NULL,
	[InjuryTypeLID] [datetime] NULL,
	[IndemnityLossAmount] [datetime] NULL,
	[MedicalLossAmount] [datetime] NULL,
	[AccidentDate] [datetime] NULL,
	[FraudulentIndicatorLID] [datetime] NULL,
	[StateJurisdication] [datetime] NULL,
	[AdjustExpenseAmount] [datetime] NULL,
	[SSNNumber] [datetime] NULL,
	[PaidIndemnity] [datetime] NULL,
	[PaidMedical] [datetime] NULL,
	[LossTypeLID] [datetime] NULL,
	[RecoveryTypeLID] [datetime] NULL,
	[CoverageTypeLID] [datetime] NULL,
	[SettlementTypeLID] [datetime] NULL,
	[VoucherIndicator] [datetime] NULL,
	[VoucherTotal] [datetime] NULL,
	[WeeklyWages] [datetime] NULL,
	[PercentageDisability] [datetime] NULL,
	[GrossIncurred] [datetime] NULL,
	[LossID] [datetime] NULL,
	[ClaimStatusLID] [datetime] NULL,
	[CatastropheNumber] [datetime] NULL,
	[CoverageExceptionLID] [datetime] NULL,
	[ReportLevel] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[ClaimCount] [datetime] NULL,
	[CorrectionNumber] [datetime] NULL,
	[IsActive] [datetime] NULL,
	[ACTTypeLID] [datetime] NULL,
	[OccupationDescription] [datetime] NULL,
	[ClaimType] [datetime] NULL,
	[InjuryPartCode] [datetime] NULL,
	[InjuryNatureCode] [datetime] NULL,
	[InjuryCauseCode] [datetime] NULL,
	[BatchDate] [datetime] NULL,
	[IsEdited] [datetime] NULL,
	[JobClassificationCode] [datetime] NULL,
	[OriginalReportLevel] [datetime] NULL,
	[OriginalCorrectionNumber] [datetime] NULL,
	[JobClassificationGID] [int] NOT NULL,
 CONSTRAINT [XPKUSRSummaryLoss] PRIMARY KEY CLUSTERED 
(
	[USRSummaryLossGID] ASC,
	[USRSummaryGID] ASC,
	[JobClassificationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USRSummaryExposureHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USRSummaryExposureHistory](
	[USRSummaryExposureHistoryGID] [datetime] NOT NULL,
	[USRSummaryHistoryGID] [datetime] NOT NULL,
	[EffectiveDate] [datetime] NULL,
	[ExposureAmount] [datetime] NULL,
	[ReportedPremium] [datetime] NULL,
	[ExposureID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CorrectionNumber] [datetime] NULL,
	[ExposureACTCoverageCodeLID] [datetime] NULL,
	[IsActive] [datetime] NULL,
	[JobClassificationGID] [int] NOT NULL,
 CONSTRAINT [XPKUSRSummaryExposureHistory] PRIMARY KEY CLUSTERED 
(
	[USRSummaryExposureHistoryGID] ASC,
	[USRSummaryHistoryGID] ASC,
	[JobClassificationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobClassificationOperation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[JobClassificationOperation](
	[JobClassificationOperationGID] [datetime] NOT NULL,
	[JobClassificationFID] [int] NULL,
	[JobOperationLID] [datetime] NULL,
	[EffectiveFromDate] [datetime] NULL,
	[EffectiveToDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [int] NULL,
	[LastUpdateUserFID] [int] NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKJobClassificationOperation] PRIMARY KEY CLUSTERED 
(
	[JobClassificationOperationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobClassificationGroupMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[JobClassificationGroupMapping](
	[JobClassificationGroupMappingGID] [int] NOT NULL,
	[JobClassificationGroupFID] [datetime] NULL,
	[JobClassificationFID] [int] NULL,
 CONSTRAINT [XPKJobClassificationGroupMapping] PRIMARY KEY CLUSTERED 
(
	[JobClassificationGroupMappingGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobClassificationRatingConfiguration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[JobClassificationRatingConfiguration](
	[JobClassificationRatingConfigurationGID] [int] NOT NULL,
	[JobClassificationFID] [int] NULL,
	[DRatio] [numeric](10, 2) NULL,
	[ExpectedLossRate] [numeric](10, 2) NULL,
	[CreateUserFID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [int] NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[HourlyWageThreshold] [int] NULL,
	[EffectiveFromDate] [datetime] NULL,
	[EffectiveToDate] [datetime] NULL,
 CONSTRAINT [XPKJobClassificationRatingConfiguration] PRIMARY KEY CLUSTERED 
(
	[JobClassificationRatingConfigurationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StateWideSummary]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StateWideSummary](
	[StatewideSummaryGID] [datetime] NOT NULL,
	[EffectivePolicyYear] [datetime] NULL,
	[StatewidePayrollTotal] [datetime] NULL,
	[StatewideLossTotal] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [datetime] NULL,
	[JobClassificationFID] [datetime] NULL,
	[PurePremium] [datetime] NULL,
	[JobClassificationGID] [int] NOT NULL,
 CONSTRAINT [XPKStateWideSummary] PRIMARY KEY CLUSTERED 
(
	[StatewideSummaryGID] ASC,
	[JobClassificationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionTransExposure]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionTransExposure](
	[PolicySubmissionTransExposureGID] [int] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[ClassorStatCode] [int] NULL,
	[ClassWordingSuffix] [varchar](2) NULL,
	[ExposureCoverageCode] [int] NULL,
	[ExposurePeriodEffectiveDate] [datetime] NULL,
	[EstimatedExposureAmount] [int] NULL,
	[NameLinkIdentifier] [int] NULL,
	[StateCodeLink] [int] NULL,
	[ExposureRecordLink] [int] NULL,
	[NameLinkCounterIdentifier] [int] NULL,
	[PolicyChangeEffectiveDate] [datetime] NULL,
	[PolicyChangeExpirationDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicySubmissionTransExposure] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionTransExposureGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionTransCancelReinstate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionTransCancelReinstate](
	[PolicySubmissionTransCancelReinstateGID] [datetime] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[CancelReinstateIDCode] [int] NULL,
	[InsuredName] [varchar](20) NULL,
	[InsuredAddress] [varchar](20) NULL,
	[CancelReinstateTransactionSequencenumber] [int] NULL,
	[CorrespondingCancellationEffectiveDate] [datetime] NULL,
	[CancelReinstateEffectiveDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicySubmissionTransCancelReinstate] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionTransCancelReinstateGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicySubmissionTransAddress]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PolicySubmissionTransAddress](
	[PolicySubmissionTransAddressGID] [datetime] NOT NULL,
	[PolicySubmissionTransactionDetailGID] [uniqueidentifier] NOT NULL,
	[PolicySubmissionDetailsGID] [datetime] NOT NULL,
	[SubmissionLogGID] [int] NOT NULL,
	[TypeofAddress] [int] NULL,
	[ForeignAddressIndicator] [varchar](20) NULL,
	[AddressStructureCode] [int] NULL,
	[StreetAddress] [datetime] NULL,
	[CityName] [datetime] NULL,
	[StateCode] [datetime] NULL,
	[PostalZipCode] [datetime] NULL,
	[AddressFreeForm] [varchar](20) NULL,
	[NameLinkIdentifier] [varchar](20) NULL,
	[StateCodeLink] [varchar](20) NULL,
	[ExposureLocationLink] [datetime] NULL,
	[GeographicArea] [char](1) NULL,
	[CountryCode] [int] NULL,
	[NameLinkCounterIdentifier] [datetime] NULL,
	[PolicyChangeEffectiveDate] [datetime] NULL,
	[PolicyChangeExpirationDate] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [varchar](20) NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [XPKPolicySubmissionTransAddress] PRIMARY KEY CLUSTERED 
(
	[PolicySubmissionTransAddressGID] ASC,
	[PolicySubmissionTransactionDetailGID] ASC,
	[PolicySubmissionDetailsGID] ASC,
	[SubmissionLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JobScheduleConfigurationDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[JobScheduleConfigurationDetail](
	[JobScheduleConfigurationDetailGID] [datetime] NOT NULL,
	[JobScheduleConfigurationGID] [datetime] NOT NULL,
	[JobStatusLID] [datetime] NULL,
	[CanRun] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[LastRunDate] [datetime] NULL,
 CONSTRAINT [XPKJobScheduleConfigurationDetail] PRIMARY KEY CLUSTERED 
(
	[JobScheduleConfigurationDetailGID] ASC,
	[JobScheduleConfigurationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LateLargeUSRsSnapShot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LateLargeUSRsSnapShot](
	[LateLargeUSRsSnapShotGID] [datetime] NOT NULL,
	[LateLargeUSRCriteriaGID] [datetime] NOT NULL,
	[PolicyFID] [datetime] NULL,
	[EmployerFID] [datetime] NULL,
	[InsurerFID] [datetime] NULL,
	[PriorYearTotalPayrollAmount] [datetime] NULL,
	[PriorYearFinalPremiumAmount] [datetime] NULL,
	[CreateUserFID] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [datetime] NULL,
 CONSTRAINT [XPKLateLargeUSRsSnapShot] PRIMARY KEY CLUSTERED 
(
	[LateLargeUSRsSnapShotGID] ASC,
	[LateLargeUSRCriteriaGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatchedBNSetDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MatchedBNSetDetails](
	[MatchedBNSetDetailsGID] [int] NOT NULL,
	[MachedBNSetGID] [datetime] NOT NULL,
	[MatchTypeLID] [int] NULL,
	[PointsEarned] [int] NULL,
 CONSTRAINT [XPKMatchedBNSetDetails] PRIMARY KEY CLUSTERED 
(
	[MatchedBNSetDetailsGID] ASC,
	[MachedBNSetGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DDTSDocuments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DDTSDocuments](
	[DDTSDocGID] [int] IDENTITY(1,1) NOT NULL,
	[DDTSMetaDataFID] [int] NULL,
	[DDTSFTPFID] [int] NULL,
	[CreateuserFid] [datetime] NULL,
	[UpdatedUserFID] [datetime] NOT NULL,
	[DocTypeLID] [int] NOT NULL,
	[DocDeliveryTypeLID] [int] NOT NULL,
	[DDTSDocumentID] [int] NULL,
	[DDTSDocRepositoryLID] [int] NOT NULL,
	[DocSharepointGUID] [varchar](20) NULL,
	[DocFilePath] [varchar](20) NULL,
	[DB2PDFDocGID] [varchar](20) NULL,
	[DocumentName] [varchar](20) NULL,
	[Resend] [int] NOT NULL,
	[SortOrderParamValue] [varchar](20) NULL,
	[CreateDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [int] NOT NULL,
	[NumberOfCopies] [int] NOT NULL,
 CONSTRAINT [PK__DDTSDocuments__4C94DCDD] PRIMARY KEY CLUSTERED 
(
	[DDTSDocGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF_DDTSDocuments_Resend]', @objname=N'[dbo].[DDTSDocuments].[Resend]' , @futureonly='futureonly'
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF_DDTSDocuments_NumberOfCopies]', @objname=N'[dbo].[DDTSDocuments].[NumberOfCopies]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DDTSPrinterDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DDTSPrinterDetails](
	[DDTSPrinterGID] [int] IDENTITY(1,1) NOT NULL,
	[PrinterName] [varchar](20) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserFID] [int] NOT NULL,
	[LastUpdateUserFID] [int] NOT NULL,
	[LastUpdateDate] [datetime] NOT NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [XPKDDTSPrinterDetails] PRIMARY KEY CLUSTERED 
(
	[DDTSPrinterGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF_DDTSPrinter_ACTIVE]', @objname=N'[dbo].[DDTSPrinterDetails].[IsActive]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkqueueLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkqueueLog](
	[WorkqueueLogGID] [int] IDENTITY(1,1) NOT NULL,
	[LogUserFID] [datetime] NULL,
	[ActionTypeLID] [int] NULL,
	[PreviousValue] [varchar](20) NULL,
	[NewValue] [varchar](20) NULL,
	[LogDateTime] [datetime] NULL,
	[LogMessage] [varchar](20) NULL,
	[IsActive] [int] NULL,
	[WorkQueueGID] [datetime] NULL,
	[DepartmentGID] [int] NULL,
 CONSTRAINT [PK__WorkqueueLog__6E01572D] PRIMARY KEY CLUSTERED 
(
	[WorkqueueLogGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF__Workqueue__IsAct__28EDDE28]', @objname=N'[dbo].[WorkqueueLog].[IsActive]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkQueueComparisionFields]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkQueueComparisionFields](
	[WorkQueueComparisionFieldsGID] [int] IDENTITY(1,1) NOT NULL,
	[ComparisionValue] [varchar](20) NULL,
	[Operator] [varchar](20) NULL,
	[IsActive] [int] NOT NULL,
	[WorkQueueGID] [datetime] NULL,
	[DepartmentGID] [int] NULL,
 CONSTRAINT [PK__WorkQueueComparisionFields__68487DD7] PRIMARY KEY CLUSTERED 
(
	[WorkQueueComparisionFieldsGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF__WorkQueue__IsAct__02F31DC9]', @objname=N'[dbo].[WorkQueueComparisionFields].[IsActive]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkQueueAction]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkQueueAction](
	[WorkQueueActionGID] [int] IDENTITY(1,1) NOT NULL,
	[ActionLevel] [int] NULL,
	[AuditActionTypeLID] [int] NULL,
	[IsActive] [int] NOT NULL,
	[DateCompletion] [datetime] NULL,
	[WorkQueueGID] [datetime] NULL,
	[DepartmentGID] [int] NULL,
 CONSTRAINT [PK__WorkQueueAction__68487DD7] PRIMARY KEY CLUSTERED 
(
	[WorkQueueActionGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF__WorkQueue__IsAct__03E74202]', @objname=N'[dbo].[WorkQueueAction].[IsActive]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employer](
	[EmployerGID] [int] IDENTITY(1,1) NOT NULL,
	[CreateUserFID] [datetime] NOT NULL,
	[LastUpdateUserFID] [datetime] NOT NULL,
	[PolicyAddressFID] [datetime] NULL,
	[DraftIndicatorRequestorFID] [datetime] NULL,
	[Name] [varchar](20) NOT NULL,
	[IsRateable] [int] NOT NULL,
	[IsBlocked] [int] NOT NULL,
	[BureauNumber] [varchar](20) NOT NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [int] NULL,
	[DoNotInspect] [int] NULL,
	[FEINCode] [varchar](20) NULL,
	[OriginalInspectionSelectionDate] [datetime] NULL,
	[LastInspectionDate] [datetime] NULL,
	[GenerateRatingAsDraft] [int] NOT NULL,
	[DraftReasonLID] [int] NULL,
	[DraftDate] [datetime] NULL,
	[SortBureauNumber] [varchar](20) NULL,
 CONSTRAINT [PK__Employer__0F975522] PRIMARY KEY CLUSTERED 
(
	[EmployerGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF_Employer_IsRateable]', @objname=N'[dbo].[Employer].[IsRateable]' , @futureonly='futureonly'
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF_Employer_IsBlocked]', @objname=N'[dbo].[Employer].[IsBlocked]' , @futureonly='futureonly'
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF_Employer_IsActive]', @objname=N'[dbo].[Employer].[IsActive]' , @futureonly='futureonly'
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF__Employer__Genera__62A020DA]', @objname=N'[dbo].[Employer].[GenerateRatingAsDraft]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Insurer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Insurer](
	[InsurerGID] [int] IDENTITY(1,1) NOT NULL,
	[NAICGroupFID] [datetime] NULL,
	[CreateUserFID] [datetime] NOT NULL,
	[LastUpdateUserFID] [datetime] NOT NULL,
	[InsurerName] [varchar](20) NOT NULL,
	[IsIndependent] [int] NOT NULL,
	[EffectiveFromDate] [datetime] NULL,
	[EffectiveToDate] [datetime] NULL,
	[MemberTypeLID] [int] NOT NULL,
	[MemberStatusLID] [int] NOT NULL,
	[MNFRMInsurerName] [varchar](20) NULL,
	[InsurerCode] [varchar](20) NOT NULL,
	[CDICode] [varchar](20) NULL,
	[NCCICode] [varchar](20) NULL,
	[ClosedInsolventStatusLID] [int] NULL,
	[NAICCode] [varchar](20) NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastUpdateDate] [datetime] NOT NULL,
	[IsActive] [int] NOT NULL,
	[IsEligibleforFTP] [int] NULL,
	[MemberSinceDate] [datetime] NULL,
	[ControlListNotificationTimeInMonth] [int] NULL,
	[SubGroup] [int] NULL,
	[CheckCertificateNumber] [int] NOT NULL,
 CONSTRAINT [PK__Insurer__1CF15040] PRIMARY KEY CLUSTERED 
(
	[InsurerGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF_Insurer_IsActive]', @objname=N'[dbo].[Insurer].[IsActive]' , @futureonly='futureonly'
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF__Insurer__IsEligi__507BE13E]', @objname=N'[dbo].[Insurer].[IsEligibleforFTP]' , @futureonly='futureonly'
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF__Insurer__Control__226D919A]', @objname=N'[dbo].[Insurer].[ControlListNotificationTimeInMonth]' , @futureonly='futureonly'
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF__Insurer__CheckCe__58E0795C]', @objname=N'[dbo].[Insurer].[CheckCertificateNumber]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Department](
	[DepartmentGID] [int] IDENTITY(1,1) NOT NULL,
	[CreateUserFID] [datetime] NOT NULL,
	[LastUpdateUserFID] [datetime] NOT NULL,
	[DepartmentName] [varchar](20) NOT NULL,
	[DepartmentTypeLID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [int] NULL,
	[DepartmentConst] [varchar](20) NULL,
 CONSTRAINT [PK__Department__060DEAE8] PRIMARY KEY CLUSTERED 
(
	[DepartmentGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF__Departmen__IsAct__77568294]', @objname=N'[dbo].[Department].[IsActive]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsurerTPELocationMap]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InsurerTPELocationMap](
	[InsurerTPELocationMapGID] [int] IDENTITY(1,1) NOT NULL,
	[InsurerFID] [datetime] NULL,
	[TPEFID] [datetime] NULL,
	[FTPAddressFID] [datetime] NULL,
	[StateAbbreviationFID] [datetime] NULL,
	[CreateUserFID] [datetime] NOT NULL,
	[LastUpdateUserFID] [datetime] NOT NULL,
	[MailCode] [varchar](20) NULL,
	[Lot] [int] NULL,
	[SelectionTag] [varchar](20) NULL,
	[InBoundFTP] [varchar](20) NULL,
	[OutBoundFTP] [varchar](20) NULL,
	[EffectiveFromDate] [datetime] NULL,
	[EffectiveToDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastUpdateDate] [datetime] NOT NULL,
	[OfficeTypeLID] [int] NULL,
	[Telephone] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](20) NULL,
	[Address1] [varchar](20) NULL,
	[Address2] [varchar](20) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](20) NULL,
	[ZIP] [varchar](20) NULL,
	[Country] [varchar](20) NULL,
	[IsActive] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[Note] [varchar](20) NULL,
	[LocationName] [varchar](20) NOT NULL,
	[Telephone2] [varchar](20) NULL,
 CONSTRAINT [PK__InsurerTPELocati__22AA2996] PRIMARY KEY CLUSTERED 
(
	[InsurerTPELocationMapGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF_InsurerTPELocationMap_IsActive]', @objname=N'[dbo].[InsurerTPELocationMap].[IsActive]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Configuration]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Configuration](
	[KeyName] [varchar](50) NOT NULL,
	[KeyValue] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL
) ON [PRIMARY]
END
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF__Configura__IsAct__7969B38F]', @objname=N'[dbo].[Configuration].[IsActive]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsurerGroupQuota]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InsurerGroupQuota](
	[InsurerGroupQuotaGID] [int] IDENTITY(1,1) NOT NULL,
	[InsurerGroupFID] [int] NULL,
	[AnnualQuota] [int] NULL,
	[Year] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserFID] [int] NOT NULL,
	[LastUpdateUserFID] [datetime] NOT NULL,
	[LastUpdateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__InsurerGroupQuot__7A92169B] PRIMARY KEY CLUSTERED 
(
	[InsurerGroupQuotaGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF__InsurerGr__IsAct__01D41107]', @objname=N'[dbo].[InsurerGroupQuota].[IsActive]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Correspondence]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Correspondence](
	[CorrespondenceGID] [int] IDENTITY(1,1) NOT NULL,
	[CorrespondenceTemplateFID] [int] NULL,
	[CreateUserFID] [datetime] NOT NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateUserFID] [int] NOT NULL,
	[LastUpdateDate] [datetime] NULL,
	[CommunicationSentDate] [datetime] NULL,
	[Keyword] [varchar](20) NULL,
	[DocumentGUID] [varchar](40) NULL,
	[IsActive] [smallint] NULL,
	[Subject] [varchar](200) NULL,
	[SignatorFID] [datetime] NOT NULL,
	[CorrespondenceStatusLID] [int] NULL,
	[DeliveryMethodLID] [int] NULL,
	[DocumentName] [varchar](50) NULL,
	[SentByUserFID] [datetime] NULL,
 CONSTRAINT [PK__Correspondence__0425A276] PRIMARY KEY CLUSTERED 
(
	[CorrespondenceGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF__Correspon__IsAct__76625E5B]', @objname=N'[dbo].[Correspondence].[IsActive]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocumentEntity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DocumentEntity](
	[DocumentEntityGID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentFID] [int] NULL,
	[DocumentTypeLID] [int] NULL,
	[EntityFID] [int] NOT NULL,
	[EntityTypeLID] [int] NOT NULL,
	[EmployerFID] [datetime] NULL,
	[IsActive] [smallint] NULL,
	[ReportLevel] [int] NULL,
 CONSTRAINT [PK__DocumentEntity__0BC6C43E] PRIMARY KEY CLUSTERED 
(
	[DocumentEntityGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF__DocumentE__IsAct__7A32EF3F]', @objname=N'[dbo].[DocumentEntity].[IsActive]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LinkedDocument]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LinkedDocument](
	[LinkedDocumentGID] [int] IDENTITY(1,1) NOT NULL,
	[ReceivedDate] [datetime] NOT NULL,
	[LinkedDocumentTypeLID] [int] NULL,
	[DocumentGUID] [varchar](40) NULL,
	[Keyword] [varchar](80) NULL,
	[CreateUserFID] [datetime] NOT NULL,
	[IsActive] [smallint] NULL,
	[DocumentName] [varchar](50) NULL,
	[Comments] [varchar](250) NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LinkedDocument] PRIMARY KEY CLUSTERED 
(
	[LinkedDocumentGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF__LinkedDoc__IsAct__03BC5979]', @objname=N'[dbo].[LinkedDocument].[IsActive]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployerBAC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployerBAC](
	[BureauAssignedClassGID] [int] IDENTITY(1,1) NOT NULL,
	[LastUpdateUserFID] [datetime] NOT NULL,
	[CreateUserFID] [datetime] NOT NULL,
	[EmployerFID] [int] NULL,
	[DateDeleted] [datetime] NULL,
	[OfficeAssigned] [int] NULL,
	[IfAny] [int] NULL,
	[USLH] [int] NULL,
	[IsActive] [int] NULL,
	[Lotus] [int] NULL,
	[CreateDate] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[EffectiveFromDate] [datetime] NULL,
	[Route] [int] NULL,
	[UpdateTypeLID_N] [int] NULL,
	[JobClassificationGID] [int] NOT NULL,
 CONSTRAINT [PK_EmployerBAC_1] PRIMARY KEY CLUSTERED 
(
	[BureauAssignedClassGID] ASC,
	[JobClassificationGID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF_EmployerBAC_OfficeAssigned]', @objname=N'[dbo].[EmployerBAC].[OfficeAssigned]' , @futureonly='futureonly'
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF_EmployerBAC_IfAny]', @objname=N'[dbo].[EmployerBAC].[IfAny]' , @futureonly='futureonly'
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF_EmployerBAC_USLH]', @objname=N'[dbo].[EmployerBAC].[USLH]' , @futureonly='futureonly'
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF_EmployerBAC_IsActive]', @objname=N'[dbo].[EmployerBAC].[IsActive]' , @futureonly='futureonly'
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[DF_EmployerBAC_Lotus]', @objname=N'[dbo].[EmployerBAC].[Lotus]' , @futureonly='futureonly'
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_35]') AND parent_object_id = OBJECT_ID(N'[dbo].[MQIncomingMessageProcessErrors]'))
ALTER TABLE [dbo].[MQIncomingMessageProcessErrors]  WITH CHECK ADD  CONSTRAINT [R_35] FOREIGN KEY([MQIncomingMessageLogFID])
REFERENCES [dbo].[MQIncomingMessageLog] ([MQIncomingMessageLogGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[MQIncomingMessageProcessErrors] CHECK CONSTRAINT [R_35]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_16]') AND parent_object_id = OBJECT_ID(N'[dbo].[PDSurveyDataErrors]'))
ALTER TABLE [dbo].[PDSurveyDataErrors]  WITH CHECK ADD  CONSTRAINT [R_16] FOREIGN KEY([PDSurveyDataFID], [PDSurveyDataSamplingDetailsFID])
REFERENCES [dbo].[PDSurveyData] ([PDSurveyDataGID], [PDSurveyDataSamplingDetailsFID])
GO
ALTER TABLE [dbo].[PDSurveyDataErrors] CHECK CONSTRAINT [R_16]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_17]') AND parent_object_id = OBJECT_ID(N'[dbo].[PDSurveyDataErrors]'))
ALTER TABLE [dbo].[PDSurveyDataErrors]  WITH CHECK ADD  CONSTRAINT [R_17] FOREIGN KEY([PDSurveyErrorTypeFID])
REFERENCES [dbo].[PDSurveyErrorType] ([PDSurveyErrorTypeGID])
GO
ALTER TABLE [dbo].[PDSurveyDataErrors] CHECK CONSTRAINT [R_17]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_8]') AND parent_object_id = OBJECT_ID(N'[dbo].[PDSurveyDisputeMechanismMapping]'))
ALTER TABLE [dbo].[PDSurveyDisputeMechanismMapping]  WITH CHECK ADD  CONSTRAINT [R_8] FOREIGN KEY([PDSurveyDataFID], [PDSurveyDataSamplingDetailsFID])
REFERENCES [dbo].[PDSurveyData] ([PDSurveyDataGID], [PDSurveyDataSamplingDetailsFID])
GO
ALTER TABLE [dbo].[PDSurveyDisputeMechanismMapping] CHECK CONSTRAINT [R_8]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_25]') AND parent_object_id = OBJECT_ID(N'[dbo].[PDSurveyData]'))
ALTER TABLE [dbo].[PDSurveyData]  WITH CHECK ADD  CONSTRAINT [R_25] FOREIGN KEY([PDSurveyDataSamplingDetailsFID])
REFERENCES [dbo].[PDSurveyDataSamplingDetails] ([PDSurveyDataSamplingDetailsGID])
GO
ALTER TABLE [dbo].[PDSurveyData] CHECK CONSTRAINT [R_25]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_13]') AND parent_object_id = OBJECT_ID(N'[dbo].[USRSummaryAuditError]'))
ALTER TABLE [dbo].[USRSummaryAuditError]  WITH CHECK ADD  CONSTRAINT [R_13] FOREIGN KEY([USRSummaryHistoryGID])
REFERENCES [dbo].[USRSummaryHistory] ([USRSummaryHistoryGID])
GO
ALTER TABLE [dbo].[USRSummaryAuditError] CHECK CONSTRAINT [R_13]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_3]') AND parent_object_id = OBJECT_ID(N'[dbo].[USRSummaryTotal]'))
ALTER TABLE [dbo].[USRSummaryTotal]  WITH CHECK ADD  CONSTRAINT [R_3] FOREIGN KEY([USRSummaryHistoryGID])
REFERENCES [dbo].[USRSummaryHistory] ([USRSummaryHistoryGID])
GO
ALTER TABLE [dbo].[USRSummaryTotal] CHECK CONSTRAINT [R_3]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_15]') AND parent_object_id = OBJECT_ID(N'[dbo].[USRSummaryLossHistory]'))
ALTER TABLE [dbo].[USRSummaryLossHistory]  WITH CHECK ADD  CONSTRAINT [R_15] FOREIGN KEY([USRSummaryHistoryGID])
REFERENCES [dbo].[USRSummaryHistory] ([USRSummaryHistoryGID])
GO
ALTER TABLE [dbo].[USRSummaryLossHistory] CHECK CONSTRAINT [R_15]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_109]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyAddress]'))
ALTER TABLE [dbo].[PolicyAddress]  WITH CHECK ADD  CONSTRAINT [R_109] FOREIGN KEY([PolicyFID])
REFERENCES [dbo].[Policy] ([PolicyGID])
GO
ALTER TABLE [dbo].[PolicyAddress] CHECK CONSTRAINT [R_109]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_105]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyAddressHistory]'))
ALTER TABLE [dbo].[PolicyAddressHistory]  WITH CHECK ADD  CONSTRAINT [R_105] FOREIGN KEY([PolicyFID])
REFERENCES [dbo].[Policy] ([PolicyGID])
GO
ALTER TABLE [dbo].[PolicyAddressHistory] CHECK CONSTRAINT [R_105]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_72]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyAuditLog]'))
ALTER TABLE [dbo].[PolicyAuditLog]  WITH CHECK ADD  CONSTRAINT [R_72] FOREIGN KEY([PolicyFID])
REFERENCES [dbo].[Policy] ([PolicyGID])
GO
ALTER TABLE [dbo].[PolicyAuditLog] CHECK CONSTRAINT [R_72]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_108]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployerPolicyMapping]'))
ALTER TABLE [dbo].[EmployerPolicyMapping]  WITH CHECK ADD  CONSTRAINT [R_108] FOREIGN KEY([PolicyFID])
REFERENCES [dbo].[Policy] ([PolicyGID])
GO
ALTER TABLE [dbo].[EmployerPolicyMapping] CHECK CONSTRAINT [R_108]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_292]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployerPolicyMapping]'))
ALTER TABLE [dbo].[EmployerPolicyMapping]  WITH CHECK ADD  CONSTRAINT [R_292] FOREIGN KEY([EmployerFID])
REFERENCES [dbo].[Employer] ([EmployerGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[EmployerPolicyMapping] CHECK CONSTRAINT [R_292]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_104]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyNameHistory]'))
ALTER TABLE [dbo].[PolicyNameHistory]  WITH CHECK ADD  CONSTRAINT [R_104] FOREIGN KEY([PolicyFID])
REFERENCES [dbo].[Policy] ([PolicyGID])
GO
ALTER TABLE [dbo].[PolicyNameHistory] CHECK CONSTRAINT [R_104]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_102]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyHistory]'))
ALTER TABLE [dbo].[PolicyHistory]  WITH CHECK ADD  CONSTRAINT [R_102] FOREIGN KEY([PolicyFID])
REFERENCES [dbo].[Policy] ([PolicyGID])
GO
ALTER TABLE [dbo].[PolicyHistory] CHECK CONSTRAINT [R_102]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_112]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyGeneralHistory]'))
ALTER TABLE [dbo].[PolicyGeneralHistory]  WITH CHECK ADD  CONSTRAINT [R_112] FOREIGN KEY([PolicyFID])
REFERENCES [dbo].[Policy] ([PolicyGID])
GO
ALTER TABLE [dbo].[PolicyGeneralHistory] CHECK CONSTRAINT [R_112]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_98]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyFormsHistory]'))
ALTER TABLE [dbo].[PolicyFormsHistory]  WITH CHECK ADD  CONSTRAINT [R_98] FOREIGN KEY([PolicyFID])
REFERENCES [dbo].[Policy] ([PolicyGID])
GO
ALTER TABLE [dbo].[PolicyFormsHistory] CHECK CONSTRAINT [R_98]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_106]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyExmodHistory]'))
ALTER TABLE [dbo].[PolicyExmodHistory]  WITH CHECK ADD  CONSTRAINT [R_106] FOREIGN KEY([PolicyFID])
REFERENCES [dbo].[Policy] ([PolicyGID])
GO
ALTER TABLE [dbo].[PolicyExmodHistory] CHECK CONSTRAINT [R_106]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_75]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyEndorsement]'))
ALTER TABLE [dbo].[PolicyEndorsement]  WITH CHECK ADD  CONSTRAINT [R_75] FOREIGN KEY([PolicyFID])
REFERENCES [dbo].[Policy] ([PolicyGID])
GO
ALTER TABLE [dbo].[PolicyEndorsement] CHECK CONSTRAINT [R_75]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_107]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyClassificationHistory]'))
ALTER TABLE [dbo].[PolicyClassificationHistory]  WITH CHECK ADD  CONSTRAINT [R_107] FOREIGN KEY([PolicyFID])
REFERENCES [dbo].[Policy] ([PolicyGID])
GO
ALTER TABLE [dbo].[PolicyClassificationHistory] CHECK CONSTRAINT [R_107]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_284]') AND parent_object_id = OBJECT_ID(N'[dbo].[LSRToCTACorrespondenceTransaction]'))
ALTER TABLE [dbo].[LSRToCTACorrespondenceTransaction]  WITH CHECK ADD  CONSTRAINT [R_284] FOREIGN KEY([PolicyFID])
REFERENCES [dbo].[Policy] ([PolicyGID])
GO
ALTER TABLE [dbo].[LSRToCTACorrespondenceTransaction] CHECK CONSTRAINT [R_284]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_40]') AND parent_object_id = OBJECT_ID(N'[dbo].[LSRToCTACorrespondenceTransaction]'))
ALTER TABLE [dbo].[LSRToCTACorrespondenceTransaction]  WITH CHECK ADD  CONSTRAINT [R_40] FOREIGN KEY([EmployerGID])
REFERENCES [dbo].[Employer] ([EmployerGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[LSRToCTACorrespondenceTransaction] CHECK CONSTRAINT [R_40]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_80]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyNameAddrMapping]'))
ALTER TABLE [dbo].[PolicyNameAddrMapping]  WITH CHECK ADD  CONSTRAINT [R_80] FOREIGN KEY([PolicyEmployerNamesGID], [PolicyFID])
REFERENCES [dbo].[PolicyEmployerNames] ([PolicyEmployerNamesGID], [PolicyFID])
GO
ALTER TABLE [dbo].[PolicyNameAddrMapping] CHECK CONSTRAINT [R_80]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_81]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyNameAddrMapping]'))
ALTER TABLE [dbo].[PolicyNameAddrMapping]  WITH CHECK ADD  CONSTRAINT [R_81] FOREIGN KEY([PolicyAddressGID], [PolicyFID])
REFERENCES [dbo].[PolicyAddress] ([PolicyAddressGID], [PolicyFID])
GO
ALTER TABLE [dbo].[PolicyNameAddrMapping] CHECK CONSTRAINT [R_81]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_82]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyAddrExposureMapping]'))
ALTER TABLE [dbo].[PolicyAddrExposureMapping]  WITH CHECK ADD  CONSTRAINT [R_82] FOREIGN KEY([PolicyAddressGID], [PolicyFID])
REFERENCES [dbo].[PolicyAddress] ([PolicyAddressGID], [PolicyFID])
GO
ALTER TABLE [dbo].[PolicyAddrExposureMapping] CHECK CONSTRAINT [R_82]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_83]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyAddrExposureMapping]'))
ALTER TABLE [dbo].[PolicyAddrExposureMapping]  WITH CHECK ADD  CONSTRAINT [R_83] FOREIGN KEY([PolicyExposureAssociationGID], [PolicyFID])
REFERENCES [dbo].[PolicyExposureAssociation] ([PolicyExposureAssociationGID], [PolicyFID])
GO
ALTER TABLE [dbo].[PolicyAddrExposureMapping] CHECK CONSTRAINT [R_83]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_63]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyCAFAlternateCoverageInfoEndorsement]'))
ALTER TABLE [dbo].[PolicyCAFAlternateCoverageInfoEndorsement]  WITH CHECK ADD  CONSTRAINT [R_63] FOREIGN KEY([PolicyEndorsementGID], [PolicyFID])
REFERENCES [dbo].[PolicyEndorsement] ([PolicyEndorsementGID], [PolicyFID])
GO
ALTER TABLE [dbo].[PolicyCAFAlternateCoverageInfoEndorsement] CHECK CONSTRAINT [R_63]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_73]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyCAFAlternateCoverageInfoEndorsement]'))
ALTER TABLE [dbo].[PolicyCAFAlternateCoverageInfoEndorsement]  WITH CHECK ADD  CONSTRAINT [R_73] FOREIGN KEY([PolicyCAF10EndorsementGID], [PolicyEndorsementGID], [PolicyFID])
REFERENCES [dbo].[PolicyCAF10Endorsement] ([PolicyCAF10EndorsementGID], [PolicyEndorsementGID], [PolicyFID])
GO
ALTER TABLE [dbo].[PolicyCAFAlternateCoverageInfoEndorsement] CHECK CONSTRAINT [R_73]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_74]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyCAFAlternateCoverageInfoEndorsement]'))
ALTER TABLE [dbo].[PolicyCAFAlternateCoverageInfoEndorsement]  WITH CHECK ADD  CONSTRAINT [R_74] FOREIGN KEY([PolicyCAF11EndorsementGID], [PolicyEndorsementGID], [PolicyFID])
REFERENCES [dbo].[PolicyCAF11Endorsement] ([PolicyCAF11EndorsementGID], [PolicyEndorsementGID], [PolicyFID])
GO
ALTER TABLE [dbo].[PolicyCAFAlternateCoverageInfoEndorsement] CHECK CONSTRAINT [R_74]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CorrespondenceTemplateEntity_CorrespondenceTemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[CorrespondenceTemplateEntity]'))
ALTER TABLE [dbo].[CorrespondenceTemplateEntity]  WITH CHECK ADD  CONSTRAINT [FK_CorrespondenceTemplateEntity_CorrespondenceTemplate] FOREIGN KEY([CorrespondenceTemplateFID])
REFERENCES [dbo].[CorrespondenceTemplate] ([CorrespondenceTemplateGID])
GO
ALTER TABLE [dbo].[CorrespondenceTemplateEntity] CHECK CONSTRAINT [FK_CorrespondenceTemplateEntity_CorrespondenceTemplate]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_77]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyEmployeeLeasingAddress]'))
ALTER TABLE [dbo].[PolicyEmployeeLeasingAddress]  WITH CHECK ADD  CONSTRAINT [R_77] FOREIGN KEY([PolicyEndorsementGID], [PolicyFID])
REFERENCES [dbo].[PolicyEndorsement] ([PolicyEndorsementGID], [PolicyFID])
GO
ALTER TABLE [dbo].[PolicyEmployeeLeasingAddress] CHECK CONSTRAINT [R_77]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_78]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyEmployeeLeasingAddress]'))
ALTER TABLE [dbo].[PolicyEmployeeLeasingAddress]  WITH CHECK ADD  CONSTRAINT [R_78] FOREIGN KEY([PolicyEmployeeLeasingNamesGID], [PolicyEndorsementGID], [PolicyFID])
REFERENCES [dbo].[PolicyEmployeeLeasingNames] ([PolicyEmployeeLeasingNamesGID], [PolicyEndorsementGID], [PolicyFID])
GO
ALTER TABLE [dbo].[PolicyEmployeeLeasingAddress] CHECK CONSTRAINT [R_78]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_59]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyMultipurposeTextEndorsement]'))
ALTER TABLE [dbo].[PolicyMultipurposeTextEndorsement]  WITH CHECK ADD  CONSTRAINT [R_59] FOREIGN KEY([PolicyEndorsementGID], [PolicyFID])
REFERENCES [dbo].[PolicyEndorsement] ([PolicyEndorsementGID], [PolicyFID])
GO
ALTER TABLE [dbo].[PolicyMultipurposeTextEndorsement] CHECK CONSTRAINT [R_59]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_76]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyEmployeeLeasingNames]'))
ALTER TABLE [dbo].[PolicyEmployeeLeasingNames]  WITH CHECK ADD  CONSTRAINT [R_76] FOREIGN KEY([PolicyEndorsementGID], [PolicyFID])
REFERENCES [dbo].[PolicyEndorsement] ([PolicyEndorsementGID], [PolicyFID])
GO
ALTER TABLE [dbo].[PolicyEmployeeLeasingNames] CHECK CONSTRAINT [R_76]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_61]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyCAF10Endorsement]'))
ALTER TABLE [dbo].[PolicyCAF10Endorsement]  WITH CHECK ADD  CONSTRAINT [R_61] FOREIGN KEY([PolicyEndorsementGID], [PolicyFID])
REFERENCES [dbo].[PolicyEndorsement] ([PolicyEndorsementGID], [PolicyFID])
GO
ALTER TABLE [dbo].[PolicyCAF10Endorsement] CHECK CONSTRAINT [R_61]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_56]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyExclusionEndorsement]'))
ALTER TABLE [dbo].[PolicyExclusionEndorsement]  WITH CHECK ADD  CONSTRAINT [R_56] FOREIGN KEY([PolicyEndorsementGID], [PolicyFID])
REFERENCES [dbo].[PolicyEndorsement] ([PolicyEndorsementGID], [PolicyFID])
GO
ALTER TABLE [dbo].[PolicyExclusionEndorsement] CHECK CONSTRAINT [R_56]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_110]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyGroupEndorsement]'))
ALTER TABLE [dbo].[PolicyGroupEndorsement]  WITH CHECK ADD  CONSTRAINT [R_110] FOREIGN KEY([PolicyEndorsementGID], [PolicyFID])
REFERENCES [dbo].[PolicyEndorsement] ([PolicyEndorsementGID], [PolicyFID])
GO
ALTER TABLE [dbo].[PolicyGroupEndorsement] CHECK CONSTRAINT [R_110]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_62]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyCAF11Endorsement]'))
ALTER TABLE [dbo].[PolicyCAF11Endorsement]  WITH CHECK ADD  CONSTRAINT [R_62] FOREIGN KEY([PolicyEndorsementGID], [PolicyFID])
REFERENCES [dbo].[PolicyEndorsement] ([PolicyEndorsementGID], [PolicyFID])
GO
ALTER TABLE [dbo].[PolicyCAF11Endorsement] CHECK CONSTRAINT [R_62]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DDTSStatu__DDTSD__50656DC1]') AND parent_object_id = OBJECT_ID(N'[dbo].[DDTSStatus]'))
ALTER TABLE [dbo].[DDTSStatus]  WITH CHECK ADD  CONSTRAINT [FK__DDTSStatu__DDTSD__50656DC1] FOREIGN KEY([DDTSDocFID])
REFERENCES [dbo].[DDTSDocuments] ([DDTSDocGID])
GO
ALTER TABLE [dbo].[DDTSStatus] CHECK CONSTRAINT [FK__DDTSStatu__DDTSD__50656DC1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DDTSEmailNotificationDetails_DDTSEmailNotification]') AND parent_object_id = OBJECT_ID(N'[dbo].[DDTSEmailNotificationDetails]'))
ALTER TABLE [dbo].[DDTSEmailNotificationDetails]  WITH CHECK ADD  CONSTRAINT [FK_DDTSEmailNotificationDetails_DDTSEmailNotification] FOREIGN KEY([DDTSEmailNotificationFID])
REFERENCES [dbo].[DDTSEmailNotification] ([DDTSEmailNotificationGID])
GO
ALTER TABLE [dbo].[DDTSEmailNotificationDetails] CHECK CONSTRAINT [FK_DDTSEmailNotificationDetails_DDTSEmailNotification]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_30]') AND parent_object_id = OBJECT_ID(N'[dbo].[DDTSInspectionReportDetails]'))
ALTER TABLE [dbo].[DDTSInspectionReportDetails]  WITH CHECK ADD  CONSTRAINT [R_30] FOREIGN KEY([DDTSInspectionReportRequestFID])
REFERENCES [dbo].[DDTSInspectionReportRequest] ([DDTSInspectionReportRequestGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DDTSInspectionReportDetails] CHECK CONSTRAINT [R_30]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_286]') AND parent_object_id = OBJECT_ID(N'[dbo].[DDTSInspectionReportAnnualManualClassInfo]'))
ALTER TABLE [dbo].[DDTSInspectionReportAnnualManualClassInfo]  WITH CHECK ADD  CONSTRAINT [R_286] FOREIGN KEY([JobClassificationGID])
REFERENCES [dbo].[JobClassification] ([JobClassificationGID])
GO
ALTER TABLE [dbo].[DDTSInspectionReportAnnualManualClassInfo] CHECK CONSTRAINT [R_286]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_36]') AND parent_object_id = OBJECT_ID(N'[dbo].[DDTSInspectionReportAnnualManualClassInfo]'))
ALTER TABLE [dbo].[DDTSInspectionReportAnnualManualClassInfo]  WITH CHECK ADD  CONSTRAINT [R_36] FOREIGN KEY([DDTSInspectionReportRequestFID])
REFERENCES [dbo].[DDTSInspectionReportRequest] ([DDTSInspectionReportRequestGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DDTSInspectionReportAnnualManualClassInfo] CHECK CONSTRAINT [R_36]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_282]') AND parent_object_id = OBJECT_ID(N'[dbo].[DDTSInspectionReportRecipients]'))
ALTER TABLE [dbo].[DDTSInspectionReportRecipients]  WITH CHECK ADD  CONSTRAINT [R_282] FOREIGN KEY([EmployerGID])
REFERENCES [dbo].[Employer] ([EmployerGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DDTSInspectionReportRecipients] CHECK CONSTRAINT [R_282]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_293]') AND parent_object_id = OBJECT_ID(N'[dbo].[DDTSInspectionReportRecipients]'))
ALTER TABLE [dbo].[DDTSInspectionReportRecipients]  WITH CHECK ADD  CONSTRAINT [R_293] FOREIGN KEY([InsurerGID])
REFERENCES [dbo].[Insurer] ([InsurerGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DDTSInspectionReportRecipients] CHECK CONSTRAINT [R_293]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_31]') AND parent_object_id = OBJECT_ID(N'[dbo].[DDTSInspectionReportRecipients]'))
ALTER TABLE [dbo].[DDTSInspectionReportRecipients]  WITH CHECK ADD  CONSTRAINT [R_31] FOREIGN KEY([DDTSInspectionReportRequestFID])
REFERENCES [dbo].[DDTSInspectionReportRequest] ([DDTSInspectionReportRequestGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DDTSInspectionReportRecipients] CHECK CONSTRAINT [R_31]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_297]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueue]'))
ALTER TABLE [dbo].[WorkQueue]  WITH CHECK ADD  CONSTRAINT [R_297] FOREIGN KEY([EmployerGID])
REFERENCES [dbo].[Employer] ([EmployerGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[WorkQueue] CHECK CONSTRAINT [R_297]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_298]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueue]'))
ALTER TABLE [dbo].[WorkQueue]  WITH CHECK ADD  CONSTRAINT [R_298] FOREIGN KEY([DepartmentGID])
REFERENCES [dbo].[Department] ([DepartmentGID])
GO
ALTER TABLE [dbo].[WorkQueue] CHECK CONSTRAINT [R_298]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_39]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionErrors]'))
ALTER TABLE [dbo].[PolicySubmissionErrors]  WITH CHECK ADD  CONSTRAINT [R_39] FOREIGN KEY([ErrorTypeGID])
REFERENCES [dbo].[ErrorType] ([ErrorTypeGID])
GO
ALTER TABLE [dbo].[PolicySubmissionErrors] CHECK CONSTRAINT [R_39]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_2]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionTransactionDetail]'))
ALTER TABLE [dbo].[PolicySubmissionTransactionDetail]  WITH CHECK ADD  CONSTRAINT [R_2] FOREIGN KEY([PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionDetails] ([PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionTransactionDetail] CHECK CONSTRAINT [R_2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_41]') AND parent_object_id = OBJECT_ID(N'[dbo].[InsurerGroupAssociation]'))
ALTER TABLE [dbo].[InsurerGroupAssociation]  WITH CHECK ADD  CONSTRAINT [R_41] FOREIGN KEY([InsurerGroupFID])
REFERENCES [dbo].[InsurerGroup] ([InsurerGroupGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[InsurerGroupAssociation] CHECK CONSTRAINT [R_41]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_42]') AND parent_object_id = OBJECT_ID(N'[dbo].[InsurerGroupAssociation]'))
ALTER TABLE [dbo].[InsurerGroupAssociation]  WITH CHECK ADD  CONSTRAINT [R_42] FOREIGN KEY([InsurerFID])
REFERENCES [dbo].[Insurer] ([InsurerGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[InsurerGroupAssociation] CHECK CONSTRAINT [R_42]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_28]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionAddressChangeEndorsement]'))
ALTER TABLE [dbo].[PolicySubmissionAddressChangeEndorsement]  WITH CHECK ADD  CONSTRAINT [R_28] FOREIGN KEY([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionEndorsement] ([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionAddressChangeEndorsement] CHECK CONSTRAINT [R_28]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_22]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionCAFAltCovgInfoEndorsement]'))
ALTER TABLE [dbo].[PolicySubmissionCAFAltCovgInfoEndorsement]  WITH CHECK ADD  CONSTRAINT [R_22] FOREIGN KEY([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionEndorsement] ([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionCAFAltCovgInfoEndorsement] CHECK CONSTRAINT [R_22]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_21]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionCAF11Endorsement]'))
ALTER TABLE [dbo].[PolicySubmissionCAF11Endorsement]  WITH CHECK ADD  CONSTRAINT [R_21] FOREIGN KEY([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionEndorsement] ([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionCAF11Endorsement] CHECK CONSTRAINT [R_21]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_20]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionCAF10Endorsement]'))
ALTER TABLE [dbo].[PolicySubmissionCAF10Endorsement]  WITH CHECK ADD  CONSTRAINT [R_20] FOREIGN KEY([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionEndorsement] ([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionCAF10Endorsement] CHECK CONSTRAINT [R_20]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_26]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionDataElementChangeEndorsement]'))
ALTER TABLE [dbo].[PolicySubmissionDataElementChangeEndorsement]  WITH CHECK ADD  CONSTRAINT [R_26] FOREIGN KEY([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionEndorsement] ([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionDataElementChangeEndorsement] CHECK CONSTRAINT [R_26]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_19]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionEmployeeLeasingEndorsement]'))
ALTER TABLE [dbo].[PolicySubmissionEmployeeLeasingEndorsement]  WITH CHECK ADD  CONSTRAINT [R_19] FOREIGN KEY([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionEndorsement] ([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionEmployeeLeasingEndorsement] CHECK CONSTRAINT [R_19]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_29]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionPeriodEndorsement]'))
ALTER TABLE [dbo].[PolicySubmissionPeriodEndorsement]  WITH CHECK ADD  CONSTRAINT [R_29] FOREIGN KEY([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionEndorsement] ([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionPeriodEndorsement] CHECK CONSTRAINT [R_29]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_23]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionGroupEndorsement]'))
ALTER TABLE [dbo].[PolicySubmissionGroupEndorsement]  WITH CHECK ADD  CONSTRAINT [R_23] FOREIGN KEY([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionEndorsement] ([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionGroupEndorsement] CHECK CONSTRAINT [R_23]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_18]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionMultipurposeTextEndorsement]'))
ALTER TABLE [dbo].[PolicySubmissionMultipurposeTextEndorsement]  WITH CHECK ADD  CONSTRAINT [R_18] FOREIGN KEY([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionEndorsement] ([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionMultipurposeTextEndorsement] CHECK CONSTRAINT [R_18]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_27]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionNameChangeEndorsement]'))
ALTER TABLE [dbo].[PolicySubmissionNameChangeEndorsement]  WITH CHECK ADD  CONSTRAINT [R_27] FOREIGN KEY([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionEndorsement] ([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionNameChangeEndorsement] CHECK CONSTRAINT [R_27]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_24]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionModChangeEndorsement]'))
ALTER TABLE [dbo].[PolicySubmissionModChangeEndorsement]  WITH CHECK ADD  CONSTRAINT [R_24] FOREIGN KEY([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionEndorsement] ([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionModChangeEndorsement] CHECK CONSTRAINT [R_24]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_14]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionExclusionEndorsement]'))
ALTER TABLE [dbo].[PolicySubmissionExclusionEndorsement]  WITH CHECK ADD  CONSTRAINT [R_14] FOREIGN KEY([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionEndorsement] ([PolicySubmissionEndorsementGID], [PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionExclusionEndorsement] CHECK CONSTRAINT [R_14]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_44]') AND parent_object_id = OBJECT_ID(N'[dbo].[CTAInsurerGroupConfiguration]'))
ALTER TABLE [dbo].[CTAInsurerGroupConfiguration]  WITH CHECK ADD  CONSTRAINT [R_44] FOREIGN KEY([InsurerGroupFID])
REFERENCES [dbo].[InsurerGroup] ([InsurerGroupGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[CTAInsurerGroupConfiguration] CHECK CONSTRAINT [R_44]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_45]') AND parent_object_id = OBJECT_ID(N'[dbo].[CTATestAuditSelectionData]'))
ALTER TABLE [dbo].[CTATestAuditSelectionData]  WITH CHECK ADD  CONSTRAINT [R_45] FOREIGN KEY([InsurerGroupQuotaFID])
REFERENCES [dbo].[InsurerGroupQuota] ([InsurerGroupQuotaGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[CTATestAuditSelectionData] CHECK CONSTRAINT [R_45]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_288]') AND parent_object_id = OBJECT_ID(N'[dbo].[USRSummaryTotalsByClass]'))
ALTER TABLE [dbo].[USRSummaryTotalsByClass]  WITH CHECK ADD  CONSTRAINT [R_288] FOREIGN KEY([JobClassificationGID])
REFERENCES [dbo].[JobClassification] ([JobClassificationGID])
GO
ALTER TABLE [dbo].[USRSummaryTotalsByClass] CHECK CONSTRAINT [R_288]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_290]') AND parent_object_id = OBJECT_ID(N'[dbo].[USRSummaryExposure]'))
ALTER TABLE [dbo].[USRSummaryExposure]  WITH CHECK ADD  CONSTRAINT [R_290] FOREIGN KEY([JobClassificationGID])
REFERENCES [dbo].[JobClassification] ([JobClassificationGID])
GO
ALTER TABLE [dbo].[USRSummaryExposure] CHECK CONSTRAINT [R_290]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_287]') AND parent_object_id = OBJECT_ID(N'[dbo].[USRSummaryLoss]'))
ALTER TABLE [dbo].[USRSummaryLoss]  WITH CHECK ADD  CONSTRAINT [R_287] FOREIGN KEY([JobClassificationGID])
REFERENCES [dbo].[JobClassification] ([JobClassificationGID])
GO
ALTER TABLE [dbo].[USRSummaryLoss] CHECK CONSTRAINT [R_287]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_289]') AND parent_object_id = OBJECT_ID(N'[dbo].[USRSummaryExposureHistory]'))
ALTER TABLE [dbo].[USRSummaryExposureHistory]  WITH CHECK ADD  CONSTRAINT [R_289] FOREIGN KEY([JobClassificationGID])
REFERENCES [dbo].[JobClassification] ([JobClassificationGID])
GO
ALTER TABLE [dbo].[USRSummaryExposureHistory] CHECK CONSTRAINT [R_289]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_4]') AND parent_object_id = OBJECT_ID(N'[dbo].[JobClassificationOperation]'))
ALTER TABLE [dbo].[JobClassificationOperation]  WITH CHECK ADD  CONSTRAINT [R_4] FOREIGN KEY([JobClassificationFID])
REFERENCES [dbo].[JobClassification] ([JobClassificationGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[JobClassificationOperation] CHECK CONSTRAINT [R_4]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_6]') AND parent_object_id = OBJECT_ID(N'[dbo].[JobClassificationGroupMapping]'))
ALTER TABLE [dbo].[JobClassificationGroupMapping]  WITH CHECK ADD  CONSTRAINT [R_6] FOREIGN KEY([JobClassificationFID])
REFERENCES [dbo].[JobClassification] ([JobClassificationGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[JobClassificationGroupMapping] CHECK CONSTRAINT [R_6]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_5]') AND parent_object_id = OBJECT_ID(N'[dbo].[JobClassificationRatingConfiguration]'))
ALTER TABLE [dbo].[JobClassificationRatingConfiguration]  WITH CHECK ADD  CONSTRAINT [R_5] FOREIGN KEY([JobClassificationFID])
REFERENCES [dbo].[JobClassification] ([JobClassificationGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[JobClassificationRatingConfiguration] CHECK CONSTRAINT [R_5]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_291]') AND parent_object_id = OBJECT_ID(N'[dbo].[StateWideSummary]'))
ALTER TABLE [dbo].[StateWideSummary]  WITH CHECK ADD  CONSTRAINT [R_291] FOREIGN KEY([JobClassificationGID])
REFERENCES [dbo].[JobClassification] ([JobClassificationGID])
GO
ALTER TABLE [dbo].[StateWideSummary] CHECK CONSTRAINT [R_291]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_9]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionTransExposure]'))
ALTER TABLE [dbo].[PolicySubmissionTransExposure]  WITH CHECK ADD  CONSTRAINT [R_9] FOREIGN KEY([PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionTransactionDetail] ([PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionTransExposure] CHECK CONSTRAINT [R_9]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_12]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionTransCancelReinstate]'))
ALTER TABLE [dbo].[PolicySubmissionTransCancelReinstate]  WITH CHECK ADD  CONSTRAINT [R_12] FOREIGN KEY([PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionTransactionDetail] ([PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionTransCancelReinstate] CHECK CONSTRAINT [R_12]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_7]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicySubmissionTransAddress]'))
ALTER TABLE [dbo].[PolicySubmissionTransAddress]  WITH CHECK ADD  CONSTRAINT [R_7] FOREIGN KEY([PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
REFERENCES [dbo].[PolicySubmissionTransactionDetail] ([PolicySubmissionTransactionDetailGID], [PolicySubmissionDetailsGID], [SubmissionLogGID])
GO
ALTER TABLE [dbo].[PolicySubmissionTransAddress] CHECK CONSTRAINT [R_7]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_1]') AND parent_object_id = OBJECT_ID(N'[dbo].[JobScheduleConfigurationDetail]'))
ALTER TABLE [dbo].[JobScheduleConfigurationDetail]  WITH CHECK ADD  CONSTRAINT [R_1] FOREIGN KEY([JobScheduleConfigurationGID])
REFERENCES [dbo].[JobScheduleConfiguration] ([JobScheduleConfigurationGID])
GO
ALTER TABLE [dbo].[JobScheduleConfigurationDetail] CHECK CONSTRAINT [R_1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_11]') AND parent_object_id = OBJECT_ID(N'[dbo].[LateLargeUSRsSnapShot]'))
ALTER TABLE [dbo].[LateLargeUSRsSnapShot]  WITH CHECK ADD  CONSTRAINT [R_11] FOREIGN KEY([LateLargeUSRCriteriaGID])
REFERENCES [dbo].[LateLargeUSRCriteria] ([LateLargeUSRCriteriaGID])
GO
ALTER TABLE [dbo].[LateLargeUSRsSnapShot] CHECK CONSTRAINT [R_11]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_86]') AND parent_object_id = OBJECT_ID(N'[dbo].[MatchedBNSetDetails]'))
ALTER TABLE [dbo].[MatchedBNSetDetails]  WITH CHECK ADD  CONSTRAINT [R_86] FOREIGN KEY([MachedBNSetGID])
REFERENCES [dbo].[MatchedBNSet] ([MachedBNSetGID])
GO
ALTER TABLE [dbo].[MatchedBNSetDetails] CHECK CONSTRAINT [R_86]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DDTSDocum__DDTSF__4D890116]') AND parent_object_id = OBJECT_ID(N'[dbo].[DDTSDocuments]'))
ALTER TABLE [dbo].[DDTSDocuments]  WITH CHECK ADD  CONSTRAINT [FK__DDTSDocum__DDTSF__4D890116] FOREIGN KEY([DDTSFTPFID])
REFERENCES [dbo].[DDTSFTPAddress] ([DDTSFTPAddressGID])
GO
ALTER TABLE [dbo].[DDTSDocuments] CHECK CONSTRAINT [FK__DDTSDocum__DDTSF__4D890116]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DDTSDocuments_DDTSMetaData]') AND parent_object_id = OBJECT_ID(N'[dbo].[DDTSDocuments]'))
ALTER TABLE [dbo].[DDTSDocuments]  WITH CHECK ADD  CONSTRAINT [FK_DDTSDocuments_DDTSMetaData] FOREIGN KEY([DDTSMetaDataFID])
REFERENCES [dbo].[DDTSMetaData] ([DDTSMetaDataGID])
GO
ALTER TABLE [dbo].[DDTSDocuments] CHECK CONSTRAINT [FK_DDTSDocuments_DDTSMetaData]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_295]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkqueueLog]'))
ALTER TABLE [dbo].[WorkqueueLog]  WITH CHECK ADD  CONSTRAINT [R_295] FOREIGN KEY([WorkQueueGID], [DepartmentGID])
REFERENCES [dbo].[WorkQueue] ([WorkQueueGID], [DepartmentGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[WorkqueueLog] CHECK CONSTRAINT [R_295]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_294]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueComparisionFields]'))
ALTER TABLE [dbo].[WorkQueueComparisionFields]  WITH CHECK ADD  CONSTRAINT [R_294] FOREIGN KEY([WorkQueueGID], [DepartmentGID])
REFERENCES [dbo].[WorkQueue] ([WorkQueueGID], [DepartmentGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[WorkQueueComparisionFields] CHECK CONSTRAINT [R_294]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_296]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueAction]'))
ALTER TABLE [dbo].[WorkQueueAction]  WITH CHECK ADD  CONSTRAINT [R_296] FOREIGN KEY([WorkQueueGID], [DepartmentGID])
REFERENCES [dbo].[WorkQueue] ([WorkQueueGID], [DepartmentGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[WorkQueueAction] CHECK CONSTRAINT [R_296]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_43]') AND parent_object_id = OBJECT_ID(N'[dbo].[InsurerGroupQuota]'))
ALTER TABLE [dbo].[InsurerGroupQuota]  WITH CHECK ADD  CONSTRAINT [R_43] FOREIGN KEY([InsurerGroupFID])
REFERENCES [dbo].[InsurerGroup] ([InsurerGroupGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[InsurerGroupQuota] CHECK CONSTRAINT [R_43]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_46]') AND parent_object_id = OBJECT_ID(N'[dbo].[Correspondence]'))
ALTER TABLE [dbo].[Correspondence]  WITH CHECK ADD  CONSTRAINT [R_46] FOREIGN KEY([CorrespondenceTemplateFID])
REFERENCES [dbo].[CorrespondenceTemplate] ([CorrespondenceTemplateGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Correspondence] CHECK CONSTRAINT [R_46]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_47]') AND parent_object_id = OBJECT_ID(N'[dbo].[DocumentEntity]'))
ALTER TABLE [dbo].[DocumentEntity]  WITH CHECK ADD  CONSTRAINT [R_47] FOREIGN KEY([DocumentFID])
REFERENCES [dbo].[Correspondence] ([CorrespondenceGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[DocumentEntity] CHECK CONSTRAINT [R_47]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_277]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployerBAC]'))
ALTER TABLE [dbo].[EmployerBAC]  WITH CHECK ADD  CONSTRAINT [R_277] FOREIGN KEY([EmployerFID])
REFERENCES [dbo].[Employer] ([EmployerGID])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[EmployerBAC] CHECK CONSTRAINT [R_277]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[R_285]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployerBAC]'))
ALTER TABLE [dbo].[EmployerBAC]  WITH CHECK ADD  CONSTRAINT [R_285] FOREIGN KEY([JobClassificationGID])
REFERENCES [dbo].[JobClassification] ([JobClassificationGID])
GO
ALTER TABLE [dbo].[EmployerBAC] CHECK CONSTRAINT [R_285]
