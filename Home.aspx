<%@ Page Title="" Language="C#" MasterPageFile="~/masterlibrary.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-md-12 text-center">
            <h1>SEARCH</h1>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4 text-center">
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            <div class="form-group-lg">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="radio radio-inline">
                    <asp:ListItem Value="ByTitle"><b>By Title&nbsp;&nbsp;&nbsp;&nbsp;</b></asp:ListItem>
                    <asp:ListItem Value="ByAuthor"><b>By Author</b></asp:ListItem>
                    <asp:ListItem Value="All"><b>All Books</b></asp:ListItem>
                    <asp:ListItem Value="Avaliable"><b>Avaliable Books</b></asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <br />
            <asp:LinkButton ID="Button1" runat="server" CssClass="btn btn-info btn-lg" OnClick="Button1_Click">Search <span class="glyphicon glyphicon-search"></span></asp:LinkButton>
        </div>
        <div class="col-md-4"></div>
    </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="BookID" CssClass="table table-hover table-bordered" OnPageIndexChanging="GridView1_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="BookID" HeaderText="BookID" InsertVisible="False" ReadOnly="True" SortExpression="BookID" />
            <asp:BoundField DataField="BookName" HeaderText="Book Name" SortExpression="BookName" />
            <asp:BoundField DataField="BookAuthor" HeaderText="Book Author" SortExpression="BookAuthor" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=RAJAT\SQLEXPRESS;Initial Catalog=Library;User ID=sa;Password=bl00dsql" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>

</asp:Content>

