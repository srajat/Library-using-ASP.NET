 <%@ Page Title="" Language="C#" MasterPageFile="~/masterlibrary.master" AutoEventWireup="true" CodeFile="HomeUser.aspx.cs" Inherits="HomeUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div class="row">
        <div class="col-md-3">
            <div class="list-group">
                <asp:linkbutton ID="LinkButton1" runat="server" class="list-group-item list-group-item-info" OnClick="LinkButton1_Click">My Books</asp:linkbutton>
                <asp:linkbutton ID="LinkButton2" runat="server" class="list-group-item list-group-item-info" OnClick="LinkButton2_Click">Issue Book</asp:linkbutton>
                <asp:linkbutton ID="LinkButton3" runat="server" class="list-group-item list-group-item-info" OnClick="LinkButton3_Click">Return Book</asp:linkbutton>
                <asp:linkbutton ID="LinkButton4" runat="server" class="list-group-item list-group-item-info" OnClick="LinkButton4_Click">Search Books</asp:linkbutton>
            </div>
        </div>
        <div class="col-md-9">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True"  AutoGenerateColumns="False" DataKeyNames="BookID" CssClass="table table-hover table-bordered" OnPageIndexChanging="GridView1_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="BookID" HeaderText="BookID" InsertVisible="False" ReadOnly="True" SortExpression="BookID" />
                        <asp:BoundField DataField="BookName" HeaderText="Book Name" SortExpression="BookName" />
                        <asp:BoundField DataField="BookAuthor" HeaderText="Book Author" SortExpression="BookAuthor" />
                    </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerSettings Mode="NextPreviousFirstLast" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    <asp:Label ID="Label1" runat="server" Text="" CssClass="text-primary alert alert-danger text-center text-capitalize"></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=RAJAT\SQLEXPRESS;Initial Catalog=Library;User ID=sa;Password=bl00dsql" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="form-group text-center">
                        <label for="TextBox1" class="control-label">Enter Book ID:</label>
                        <br />
                        <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* The Input must be a number" CssClass="alert-danger" ValidationExpression="^(0|[1-9][0-9]*)$"></asp:RegularExpressionValidator>
                        <br />
                        <asp:LinkButton ID="LinkButton5" runat="server" class="btn btn-primary btn-lg" OnClick="LinkButton5_Click">Issue <span class="glyphicon glyphicon-credit-card"></span></asp:LinkButton>
                    </div>
                    <asp:Label ID="Label2" runat="server" Text="" CssClass="text-primary alert alert-danger text-center text-capitalize"></asp:Label>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <div class="form-group text-center">
                        <label for="TextBox2" class="control-label">Enter Book ID:</label>
                        <br />
                        <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="* The Input must be a number" CssClass="alert-danger" ValidationExpression="^(0|[1-9][0-9]*)$"></asp:RegularExpressionValidator>
                        <br />
                        <asp:LinkButton ID="LinkButton6" runat="server" class="btn btn-primary btn-lg" OnClick="LinkButton6_Click">Return <span class="glyphicon glyphicon-eject"></span></asp:LinkButton>
                    </div>
                    <asp:Label ID="Label3" runat="server" Text="" CssClass="text-primary alert alert-danger text-center text-capitalize"></asp:Label>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>

