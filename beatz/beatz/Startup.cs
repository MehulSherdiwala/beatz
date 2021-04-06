using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(beatz.Startup))]
namespace beatz
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
