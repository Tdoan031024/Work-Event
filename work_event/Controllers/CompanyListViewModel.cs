using System;

namespace work_event.Models
{
    public class CompanyListViewModel
    {
        public int Id { get; set; }
        public string TenCongTy { get; set; }
        public string DiaChi { get; set; }
        public string Email { get; set; }
        public string SoDienThoai { get; set; }
        public string? Logo { get; set; }
        public string? QuyMo { get; set; }
        public string? Website { get; set; }
        public string? LinhVuc { get; set; }
    }
}
