using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(falabellaSeguros.Startup))]
namespace falabellaSeguros
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
