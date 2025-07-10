namespace work_event.Models;

public partial class SystemSetting
{
    public int Id { get; set; }
    public string Name { get; set; } = null!;
    public string? Email { get; set; }
    public string? Contact { get; set; }
    public string? CoverImg { get; set; }
    public string? AboutContent { get; set; }
}