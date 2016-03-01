using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["uid"]!=null)
        {
            Label1.Text = "Your ID for Library is "+Request.QueryString["uid"].ToString()+". Please Login.";
        }
        else
        {
            Label1.Text = "";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string str = ConfigurationManager.ConnectionStrings["usersDatabase"].ToString();
        con = new SqlConnection(str);
        con.Open();

        SqlCommand cmd = new SqlCommand("select * from users where Username='"+TextBox1.Text+"'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if(dr.Read()== true)
        {
            if(TextBox2.Text==dr.GetString(5))
            {
                Label1.Text = "Login Success!";
                FormsAuthentication.SetAuthCookie(TextBox1.Text, true);
                Response.Redirect("HomeUser.aspx");
            }
            else
            {
                Label1.Text = "Wrong Password! Try again.";
            }
        }
        else
        {
            Label1.Text = "No user with this Username found. Please Register.";
        }
        con.Close();
    }
}