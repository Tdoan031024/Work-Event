using System;
using System.Collections.Generic;

namespace work_event.Models;

public partial class SinhVien
{
    public int Id { get; set; }

    public string HoTen { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string MatKhau { get; set; } = null!;

    public string? SoDienThoai { get; set; }

    public string? TruongHoc { get; set; }

    public string? ChuyenNganh { get; set; }

    public string? DiaChi { get; set; }

    public string? Avatar { get; set; }

    public string? CvPdf { get; set; }

    public DateTime NgayTao { get; set; }

    public DateTime NgayCapNhat { get; set; }

   
}
