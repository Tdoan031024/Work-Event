using Microsoft.EntityFrameworkCore;
using work_event.Models;

var builder = WebApplication.CreateBuilder(args);

// Đăng ký dịch vụ MVC
builder.Services.AddControllersWithViews();

// Đăng ký EventDbContext với SQL Server
builder.Services.AddDbContext<EventDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

var app = builder.Build();

// Cấu hình pipeline
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();