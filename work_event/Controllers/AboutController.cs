using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using work_event.Models;
using System.Linq;

namespace work_event.Controllers
{
    public class AboutController : Controller
    {
        private readonly EventDbContext _context;

        public AboutController(EventDbContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public IActionResult Index()
        {
            try
            {
                // Lấy thông tin hệ thống
                var systemSettings = _context.SystemSettings.FirstOrDefault() ?? new SystemSetting
                {
                    Name = "Event Management System",
                    Email = "email@default.com",
                    Contact = "+84 123 456 789",
                    AboutContent = "Nội dung giới thiệu mặc định"
                };

                // Lấy số doanh nghiệp
                var partnersCount = _context.DoanhNghieps.Count();

                // Lấy số sự kiện
                var projectsCount = _context.Events.Count();

                // Lấy số sinh viên
                var studentsCount = _context.SinhViens.Count();

                // Tính tỷ lệ thành công
                var successCount = _context.Events.Count(e => e.Type == true);
                var successRate = projectsCount > 0 ? (int)Math.Round((double)successCount / projectsCount * 100) : 0;

                // Tạo view model
                var viewModel = new AboutViewModel
                {
                    SystemSettings = systemSettings,
                    Stats = new StatsViewModel
                    {
                        StudentsCount = studentsCount,
                        PartnersCount = partnersCount,
                        ProjectsCount = projectsCount,
                        SuccessRate = successRate
                    }
                };

                return View(viewModel);
            }
            catch (Exception ex)
            {
                // Log lỗi
                Console.WriteLine($"Lỗi trong AboutController::Index: {ex.Message}");
                // Giá trị mặc định nếu lỗi
                var viewModel = new AboutViewModel
                {
                    SystemSettings = new SystemSetting
                    {
                        Name = "Event Management System",
                        Email = "email@default.com",
                        Contact = "+84 123 456 789",
                        AboutContent = "Nội dung giới thiệu mặc định"
                    },
                    Stats = new StatsViewModel
                    {
                        StudentsCount = 0,
                        PartnersCount = 0,
                        ProjectsCount = 0,
                        SuccessRate = 0
                    }
                };
                return View(viewModel);
            }
        }
    }

    public class AboutViewModel
    {
        public SystemSetting SystemSettings { get; set; } = null!;
        public StatsViewModel Stats { get; set; } = null!;
    }

    public class StatsViewModel
    {
        public int StudentsCount { get; set; }
        public int PartnersCount { get; set; }
        public int ProjectsCount { get; set; }
        public int SuccessRate { get; set; }
    }
}