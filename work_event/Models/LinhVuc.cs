using System;
using System.Collections.Generic;

namespace work_event.Models;

public partial class LinhVuc
{
    public int Id { get; set; }

    public string TenLinhVuc { get; set; } = null!;

    public string? MoTa { get; set; }

    public virtual ICollection<DoanhNghiep> DoanhNghieps { get; set; } = new List<DoanhNghiep>();
}
