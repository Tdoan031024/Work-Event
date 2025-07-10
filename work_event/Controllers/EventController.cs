using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using work_event.Models;
using System.Threading.Tasks;

namespace work_event.Controllers
{
    public class EventController : Controller
    {
        private readonly EventDbContext _context;

        public EventController(EventDbContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task<IActionResult> Index()
        {
            var events = await _context.Events
                .Include(e => e.Venue)
                .OrderBy(e => e.Schedule)
                .ToListAsync();
            return View(events);
        }

        public async Task<IActionResult> View(int id)
        {
            var evt = await _context.Events
                .Include(e => e.Venue)
                .FirstOrDefaultAsync(e => e.Id == id);
            if (evt == null)
            {
                return NotFound();
            }
            return View(evt);
        }

    }
}