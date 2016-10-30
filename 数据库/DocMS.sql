/*
Navicat SQL Server Data Transfer

Source Server         : (local)
Source Server Version : 110000
Source Host           : (local):1433
Source Database       : DocMS
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 110000
File Encoding         : 65001

Date: 2016-10-31 00:01:20
*/


-- ----------------------------
-- Table structure for Admin
-- ----------------------------
DROP TABLE [dbo].[Admin]
GO
CREATE TABLE [dbo].[Admin] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] nvarchar(30) NULL ,
[password] nvarchar(30) NULL ,
[type] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Admin]', RESEED, 4)
GO

-- ----------------------------
-- Records of Admin
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Admin] ON
GO
INSERT INTO [dbo].[Admin] ([id], [name], [password], [type]) VALUES (N'1', N'admin', N'123456', N'1')
GO
GO
INSERT INTO [dbo].[Admin] ([id], [name], [password], [type]) VALUES (N'3', N'huyao', N'123456', N'2')
GO
GO
INSERT INTO [dbo].[Admin] ([id], [name], [password], [type]) VALUES (N'4', N'zjl', N'123456', N'2')
GO
GO
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO

-- ----------------------------
-- Table structure for AdminBook
-- ----------------------------
DROP TABLE [dbo].[AdminBook]
GO
CREATE TABLE [dbo].[AdminBook] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] nvarchar(30) NULL ,
[url] nvarchar(200) NULL ,
[star] int NULL ,
[author] nvarchar(30) NULL ,
[keyword] nvarchar(30) NULL ,
[score] int NULL ,
[filetype] nvarchar(10) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[AdminBook]', RESEED, 42)
GO

-- ----------------------------
-- Records of AdminBook
-- ----------------------------
SET IDENTITY_INSERT [dbo].[AdminBook] ON
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'19', N'建筑空间结构及其组成.doc', N'admin/upload/bookfile/建筑空间结构及其组成.doc', N'4', N'小轩', N'建筑形态', N'15', N'doc')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'20', N'建筑设计教学研究与实践.pdf', N'admin/upload/bookfile/建筑设计教学研究与实践.pdf', N'3', N'小轩', N'建筑形态', N'15', N'pdf')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'21', N'建筑设计需求.doc', N'admin/upload/bookfile/建筑设计需求.doc', N'3', N'老李', N'建筑形态', N'5', N'doc')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'22', N'建筑形态构成.doc', N'admin/upload/bookfile/建筑设计构成.doc', N'5', N'小六', N'建筑形态', N'20', N'doc')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'23', N'建筑形态构成基本方法.doc', N'admin/upload/bookfile/建筑形态构成基本方法.doc', N'5', N'老李', N'建筑形态', N'30', N'doc')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'24', N'带你进入四维空间.doc', N'admin/upload/bookfile/带你进入四维空间.doc', N'4', N'小明', N'四维空间', N'10', N'doc')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'25', N'六维空间基础知识考试答案.doc', N'admin/upload/bookfile/六维空间基础知识考试答案.doc', N'4', N'小东', N'六维形态', N'5', N'doc')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'26', N'薄壳结构-仿生建筑.doc', N'admin/upload/bookfile/薄壳结构-仿生建筑.doc', N'4', N'小六', N'薄壳结构', N'5', N'doc')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'27', N'圆柱薄壳结构的弹塑性分析.pdf', N'admin/upload/bookfile/圆柱薄壳结构的弹塑性分析.pdf', N'5', N'小明', N'薄壳结构', N'5', N'pdf')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'28', N'悬索结构.pdf', N'admin/upload/bookfile/悬索结构.pdf', N'4', N'小六', N'悬索结构', N'20', N'pdf')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'29', N'网架结构分析.pdf', N'admin/upload/bookfile/网架结构分析.pdf', N'3', N'小六', N'网架结构分析', N'30', N'pdf')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'30', N'膜结构分析.pdf', N'admin/upload/bookfile/膜结构分析.pdf', N'3', N'小轩', N'膜结构分析', N'15', N'pdf')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'31', N'采光标准设定.pdf', N'admin/upload/bookfile/采光标准设定.pdf', N'2', N'小六', N'采光标准设定', N'5', N'pdf')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'32', N'采光设计设定.pdf', N'admin/upload/bookfile/采光设计设定.pdf', N'2', N'小六', N'采光设定', N'5', N'pdf')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'33', N'采光特性分析.pdf', N'admin/upload/bookfile/采光特性分析.pdf', N'4', N'小明', N'采光特性分析', N'15', N'pdf')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'34', N'结构材料分析.ppt', N'admin/upload/bookfile/结构材料分析.ppt', N'4', N'小东', N'结构材料分析', N'10', N'ppt')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'35', N'现场勘探分析.ppt', N'admin/upload/bookfile/现场勘探分析.ppt', N'4', N'老李', N'现场勘探分析', N'15', N'ppt')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'36', N'现场勘探结果.pdf', N'admin/upload/bookfile/现场勘探结果.pdf', N'4', N'小东', N'现场勘探结果', N'20', N'pdf')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'37', N'现场状况.ppt', N'admin/upload/bookfile/现场状况.ppt', N'4', N'小东', N'现场状况', N'15', N'ppt')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'38', N'各分析清单.doc', N'admin/upload/bookfile/各分析清单.doc', N'5', N'小东', N'各分析清单', N'5', N'doc')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'39', N'针对性问题.doc', N'admin/upload/bookfile/针对性问题.doc', N'5', N'小东', N'针对性问题', N'5', N'doc')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'40', N'装饰材料.doc', N'admin/upload/bookfile/装饰材料.doc', N'4', N'小六', N'装饰', N'15', N'doc')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'41', N'专用材料.doc', N'admin/upload/bookfile/专用材料.doc', N'4', N'sundshine', N'专用', N'15', N'doc')
GO
GO
INSERT INTO [dbo].[AdminBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'42', N'客厅.dwg', N'admin/upload/bookfile/客厅.dwg', N'4', N'小黄', N'客厅设计', N'15', N'dwg')
GO
GO
SET IDENTITY_INSERT [dbo].[AdminBook] OFF
GO

-- ----------------------------
-- Table structure for AdminBooktype
-- ----------------------------
DROP TABLE [dbo].[AdminBooktype]
GO
CREATE TABLE [dbo].[AdminBooktype] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] nvarchar(30) NULL ,
[price] float(53) NULL ,
[parent_id] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[AdminBooktype]', RESEED, 74)
GO

-- ----------------------------
-- Records of AdminBooktype
-- ----------------------------
SET IDENTITY_INSERT [dbo].[AdminBooktype] ON
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'25', N'资料类别分类', N'5000', N'0')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'26', N'项目阶段分类', N'6000', N'0')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'27', N'建筑形态', N'0', N'25')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'28', N'空间结构', N'0', N'25')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'29', N'采光问题', N'0', N'25')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'30', N'建筑材料', N'0', N'25')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'31', N'用水与排水', N'0', N'25')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'32', N'经济成本', N'0', N'25')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'33', N'设计前期准备阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'34', N'问题提出目标设定阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'35', N'构思与概念设计阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'36', N'方案设计阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'37', N'设计优化阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'38', N'设计实施阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'39', N'施工技术指导阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'40', N'后期评估阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'41', N'空间形态', N'0', N'27')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'42', N'平面形态', N'0', N'27')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'43', N'四维形态', N'0', N'27')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'44', N'薄壳结构', N'0', N'28')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'45', N'悬索结构', N'0', N'28')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'46', N'网架结构', N'0', N'28')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'47', N'膜结构', N'0', N'28')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'48', N'采光标准', N'0', N'29')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'49', N'采光设计', N'0', N'29')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'50', N'采光特性', N'0', N'29')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'51', N'结构材料', N'0', N'30')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'52', N'装饰材料', N'0', N'30')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'53', N'专用材料', N'0', N'30')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'54', N'明排水法', N'0', N'31')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'55', N'井点降水法', N'0', N'31')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'56', N'材料成本', N'0', N'32')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'57', N'人员成本', N'0', N'32')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'58', N'其他成本', N'0', N'32')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'59', N'现场勘探', N'0', N'33')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'60', N'资料搜索', N'0', N'33')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'61', N'基础清单列表', N'0', N'33')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'62', N'设计任务书', N'0', N'34')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'63', N'各类资源分析', N'0', N'34')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'64', N'目标设定与描述', N'0', N'34')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'65', N'空间布局组织', N'0', N'35')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'66', N'多方案比较', N'0', N'35')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'67', N'多方沟通决策', N'0', N'35')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'68', N'概念设计发展', N'0', N'36')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'69', N'成本估算', N'0', N'36')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'70', N'各类技术问题深化', N'0', N'37')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'71', N'技术方案选择', N'0', N'38')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'72', N'产品材料选择', N'0', N'39')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'73', N'后期反馈', N'0', N'40')
GO
GO
INSERT INTO [dbo].[AdminBooktype] ([id], [name], [price], [parent_id]) VALUES (N'74', N'针对性问题', N'0', N'41')
GO
GO
SET IDENTITY_INSERT [dbo].[AdminBooktype] OFF
GO

