USE [event_db]
GO
/****** Object:  Table [dbo].[audience]    Script Date: 07/10/2025 8:51:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[audience](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[contact] [nvarchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[event_id] [int] NOT NULL,
	[sinh_vien_id] [int] NULL,
	[payment_status] [bit] NOT NULL,
	[attendance_status] [bit] NOT NULL,
	[status] [bit] NOT NULL,
	[date_created] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[banner_slides]    Script Date: 07/10/2025 8:51:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[banner_slides](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[subtitle] [nvarchar](max) NULL,
	[image] [nvarchar](255) NOT NULL,
	[button_text] [nvarchar](100) NULL,
	[button_link] [nvarchar](255) NULL,
	[sort_order] [int] NOT NULL,
	[is_active] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contact]    Script Date: 07/10/2025 8:51:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](100) NOT NULL,
	[organization] [nvarchar](200) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[contact_method] [nvarchar](100) NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[status] [bit] NOT NULL,
	[date_created] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cv_guide_blog]    Script Date: 07/10/2025 8:51:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cv_guide_blog](
	[ma_bai_viet] [int] IDENTITY(1,1) NOT NULL,
	[tieu_de] [nvarchar](255) NOT NULL,
	[tom_tat] [nvarchar](max) NULL,
	[noi_dung] [nvarchar](max) NULL,
	[hinh_anh] [nvarchar](255) NULL,
	[trang_thai] [bit] NOT NULL,
	[ngay_tao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_bai_viet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cv_guide_blog_images]    Script Date: 07/10/2025 8:51:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cv_guide_blog_images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_bai_viet] [int] NOT NULL,
	[hinh_anh] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cv_guide_sample]    Script Date: 07/10/2025 8:51:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cv_guide_sample](
	[ma_mau_cv] [int] IDENTITY(1,1) NOT NULL,
	[tieu_de] [nvarchar](255) NOT NULL,
	[mo_ta] [nvarchar](max) NULL,
	[hinh_anh] [nvarchar](255) NULL,
	[tep_tin] [nvarchar](255) NULL,
	[ngay_tao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_mau_cv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[doanh_nghiep]    Script Date: 07/10/2025 8:51:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doanh_nghiep](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_cong_ty] [nvarchar](255) NOT NULL,
	[dia_chi] [nvarchar](max) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[mat_khau] [nvarchar](max) NOT NULL,
	[so_dien_thoai] [nvarchar](20) NOT NULL,
	[mo_ta] [nvarchar](max) NULL,
	[logo] [nvarchar](255) NULL,
	[linh_vuc] [nvarchar](100) NULL,
	[quy_mo] [nvarchar](50) NULL,
	[website] [nvarchar](255) NULL,
	[linh_vuc_id] [int] NULL,
	[ngay_tao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[events]    Script Date: 07/10/2025 8:51:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[events](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[venue_id] [int] NOT NULL,
	[event] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[schedule] [datetime] NOT NULL,
	[type] [bit] NOT NULL,
	[audience_capacity] [int] NOT NULL,
	[payment_type] [bit] NOT NULL,
	[amount] [decimal](18, 2) NULL,
	[banner] [nvarchar](max) NOT NULL,
	[date_created] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[linh_vuc]    Script Date: 07/10/2025 8:51:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[linh_vuc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_linh_vuc] [nvarchar](100) NOT NULL,
	[mo_ta] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sinh_vien]    Script Date: 07/10/2025 8:51:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sinh_vien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ho_ten] [nvarchar](255) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[mat_khau] [nvarchar](max) NOT NULL,
	[so_dien_thoai] [nvarchar](20) NULL,
	[truong_hoc] [nvarchar](255) NULL,
	[chuyen_nganh] [nvarchar](100) NULL,
	[dia_chi] [nvarchar](max) NULL,
	[avatar] [nvarchar](255) NULL,
	[cv_pdf] [nvarchar](255) NULL,
	[ngay_tao] [datetime] NOT NULL,
	[ngay_cap_nhat] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[system_settings]    Script Date: 07/10/2025 8:51:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_settings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[email] [nvarchar](200) NOT NULL,
	[contact] [nvarchar](20) NOT NULL,
	[cover_img] [nvarchar](max) NOT NULL,
	[about_content] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 07/10/2025 8:51:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[username] [nvarchar](200) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[type] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venue]    Script Date: 07/10/2025 8:51:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venue](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[venue] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[rate] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venue_booking]    Script Date: 07/10/2025 8:51:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venue_booking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[contact] [nvarchar](100) NOT NULL,
	[venue_id] [int] NOT NULL,
	[duration] [nvarchar](100) NOT NULL,
	[datetime] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[viec_lam]    Script Date: 07/10/2025 8:51:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[viec_lam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[doanh_nghiep_id] [int] NOT NULL,
	[tieu_de] [nvarchar](255) NOT NULL,
	[mo_ta] [nvarchar](max) NOT NULL,
	[yeu_cau] [nvarchar](max) NULL,
	[chuyen_nganh] [nvarchar](100) NOT NULL,
	[kinh_nghiem] [nvarchar](50) NOT NULL,
	[dia_diem] [nvarchar](100) NOT NULL,
	[luong] [nvarchar](100) NULL,
	[han_nop] [date] NULL,
	[so_luong] [int] NOT NULL,
	[trang_thai] [bit] NOT NULL,
	[ngay_tao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[audience] ON 

INSERT [dbo].[audience] ([id], [name], [contact], [email], [address], [event_id], [sinh_vien_id], [payment_status], [attendance_status], [status], [date_created]) VALUES (1, N'Nguyễn Văn An', N'0912345678', N'an.nguyen@example.com', N'123 Đường Láng, Hà Nội', 1, 1, 1, 1, 1, CAST(N'2025-07-07T02:05:18.000' AS DateTime))
INSERT [dbo].[audience] ([id], [name], [contact], [email], [address], [event_id], [sinh_vien_id], [payment_status], [attendance_status], [status], [date_created]) VALUES (2, N'Trần Thị Bình', N'0987654321', N'binh.tran@example.com', N'456 Đường Giải Phóng, Hà Nội', 2, 2, 0, 0, 0, CAST(N'2025-07-07T02:05:18.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[audience] OFF
GO
SET IDENTITY_INSERT [dbo].[banner_slides] ON 

INSERT [dbo].[banner_slides] ([id], [title], [subtitle], [image], [button_text], [button_link], [sort_order], [is_active], [created_at]) VALUES (1, N'Chào mừng đến với Tech 2025', N'Khám phá công nghệ mới', N'ngayhoivieclam-24.jpg', N'Đăng ký ngay', N'/events/1', 1, 1, CAST(N'2025-07-07T02:05:18.000' AS DateTime))
INSERT [dbo].[banner_slides] ([id], [title], [subtitle], [image], [button_text], [button_link], [sort_order], [is_active], [created_at]) VALUES (2, N'Hội nghị Tài chính 2025', N'Cơ hội đầu tư lớn', N'ngay-hoi-viec-lam.jpg', N'Tìm hiểu thêm', N'/events/2', 2, 1, CAST(N'2025-07-07T02:05:18.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[banner_slides] OFF
GO
SET IDENTITY_INSERT [dbo].[contact] ON 

INSERT [dbo].[contact] ([id], [full_name], [organization], [email], [contact_method], [message], [status], [date_created]) VALUES (1, N'Nguyễn Thị Duyên', N'Công ty ABC', N'duyen.nguyen@example.com', N'Email', N'Yêu cầu hỗ trợ sự kiện', 0, CAST(N'2025-07-07T02:05:18.000' AS DateTime))
INSERT [dbo].[contact] ([id], [full_name], [organization], [email], [contact_method], [message], [status], [date_created]) VALUES (2, N'Trần Văn Hùng', N'Công ty XYZ', N'hung.tran@example.com', N'Điện thoại', N'Tư vấn về hội thảo', 1, CAST(N'2025-07-07T02:05:18.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[contact] OFF
GO
SET IDENTITY_INSERT [dbo].[cv_guide_blog] ON 

INSERT [dbo].[cv_guide_blog] ([ma_bai_viet], [tieu_de], [tom_tat], [noi_dung], [hinh_anh], [trang_thai], [ngay_tao]) VALUES (1, N'Cách viết CV chuyên nghiệp', N'Hướng dẫn tạo CV ấn tượng', N'Nội dung chi tiết về cách viết CV...', N'/Uploads/blogs/cv_guide.jpg', 1, CAST(N'2025-07-07T02:05:18.000' AS DateTime))
INSERT [dbo].[cv_guide_blog] ([ma_bai_viet], [tieu_de], [tom_tat], [noi_dung], [hinh_anh], [trang_thai], [ngay_tao]) VALUES (2, N'Mẹo phỏng vấn thành công', N'Bí quyết để gây ấn tượng với nhà tuyển dụng', N'Nội dung chi tiết về phỏng vấn...', N'/Uploads/blogs/interview_tips.jpg', 1, CAST(N'2025-07-07T02:05:18.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[cv_guide_blog] OFF
GO
SET IDENTITY_INSERT [dbo].[cv_guide_blog_images] ON 

INSERT [dbo].[cv_guide_blog_images] ([id], [ma_bai_viet], [hinh_anh]) VALUES (1, 1, N'/Uploads/blogs/cv_image1.jpg')
INSERT [dbo].[cv_guide_blog_images] ([id], [ma_bai_viet], [hinh_anh]) VALUES (2, 1, N'/Uploads/blogs/cv_image2.jpg')
INSERT [dbo].[cv_guide_blog_images] ([id], [ma_bai_viet], [hinh_anh]) VALUES (3, 2, N'/Uploads/blogs/interview_image1.jpg')
SET IDENTITY_INSERT [dbo].[cv_guide_blog_images] OFF
GO
SET IDENTITY_INSERT [dbo].[cv_guide_sample] ON 

INSERT [dbo].[cv_guide_sample] ([ma_mau_cv], [tieu_de], [mo_ta], [hinh_anh], [tep_tin], [ngay_tao]) VALUES (1, N'Mẫu CV IT', N'Mẫu CV dành cho ngành CNTT', N'/Uploads/samples/cv_it.jpg', N'/Uploads/samples/cv_it.pdf', CAST(N'2025-07-07T02:05:18.000' AS DateTime))
INSERT [dbo].[cv_guide_sample] ([ma_mau_cv], [tieu_de], [mo_ta], [hinh_anh], [tep_tin], [ngay_tao]) VALUES (2, N'Mẫu CV Marketing', N'Mẫu CV dành cho ngành Marketing', N'/Uploads/samples/cv_marketing.jpg', N'/Uploads/samples/cv_marketing.pdf', CAST(N'2025-07-07T02:05:18.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[cv_guide_sample] OFF
GO
SET IDENTITY_INSERT [dbo].[doanh_nghiep] ON 

INSERT [dbo].[doanh_nghiep] ([id], [ten_cong_ty], [dia_chi], [email], [mat_khau], [so_dien_thoai], [mo_ta], [logo], [linh_vuc], [quy_mo], [website], [linh_vuc_id], [ngay_tao]) VALUES (1, N'Công ty TechVN', N'Tòa nhà A, 123 Đường Láng, Hà Nội', N'contact@techvn.com', N'$2a$10$hashedpassword4', N'0911112222', N'Công ty phát triển phần mềm', N'acecook_logo.png', N'Công nghệ thông tin', N'100-500 nhân viên', N'https://techvn.com', 1, CAST(N'2025-07-07T02:05:18.000' AS DateTime))
INSERT [dbo].[doanh_nghiep] ([id], [ten_cong_ty], [dia_chi], [email], [mat_khau], [so_dien_thoai], [mo_ta], [logo], [linh_vuc], [quy_mo], [website], [linh_vuc_id], [ngay_tao]) VALUES (2, N'Ngân hàng VietBank', N'456 Đường Giải Phóng, Hà Nội', N'info@vietbank.com', N'$2a$10$hashedpassword5', N'0982223333', N'Ngân hàng thương mại', N'fpt_software.png', N'Tài chính', N'500-1000 nhân viên', N'https://vietbank.com', 2, CAST(N'2025-07-07T02:05:18.000' AS DateTime))
INSERT [dbo].[doanh_nghiep] ([id], [ten_cong_ty], [dia_chi], [email], [mat_khau], [so_dien_thoai], [mo_ta], [logo], [linh_vuc], [quy_mo], [website], [linh_vuc_id], [ngay_tao]) VALUES (3, N'Công ty Marketing Plus', N'789 Đường Nguyễn Trãi, Hà Nội', N'support@marketingplus.com', N'$2a$10$hashedpassword6', N'0903334444', N'Dịch vụ tiếp thị và quảng cáo', N'intel_logo.png', N'Marketing', N'50-100 nhân viên', N'https://marketingplus.com', 3, CAST(N'2025-07-07T02:05:18.000' AS DateTime))
INSERT [dbo].[doanh_nghiep] ([id], [ten_cong_ty], [dia_chi], [email], [mat_khau], [so_dien_thoai], [mo_ta], [logo], [linh_vuc], [quy_mo], [website], [linh_vuc_id], [ngay_tao]) VALUES (4, N'Đại học Công Thương Thành Phố Hồ Chí Minh', N'69 Nguyễn Đỗ Cung, Tây Thạnh, Tân Phú', N'huit@gmail.edu.com', N'$2y$10$ebiNt.LhoIJa0h882GXuC..A6DyKcfaT6YzDpUSJYekxGhNiYl1u6', N'0888854212', NULL, N'logoiec.jpg', N'CNTT', N'Lớn', N'https://iec.huit.edu.vn/', 1, CAST(N'2025-07-07T11:00:16.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[doanh_nghiep] OFF
GO
SET IDENTITY_INSERT [dbo].[events] ON 

INSERT [dbo].[events] ([id], [venue_id], [event], [description], [schedule], [type], [audience_capacity], [payment_type], [amount], [banner], [date_created]) VALUES (1, 1, N'Hội thảo Công nghệ 2025', N'Hội thảo về xu hướng công nghệ mới', CAST(N'2025-07-15T09:00:00.000' AS DateTime), 1, 200, 1, CAST(0.00 AS Decimal(18, 2)), N'AIinOffice.png', CAST(N'2025-07-07T02:05:18.000' AS DateTime))
INSERT [dbo].[events] ([id], [venue_id], [event], [description], [schedule], [type], [audience_capacity], [payment_type], [amount], [banner], [date_created]) VALUES (2, 2, N'Hội nghị Tài chính', N'Thảo luận về đầu tư và tài chính', CAST(N'2025-07-20T14:00:00.000' AS DateTime), 1, 100, 1, CAST(500000.00 AS Decimal(18, 2)), N'worksop-ai-bsa.png', CAST(N'2025-07-07T02:05:18.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[events] OFF
GO
SET IDENTITY_INSERT [dbo].[linh_vuc] ON 

INSERT [dbo].[linh_vuc] ([id], [ten_linh_vuc], [mo_ta]) VALUES (1, N'Công nghệ thông tin', N'Lĩnh vực liên quan đến phát triển phần mềm, AI, và công nghệ')
INSERT [dbo].[linh_vuc] ([id], [ten_linh_vuc], [mo_ta]) VALUES (2, N'Tài chính', N'Lĩnh vực liên quan đến ngân hàng, đầu tư, và quản lý tài chính')
INSERT [dbo].[linh_vuc] ([id], [ten_linh_vuc], [mo_ta]) VALUES (3, N'Marketing', N'Lĩnh vực quảng cáo, tiếp thị và truyền thông')
SET IDENTITY_INSERT [dbo].[linh_vuc] OFF
GO
SET IDENTITY_INSERT [dbo].[sinh_vien] ON 

INSERT [dbo].[sinh_vien] ([id], [ho_ten], [email], [mat_khau], [so_dien_thoai], [truong_hoc], [chuyen_nganh], [dia_chi], [avatar], [cv_pdf], [ngay_tao], [ngay_cap_nhat]) VALUES (1, N'Nguyễn Văn An', N'an.nguyen@example.com', N'$2a$10$hashedpassword1', N'0912345678', N'ĐH Bách Khoa', N'Công nghệ thông tin', N'123 Đường Láng, Hà Nội', N'/Uploads/avatars/an.jpg', N'/Uploads/cvs/an_cv.pdf', CAST(N'2025-07-07T02:05:18.000' AS DateTime), CAST(N'2025-07-07T02:05:18.000' AS DateTime))
INSERT [dbo].[sinh_vien] ([id], [ho_ten], [email], [mat_khau], [so_dien_thoai], [truong_hoc], [chuyen_nganh], [dia_chi], [avatar], [cv_pdf], [ngay_tao], [ngay_cap_nhat]) VALUES (2, N'Trần Thị Bình', N'binh.tran@example.com', N'$2a$10$hashedpassword2', N'0987654321', N'ĐH Kinh tế Quốc dân', N'Marketing', N'456 Đường Giải Phóng, Hà Nội', N'/Uploads/avatars/binh.jpg', N'/Uploads/cvs/binh_cv.pdf', CAST(N'2025-07-07T02:05:18.000' AS DateTime), CAST(N'2025-07-07T02:05:18.000' AS DateTime))
INSERT [dbo].[sinh_vien] ([id], [ho_ten], [email], [mat_khau], [so_dien_thoai], [truong_hoc], [chuyen_nganh], [dia_chi], [avatar], [cv_pdf], [ngay_tao], [ngay_cap_nhat]) VALUES (3, N'Lê Văn Cường', N'cuong.le@example.com', N'$2a$10$hashedpassword3', N'0901234567', N'ĐH Sư Phạm', N'Tài chính', N'789 Đường Nguyễn Trãi, Hà Nội', N'/Uploads/avatars/cuong.jpg', N'/Uploads/cvs/cuong_cv.pdf', CAST(N'2025-07-07T02:05:18.000' AS DateTime), CAST(N'2025-07-07T02:05:18.000' AS DateTime))
INSERT [dbo].[sinh_vien] ([id], [ho_ten], [email], [mat_khau], [so_dien_thoai], [truong_hoc], [chuyen_nganh], [dia_chi], [avatar], [cv_pdf], [ngay_tao], [ngay_cap_nhat]) VALUES (4, N'Đỗ Văn Tuyên Đoán', N'tuyendoan369@gmail.com', N'$2y$10$bY9OJOOuHVD3WNGkT6H1xOjnQxc3tNgg.V41WtYKrGOs/80Fh9jBS', N'0888854212', N'Đại học Công Thương', N'Công nghệ thông tin', N'69 Nguyễn Đỗ Cung, Tây Thạnh, Tân Phú', N'tuyend.jpg', N'CamScanner-17-06-2025-07.22_1.pdf', CAST(N'2025-07-07T09:28:29.000' AS DateTime), CAST(N'2025-07-07T10:59:26.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[sinh_vien] OFF
GO
SET IDENTITY_INSERT [dbo].[system_settings] ON 

INSERT [dbo].[system_settings] ([id], [name], [email], [contact], [cover_img], [about_content]) VALUES (1, N'Hệ thống Sự kiện VN', N'contact@eventvn.com', N'0901234567', N'/Uploads/cover.jpg', N'Hệ thống quản lý sự kiện và việc làm hàng đầu tại Việt Nam.')
SET IDENTITY_INSERT [dbo].[system_settings] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [username], [password], [type]) VALUES (1, N'Admin Hệ thống', N'admin', N'$2a$10$hashedpassword7', 1)
INSERT [dbo].[users] ([id], [name], [username], [password], [type]) VALUES (2, N'Nhân viên Hỗ trợ', N'staff1', N'$2a$10$hashedpassword8', 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[venue] ON 

INSERT [dbo].[venue] ([id], [venue], [address], [description], [rate]) VALUES (1, N'Hội trường Bách Khoa', N'1 Đại Cồ Việt, Hà Nội', N'Hội trường lớn với sức chứa 500 người', CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[venue] ([id], [venue], [address], [description], [rate]) VALUES (2, N'Trung tâm Sự kiện VN', N'123 Đường Láng, Hà Nội', N'Không gian hiện đại cho sự kiện', CAST(2000000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[venue] OFF
GO
SET IDENTITY_INSERT [dbo].[venue_booking] ON 

INSERT [dbo].[venue_booking] ([id], [name], [address], [email], [contact], [venue_id], [duration], [datetime], [status]) VALUES (1, N'Công ty TechVN', N'123 Đường Láng, Hà Nội', N'contact@techvn.com', N'0911112222', 1, N'4 giờ', CAST(N'2025-07-15T08:00:00.000' AS DateTime), 1)
INSERT [dbo].[venue_booking] ([id], [name], [address], [email], [contact], [venue_id], [duration], [datetime], [status]) VALUES (2, N'Ngân hàng VietBank', N'456 Đường Giải Phóng, Hà Nội', N'info@vietbank.com', N'0982223333', 2, N'6 giờ', CAST(N'2025-07-20T13:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[venue_booking] OFF
GO
SET IDENTITY_INSERT [dbo].[viec_lam] ON 

INSERT [dbo].[viec_lam] ([id], [doanh_nghiep_id], [tieu_de], [mo_ta], [yeu_cau], [chuyen_nganh], [kinh_nghiem], [dia_diem], [luong], [han_nop], [so_luong], [trang_thai], [ngay_tao]) VALUES (1, 1, N'Lập trình viên Full Stack', N'Phát triển ứng dụng web', N'Kinh nghiệm 2 năm, biết React và Node.js', N'Công nghệ thông tin', N'2 năm', N'Hà Nội', N'20-30 triệu', CAST(N'2025-08-01' AS Date), 2, 1, CAST(N'2025-07-07T02:05:18.000' AS DateTime))
INSERT [dbo].[viec_lam] ([id], [doanh_nghiep_id], [tieu_de], [mo_ta], [yeu_cau], [chuyen_nganh], [kinh_nghiem], [dia_diem], [luong], [han_nop], [so_luong], [trang_thai], [ngay_tao]) VALUES (2, 2, N'Chuyên viên tài chính', N'Phân tích tài chính doanh nghiệp', N'Kinh nghiệm 3 năm, CFA là lợi thế', N'Tài chính', N'3 năm', N'Hà Nội', N'25-35 triệu', CAST(N'2025-08-15' AS Date), 1, 1, CAST(N'2025-07-07T02:05:18.000' AS DateTime))
INSERT [dbo].[viec_lam] ([id], [doanh_nghiep_id], [tieu_de], [mo_ta], [yeu_cau], [chuyen_nganh], [kinh_nghiem], [dia_diem], [luong], [han_nop], [so_luong], [trang_thai], [ngay_tao]) VALUES (3, 3, N'Nhân viên Marketingggggggg', N'Lên kế hoạch tiếp thị số', N'Kinh nghiệm 1 năm, thành thạo SEO', N'Marketing', N'1 năm', N'Hà Nội', N'15-20 triệu', CAST(N'2025-07-30' AS Date), 3, 1, CAST(N'2025-07-07T02:05:18.000' AS DateTime))
INSERT [dbo].[viec_lam] ([id], [doanh_nghiep_id], [tieu_de], [mo_ta], [yeu_cau], [chuyen_nganh], [kinh_nghiem], [dia_diem], [luong], [han_nop], [so_luong], [trang_thai], [ngay_tao]) VALUES (4, 4, N'Nhân viên IT', N'ko có mô tả', N'ko có', N'Công nghệ thông tin', N'1 năm', N'140 Lê Trọng Tấn', N'10.000.000', CAST(N'2025-07-07' AS Date), 2, 1, CAST(N'2025-07-07T14:29:24.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[viec_lam] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_doanh_nghiep_email]    Script Date: 07/10/2025 8:51:29 AM ******/
ALTER TABLE [dbo].[doanh_nghiep] ADD  CONSTRAINT [UK_doanh_nghiep_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_sinh_vien_email]    Script Date: 07/10/2025 8:51:29 AM ******/
ALTER TABLE [dbo].[sinh_vien] ADD  CONSTRAINT [UK_sinh_vien_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[audience] ADD  DEFAULT ((0)) FOR [payment_status]
GO
ALTER TABLE [dbo].[audience] ADD  DEFAULT ((0)) FOR [attendance_status]
GO
ALTER TABLE [dbo].[audience] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[audience] ADD  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[banner_slides] ADD  DEFAULT ((0)) FOR [sort_order]
GO
ALTER TABLE [dbo].[banner_slides] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[banner_slides] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[contact] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[contact] ADD  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[cv_guide_blog] ADD  DEFAULT ((1)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[cv_guide_blog] ADD  DEFAULT (getdate()) FOR [ngay_tao]
GO
ALTER TABLE [dbo].[cv_guide_sample] ADD  DEFAULT (getdate()) FOR [ngay_tao]
GO
ALTER TABLE [dbo].[doanh_nghiep] ADD  DEFAULT (getdate()) FOR [ngay_tao]
GO
ALTER TABLE [dbo].[events] ADD  DEFAULT ((1)) FOR [type]
GO
ALTER TABLE [dbo].[events] ADD  DEFAULT ((1)) FOR [payment_type]
GO
ALTER TABLE [dbo].[events] ADD  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[sinh_vien] ADD  DEFAULT (getdate()) FOR [ngay_tao]
GO
ALTER TABLE [dbo].[sinh_vien] ADD  DEFAULT (getdate()) FOR [ngay_cap_nhat]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((2)) FOR [type]
GO
ALTER TABLE [dbo].[venue] ADD  CONSTRAINT [DF_venue_rate]  DEFAULT ((0.00)) FOR [rate]
GO
ALTER TABLE [dbo].[venue_booking] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[viec_lam] ADD  DEFAULT ((1)) FOR [so_luong]
GO
ALTER TABLE [dbo].[viec_lam] ADD  DEFAULT ((1)) FOR [trang_thai]
GO
ALTER TABLE [dbo].[viec_lam] ADD  DEFAULT (getdate()) FOR [ngay_tao]
GO
ALTER TABLE [dbo].[audience]  WITH CHECK ADD FOREIGN KEY([sinh_vien_id])
REFERENCES [dbo].[sinh_vien] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[cv_guide_blog_images]  WITH CHECK ADD FOREIGN KEY([ma_bai_viet])
REFERENCES [dbo].[cv_guide_blog] ([ma_bai_viet])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[doanh_nghiep]  WITH CHECK ADD FOREIGN KEY([linh_vuc_id])
REFERENCES [dbo].[linh_vuc] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[viec_lam]  WITH CHECK ADD FOREIGN KEY([doanh_nghiep_id])
REFERENCES [dbo].[doanh_nghiep] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
