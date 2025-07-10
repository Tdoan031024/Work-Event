using System;

namespace work_event.Models;

public partial class ViecLam
{
    public int Id { get; set; }
    public int DoanhNghiepId { get; set; }
    public string TieuDe { get; set; } = null!;
    public string MoTa { get; set; } = null!;
    public string? YeuCau { get; set; }
    public string ChuyenNganh { get; set; } = null!;
    public string KinhNghiem { get; set; } = null!;
    public string DiaDiem { get; set; } = null!;
    public string? Luong { get; set; }
    public DateTime? HanNop { get; set; } // Sử dụng DateTime?
    public int SoLuong { get; set; }
    public bool TrangThai { get; set; }
    public DateTime NgayTao { get; set; } // Sử dụng DateTime
    public virtual DoanhNghiep DoanhNghiep { get; set; } = null!;
}