-- ----------------------------
-- Table structure for AdminBT
-- ----------------------------
DROP TABLE [dbo].[AdminBT]
GO
CREATE TABLE [dbo].[AdminBT] (
[abook_id] int NOT NULL ,
[abooktype_id] int NOT NULL 
)


GO

-- ----------------------------
-- Records of AdminBT
-- ----------------------------
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'19', N'41')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'20', N'42')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'21', N'42')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'22', N'41')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'23', N'41')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'24', N'43')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'25', N'43')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'26', N'44')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'27', N'44')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'28', N'45')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'29', N'46')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'30', N'47')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'31', N'48')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'32', N'49')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'33', N'50')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'34', N'51')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'35', N'59')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'36', N'59')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'37', N'60')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'38', N'61')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'39', N'74')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'40', N'52')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'41', N'53')
GO
GO
INSERT INTO [dbo].[AdminBT] ([abook_id], [abooktype_id]) VALUES (N'42', N'41')
GO
GO

-- ----------------------------
-- Table structure for Bill
-- ----------------------------
DROP TABLE [dbo].[Bill]
GO
CREATE TABLE [dbo].[Bill] (
[id] int NOT NULL IDENTITY(1,1) ,
[time] date NULL ,
[day] int NULL ,
[price] float(53) NULL ,
[status] int NULL ,
[corporation_id] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Bill]', RESEED, 30)
GO

-- ----------------------------
-- Records of Bill
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Bill] ON
GO
INSERT INTO [dbo].[Bill] ([id], [time], [day], [price], [status], [corporation_id]) VALUES (N'29', N'2016-08-02', N'1', N'5000', N'1', N'3')
GO
GO
INSERT INTO [dbo].[Bill] ([id], [time], [day], [price], [status], [corporation_id]) VALUES (N'30', N'2016-08-02', N'1', N'6000', N'1', N'3')
GO
GO
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO

-- ----------------------------
-- Table structure for Billtype
-- ----------------------------
DROP TABLE [dbo].[Billtype]
GO
CREATE TABLE [dbo].[Billtype] (
[bill_id] int NOT NULL ,
[abooktype_id] int NOT NULL 
)


GO

-- ----------------------------
-- Records of Billtype
-- ----------------------------
INSERT INTO [dbo].[Billtype] ([bill_id], [abooktype_id]) VALUES (N'29', N'25')
GO
GO
INSERT INTO [dbo].[Billtype] ([bill_id], [abooktype_id]) VALUES (N'30', N'26')
GO
GO

-- ----------------------------
-- Table structure for CorpoBook
-- ----------------------------
DROP TABLE [dbo].[CorpoBook]
GO
CREATE TABLE [dbo].[CorpoBook] (
[abook_id] int NOT NULL ,
[corporation_id] int NOT NULL ,
[name] nvarchar(30) NULL ,
[url] nvarchar(200) NULL ,
[star] int NULL ,
[author] nvarchar(30) NULL ,
[keyword] nvarchar(30) NULL ,
[score] int NULL ,
[filetype] nvarchar(10) NULL 
)


GO

-- ----------------------------
-- Records of CorpoBook
-- ----------------------------
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'19', N'3', N'建筑空间结构及其组成.doc', N'corporation/upload/浙江大学/建筑空间结构及其组成.doc', N'4', N'小轩', N'建筑形态', N'15', N'doc')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'20', N'3', N'建筑设计教学研究与实践.pdf', N'corporation/upload/浙江大学/建筑设计教学研究与实践.pdf', N'3', N'小轩', N'建筑形态', N'15', N'pdf')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'21', N'3', N'建筑设计需求.doc', N'corporation/upload/浙江大学/建筑设计需求.doc', N'3', N'老李', N'建筑形态', N'5', N'doc')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'22', N'3', N'建筑形态构成.doc', N'corporation/upload/浙江大学/建筑设计构成.doc', N'5', N'小六', N'建筑形态', N'20', N'doc')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'23', N'3', N'建筑形态构成基本方法.doc', N'corporation/upload/浙江大学/建筑形态构成基本方法.doc', N'5', N'老李', N'建筑形态', N'30', N'doc')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'24', N'3', N'带你进入四维空间.doc', N'corporation/upload/浙江大学/带你进入四维空间.doc', N'4', N'小明', N'四维空间', N'10', N'doc')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'25', N'3', N'六维空间基础知识考试答案.doc', N'corporation/upload/浙江大学/六维空间基础知识考试答案.doc', N'4', N'小东', N'六维形态', N'5', N'doc')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'26', N'3', N'薄壳结构-仿生建筑.doc', N'corporation/upload/浙江大学/薄壳结构-仿生建筑.doc', N'4', N'小六', N'薄壳结构', N'5', N'doc')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'27', N'3', N'圆柱薄壳结构的弹塑性分析.pdf', N'corporation/upload/浙江大学/圆柱薄壳结构的弹塑性分析.pdf', N'5', N'小明', N'薄壳结构', N'5', N'pdf')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'28', N'3', N'悬索结构.pdf', N'corporation/upload/浙江大学/悬索结构.pdf', N'4', N'小六', N'悬索结构', N'20', N'pdf')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'29', N'3', N'网架结构分析.pdf', N'corporation/upload/浙江大学/网架结构分析.pdf', N'3', N'小六', N'网架结构分析', N'30', N'pdf')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'30', N'3', N'膜结构分析.pdf', N'corporation/upload/浙江大学/膜结构分析.pdf', N'3', N'小轩', N'膜结构分析', N'15', N'pdf')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'31', N'3', N'采光标准设定.pdf', N'corporation/upload/浙江大学/采光标准设定.pdf', N'2', N'小六', N'采光标准设定', N'5', N'pdf')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'32', N'3', N'采光设计设定.pdf', N'corporation/upload/浙江大学/采光设计设定.pdf', N'2', N'小六', N'采光设定', N'5', N'pdf')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'33', N'3', N'采光特性分析.pdf', N'corporation/upload/浙江大学/采光特性分析.pdf', N'4', N'小明', N'采光特性分析', N'15', N'pdf')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'34', N'3', N'结构材料分析.ppt', N'corporation/upload/浙江大学/结构材料分析.ppt', N'4', N'小东', N'结构材料分析', N'10', N'ppt')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'35', N'3', N'现场勘探分析.ppt', N'corporation/upload/浙江大学/现场勘探分析.ppt', N'4', N'老李', N'现场勘探分析', N'15', N'ppt')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'36', N'3', N'现场勘探结果.pdf', N'corporation/upload/浙江大学/现场勘探结果.pdf', N'4', N'小东', N'现场勘探结果', N'20', N'pdf')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'37', N'3', N'现场状况.ppt', N'corporation/upload/浙江大学/现场状况.ppt', N'4', N'小东', N'现场状况', N'15', N'ppt')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'38', N'3', N'各分析清单.doc', N'corporation/upload/浙江大学/各分析清单.doc', N'5', N'小东', N'各分析清单', N'5', N'doc')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'39', N'3', N'针对性问题.doc', N'corporation/upload/浙江大学/针对性问题.doc', N'5', N'小东', N'针对性问题', N'5', N'doc')
GO
GO
INSERT INTO [dbo].[CorpoBook] ([abook_id], [corporation_id], [name], [url], [star], [author], [keyword], [score], [filetype]) VALUES (N'42', N'3', N'客厅.dwg', N'corporation/upload/浙江大学/客厅.dwg', N'4', N'小黄', N'客厅设计', N'15', N'dwg')
GO
GO

