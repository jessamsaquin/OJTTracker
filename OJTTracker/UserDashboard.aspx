<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="OJTTracker.UserDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 30px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            margin-bottom: 20px;
        }
        .card {
            width: 50%;
            margin: 0 auto 20px auto;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: white;
        }
        .card-header {
            background-color: #007bff;
            color: white;
            padding: 10px;
            font-size: 18px;
            font-weight: bold;
        }
        .button-container {
            margin-bottom: 20px;
        }
        .button-container input {
            padding: 10px 15px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-green { background-color: green; color: white; }
        .btn-yellow { background-color: orange; color: white; }
        .btn-blue { background-color: blue; color: white; }
        .btn-red { background-color: red; color: white; }
        .btn-green:hover { background-color: darkgreen; }
        .btn-yellow:hover { background-color: darkorange; }
        .btn-blue:hover { background-color: darkblue; }
        .btn-red:hover { background-color: darkred; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #333;
            color: white;
        }
        .message {
            color: red;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>⏳ Time Tracking Dashboard</h2>

            <!-- Total Hours Worked -->
            <div class="card">
                <div class="card-header">Total Hours Worked Today</div>
                <h3 style="color: #007bff; font-weight: bold;">
                    <asp:Label ID="lblTotalHours" runat="server" Text="0 hrs"></asp:Label>
                </h3>
            </div>

            <!-- Time In/Out Buttons -->
            <div class="button-container">
                <asp:Button ID="btnTimeIn" runat="server" CssClass="btn-green" Text="🕒 Time In" OnClick="btnTimeIn_Click" />
                <asp:Button ID="btnBreakIn" runat="server" CssClass="btn-yellow" Text="☕ Break In" OnClick="btnBreakIn_Click" />
                <asp:Button ID="btnBreakOut" runat="server" CssClass="btn-blue" Text="🍽️ Break Out" OnClick="btnBreakOut_Click" />
                <asp:Button ID="btnTimeOut" runat="server" CssClass="btn-red" Text="🚪 Time Out" OnClick="btnTimeOut_Click" />
            </div>

            <!-- Time Log Table -->
            <div class="card">
                <div class="card-header">⏱ Time Log History</div>
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
