using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class masterlibrary : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            HyperLink1.Text = "Home " + HttpContext.Current.User.Identity.Name;
            HyperLink1.NavigateUrl = "HomeUser.aspx";
        }
        else
        {
            HyperLink1.Text = "Home";
            HyperLink1.NavigateUrl = "Home.aspx";
        }
    }
}