-- ----------------------------
-- Table structure for CorpoBooktype
-- ----------------------------
DROP TABLE [dbo].[CorpoBooktype]
GO
CREATE TABLE [dbo].[CorpoBooktype] (
[abooktype_id] int NOT NULL ,
[corporation_id] int NOT NULL ,
[name] nvarchar(30) NULL ,
[price] float(53) NULL ,
[parent_id] int NULL 
)


GO

-- ----------------------------
-- Records of CorpoBooktype
-- ----------------------------
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'25', N'3', N'资料类别分类', N'5000', N'0')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'26', N'3', N'项目阶段分类', N'6000', N'0')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'27', N'3', N'建筑形态', N'0', N'25')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'28', N'3', N'空间结构', N'0', N'25')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'29', N'3', N'采光问题', N'0', N'25')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'30', N'3', N'建筑材料', N'0', N'25')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'31', N'3', N'用水与排水', N'0', N'25')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'32', N'3', N'经济成本', N'0', N'25')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'33', N'3', N'设计前期准备阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'34', N'3', N'问题提出目标设定阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'35', N'3', N'构思与概念设计阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'36', N'3', N'方案设计阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'37', N'3', N'设计优化阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'38', N'3', N'设计实施阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'39', N'3', N'施工技术指导阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'40', N'3', N'后期评估阶段', N'0', N'26')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'41', N'3', N'空间形态', N'0', N'27')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'42', N'3', N'平面形态', N'0', N'27')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'43', N'3', N'四维形态', N'0', N'27')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'44', N'3', N'薄壳结构', N'0', N'28')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'45', N'3', N'悬索结构', N'0', N'28')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'46', N'3', N'网架结构', N'0', N'28')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'47', N'3', N'膜结构', N'0', N'28')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'48', N'3', N'采光标准', N'0', N'29')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'49', N'3', N'采光设计', N'0', N'29')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'50', N'3', N'采光特性', N'0', N'29')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'51', N'3', N'结构材料', N'0', N'30')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'52', N'3', N'装饰材料', N'0', N'30')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'53', N'3', N'专用材料', N'0', N'30')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'54', N'3', N'明排水法', N'0', N'31')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'55', N'3', N'井点降水法', N'0', N'31')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'56', N'3', N'材料成本', N'0', N'32')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'57', N'3', N'人员成本', N'0', N'32')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'58', N'3', N'其他成本', N'0', N'32')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'59', N'3', N'现场勘探', N'0', N'33')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'60', N'3', N'资料搜索', N'0', N'33')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'61', N'3', N'基础清单列表', N'0', N'33')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'62', N'3', N'设计任务书', N'0', N'34')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'63', N'3', N'各类资源分析', N'0', N'34')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'64', N'3', N'目标设定与描述', N'0', N'34')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'65', N'3', N'空间布局组织', N'0', N'35')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'66', N'3', N'多方案比较', N'0', N'35')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'67', N'3', N'多方沟通决策', N'0', N'35')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'68', N'3', N'概念设计发展', N'0', N'36')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'69', N'3', N'成本估算', N'0', N'36')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'70', N'3', N'各类技术问题深化', N'0', N'37')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'71', N'3', N'技术方案选择', N'0', N'38')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'72', N'3', N'产品材料选择', N'0', N'39')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'73', N'3', N'后期反馈', N'0', N'40')
GO
GO
INSERT INTO [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id], [name], [price], [parent_id]) VALUES (N'74', N'3', N'针对性问题', N'0', N'41')
GO
GO

-- ----------------------------
-- Table structure for CorpoBT
-- ----------------------------
DROP TABLE [dbo].[CorpoBT]
GO
CREATE TABLE [dbo].[CorpoBT] (
[cbook_id] int NOT NULL ,
[cbooktype_id] int NOT NULL ,
[corporation_id] int NOT NULL 
)


GO

-- ----------------------------
-- Records of CorpoBT
-- ----------------------------
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'19', N'41', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'20', N'42', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'21', N'42', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'22', N'41', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'23', N'41', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'24', N'43', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'25', N'43', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'26', N'44', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'27', N'44', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'28', N'45', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'29', N'46', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'30', N'47', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'31', N'48', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'32', N'49', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'33', N'50', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'34', N'51', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'35', N'59', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'36', N'59', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'37', N'60', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'38', N'61', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'39', N'74', N'3')
GO
GO
INSERT INTO [dbo].[CorpoBT] ([cbook_id], [cbooktype_id], [corporation_id]) VALUES (N'42', N'41', N'3')
GO
GO

-- ----------------------------
-- Table structure for Corporation
-- ----------------------------
DROP TABLE [dbo].[Corporation]
GO
CREATE TABLE [dbo].[Corporation] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] nvarchar(30) NULL ,
[password] nvarchar(30) NULL ,
[email] nvarchar(30) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Corporation]', RESEED, 4)
GO

-- ----------------------------
-- Records of Corporation
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Corporation] ON
GO
INSERT INTO [dbo].[Corporation] ([id], [name], [password], [email]) VALUES (N'3', N'浙江大学', N'123456', N'1234567@qq.com')
GO
GO
INSERT INTO [dbo].[Corporation] ([id], [name], [password], [email]) VALUES (N'4', N'重庆大学', N'123456', N'1234567@qq.com')
GO
GO
SET IDENTITY_INSERT [dbo].[Corporation] OFF
GO

-- ----------------------------
-- Table structure for CorSelfBook
-- ----------------------------
DROP TABLE [dbo].[CorSelfBook]
GO
CREATE TABLE [dbo].[CorSelfBook] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] nvarchar(30) NULL ,
[url] nvarchar(200) NULL ,
[star] int NULL ,
[author] nvarchar(30) NULL ,
[keyword] nvarchar(30) NULL ,
[score] int NULL ,
[filetype] nvarchar(30) NULL ,
[corporation_id] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[CorSelfBook]', RESEED, 10)
GO

-- ----------------------------
-- Records of CorSelfBook
-- ----------------------------
SET IDENTITY_INSERT [dbo].[CorSelfBook] ON
GO
INSERT INTO [dbo].[CorSelfBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype], [corporation_id]) VALUES (N'6', N'重庆大学.doc', N'corporation/upload/浙江大学/重庆大学.doc', N'3', N'小明', N'学校', N'5', N'doc', N'3')
GO
GO
INSERT INTO [dbo].[CorSelfBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype], [corporation_id]) VALUES (N'7', N'计算机学院学生名单.doc', N'corporation/upload/浙江大学/计算机学院学生名单.doc', N'4', N'小明', N'学生名单', N'5', N'doc', N'3')
GO
GO
INSERT INTO [dbo].[CorSelfBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype], [corporation_id]) VALUES (N'8', N'历史学院学生名单.doc', N'corporation/upload/浙江大学/历史学院学生名单.doc', N'4', N'小东', N'学生名单', N'15', N'doc', N'3')
GO
GO
INSERT INTO [dbo].[CorSelfBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype], [corporation_id]) VALUES (N'9', N'外国语学生名单.pdf', N'corporation/upload/浙江大学/外国语学生名单.pdf', N'3', N'小东', N'学生名单', N'20', N'pdf', N'3')
GO
GO
INSERT INTO [dbo].[CorSelfBook] ([id], [name], [url], [star], [author], [keyword], [score], [filetype], [corporation_id]) VALUES (N'10', N'化学学院学生名单.pdf', N'corporation/upload/浙江大学/化学学院学生名单.pdf', N'5', N'小东', N'学生名单', N'5', N'pdf', N'3')
GO
GO
SET IDENTITY_INSERT [dbo].[CorSelfBook] OFF
GO

