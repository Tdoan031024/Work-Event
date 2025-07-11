using Microsoft.AspNetCore.Mvc;

namespace work_event.Controllers
{
    public class CvGuideController : Controller
    {
        public IActionResult Index()
        {
            // Nếu cần truyền dữ liệu cho View, thêm vào đây
            return View();
        }
    }
}
