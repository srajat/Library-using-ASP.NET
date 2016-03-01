<%@ Page Title="" Language="C#" MasterPageFile="~/masterlibrary.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-md-4">
            <h3 class="page-header">Login</h3>
            <div class="form-group">
                <label class="control-label" for="TextBox1">Username</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="alert-danger" ErrorMessage="* Username Required"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label class="control-label" for="TextBox2">Password</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" type="password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" CssClass="alert-danger" ErrorMessage="* Password Required"></asp:RequiredFieldValidator>
            </div>
            <div class="text-center">
                <asp:LinkButton ID="Button1" runat="server" CssClass="btn btn-primary btn-lg" OnClick="Button1_Click">Login <span class="glyphicon glyphicon-log-in"></span></asp:LinkButton>&nbsp;
                <asp:LinkButton ID="Button2" runat="server" CssClass="btn btn-danger btn-lg">Cancel <span class="glyphicon glyphicon-off"></span></asp:LinkButton>
            </div>
            <br />
        </div>
        <div class="col-md-8 text-center">
            <br />
            <asp:Label ID="Label1" runat="server" Text="" CssClass="text-success bg-success"></asp:Label>
        </div>
    </div>

</asp:Content>