-- ----------------------------
-- Table structure for CorSelfBooktype
-- ----------------------------
DROP TABLE [dbo].[CorSelfBooktype]
GO
CREATE TABLE [dbo].[CorSelfBooktype] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] nvarchar(100) NULL ,
[price] int NULL ,
[parent_id] int NULL ,
[corporation_id] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[CorSelfBooktype]', RESEED, 10)
GO

-- ----------------------------
-- Records of CorSelfBooktype
-- ----------------------------
SET IDENTITY_INSERT [dbo].[CorSelfBooktype] ON
GO
INSERT INTO [dbo].[CorSelfBooktype] ([id], [name], [price], [parent_id], [corporation_id]) VALUES (N'5', N'浙江大学', N'1000', N'0', N'3')
GO
GO
INSERT INTO [dbo].[CorSelfBooktype] ([id], [name], [price], [parent_id], [corporation_id]) VALUES (N'6', N'教务处', N'0', N'5', N'3')
GO
GO
INSERT INTO [dbo].[CorSelfBooktype] ([id], [name], [price], [parent_id], [corporation_id]) VALUES (N'7', N'计算机学院', N'0', N'5', N'3')
GO
GO
INSERT INTO [dbo].[CorSelfBooktype] ([id], [name], [price], [parent_id], [corporation_id]) VALUES (N'8', N'历史学院', N'0', N'5', N'3')
GO
GO
INSERT INTO [dbo].[CorSelfBooktype] ([id], [name], [price], [parent_id], [corporation_id]) VALUES (N'9', N'外国语学院', N'0', N'5', N'3')
GO
GO
INSERT INTO [dbo].[CorSelfBooktype] ([id], [name], [price], [parent_id], [corporation_id]) VALUES (N'10', N'化学学院', N'0', N'5', N'3')
GO
GO
SET IDENTITY_INSERT [dbo].[CorSelfBooktype] OFF
GO

-- ----------------------------
-- Table structure for CorSelfBT
-- ----------------------------
DROP TABLE [dbo].[CorSelfBT]
GO
CREATE TABLE [dbo].[CorSelfBT] (
[book_id] int NOT NULL ,
[booktype_id] int NOT NULL ,
[corporation_id] int NOT NULL 
)


GO

-- ----------------------------
-- Records of CorSelfBT
-- ----------------------------
INSERT INTO [dbo].[CorSelfBT] ([book_id], [booktype_id], [corporation_id]) VALUES (N'6', N'6', N'3')
GO
GO
INSERT INTO [dbo].[CorSelfBT] ([book_id], [booktype_id], [corporation_id]) VALUES (N'7', N'7', N'3')
GO
GO
INSERT INTO [dbo].[CorSelfBT] ([book_id], [booktype_id], [corporation_id]) VALUES (N'8', N'8', N'3')
GO
GO
INSERT INTO [dbo].[CorSelfBT] ([book_id], [booktype_id], [corporation_id]) VALUES (N'9', N'9', N'3')
GO
GO
INSERT INTO [dbo].[CorSelfBT] ([book_id], [booktype_id], [corporation_id]) VALUES (N'10', N'10', N'3')
GO
GO

