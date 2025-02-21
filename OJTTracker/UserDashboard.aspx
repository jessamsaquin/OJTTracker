<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="OJTTracker.UserDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="UserDashboard.css" />
    <title>User Dashboard</title>


    <style type="text/css">
       .auto-style1 {
        height: 35px;
        color: black;
        background-color: white;
        position:fixed;
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
    }
    .right-side {
        display: flex;
        align-items: center;
    }
    .logout-label {
        background-color: #3d3b68;
        color: white;
        padding: 5px 10px;
        cursor: pointer;
        border-radius: 10px;
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
            <h2>⏳ Time Tracking Dashboard</h2>

            <!-- Total Hours Worked -->
            <div class="card">
                <div class="card1">
                    <div class="card-header">Hours Today</div>
                    <h3 style="color: white; font-weight: bold;">
                        <asp:Label ID="lblTotalHours" runat="server" Text="0 hrs"></asp:Label>
                    </h3>
                </div>

                <div class="card2">
                    <div class="card-header">Total Hours</div>
                    <h3 style="color: white; font-weight: bold;">
                        <asp:Label ID="lblTotalHoursWorked" runat="server" Text="0 hrs"></asp:Label>
                    </h3>
                </div>
            </div>

            <!-- Time In/Out Buttons -->
            <div class="button-container">
                <asp:Button ID="btnTimeIn" runat="server" CssClass="btn btn-green" Text="🕒 Time In" OnClick="btnTimeIn_Click" />
                <asp:Button ID="btnBreakIn" runat="server" CssClass="btn btn-yellow" Text="☕ Break In" OnClick="btnBreakIn_Click" />
                <asp:Button ID="btnBreakOut" runat="server" CssClass="btn btn-blue" Text="🍽️ Break Out" OnClick="btnBreakOut_Click" />
                <asp:Button ID="btnTimeOut" runat="server" CssClass="btn btn-red" Text="🚪 Time Out" OnClick="btnTimeOut_Click" />
            </div>

            <!-- Time Log Table -->
            <div class="table-container">
                <asp:GridView ID="gvTimeLogs" runat="server" CssClass="table" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="TimeIn" HeaderText="Time In" />
                        <asp:BoundField DataField="BreakIn" HeaderText="Break In" />
                        <asp:BoundField DataField="BreakOut" HeaderText="Break Out" />
                        <asp:BoundField DataField="TimeOut" HeaderText="Time Out" />
                        <asp:BoundField DataField="TotalHours" HeaderText="Total Hours" />
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Message Label -->
            <div class="message">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
