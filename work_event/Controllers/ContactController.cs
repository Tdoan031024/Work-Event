using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using work_event.Models;
using System.Threading.Tasks;

namespace work_event.Controllers
{
    public class ContactController : Controller
    {
        private readonly EventDbContext _context;

        public ContactController(EventDbContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public IActionResult Index()
        {
            var systemSettings = _context.SystemSettings.FirstOrDefault() ?? new SystemSetting
            {
                Name = "Event Management System",
                Email = "iec@huit.edu.vn",
                Contact = "0963 621 124",
                AboutContent = "Nội dung giới thiệu mặc định"
            };

            var viewModel = new ContactViewModel
            {
                SystemSettings = systemSettings,
                Contact = new Contact()
            };

            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Submit(ContactViewModel viewModel)
        {
            if (!ModelState.IsValid)
            {
                viewModel.SystemSettings = _context.SystemSettings.FirstOrDefault() ?? new SystemSetting
                {
                    Name = "Event Management System",
                    Email = "iec@huit.edu.vn",
                    Contact = "0963 621 124",
                    AboutContent = "Nội dung giới thiệu mặc định"
                };
                return View("Index", viewModel);
            }

            try
            {
                var contact = new Contact
                {
                    FullName = viewModel.Contact.FullName,
                    Organization = viewModel.Contact.Organization,
                    Email = viewModel.Contact.Email,
                    ContactMethod = viewModel.Contact.ContactMethod,
                    Message = viewModel.Contact.Message
                };

                _context.Contacts.Add(contact);
                await _context.SaveChangesAsync();

                return RedirectToAction("Success");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Lỗi khi lưu liên hệ: {ex.Message}");
                ModelState.AddModelError("", "Có lỗi xảy ra khi gửi thông tin. Vui lòng thử lại.");
                viewModel.SystemSettings = _context.SystemSettings.FirstOrDefault() ?? new SystemSetting
                {
                    Name = "Event Management System",
                    Email = "iec@huit.edu.vn",
                    Contact = "0963 621 124",
                    AboutContent = "Nội dung giới thiệu mặc định"
                };
                return View("Index", viewModel);
            }
        }

        public IActionResult Success()
        {
            return View();
        }
    }

    public class ContactViewModel
    {
        public SystemSetting SystemSettings { get; set; } = null!;
        public Contact Contact { get; set; } = null!;
    }
}