-- ----------------------------
-- Table structure for CorVisitRecord
-- ----------------------------
DROP TABLE [dbo].[CorVisitRecord]
GO
CREATE TABLE [dbo].[CorVisitRecord] (
[id] int NOT NULL IDENTITY(1,1) ,
[time] datetime NULL ,
[type] int NULL ,
[ip] nvarchar(30) NULL ,
[corporation_id] int NULL ,
[book_id] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[CorVisitRecord]', RESEED, 278)
GO

-- ----------------------------
-- Records of CorVisitRecord
-- ----------------------------
SET IDENTITY_INSERT [dbo].[CorVisitRecord] ON
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'22', N'2016-08-09 01:17:54.080', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'23', N'2016-08-09 01:17:56.273', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'24', N'2016-08-09 01:17:57.883', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'25', N'2016-08-09 01:17:59.780', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'26', N'2016-08-09 01:18:01.397', N'1', null, N'3', N'21')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'27', N'2016-08-09 01:18:03.590', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'28', N'2016-08-09 01:18:05.893', N'1', null, N'3', N'25')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'29', N'2016-08-09 01:19:52.107', N'1', null, N'3', N'26')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'30', N'2016-08-09 01:20:01.103', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'31', N'2016-08-09 01:20:02.597', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'32', N'2016-08-09 01:20:05.170', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'33', N'2016-08-09 10:02:40.743', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'34', N'2016-08-09 10:02:43.753', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'35', N'2016-08-09 10:02:46.467', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'36', N'2016-08-09 10:02:56.770', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'37', N'2016-08-09 10:23:43.090', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'38', N'2016-08-09 10:33:43.263', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'39', N'2016-08-09 10:34:37.600', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'40', N'2016-08-09 10:35:06.733', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'41', N'2016-08-09 10:35:07.827', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'42', N'2016-08-09 10:44:48.630', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'43', N'2016-08-09 10:44:51.263', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'44', N'2016-08-09 10:44:53.093', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'45', N'2016-08-09 10:44:57.853', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'46', N'2016-08-09 10:44:59.133', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'47', N'2016-08-13 17:26:53.413', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'48', N'2016-08-13 17:26:57.047', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'49', N'2016-08-13 17:26:59.783', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'50', N'2016-08-14 22:05:41.837', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'51', N'2016-08-14 22:10:52.107', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'52', N'2016-08-14 22:11:40.680', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'53', N'2016-08-14 22:11:42.790', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'54', N'2016-08-14 22:11:45.280', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'55', N'2016-08-14 22:13:38.613', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'56', N'2016-08-14 22:13:49.600', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'57', N'2016-08-14 22:13:50.573', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'58', N'2016-08-14 22:13:52.797', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'59', N'2016-08-14 22:13:56.067', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'60', N'2016-08-15 10:55:58.110', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'61', N'2016-08-15 11:00:23.997', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'62', N'2016-08-15 11:00:32.647', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'63', N'2016-08-15 11:00:37.057', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'64', N'2016-08-15 11:00:41.817', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'65', N'2016-08-15 11:01:16.237', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'66', N'2016-08-15 11:02:52.563', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'67', N'2016-08-15 11:03:53.877', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'68', N'2016-08-15 11:03:58.010', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'69', N'2016-08-15 13:33:10.567', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'70', N'2016-08-15 13:38:43.877', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'71', N'2016-08-15 13:38:46.037', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'72', N'2016-08-15 13:38:47.000', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'73', N'2016-08-15 13:38:49.190', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'74', N'2016-08-15 13:38:50.277', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'75', N'2016-08-15 13:38:51.223', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'76', N'2016-08-16 18:43:50.863', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'77', N'2016-08-16 18:43:54.960', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'78', N'2016-08-16 18:44:01.800', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'79', N'2016-08-16 18:44:30.810', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'80', N'2016-08-16 18:57:49.153', N'1', null, N'3', N'35')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'81', N'2016-08-16 18:57:52.310', N'1', null, N'3', N'36')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'82', N'2016-08-16 18:57:55.950', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'83', N'2016-08-17 16:00:59.427', N'1', null, N'3', N'39')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'84', N'2016-08-17 16:01:09.563', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'85', N'2016-08-17 16:54:25.577', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'86', N'2016-08-17 21:44:15.893', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'87', N'2016-08-17 21:59:59.233', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'88', N'2016-08-17 22:00:04.367', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'89', N'2016-08-17 22:00:10.167', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'90', N'2016-08-17 22:00:17.117', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'91', N'2016-08-17 22:02:42.363', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'92', N'2016-08-17 22:03:11.587', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'93', N'2016-08-17 22:04:14.657', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'94', N'2016-08-17 22:05:08.517', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'95', N'2016-08-17 22:05:50.767', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'96', N'2016-08-17 22:05:53.877', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'97', N'2016-08-17 22:06:01.943', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'98', N'2016-08-17 22:06:06.537', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'99', N'2016-08-17 22:06:27.570', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'100', N'2016-08-17 22:12:45.873', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'101', N'2016-08-17 22:12:46.923', N'1', null, N'3', N'21')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'102', N'2016-08-17 22:12:49.793', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'103', N'2016-08-17 22:12:56.517', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'104', N'2016-08-17 22:13:56.500', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'105', N'2016-08-17 22:15:00.840', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'106', N'2016-08-17 22:20:43.960', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'107', N'2016-08-17 22:20:50.380', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'108', N'2016-08-17 22:21:19.653', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'109', N'2016-08-17 22:21:23.453', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'110', N'2016-08-17 22:21:27.517', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'111', N'2016-08-17 22:21:34.977', N'1', null, N'3', N'27')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'112', N'2016-08-17 22:21:39.850', N'1', null, N'3', N'26')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'113', N'2016-08-17 22:21:41.940', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'114', N'2016-08-17 22:21:50.980', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'115', N'2016-08-17 22:22:28.373', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'116', N'2016-08-17 22:22:42.537', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'117', N'2016-08-17 22:23:43.520', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'118', N'2016-08-17 22:23:47.637', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'119', N'2016-08-17 22:56:46.503', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'120', N'2016-08-17 22:58:26.583', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'121', N'2016-08-17 23:24:44.700', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'122', N'2016-08-18 14:19:11.757', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'123', N'2016-08-18 14:19:14.610', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'124', N'2016-08-18 15:28:12.433', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'125', N'2016-08-18 15:28:15.000', N'1', null, N'3', N'21')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'126', N'2016-08-18 15:28:22.330', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'127', N'2016-08-18 17:34:39.980', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'128', N'2016-08-18 17:35:18.313', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'129', N'2016-08-18 17:41:18.157', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'130', N'2016-08-18 19:51:46.553', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'131', N'2016-08-18 19:53:36.927', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'132', N'2016-08-18 22:36:19.650', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'133', N'2016-08-18 22:36:26.187', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'134', N'2016-08-18 22:36:32.743', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'135', N'2016-08-18 22:40:30.787', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'136', N'2016-08-18 22:40:45.573', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'137', N'2016-08-18 22:41:03.200', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'138', N'2016-08-18 22:42:26.780', N'1', null, N'3', N'39')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'139', N'2016-08-18 22:42:30.907', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'140', N'2016-08-18 22:42:34.867', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'141', N'2016-08-19 16:50:25.077', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'142', N'2016-08-19 16:50:28.647', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'143', N'2016-08-19 21:13:42.037', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'144', N'2016-08-19 21:13:48.650', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'145', N'2016-08-22 10:44:07.960', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'146', N'2016-08-23 15:42:37.163', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'147', N'2016-08-24 12:55:30.350', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'148', N'2016-08-24 12:55:42.783', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'149', N'2016-08-24 12:55:45.750', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'150', N'2016-08-24 12:55:47.483', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'151', N'2016-08-24 12:55:48.350', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'152', N'2016-08-24 12:55:50.867', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'153', N'2016-08-24 12:55:51.977', N'1', null, N'3', N'21')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'154', N'2016-08-24 12:56:49.033', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'155', N'2016-08-24 12:56:51.660', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'156', N'2016-08-24 12:56:54.793', N'1', null, N'3', N'21')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'157', N'2016-08-24 12:57:03.317', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'158', N'2016-08-24 12:57:05.550', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'159', N'2016-08-24 12:57:08.860', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'160', N'2016-08-24 12:57:12.923', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'161', N'2016-08-24 12:57:14.547', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'162', N'2016-08-24 12:57:21.483', N'1', null, N'3', N'26')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'163', N'2016-08-24 12:57:22.987', N'1', null, N'3', N'27')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'164', N'2016-08-24 13:02:06.507', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'165', N'2016-08-24 13:02:08.240', N'1', null, N'3', N'21')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'166', N'2016-08-24 13:02:11.317', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'167', N'2016-08-24 14:24:36.857', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'168', N'2016-08-24 14:24:40.570', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'169', N'2016-08-24 16:08:19.890', N'1', null, N'3', N'31')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'170', N'2016-08-24 16:08:22.537', N'1', null, N'3', N'32')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'171', N'2016-08-24 16:08:26.083', N'1', null, N'3', N'26')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'172', N'2016-08-24 16:56:38.077', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'173', N'2016-08-25 10:39:43.757', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'174', N'2016-08-25 10:39:57.487', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'175', N'2016-08-25 11:18:23.860', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'176', N'2016-08-25 11:20:43.477', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'177', N'2016-08-25 11:21:16.397', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'178', N'2016-08-25 11:21:45.673', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'179', N'2016-08-25 11:22:19.617', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'180', N'2016-08-25 11:22:21.930', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'181', N'2016-08-25 11:22:29.913', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'182', N'2016-08-25 11:22:41.760', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'183', N'2016-08-25 11:27:21.193', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'184', N'2016-08-25 11:41:04.217', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'185', N'2016-08-25 11:43:50.677', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'186', N'2016-08-25 11:44:06.430', N'1', null, N'3', N'21')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'187', N'2016-08-25 12:03:30.250', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'188', N'2016-08-25 12:03:42.370', N'1', null, N'3', N'21')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'189', N'2016-08-25 12:03:56.507', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'190', N'2016-08-25 12:03:59.130', N'1', null, N'3', N'21')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'191', N'2016-08-25 12:04:03.370', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'192', N'2016-08-25 12:04:10.520', N'1', null, N'3', N'21')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'193', N'2016-08-25 12:04:13.163', N'1', null, N'3', N'25')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'194', N'2016-08-25 14:30:34.483', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'195', N'2016-08-25 14:33:18.563', N'1', null, N'3', N'35')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'196', N'2016-08-25 15:00:24.573', N'1', null, N'3', N'28')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'197', N'2016-08-25 16:22:56.773', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'198', N'2016-08-25 16:24:31.967', N'1', null, N'3', N'26')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'199', N'2016-08-25 16:40:02.537', N'1', null, N'3', N'26')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'200', N'2016-08-25 16:49:30.430', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'201', N'2016-08-25 17:11:11.093', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'202', N'2016-08-25 17:54:31.147', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'203', N'2016-08-25 18:00:22.507', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'204', N'2016-08-25 18:03:19.310', N'1', null, N'3', N'26')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'205', N'2016-08-25 19:55:09.547', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'206', N'2016-08-25 20:21:00.590', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'207', N'2016-08-25 20:25:50.103', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'208', N'2016-08-25 22:46:55.643', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'209', N'2016-08-28 01:37:37.550', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'210', N'2016-08-28 01:37:47.310', N'1', null, N'3', N'21')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'211', N'2016-08-28 01:37:49.400', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'212', N'2016-08-28 01:40:44.970', N'1', null, N'3', N'26')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'213', N'2016-08-28 21:11:51.710', N'1', null, N'3', N'31')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'214', N'2016-08-28 21:12:14.880', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'215', N'2016-08-28 21:12:32.047', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'216', N'2016-08-28 21:16:46.297', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'217', N'2016-08-28 21:16:55.590', N'1', null, N'3', N'31')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'218', N'2016-08-28 21:30:42.823', N'1', null, N'3', N'26')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'219', N'2016-08-28 21:52:34.207', N'1', null, N'3', N'32')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'220', N'2016-08-29 15:25:43.950', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'221', N'2016-08-29 15:25:47.537', N'1', null, N'3', N'21')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'222', N'2016-08-29 15:25:51.137', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'223', N'2016-08-30 10:29:14.937', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'224', N'2016-08-30 10:29:20.327', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'225', N'2016-08-30 10:31:26.653', N'1', null, N'3', N'21')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'226', N'2016-08-31 20:33:21.940', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'227', N'2016-09-02 14:19:21.783', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'228', N'2016-09-02 14:20:21.540', N'1', null, N'3', N'34')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'229', N'2016-09-02 14:21:09.333', N'1', null, N'3', N'33')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'230', N'2016-09-02 14:21:48.583', N'1', null, N'3', N'34')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'231', N'2016-09-02 14:26:06.257', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'232', N'2016-09-02 14:26:12.150', N'1', null, N'3', N'34')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'233', N'2016-09-02 14:26:17.483', N'1', null, N'3', N'26')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'234', N'2016-09-03 15:37:23.603', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'235', N'2016-09-04 00:40:21.603', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'236', N'2016-09-04 00:40:41.813', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'237', N'2016-09-04 00:41:17.720', N'1', null, N'3', N'26')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'238', N'2016-09-04 23:28:22.913', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'239', N'2016-09-04 23:28:26.303', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'240', N'2016-09-04 23:32:03.333', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'241', N'2016-09-04 23:32:12.537', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'242', N'2016-09-04 23:32:15.727', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'243', N'2016-09-04 23:32:20.623', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'244', N'2016-09-04 23:36:31.527', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'245', N'2016-09-04 23:36:47.887', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'246', N'2016-09-04 23:36:50.067', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'247', N'2016-09-04 23:36:58.840', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'248', N'2016-09-04 23:36:59.963', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'249', N'2016-09-04 23:37:03.533', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'250', N'2016-09-04 23:37:06.467', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'251', N'2016-09-04 23:53:22.913', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'252', N'2016-09-04 23:53:51.110', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'253', N'2016-09-05 00:24:31.003', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'254', N'2016-09-05 00:25:02.023', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'255', N'2016-09-05 00:44:40.060', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'256', N'2016-09-05 00:44:43.320', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'257', N'2016-09-05 00:44:44.647', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'258', N'2016-09-05 00:44:47.177', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'259', N'2016-09-05 00:44:49.227', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'260', N'2016-09-05 00:45:55.097', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'261', N'2016-09-05 00:45:57.863', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'262', N'2016-09-05 00:46:48.887', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'263', N'2016-09-05 00:47:31.413', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'264', N'2016-09-05 00:47:34.360', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'265', N'2016-09-05 00:47:36.067', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'266', N'2016-09-05 00:47:39.043', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'267', N'2016-09-05 00:52:27.260', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'268', N'2016-09-05 00:56:42.073', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'269', N'2016-09-05 00:56:45.397', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'270', N'2016-09-05 00:56:46.923', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'271', N'2016-09-05 00:56:52.027', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'272', N'2016-09-05 00:56:53.293', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'273', N'2016-09-05 00:58:00.433', N'1', null, N'3', N'42')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'274', N'2016-09-05 12:39:53.310', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'275', N'2016-09-05 12:40:02.970', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'276', N'2016-09-05 12:40:11.263', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'277', N'2016-09-05 12:40:22.473', N'1', null, N'3', N'23')
GO
GO
INSERT INTO [dbo].[CorVisitRecord] ([id], [time], [type], [ip], [corporation_id], [book_id]) VALUES (N'278', N'2016-09-05 12:40:27.267', N'1', null, N'3', N'42')
GO
GO
SET IDENTITY_INSERT [dbo].[CorVisitRecord] OFF
GO

