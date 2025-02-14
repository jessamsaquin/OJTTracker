<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OJTTracker.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="login.css" />
    <style type="text/css">
        .auto-style1 {
            width: 83px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Left Side (Login Form) -->
        <div class="login-section">
            <form id="form1" runat="server">
                <h2>🔐 Login</h2>
                <table>
                    <tr>
                        <td class="auto-style1"><asp:Label ID="txtUsernamelbl" runat="server" Text="Username: "></asp:Label></td> </tr>
                        <tr><td><asp:TextBox ID="username" runat="server"></asp:TextBox></td></tr>
                   
                    <tr>
                        <td class="auto-style1"><asp:Label ID="txtPasswordlbl" runat="server" Text="Password: "></asp:Label></td></tr>
                        <tr><td><asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Loginbtn" runat="server" CssClass="btn" Text="Log in" OnClick="Loginbtn_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Errorlabel" runat="server" CssClass="error" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
            </form>
        </div>

        <!-- Right Side (Image) -->
        <div class="image-section">
            <asp:Image ID="Image1" runat="server" ImageUrl="Images/bgbg.jpg" Width="450px"  />
        </div>
    </div>
</body>
</html>
