<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OJTTracker.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <table>
                <tr>
                    <td>
                    <asp:Label ID="txtUsernamelbl" runat="server" Text="Username: "></asp:Label> 
                    </td>
                    <td colspan ="2">
                    <asp:TextBox ID="username" runat="server"></asp:TextBox>
                    </td></tr>
            
                 <tr>
                    <td>
                    <asp:Label ID="txtPasswordlbl" runat="server" Text="Password: "></asp:Label> 
                    </td>
                     <td colspan ="2">
                    <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                    </td>

                 </tr>
           
                <tr>   
                    <td >
                 
                    </td>
                    <td colspan ="3">
                    <asp:Button ID="Loginbtn" runat="server" Text="Log in" OnClick="Loginbtn_Click" />
                    </td> 

                </tr>
                <tr>   
                    <td >
                 
                    </td>
                    <td colspan ="3">
                        <asp:Label ID="Errorlabel" runat="server" Text=""></asp:Label>
                    </td> 

                </tr>
            </table>
        </div>
    </form>
</body>
</html>