-- ----------------------------
-- Table structure for CUBill
-- ----------------------------
DROP TABLE [dbo].[CUBill]
GO
CREATE TABLE [dbo].[CUBill] (
[id] int NOT NULL IDENTITY(1,1) ,
[time] date NULL ,
[user_id] int NULL ,
[abook_id] int NULL ,
[corporation_id] int NULL 
)


GO

-- ----------------------------
-- Records of CUBill
-- ----------------------------
SET IDENTITY_INSERT [dbo].[CUBill] ON
GO
SET IDENTITY_INSERT [dbo].[CUBill] OFF
GO

-- ----------------------------
-- Table structure for Discuss
-- ----------------------------
DROP TABLE [dbo].[Discuss]
GO
CREATE TABLE [dbo].[Discuss] (
[id] int NOT NULL ,
[time] datetime NULL ,
[recommend_id] int NULL ,
[user_id] int NULL ,
[content] nvarchar(300) NULL 
)


GO

-- ----------------------------
-- Records of Discuss
-- ----------------------------

-- ----------------------------
-- Table structure for Group
-- ----------------------------
DROP TABLE [dbo].[Group]
GO
CREATE TABLE [dbo].[Group] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] nvarchar(50) NULL ,
[boss_name] nvarchar(50) NULL ,
[type] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Group]', RESEED, 3)
GO

-- ----------------------------
-- Records of Group
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Group] ON
GO
INSERT INTO [dbo].[Group] ([id], [name], [boss_name], [type]) VALUES (N'2', N'学神交流中心', N'胡耀', N'1')
GO
GO
INSERT INTO [dbo].[Group] ([id], [name], [boss_name], [type]) VALUES (N'3', N'秋名山交流中心', N'胡耀', N'1')
GO
GO
SET IDENTITY_INSERT [dbo].[Group] OFF
GO

-- ----------------------------
-- Table structure for Invite
-- ----------------------------
DROP TABLE [dbo].[Invite]
GO
CREATE TABLE [dbo].[Invite] (
[id] int NOT NULL IDENTITY(1,1) ,
[inviter] nvarchar(50) NULL ,
[type] int NULL ,
[user_id] int NULL ,
[group_id] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Invite]', RESEED, 3)
GO

-- ----------------------------
-- Records of Invite
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Invite] ON
GO
INSERT INTO [dbo].[Invite] ([id], [inviter], [type], [user_id], [group_id]) VALUES (N'1', N'胡耀', N'0', N'9', N'2')
GO
GO
INSERT INTO [dbo].[Invite] ([id], [inviter], [type], [user_id], [group_id]) VALUES (N'3', N'胡耀', N'0', N'7', N'3')
GO
GO
SET IDENTITY_INSERT [dbo].[Invite] OFF
GO

-- ----------------------------
-- Table structure for Recommend
-- ----------------------------
DROP TABLE [dbo].[Recommend]
GO
CREATE TABLE [dbo].[Recommend] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] nvarchar(50) NULL ,
[url] nvarchar(200) NULL ,
[star] int NULL ,
[author] nvarchar(30) NULL ,
[keyword] nvarchar(30) NULL ,
[score] int NULL ,
[filetype] nvarchar(10) NULL ,
[group_id] int NULL ,
[reference_name] nvarchar(30) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[Recommend]', RESEED, 11)
GO

