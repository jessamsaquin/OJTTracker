<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="OJTTracker.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="AdminDashboard.css" />
    <title>Admin Dashboard</title>

    <style type="text/css">
        .auto-style1 {
            height: 35px;
            color: black;
            background-color: white;
            position: fixed;
            width: 100%;
            top: 0;
        }

        .user-prof {
            display: flex;
            justify-content: space-between; /* Place items on opposite ends */
            align-items: center;
            padding: 10px;
            background-color: #f1f1f1;
        }

        .left-side {
            display: flex;
            align-items: center;
            margin-left: 5%;
        }

        .right-side {
            display: flex;
            align-items: center;
            margin-right: 5%;
        }

        .logout-label {
            background-color: #3d3b68;
            color: white;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 10px;
            text-decoration: none;
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

    </form>
</body>
</html>
