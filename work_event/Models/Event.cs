using System;

namespace work_event.Models;

public partial class Event
{
    public int Id { get; set; }
    public int VenueId { get; set; }
    public string Event1 { get; set; } = null!;
    public string? Description { get; set; }
    public DateTime Schedule { get; set; }
    public bool Type { get; set; }
    public int? AudienceCapacity { get; set; }
    public bool PaymentType { get; set; }
    public double? Amount { get; set; } // Thay decimal? bằng double?
    public string? Banner { get; set; }
    public DateTime DateCreated { get; set; }
    public virtual Venue Venue { get; set; } = null!;
}