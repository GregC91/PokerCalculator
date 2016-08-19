using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PokerCalculator.Startup))]
namespace PokerCalculator
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
