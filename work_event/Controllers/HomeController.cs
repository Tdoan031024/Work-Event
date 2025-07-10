using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using work_event.Models;
using System.Linq;

namespace work_event.Controllers
{
    public class HomeController : Controller
    {
        private readonly EventDbContext _context;

        public HomeController(EventDbContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public IActionResult Index()
        {
            var bannerSlides = _context.BannerSlides
                .Where(b => b.IsActive)
                .OrderBy(b => b.SortOrder)
                .ToList();

            var events = _context.Events
                .OrderBy(e => e.Schedule)
                .ToList();

            var featuredCompanies = _context.DoanhNghieps
                .Take(6)
                .ToList();

            var totalEvents = _context.Events.Count();
            var totalCompanies = _context.DoanhNghieps.Count();
            var totalJobs = _context.ViecLams.Count();
            var systemSettings = _context.SystemSettings.FirstOrDefault();

            var viewModel = new HomeViewModel
            {
                BannerSlides = bannerSlides,
                Events = events,
                FeaturedCompanies = featuredCompanies,
                TotalEvents = totalEvents,
                TotalCompanies = totalCompanies,
                TotalJobs = totalJobs,
                SystemSettings = systemSettings
            };

            return View(viewModel);
        }
    }

    public class HomeViewModel
    {
        public List<BannerSlide> BannerSlides { get; set; } = new List<BannerSlide>();
        public List<Event> Events { get; set; } = new List<Event>();
        public List<DoanhNghiep> FeaturedCompanies { get; set; } = new List<DoanhNghiep>();
        public int TotalEvents { get; set; }
        public int TotalCompanies { get; set; }
        public int TotalJobs { get; set; }
        public SystemSetting? SystemSettings { get; set; }
    }
}