-- ----------------------------
-- Records of Recommend
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Recommend] ON
GO
INSERT INTO [dbo].[Recommend] ([id], [name], [url], [star], [author], [keyword], [score], [filetype], [group_id], [reference_name]) VALUES (N'1', N'建筑设计教学研究与实践.pdf', null, N'3', N'小轩', N'建筑形态', N'15', null, N'2', N'胡耀')
GO
GO
INSERT INTO [dbo].[Recommend] ([id], [name], [url], [star], [author], [keyword], [score], [filetype], [group_id], [reference_name]) VALUES (N'3', N'建筑空间结构及其组成.doc', null, N'4', N'小轩', N'建筑形态', N'15', null, N'3', N'胡耀')
GO
GO
INSERT INTO [dbo].[Recommend] ([id], [name], [url], [star], [author], [keyword], [score], [filetype], [group_id], [reference_name]) VALUES (N'4', N'薄壳结构-仿生建筑.doc', null, N'4', N'小六', N'薄壳结构', N'5', null, N'3', N'胡耀')
GO
GO
INSERT INTO [dbo].[Recommend] ([id], [name], [url], [star], [author], [keyword], [score], [filetype], [group_id], [reference_name]) VALUES (N'7', N'带你进入四维空间.doc', null, N'4', N'小明', N'四维空间', N'10', null, N'2', N'胡耀')
GO
GO
INSERT INTO [dbo].[Recommend] ([id], [name], [url], [star], [author], [keyword], [score], [filetype], [group_id], [reference_name]) VALUES (N'8', N'薄壳结构-仿生建筑.doc', null, N'4', N'小六', N'薄壳结构', N'5', null, N'2', N'胡耀')
GO
GO
INSERT INTO [dbo].[Recommend] ([id], [name], [url], [star], [author], [keyword], [score], [filetype], [group_id], [reference_name]) VALUES (N'9', N'采光标准设定.pdf', null, N'2', N'小六', N'采光标准设定', N'5', null, N'2', N'罗卓')
GO
GO
INSERT INTO [dbo].[Recommend] ([id], [name], [url], [star], [author], [keyword], [score], [filetype], [group_id], [reference_name]) VALUES (N'10', N'建筑形态构成.doc', null, N'5', N'小六', N'建筑形态', N'20', null, N'2', N'罗卓')
GO
GO
INSERT INTO [dbo].[Recommend] ([id], [name], [url], [star], [author], [keyword], [score], [filetype], [group_id], [reference_name]) VALUES (N'11', N'采光设计设定.pdf', null, N'2', N'小六', N'采光设定', N'5', null, N'3', N'luozhuo')
GO
GO
SET IDENTITY_INSERT [dbo].[Recommend] OFF
GO

-- ----------------------------
-- Table structure for UG
-- ----------------------------
DROP TABLE [dbo].[UG]
GO
CREATE TABLE [dbo].[UG] (
[user_id] int NOT NULL ,
[gid] int NOT NULL 
)


GO

-- ----------------------------
-- Records of UG
-- ----------------------------
INSERT INTO [dbo].[UG] ([user_id], [gid]) VALUES (N'3', N'2')
GO
GO
INSERT INTO [dbo].[UG] ([user_id], [gid]) VALUES (N'3', N'3')
GO
GO
INSERT INTO [dbo].[UG] ([user_id], [gid]) VALUES (N'7', N'2')
GO
GO
INSERT INTO [dbo].[UG] ([user_id], [gid]) VALUES (N'8', N'2')
GO
GO

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE [dbo].[User]
GO
CREATE TABLE [dbo].[User] (
[id] int NOT NULL IDENTITY(1,1) ,
[name] nvarchar(30) NULL ,
[password] nvarchar(30) NULL ,
[email] nvarchar(30) NULL ,
[authority] int NULL ,
[corporation_id] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[User]', RESEED, 9)
GO

-- ----------------------------
-- Records of User
-- ----------------------------
SET IDENTITY_INSERT [dbo].[User] ON
GO
INSERT INTO [dbo].[User] ([id], [name], [password], [email], [authority], [corporation_id]) VALUES (N'3', N'luozhuo', N'123456', N'12345678@qq.com', N'0', N'3')
GO
GO
INSERT INTO [dbo].[User] ([id], [name], [password], [email], [authority], [corporation_id]) VALUES (N'4', N'huyao', N'123456', N'1234567@qq.com', N'0', N'4')
GO
GO
INSERT INTO [dbo].[User] ([id], [name], [password], [email], [authority], [corporation_id]) VALUES (N'5', N'小默', N'123456', N'123456789@qq.com', N'0', N'3')
GO
GO
INSERT INTO [dbo].[User] ([id], [name], [password], [email], [authority], [corporation_id]) VALUES (N'6', N'胡耀', N'123456', N'1234567560@qq.com', N'1', N'3')
GO
GO
INSERT INTO [dbo].[User] ([id], [name], [password], [email], [authority], [corporation_id]) VALUES (N'7', N'罗卓', N'123456', N'123456453@qq.com', N'0', N'3')
GO
GO
INSERT INTO [dbo].[User] ([id], [name], [password], [email], [authority], [corporation_id]) VALUES (N'8', N'谭浩强', N'123456', N'12346543@qq.com', N'0', N'3')
GO
GO
INSERT INTO [dbo].[User] ([id], [name], [password], [email], [authority], [corporation_id]) VALUES (N'9', N'vczh', N'123456', N'12432435@qq.com', N'1', N'3')
GO
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO

-- ----------------------------
-- Table structure for UserVisitRecord
-- ----------------------------
DROP TABLE [dbo].[UserVisitRecord]
GO
CREATE TABLE [dbo].[UserVisitRecord] (
[id] int NOT NULL IDENTITY(1,1) ,
[time] datetime NULL ,
[type] int NULL ,
[ip] nvarchar(30) NULL ,
[user_id] int NULL ,
[book_id] int NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[UserVisitRecord]', RESEED, 18)
GO

-- ----------------------------
-- Records of UserVisitRecord
-- ----------------------------
SET IDENTITY_INSERT [dbo].[UserVisitRecord] ON
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'1', N'2016-08-24 16:07:02.920', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'2', N'2016-08-24 16:08:16.993', N'1', null, N'3', N'31')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'3', N'2016-08-24 16:56:16.123', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'4', N'2016-08-24 16:59:55.020', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'5', N'2016-08-25 10:25:45.253', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'6', N'2016-08-25 11:44:14.413', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'7', N'2016-08-25 11:51:16.373', N'1', null, N'3', N'26')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'8', N'2016-08-25 11:59:22.040', N'1', null, N'3', N'26')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'9', N'2016-08-25 12:01:28.760', N'1', null, N'3', N'26')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'10', N'2016-08-25 14:58:07.177', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'11', N'2016-08-25 16:40:16.823', N'1', null, N'3', N'26')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'12', N'2016-08-25 16:43:16.940', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'13', N'2016-08-25 16:47:02.517', N'1', null, N'3', N'20')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'14', N'2016-09-01 15:39:48.303', N'1', null, N'3', N'24')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'15', N'2016-09-02 14:19:52.290', N'1', null, N'3', N'22')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'16', N'2016-09-04 00:40:26.103', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'17', N'2016-09-05 13:54:05.247', N'1', null, N'3', N'19')
GO
GO
INSERT INTO [dbo].[UserVisitRecord] ([id], [time], [type], [ip], [user_id], [book_id]) VALUES (N'18', N'2016-09-05 13:54:09.980', N'1', null, N'3', N'22')
GO
GO
SET IDENTITY_INSERT [dbo].[UserVisitRecord] OFF
GO

-- ----------------------------
-- Procedure structure for InsertBillT
-- ----------------------------
DROP PROCEDURE [dbo].[InsertBillT]
GO
CREATE PROCEDURE [dbo].[InsertBillT]
(
	@time date,
	@day int,
	@price float,
	@status int,
	@corporation_id int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Bill] ([time], [day], [price], [status], [corporation_id]) VALUES (@time, @day, @price, @status, @corporation_id);
	
SELECT id, time, day, price, status, corporation_id FROM Bill WHERE (id = SCOPE_IDENTITY())
GO

-- ----------------------------
-- Indexes structure for table Admin
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Admin
-- ----------------------------
ALTER TABLE [dbo].[Admin] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table AdminBook
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table AdminBook
-- ----------------------------
ALTER TABLE [dbo].[AdminBook] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table AdminBooktype
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table AdminBooktype
-- ----------------------------
ALTER TABLE [dbo].[AdminBooktype] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table AdminBT
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table AdminBT
-- ----------------------------
ALTER TABLE [dbo].[AdminBT] ADD PRIMARY KEY ([abook_id], [abooktype_id])
GO

