<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="OJTTracker.UserDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
            width: 90%;
            max-width: 600px;
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
            width: 100%;
            margin-bottom: 20px;
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
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .button-container input {
            flex: 1 1 40%;
            min-width: 120px;
            margin: 5px;
        }
        .btn {
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-green { background-color: green; }
        .btn-yellow { background-color: orange; }
        .btn-blue { background-color: blue; }
        .btn-red { background-color: red; }
        .btn-green:hover { background-color: darkgreen; }
        .btn-yellow:hover { background-color: darkorange; }
        .btn-blue:hover { background-color: darkblue; }
        .btn-red:hover { background-color: darkred; }
        .table-container {
            width: 100%;
            overflow-x: auto;
        }
        table {
            width: 100%;
            min-width: 500px;
            border-collapse: collapse;
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
    <div class="profile">
            <div class="user-prof">
                <asp:Image ID="Image1" runat="server" />
                <asp:Label ID="lblProfilename" runat="server" Text=""></asp:Label>
    </div>
    </div>

    <form id="form1" runat="server">
        
        
        <div class="container">
            <h2>⏳ Time Tracking Dashboard</h2>
            
            <!-- Total Hours Worked -->
            <div class="card">
                <div class="card-header">Total Hours Worked</div>
                <h3 style="color: #007bff; font-weight: bold;">
                    <asp:Label ID="lblTotalHours" runat="server" Text="0 hrs"></asp:Label>
                </h3>
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
