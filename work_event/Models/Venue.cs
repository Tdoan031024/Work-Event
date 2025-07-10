using System.Collections.Generic;

namespace work_event.Models;

public partial class Venue
{
    public int Id { get; set; }
    public string Venue1 { get; set; } = null!;
    public string? Address { get; set; }
    public string? Description { get; set; }
    public double? Rate { get; set; } // Thay decimal? bằng double?
    public virtual ICollection<Event> Events { get; set; } = new List<Event>();
}