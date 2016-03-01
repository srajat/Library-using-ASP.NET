<%@ Page Title="" Language="C#" MasterPageFile="~/masterlibrary.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-md-4">
            <h3 class="page-header">Register here</h3>
            <div class="form-group">
                <label class="control-label" for="TextBox1">Name</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Rajat"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="* Enter Name" CssClass="alert-danger"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label class="control-label" for="TextBox2">Email ID</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="rajat8171@gmail.com"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" CssClass="alert-danger" ErrorMessage="* Enter valid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label class="control-label" for="TextBox3">Mobile</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="8171359599"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" CssClass="alert-danger" ErrorMessage="* Enter valid Mobile Number" ValidationExpression="^[789]\d{9}$"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label class="control-label" for="TextBox4">Username</label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" CssClass="alert-danger" ErrorMessage="* Username Required"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label class="control-label" for="TextBox5">Password</label>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" type="password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5" CssClass="alert-danger" ErrorMessage="* Enter a Password"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox5" ControlToValidate="TextBox6" CssClass="alert-danger" ErrorMessage="* Passwords Do not match"></asp:CompareValidator>
            </div>
            <div class="form-group">
                <label class="control-label" for="TextBox6">Confirm Password</label>
                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" type="password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox6" CssClass="alert-danger" ErrorMessage="* Enter Confirm Password"></asp:RequiredFieldValidator>
            </div>
            <div class="text-center">
                <asp:LinkButton ID="Button1" runat="server" CssClass="btn btn-primary btn-lg" OnClick="Button1_Click">Submit <span class="glyphicon glyphicon-save"></span></asp:LinkButton>&nbsp;
                <asp:LinkButton ID="Button2" runat="server" class="btn btn-danger btn-lg" OnClick="Button2_Click" CausesValidation="False">Cancel <span class="glyphicon glyphicon-off"></span></asp:LinkButton>
            </div>
            <br />
        </div>
        <div class="col-md-8">
            
        </div>
    </div>

</asp:Content>

