using System;
using System.Collections.Generic;

namespace work_event.Models;

public partial class DoanhNghiep
{
    public int Id { get; set; }
    public string TenCongTy { get; set; } = null!;
    public string DiaChi { get; set; } = null!;
    public string Email { get; set; } = null!;
    public string MatKhau { get; set; } = null!;
    public string SoDienThoai { get; set; } = null!;
    public string? MoTa { get; set; }
    public string? Logo { get; set; }
    public string? QuyMo { get; set; }
    public string? Website { get; set; }
    public int? LinhVucId { get; set; }
    public DateTime NgayTao { get; set; } // Sử dụng DateTime
    public virtual LinhVuc? LinhVuc { get; set; }
    public virtual ICollection<ViecLam> ViecLams { get; set; } = new List<ViecLam>();
}