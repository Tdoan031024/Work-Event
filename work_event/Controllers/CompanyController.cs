using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using work_event.Models;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;

namespace work_event.Controllers
{
    public class CompanyController : Controller
    {
        private readonly EventDbContext _context;

        public CompanyController(EventDbContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        // GET: /Companies
        public async Task<IActionResult> Index(string search = "", int? linhVuc = null, string quyMo = "", int page = 1, int pageSize = 6)
        {
            var query = _context.DoanhNghieps
                .Include(d => d.LinhVuc)
                .AsQueryable();

            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(d => d.TenCongTy.Contains(search));
            }
            if (linhVuc.HasValue)
            {
                query = query.Where(d => d.LinhVucId == linhVuc);
            }
            if (!string.IsNullOrEmpty(quyMo))
            {
                query = query.Where(d => d.QuyMo == quyMo);
            }

            query = query.OrderBy(d => d.TenCongTy);

            var totalCompanies = await query.CountAsync();
            var companies = await query
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            ViewBag.LinhVucList = await _context.LinhVucs.OrderBy(l => l.TenLinhVuc).ToListAsync();
            ViewBag.Search = search;
            ViewBag.LinhVuc = linhVuc;
            ViewBag.QuyMo = quyMo;
            ViewBag.TotalPages = (int)Math.Ceiling((double)totalCompanies / pageSize);
            ViewBag.CurrentPage = page;

            return View(companies);
        }

        // GET: /Companies/View/{id}
        public async Task<IActionResult> View(int id)
        {
            var company = await _context.DoanhNghieps
                .Include(d => d.LinhVuc)
                .FirstOrDefaultAsync(d => d.Id == id);

            if (company == null)
            {
                return NotFound();
            }

            var jobs = await _context.ViecLams
                .Where(v => v.DoanhNghiepId == id)
                .OrderByDescending(v => v.NgayTao)
                .ToListAsync();

            ViewBag.Jobs = jobs;
            return View(company);
        }

        // GET: /Companies/ViewJob/{id}
        [Authorize]
        public async Task<IActionResult> ViewJob(int id)
        {
            var userRole = User.IsInRole("DoanhNghiep") ? "doanh_nghiep" : User.IsInRole("SinhVien") ? "sinh_vien" : null;
            if (userRole == null)
            {
                TempData["ErrorMessage"] = "Vui lòng đăng nhập để xem chi tiết việc làm.";
                return RedirectToAction("Login", "Account");
            }

            var doanhNghiepId = userRole == "doanh_nghiep" ? int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "0") : (int?)null;

            var job = await _context.ViecLams
                .Where(v => v.Id == id && (doanhNghiepId == null || v.DoanhNghiepId == doanhNghiepId))
                .FirstOrDefaultAsync();

            if (job == null)
            {
                return NotFound();
            }

            ViewBag.UserRole = userRole;
            return View(job);
        }

        // GET: /Companies/AddJob
        [Authorize(Roles = "DoanhNghiep")]
        public IActionResult AddJob()
        {
            return View(new ViecLam { HanNop = DateTime.Today.AddDays(30), SoLuong = 1, TrangThai = true });
        }

        // POST: /Companies/AddJob
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "DoanhNghiep")]
        public async Task<IActionResult> AddJob(ViecLam job)
        {
            if (!ModelState.IsValid)
            {
                return View(job);
            }

            var userId = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "0");
            job.DoanhNghiepId = userId;
            job.NgayTao = DateTime.Now;

            _context.ViecLams.Add(job);
            await _context.SaveChangesAsync();
            TempData["SuccessMessage"] = "Thêm việc làm thành công.";
            return RedirectToAction("Profile", "Account");
        }

        // GET: /Companies/EditJob/{id}
        [Authorize(Roles = "DoanhNghiep")]
        public async Task<IActionResult> EditJob(int id)
        {
            var userId = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "0");
            var job = await _context.ViecLams
                .Where(v => v.Id == id && v.DoanhNghiepId == userId)
                .FirstOrDefaultAsync();

            if (job == null)
            {
                return NotFound();
            }

            return View(job);
        }

        // POST: /Companies/EditJob/{id}
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "DoanhNghiep")]
        public async Task<IActionResult> EditJob(int id, ViecLam job)
        {
            if (id != job.Id)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return View(job);
            }

            var userId = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "0");
            var existingJob = await _context.ViecLams
                .Where(v => v.Id == id && v.DoanhNghiepId == userId)
                .FirstOrDefaultAsync();

            if (existingJob == null)
            {
                return NotFound();
            }

            existingJob.TieuDe = job.TieuDe;
            existingJob.MoTa = job.MoTa;
            existingJob.YeuCau = job.YeuCau;
            existingJob.ChuyenNganh = job.ChuyenNganh;
            existingJob.KinhNghiem = job.KinhNghiem;
            existingJob.DiaDiem = job.DiaDiem;
            existingJob.Luong = job.Luong;
            existingJob.HanNop = job.HanNop;
            existingJob.SoLuong = job.SoLuong;
            existingJob.TrangThai = job.TrangThai;

            await _context.SaveChangesAsync();
            TempData["SuccessMessage"] = "Cập nhật việc làm thành công.";
            return RedirectToAction("Profile", "Account");
        }

        // POST: /Companies/DeleteJob/{id}
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "DoanhNghiep")]
        public async Task<IActionResult> DeleteJob(int id)
        {
            var userId = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier)?.Value ?? "0");
            var job = await _context.ViecLams
                .Where(v => v.Id == id && v.DoanhNghiepId == userId)
                .FirstOrDefaultAsync();

            if (job == null)
            {
                TempData["ErrorMessage"] = "Không tìm thấy việc làm hoặc bạn không có quyền xóa.";
                return RedirectToAction("Profile", "Account");
            }

            _context.ViecLams.Remove(job);
            await _context.SaveChangesAsync();
            TempData["SuccessMessage"] = "Xóa việc làm thành công.";
            return RedirectToAction("Profile", "Account");
        }
    }
}