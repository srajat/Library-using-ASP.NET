using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class HomeUser : System.Web.UI.Page
{
    static SqlConnection con;
    static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            string str = ConfigurationManager.ConnectionStrings["usersDatabase"].ToString();
            con = new SqlConnection(str);
            con.Open();
            string uname = HttpContext.Current.User.Identity.Name;

            SqlCommand cmd = new SqlCommand("select ID from users where Username='" + uname + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                id = dr.GetInt32(0);
            }
            con.Close();
        }
        Label3.Visible = false;
        Label2.Visible = false;
        Label1.Visible = false;
    }
    protected void GridView1_PageIndexChanging(Object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        
        SqlDataSource1.SelectCommand = "SELECT [BookID], [BookName], [BookAuthor] FROM [books] where ID="+id+"";
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();
        MultiView1.SetActiveView(View1);
        if(GridView1.Rows.Count == 0)
        {
            Label1.Text = "You have currently no books issued...";
            Label1.Visible = true;
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View3);
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        con.Open();
        
        SqlCommand checkbook = new SqlCommand("select [ID] from books where BookID="+TextBox1.Text+"",con);
        SqlDataReader dr = checkbook.ExecuteReader();
        int userID = 1;
        while (dr.Read())
        {
            userID = dr.GetInt32(0);
        }
        dr.Close();
        if (userID==0)
        {
            //avaliable to book
            SqlCommand updateuser = new SqlCommand("select NoOfBooks from users where ID=" + id.ToString() + "", con);
            SqlDataReader dw = updateuser.ExecuteReader();
            int book = 0;
            while (dw.Read())
            {
                book = dw.GetInt32(0);
            }
            dw.Close();
            book++;
            SqlCommand cmd2 = new SqlCommand("update users set NoOfBooks=" + book.ToString() + " where ID=" + id.ToString() + "", con);
            cmd2.ExecuteNonQuery();
            SqlCommand cmd3 = new SqlCommand("update books set ID="+id.ToString()+" where BookID="+TextBox1.Text+"",con);
            cmd3.ExecuteNonQuery();
            TextBox1.Text = "";
            con.Close();
        }
        else
        {
            //Not avaliable
            Label2.Text = "Already Booked or Invalid BookID!! Select another book...";
            Label2.Visible = true;
        }
       
        con.Close(); 
    }

    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        con.Open();
        
        SqlCommand checkbook = new SqlCommand("select [ID] from books where BookID=" + TextBox2.Text, con);
        SqlDataReader dr = checkbook.ExecuteReader();
        int userID = 0;
        while (dr.Read())
        {
            userID = dr.GetInt32(0);
        }
        dr.Close();
        if(userID==id)
        {
            //Returnable
            SqlCommand updateuser = new SqlCommand("select NoOfBooks from users where ID=" + id.ToString() + "", con);
            SqlDataReader dw = updateuser.ExecuteReader();
            int book = 0;
            while (dw.Read())
            {
                book = dw.GetInt32(0);
            }
            dw.Close();
            if(book>0)
            book--;
            SqlCommand cmd2 = new SqlCommand("update users set NoOfBooks=" + book.ToString() + " where ID=" + id.ToString() + "", con);
            cmd2.ExecuteNonQuery();
            SqlCommand cmd3 = new SqlCommand("update books set ID=0 where BookID=" + TextBox2.Text + "", con);
            cmd3.ExecuteNonQuery();
            TextBox2.Text = "";
            
        }
        else
        {
            //Booked to another or avaliable
            Label3.Text = "Return failed. Either this book is avaliable or booked to another person...";
            Label3.Visible = true;
        }
        con.Close();
    }
}