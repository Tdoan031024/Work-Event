CREATE DATABASE event_db;
	GO

	USE event_db;
	GO

	-- Table structure for table `linh_vuc`
	IF OBJECT_ID('dbo.linh_vuc', 'U') IS NOT NULL DROP TABLE dbo.linh_vuc;
	CREATE TABLE linh_vuc (
		id int NOT NULL IDENTITY(1,1),
		ten_linh_vuc nvarchar(100) NOT NULL,
		mo_ta nvarchar(max) NULL,
		PRIMARY KEY (id)
	);
	GO

	-- Table structure for table `doanh_nghiep`
	IF OBJECT_ID('dbo.doanh_nghiep', 'U') IS NOT NULL DROP TABLE dbo.doanh_nghiep;
	CREATE TABLE doanh_nghiep (
		id int NOT NULL IDENTITY(1,1),
		ten_cong_ty nvarchar(255) NOT NULL,
		dia_chi nvarchar(max) NOT NULL,
		email nvarchar(100) NOT NULL,
		mat_khau nvarchar(max) NOT NULL,
		so_dien_thoai nvarchar(20) NOT NULL,
		mo_ta nvarchar(max) NULL,
		logo nvarchar(255) NULL,
		linh_vuc nvarchar(100) NULL,
		quy_mo nvarchar(50) NULL,
		website nvarchar(255) NULL,
		linh_vuc_id int NULL,
		ngay_tao datetime NOT NULL DEFAULT GETDATE(),
		PRIMARY KEY (id),
		CONSTRAINT UK_doanh_nghiep_email UNIQUE (email),
		FOREIGN KEY (linh_vuc_id) REFERENCES linh_vuc(id) ON DELETE SET NULL ON UPDATE CASCADE
	);
	GO

	-- Table structure for table `sinh_vien`
	IF OBJECT_ID('dbo.sinh_vien', 'U') IS NOT NULL DROP TABLE dbo.sinh_vien;
	CREATE TABLE sinh_vien (
		id int NOT NULL IDENTITY(1,1),
		ho_ten nvarchar(255) NOT NULL,
		email nvarchar(100) NOT NULL,
		mat_khau nvarchar(max) NOT NULL,
		so_dien_thoai nvarchar(20) NULL,
		truong_hoc nvarchar(255) NULL,
		chuyen_nganh nvarchar(100) NULL,
		dia_chi nvarchar(max) NULL,
		avatar nvarchar(255) NULL,
		cv_pdf nvarchar(255) NULL,
		ngay_tao datetime NOT NULL DEFAULT GETDATE(),
		ngay_cap_nhat datetime NOT NULL DEFAULT GETDATE(),
		PRIMARY KEY (id),
		CONSTRAINT UK_sinh_vien_email UNIQUE (email)
	);
	GO

	-- Table structure for table `audience`
	IF OBJECT_ID('dbo.audience', 'U') IS NOT NULL DROP TABLE dbo.audience;
	CREATE TABLE audience (
		id int NOT NULL IDENTITY(1,1),
		name nvarchar(max) NOT NULL,
		contact nvarchar(50) NOT NULL,
		email nvarchar(100) NOT NULL,
		address nvarchar(max) NOT NULL,
		event_id int NOT NULL,
		sinh_vien_id int NULL,
		payment_status bit NOT NULL DEFAULT 0,
		attendance_status bit NOT NULL DEFAULT 0,
		status bit NOT NULL DEFAULT 0,
		date_created datetime NOT NULL DEFAULT GETDATE(),
		PRIMARY KEY (id),
		FOREIGN KEY (sinh_vien_id) REFERENCES sinh_vien(id) ON DELETE SET NULL ON UPDATE CASCADE
	);
	GO

	-- Table structure for table `viec_lam`
	IF OBJECT_ID('dbo.viec_lam', 'U') IS NOT NULL DROP TABLE dbo.viec_lam;
	CREATE TABLE viec_lam (
		id int NOT NULL IDENTITY(1,1),
		doanh_nghiep_id int NOT NULL,
		tieu_de nvarchar(255) NOT NULL,
		mo_ta nvarchar(max) NOT NULL,
		yeu_cau nvarchar(max) NULL,
		chuyen_nganh nvarchar(100) NOT NULL,
		kinh_nghiem nvarchar(50) NOT NULL,
		dia_diem nvarchar(100) NOT NULL,
		luong nvarchar(100) NULL,
		han_nop date NULL,
		so_luong int NOT NULL DEFAULT 1,
		trang_thai bit NOT NULL DEFAULT 1,
		ngay_tao datetime NOT NULL DEFAULT GETDATE(),
		PRIMARY KEY (id),
		FOREIGN KEY (doanh_nghiep_id) REFERENCES doanh_nghiep(id) ON DELETE CASCADE ON UPDATE CASCADE
	);
	GO

	-- Table structure for table `banner_slides`
	IF OBJECT_ID('dbo.banner_slides', 'U') IS NOT NULL DROP TABLE dbo.banner_slides;
	CREATE TABLE banner_slides (
		id int NOT NULL IDENTITY(1,1),
		title nvarchar(255) NULL,
		subtitle nvarchar(max) NULL,
		image nvarchar(255) NOT NULL,
		button_text nvarchar(100) NULL,
		button_link nvarchar(255) NULL,
		sort_order int NOT NULL DEFAULT 0,
		is_active bit NOT NULL DEFAULT 1,
		created_at datetime NOT NULL DEFAULT GETDATE(),
		PRIMARY KEY (id)
	);
	GO

	-- Table structure for table `contact`
	IF OBJECT_ID('dbo.contact', 'U') IS NOT NULL DROP TABLE dbo.contact;
	CREATE TABLE contact (
		id int NOT NULL IDENTITY(1,1),
		full_name nvarchar(100) NOT NULL,
		organization nvarchar(200) NOT NULL,
		email nvarchar(100) NOT NULL,
		contact_method nvarchar(100) NOT NULL,
		message nvarchar(max) NOT NULL,
		status bit NOT NULL DEFAULT 0,
		date_created datetime NOT NULL DEFAULT GETDATE(),
		PRIMARY KEY (id)
	);
	GO

	-- Table structure for table `cv_guide_blog`
	IF OBJECT_ID('dbo.cv_guide_blog', 'U') IS NOT NULL DROP TABLE dbo.cv_guide_blog;
	CREATE TABLE cv_guide_blog (
		ma_bai_viet int NOT NULL IDENTITY(1,1),
		tieu_de nvarchar(255) NOT NULL,
		tom_tat nvarchar(max) NULL,
		noi_dung nvarchar(max) NULL,
		hinh_anh nvarchar(255) NULL,
		trang_thai bit NOT NULL DEFAULT 1,
		ngay_tao datetime NOT NULL DEFAULT GETDATE(),
		PRIMARY KEY (ma_bai_viet)
	);
	GO

	-- Table structure for table `cv_guide_blog_images`
	IF OBJECT_ID('dbo.cv_guide_blog_images', 'U') IS NOT NULL DROP TABLE dbo.cv_guide_blog_images;
	CREATE TABLE cv_guide_blog_images (
		id int NOT NULL IDENTITY(1,1),
		ma_bai_viet int NOT NULL,
		hinh_anh nvarchar(255) NOT NULL,
		PRIMARY KEY (id),
		FOREIGN KEY (ma_bai_viet) REFERENCES cv_guide_blog(ma_bai_viet) ON DELETE CASCADE
	);
	GO

	-- Table structure for table `cv_guide_sample`
	IF OBJECT_ID('dbo.cv_guide_sample', 'U') IS NOT NULL DROP TABLE dbo.cv_guide_sample;
	CREATE TABLE cv_guide_sample (
		ma_mau_cv int NOT NULL IDENTITY(1,1),
		tieu_de nvarchar(255) NOT NULL,
		mo_ta nvarchar(max) NULL,
		hinh_anh nvarchar(255) NULL,
		tep_tin nvarchar(255) NULL,
		ngay_tao datetime NOT NULL DEFAULT GETDATE(),
		PRIMARY KEY (ma_mau_cv)
	);
	GO

	-- Table structure for table `events`
	IF OBJECT_ID('dbo.events', 'U') IS NOT NULL DROP TABLE dbo.events;
	CREATE TABLE events (
		id int NOT NULL IDENTITY(1,1),
		venue_id int NOT NULL,
		event nvarchar(max) NOT NULL,
		description nvarchar(max) NOT NULL,
		schedule datetime NOT NULL,
		type bit NOT NULL DEFAULT 1,
		audience_capacity int NOT NULL,
		payment_type bit NOT NULL DEFAULT 1,
		amount decimal(18,2) NULL,
		banner nvarchar(max) NOT NULL,
		date_created datetime NOT NULL DEFAULT GETDATE(),
		PRIMARY KEY (id)
	);
	GO

	-- Table structure for table `system_settings`
	IF OBJECT_ID('dbo.system_settings', 'U') IS NOT NULL DROP TABLE dbo.system_settings;
	CREATE TABLE system_settings (
		id int NOT NULL IDENTITY(1,1),
		name nvarchar(max) NOT NULL,
		email nvarchar(200) NOT NULL,
		contact nvarchar(20) NOT NULL,
		cover_img nvarchar(max) NOT NULL,
		about_content nvarchar(max) NOT NULL,
		PRIMARY KEY (id)
	);
	GO

	-- Table structure for table `users`
	IF OBJECT_ID('dbo.users', 'U') IS NOT NULL DROP TABLE dbo.users;
	CREATE TABLE users (
		id int NOT NULL IDENTITY(1,1),
		name nvarchar(max) NOT NULL,
		username nvarchar(200) NOT NULL,
		password nvarchar(max) NOT NULL,
		type bit NOT NULL DEFAULT 2,
		PRIMARY KEY (id)
	);
	GO

	-- Table structure for table `venue`
	IF OBJECT_ID('dbo.venue', 'U') IS NOT NULL DROP TABLE dbo.venue;
	CREATE TABLE venue (
		id int NOT NULL IDENTITY(1,1),
		venue nvarchar(max) NOT NULL,
		address nvarchar(max) NOT NULL,
		description nvarchar(max) NOT NULL,
		price decimal(18,2) NULL,
		PRIMARY KEY (id)
	);
	GO

	-- Table structure for table `venue_booking`
	IF OBJECT_ID('dbo.venue_booking', 'U') IS NOT NULL DROP TABLE dbo.venue_booking;
	CREATE TABLE venue_booking (
		id int NOT NULL IDENTITY(1,1),
		name nvarchar(max) NOT NULL,
		address nvarchar(max) NOT NULL,
		email nvarchar(100) NOT NULL,
		contact nvarchar(100) NOT NULL,
		venue_id int NOT NULL,
		duration nvarchar(100) NOT NULL,
		datetime datetime NOT NULL,
		status bit NOT NULL DEFAULT 0,
		PRIMARY KEY (id)
	);
	GO


