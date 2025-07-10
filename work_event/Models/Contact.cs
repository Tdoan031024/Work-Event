using System.ComponentModel.DataAnnotations;

namespace work_event.Models;

public partial class Contact
{
    public int Id { get; set; }

    [Required(ErrorMessage = "Vui lòng nhập họ và tên")]
    public string FullName { get; set; } = null!;

    [Required(ErrorMessage = "Vui lòng nhập tên công ty/doanh nghiệp/trường học")]
    public string Organization { get; set; } = null!;

    [Required(ErrorMessage = "Vui lòng nhập email")]
    [EmailAddress(ErrorMessage = "Email không hợp lệ")]
    public string Email { get; set; } = null!;

    [Required(ErrorMessage = "Vui lòng nhập phương thức liên hệ")]
    public string ContactMethod { get; set; } = null!;

    [Required(ErrorMessage = "Vui lòng nhập nội dung")]
    public string Message { get; set; } = null!;
}