<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="OJTTracker.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="AdminDashboard.css" />
    <title>Admin Dashboard</title>

    <style type="text/css">
        
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
