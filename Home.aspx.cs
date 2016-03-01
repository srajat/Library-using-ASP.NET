using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if (Page.IsPostBack)
         {
            if (RadioButtonList1.SelectedValue == "All")
                SqlDataSource1.SelectCommand = "SELECT [BookID], [BookName], [BookAuthor] FROM [books]";
            else if (RadioButtonList1.SelectedValue == "ByTitle")
                SqlDataSource1.SelectCommand = "SELECT [BookID], [BookName], [BookAuthor] FROM [books] where BookName='" + TextBox1.Text + "'";
            else if (RadioButtonList1.SelectedValue == "ByAuthor")
                SqlDataSource1.SelectCommand = "SELECT [BookID], [BookName], [BookAuthor] FROM [books] where BookAuthor='" + TextBox1.Text + "'";
            else if (RadioButtonList1.SelectedValue == "Avaliable")
                SqlDataSource1.SelectCommand = "SELECT [BookID], [BookName], [BookAuthor] FROM [books] where ID=0";
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();

         }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "ByTitle")
        {
            SqlDataSource1.SelectCommand = "SELECT [BookID], [BookName], [BookAuthor] FROM [books] where BookName='"+TextBox1.Text+"'";
        }
        else if(RadioButtonList1.SelectedValue == "ByAuthor")
        {
            SqlDataSource1.SelectCommand = "SELECT [BookID], [BookName], [BookAuthor] FROM [books] where BookAuthor='" + TextBox1.Text + "'";
        }
        else if(RadioButtonList1.SelectedValue == "All")
        {
            SqlDataSource1.SelectCommand = "SELECT [BookID], [BookName], [BookAuthor] FROM [books]";
        }
        else if(RadioButtonList1.SelectedValue == "Avaliable")
        {
            SqlDataSource1.SelectCommand = "SELECT [BookID], [BookName], [BookAuthor] FROM [books] where ID=0";
        }
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(Object sender,GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}