-- ----------------------------
-- Indexes structure for table Bill
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Bill
-- ----------------------------
ALTER TABLE [dbo].[Bill] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table Billtype
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Billtype
-- ----------------------------
ALTER TABLE [dbo].[Billtype] ADD PRIMARY KEY ([bill_id], [abooktype_id])
GO

-- ----------------------------
-- Indexes structure for table CorpoBook
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table CorpoBook
-- ----------------------------
ALTER TABLE [dbo].[CorpoBook] ADD PRIMARY KEY ([abook_id], [corporation_id])
GO

-- ----------------------------
-- Indexes structure for table CorpoBooktype
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table CorpoBooktype
-- ----------------------------
ALTER TABLE [dbo].[CorpoBooktype] ADD PRIMARY KEY ([abooktype_id], [corporation_id])
GO

-- ----------------------------
-- Indexes structure for table CorpoBT
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table CorpoBT
-- ----------------------------
ALTER TABLE [dbo].[CorpoBT] ADD PRIMARY KEY ([cbook_id], [cbooktype_id], [corporation_id])
GO

-- ----------------------------
-- Indexes structure for table Corporation
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Corporation
-- ----------------------------
ALTER TABLE [dbo].[Corporation] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table CorSelfBook
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table CorSelfBook
-- ----------------------------
ALTER TABLE [dbo].[CorSelfBook] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table CorSelfBooktype
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table CorSelfBooktype
-- ----------------------------
ALTER TABLE [dbo].[CorSelfBooktype] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table CorSelfBT
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table CorSelfBT
-- ----------------------------
ALTER TABLE [dbo].[CorSelfBT] ADD PRIMARY KEY ([book_id], [booktype_id], [corporation_id])
GO

-- ----------------------------
-- Indexes structure for table CorVisitRecord
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table CorVisitRecord
-- ----------------------------
ALTER TABLE [dbo].[CorVisitRecord] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table CUBill
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table CUBill
-- ----------------------------
ALTER TABLE [dbo].[CUBill] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table Discuss
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Discuss
-- ----------------------------
ALTER TABLE [dbo].[Discuss] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table Group
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Group
-- ----------------------------
ALTER TABLE [dbo].[Group] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table Invite
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Invite
-- ----------------------------
ALTER TABLE [dbo].[Invite] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table Recommend
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Recommend
-- ----------------------------
ALTER TABLE [dbo].[Recommend] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table UG
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table UG
-- ----------------------------
ALTER TABLE [dbo].[UG] ADD PRIMARY KEY ([user_id], [gid])
GO

-- ----------------------------
-- Indexes structure for table User
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table User
-- ----------------------------
ALTER TABLE [dbo].[User] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table UserVisitRecord
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table UserVisitRecord
-- ----------------------------
ALTER TABLE [dbo].[UserVisitRecord] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[AdminBT]
-- ----------------------------
ALTER TABLE [dbo].[AdminBT] ADD FOREIGN KEY ([abook_id]) REFERENCES [dbo].[AdminBook] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[AdminBT] ADD FOREIGN KEY ([abooktype_id]) REFERENCES [dbo].[AdminBooktype] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Bill]
-- ----------------------------
ALTER TABLE [dbo].[Bill] ADD FOREIGN KEY ([corporation_id]) REFERENCES [dbo].[Corporation] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Billtype]
-- ----------------------------
ALTER TABLE [dbo].[Billtype] ADD FOREIGN KEY ([abooktype_id]) REFERENCES [dbo].[AdminBooktype] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[Billtype] ADD FOREIGN KEY ([bill_id]) REFERENCES [dbo].[Bill] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[CorpoBook]
-- ----------------------------
ALTER TABLE [dbo].[CorpoBook] ADD FOREIGN KEY ([abook_id]) REFERENCES [dbo].[AdminBook] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[CorpoBook] ADD FOREIGN KEY ([corporation_id]) REFERENCES [dbo].[Corporation] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[CorpoBooktype]
-- ----------------------------
ALTER TABLE [dbo].[CorpoBooktype] ADD FOREIGN KEY ([abooktype_id]) REFERENCES [dbo].[AdminBooktype] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[CorpoBooktype] ADD FOREIGN KEY ([corporation_id]) REFERENCES [dbo].[Corporation] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[CorpoBT]
-- ----------------------------
ALTER TABLE [dbo].[CorpoBT] ADD FOREIGN KEY ([cbook_id], [corporation_id]) REFERENCES [dbo].[CorpoBook] ([abook_id], [corporation_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[CorpoBT] ADD FOREIGN KEY ([cbooktype_id], [corporation_id]) REFERENCES [dbo].[CorpoBooktype] ([abooktype_id], [corporation_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[CorSelfBook]
-- ----------------------------
ALTER TABLE [dbo].[CorSelfBook] ADD FOREIGN KEY ([corporation_id]) REFERENCES [dbo].[Corporation] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[CorSelfBooktype]
-- ----------------------------
ALTER TABLE [dbo].[CorSelfBooktype] ADD FOREIGN KEY ([corporation_id]) REFERENCES [dbo].[Corporation] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[CorSelfBT]
-- ----------------------------
ALTER TABLE [dbo].[CorSelfBT] ADD FOREIGN KEY ([book_id]) REFERENCES [dbo].[CorSelfBook] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[CorSelfBT] ADD FOREIGN KEY ([booktype_id]) REFERENCES [dbo].[CorSelfBooktype] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[CorSelfBT] ADD FOREIGN KEY ([corporation_id]) REFERENCES [dbo].[Corporation] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[CorVisitRecord]
-- ----------------------------
ALTER TABLE [dbo].[CorVisitRecord] ADD FOREIGN KEY ([book_id]) REFERENCES [dbo].[AdminBook] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[CorVisitRecord] ADD FOREIGN KEY ([corporation_id]) REFERENCES [dbo].[Corporation] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[CUBill]
-- ----------------------------
ALTER TABLE [dbo].[CUBill] ADD FOREIGN KEY ([abook_id], [corporation_id]) REFERENCES [dbo].[CorpoBook] ([abook_id], [corporation_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[CUBill] ADD FOREIGN KEY ([user_id]) REFERENCES [dbo].[User] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Discuss]
-- ----------------------------
ALTER TABLE [dbo].[Discuss] ADD FOREIGN KEY ([recommend_id]) REFERENCES [dbo].[Recommend] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[Discuss] ADD FOREIGN KEY ([user_id]) REFERENCES [dbo].[User] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Invite]
-- ----------------------------
ALTER TABLE [dbo].[Invite] ADD FOREIGN KEY ([group_id]) REFERENCES [dbo].[Group] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[Invite] ADD FOREIGN KEY ([user_id]) REFERENCES [dbo].[User] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Recommend]
-- ----------------------------
ALTER TABLE [dbo].[Recommend] ADD FOREIGN KEY ([group_id]) REFERENCES [dbo].[Group] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[UG]
-- ----------------------------
ALTER TABLE [dbo].[UG] ADD FOREIGN KEY ([gid]) REFERENCES [dbo].[Group] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[UG] ADD FOREIGN KEY ([user_id]) REFERENCES [dbo].[User] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[User]
-- ----------------------------
ALTER TABLE [dbo].[User] ADD FOREIGN KEY ([corporation_id]) REFERENCES [dbo].[Corporation] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[UserVisitRecord]
-- ----------------------------
ALTER TABLE [dbo].[UserVisitRecord] ADD FOREIGN KEY ([book_id]) REFERENCES [dbo].[AdminBook] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[UserVisitRecord] ADD FOREIGN KEY ([user_id]) REFERENCES [dbo].[User] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
