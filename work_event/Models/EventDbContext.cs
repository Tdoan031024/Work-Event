using Microsoft.EntityFrameworkCore;
using work_event.Models;

namespace work_event.Models;

public partial class EventDbContext : DbContext
{
    public EventDbContext(DbContextOptions<EventDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<DoanhNghiep> DoanhNghieps { get; set; }
    public virtual DbSet<ViecLam> ViecLams { get; set; }
    public virtual DbSet<LinhVuc> LinhVucs { get; set; }
    public virtual DbSet<Event> Events { get; set; }
    public virtual DbSet<Venue> Venues { get; set; }
    public virtual DbSet<SystemSetting> SystemSettings { get; set; }
    public virtual DbSet<BannerSlide> BannerSlides { get; set; }
    
    public virtual DbSet<Contact> Contacts { get; set; }
    public virtual DbSet<SinhVien> SinhViens { get; set; }
    public virtual DbSet<User> Users { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Contact>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.ToTable("contact");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.FullName).HasColumnName("full_name");
            entity.Property(e => e.Organization).HasColumnName("organization");
            entity.Property(e => e.Email).HasColumnName("email");
            entity.Property(e => e.ContactMethod).HasColumnName("contact_method");
            entity.Property(e => e.Message).HasColumnName("message");
        });

        // Giữ nguyên các ánh xạ khác
        modelBuilder.Entity<SystemSetting>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.ToTable("system_settings");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.Email).HasColumnName("email");
            entity.Property(e => e.Contact).HasColumnName("contact");
            entity.Property(e => e.CoverImg).HasColumnName("cover_img");
            entity.Property(e => e.AboutContent).HasColumnName("about_content");
        });

        modelBuilder.Entity<DoanhNghiep>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__doanh_nghiep__3213E83F");
            entity.ToTable("doanh_nghiep");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.TenCongTy).HasColumnName("ten_cong_ty");
            entity.Property(e => e.DiaChi).HasColumnName("dia_chi");
            entity.Property(e => e.Email).HasColumnName("email");
            entity.Property(e => e.MatKhau).HasColumnName("mat_khau");
            entity.Property(e => e.SoDienThoai).HasColumnName("so_dien_thoai");
            entity.Property(e => e.MoTa).HasColumnName("mo_ta");
            entity.Property(e => e.Logo).HasColumnName("logo");
            entity.Property(e => e.QuyMo).HasColumnName("quy_mo");
            entity.Property(e => e.Website).HasColumnName("website");
            entity.Property(e => e.LinhVucId).HasColumnName("linh_vuc_id");
            entity.Property(e => e.NgayTao).HasColumnName("ngay_tao");

            entity.HasOne(d => d.LinhVuc)
                .WithMany(l => l.DoanhNghieps)
                .HasForeignKey(d => d.LinhVucId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_doanh_nghiep_linh_vuc");
        });

        modelBuilder.Entity<ViecLam>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__viec_lam__3213E83F");
            entity.ToTable("viec_lam");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.DoanhNghiepId).HasColumnName("doanh_nghiep_id");
            entity.Property(e => e.TieuDe).HasColumnName("tieu_de");
            entity.Property(e => e.MoTa).HasColumnName("mo_ta");
            entity.Property(e => e.YeuCau).HasColumnName("yeu_cau");
            entity.Property(e => e.ChuyenNganh).HasColumnName("chuyen_nganh");
            entity.Property(e => e.KinhNghiem).HasColumnName("kinh_nghiem");
            entity.Property(e => e.DiaDiem).HasColumnName("dia_diem");
            entity.Property(e => e.Luong).HasColumnName("luong");
            entity.Property(e => e.HanNop).HasColumnName("han_nop");
            entity.Property(e => e.SoLuong).HasColumnName("so_luong");
            entity.Property(e => e.TrangThai).HasColumnName("trang_thai");
            entity.Property(e => e.NgayTao).HasColumnName("ngay_tao");

            entity.HasOne(v => v.DoanhNghiep)
                .WithMany(d => d.ViecLams)
                .HasForeignKey(v => v.DoanhNghiepId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK_viec_lam_doanh_nghiep");
        });

        modelBuilder.Entity<LinhVuc>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__linh_vuc__3213E83F");
            entity.ToTable("linh_vuc");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.TenLinhVuc).HasColumnName("ten_linh_vuc");
            entity.Property(e => e.MoTa).HasColumnName("mo_ta");
        });

        modelBuilder.Entity<Event>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__events__3213E83F1AC986DF");
            entity.ToTable("events");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.VenueId).HasColumnName("venue_id");
            entity.Property(e => e.Event1).HasColumnName("event");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Schedule).HasColumnType("datetime").HasColumnName("schedule");
            entity.Property(e => e.Type).HasDefaultValue(true).HasColumnName("type");
            entity.Property(e => e.AudienceCapacity).HasColumnName("audience_capacity");
            entity.Property(e => e.PaymentType).HasDefaultValue(true).HasColumnName("payment_type");
            entity.Property(e => e.Amount).HasColumnName("amount").HasColumnType("decimal(18,2)");
            entity.Property(e => e.Banner).HasColumnName("banner");
            entity.Property(e => e.DateCreated).HasDefaultValueSql("(getdate())").HasColumnType("datetime").HasColumnName("date_created");

            entity.HasOne(e => e.Venue)
                .WithMany(v => v.Events)
                .HasForeignKey(e => e.VenueId)
                .OnDelete(DeleteBehavior.NoAction)
                .HasConstraintName("FK_events_venue");
        });

        modelBuilder.Entity<Venue>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__venue__3213E83F848CCE62");
            entity.ToTable("venue");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Venue1).HasColumnName("venue");
            entity.Property(e => e.Address).HasColumnName("address");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Rate).HasColumnName("rate").HasColumnType("decimal(18,2)");
        });

        modelBuilder.Entity<BannerSlide>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.ToTable("banner_slides");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Image).HasColumnName("image");
            entity.Property(e => e.Title).HasColumnName("title");
            entity.Property(e => e.Subtitle).HasColumnName("subtitle");
            entity.Property(e => e.ButtonText).HasColumnName("button_text");
            entity.Property(e => e.ButtonLink).HasColumnName("button_link");
            entity.Property(e => e.IsActive).HasColumnName("is_active");
            entity.Property(e => e.SortOrder).HasColumnName("sort_order");
        });

       

        modelBuilder.Entity<SinhVien>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.ToTable("sinh_vien");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.HoTen).HasColumnName("ho_ten");
            entity.Property(e => e.Email).HasColumnName("email");
            entity.Property(e => e.MatKhau).HasColumnName("mat_khau");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Id);
            entity.ToTable("users");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Username).HasColumnName("username");
            entity.Property(e => e.Password).HasColumnName("password");
            entity.Property(e => e.Role).HasColumnName("role");
        });


        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}