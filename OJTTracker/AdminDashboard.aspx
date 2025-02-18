<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="OJTTracker.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css" href="admindashboard.css" />
    <title>Admin Dashbaord</title>
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
        <asp:LinkButton ID="Logout" runat="server" Text="Logout" CssClass="logout-label" ></asp:LinkButton>
        
</div>
    </div>
  </div>

        <div>

            <asp:Label ID="Label1" runat="server" Text="Label">Admin Dashboard</asp:Label>



        </div>
    </form>
</body>
</html>
