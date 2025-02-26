<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="OJTTracker.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="AdminDashboard.css" />
    <title>Admin Dashboard</title>

    <style type="text/css">
        .btn {
            display: inline-block;
            padding: 8px 15px;
            background-color: #3d3b68;
            border-radius: 10px;
            color: white;
            border-radius: 4px;
            text-decoration: none;
            margin-bottom: 15px;
            border: none;
            cursor: pointer;
        }

            .btn:hover {
                opacity: 0.9;
            }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <div class="user-prof">
                <div class="left-side">
                    <asp:Image ID="Image1" runat="server" />
                    <asp:Label ID="lblProfilename" runat="server" Text=""></asp:Label>
                </div>
                <div class="right-side">
                    <asp:LinkButton ID="Logout" runat="server" Text="Logout" CssClass="logout-label" OnClick="LblLogout"></asp:LinkButton>
                </div>
            </div>
        </div>

        <div class="container">
            <h2>Admin Dashboard</h2>

            <div class="stats">
                <div class="box">
                    <h3>Total Interns</h3>
                    <asp:Label ID="lblTotalInterns" runat="server" Text="0"></asp:Label>
                </div>
                <div class="box">
                    <h3>Active Interns</h3>
                    <asp:Label ID="lblActiveInterns" runat="server" Text="0"></asp:Label>
                </div>
                <div class="box">
                    <h3>Total Logs</h3>
                    <asp:Label ID="lblTotalLogs" runat="server" Text="0"></asp:Label>
                </div>
            </div>


            <asp:LinkButton ID="btnAddNew" runat="server" Text="Add New Intern" class="btn" OnClick="AddNewbtn"></asp:LinkButton>

            <asp:Panel ID="Popuppnl" runat="server" CssClass="popup-container" BorderStyle="Solid" Visible="false">
                <h3>Add New Intern</h3>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Enter Name"></asp:TextBox><br />
                <br />
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Enter Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
    ErrorMessage="*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
    ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    ErrorMessage="Please enter a valid email address" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator><br />
                <br />
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" Placeholder="Enter Password" TextMode="Password"></asp:TextBox><br />
                <br />
                <asp:CheckBox ID="chkShowPassword" runat="server" AutoPostBack="true" OnCheckedChanged="chkShowPasswordchange" Text="Show Password" />
                <br />
                <br />

                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                    <asp:ListItem Text="User" Value="User"></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" />
            </asp:Panel>

            <h3>Intern List</h3>
            <asp:GridView ID="gvInterns" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="UserID" HeaderText="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="CreatedAt" HeaderText="Status" />
                </Columns>
            </asp:GridView>
        </div>

    </form>
</body>
</html>
