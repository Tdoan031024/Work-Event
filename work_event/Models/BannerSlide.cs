using System;

namespace work_event.Models;

public partial class BannerSlide
{
    public int Id { get; set; }
    public string? Image { get; set; }
    public string? Title { get; set; }
    public string? Subtitle { get; set; }
    public string? ButtonText { get; set; }
    public string? ButtonLink { get; set; }
    public bool IsActive { get; set; }
    public int SortOrder { get; set; } // Thêm SortOrder
}