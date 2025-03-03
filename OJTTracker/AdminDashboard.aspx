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
            padding: 10px 20px;
            background-color: #3d3b68;
            border-radius: 6px;
            color: white;
            border-radius: 4px;
            text-decoration: none;
            margin-bottom: 25px;
            border: none;
            transition: background-color 0.3s, transform 0.2s;
            font-weight: 500;
        }

            .btn:hover {
                background-color: #2e2c50;
            transform: translateY(-2px);
            }
            .btn:active {
            transform: translateY(0);
        }

            .popup-container {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 5px;
            border-radius: 8px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.2);
            z-index: 1000;
            width: 80%;
            max-width: 400px;
        }
            .popup-container h3 {
            text-align: center;
            margin-bottom: 10px;
            color: #3d3b68;
        }

        .form-control {
            width:90%;
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            background-color: lightgray;
        }

        .form-control:focus {
            outline: none;
            border-color: #3d3b68;
            box-shadow: 0 0 0 2px rgba(61, 59, 104, 0.2);
        }

        .popup-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .popup-buttons .btn {
            width: 48%;
            text-align: center;
        }

        #gvInterns {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            border-radius: 8px;
            overflow: hidden;
        }

        #gvInterns th {
            background-color: #3d3b68;
            color: white;
            padding: 12px 15px;
            text-align: left;
        }

        #gvInterns td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
        }

        #gvInterns tr:last-child td {
            border-bottom: none;
        }

        #gvInterns tr:hover {
            background-color: #f9f9f9;
        }

        @media (max-width: 768px) {
            .stats {
                flex-direction: column;
            }
            
            
            .box {
                margin-bottom: 15px;
                width: 80%;
                margin: 0 auto;
            }
            
            .popup-container {
                width: 95%;
                padding: 15px;
            }
            
            #gvInterns {
                font-size: 14px;
            }
            
            #gvInterns th, #gvInterns td {
                padding: 8px;
            }
        }

        @media (max-width: 480px) {
            .header-section {
                flex-direction: column;
                text-align: center;
            }
            
            .user-prof {
                flex-direction: column;
            }
            
            .left-side, .right-side {
                margin-bottom: 10px;
            }
            
            .container {
                padding: 0 10px;
            }
            
            h2 {
                font-size: 20px;
            }
            .box{
                max-width: 80%;
                
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
                    <asp:LinkButton ID="Logout" runat="server" Text="Logout" class="logout-label" OnClick="LblLogout"></asp:LinkButton>
                </div>
            </div>
        </div>

        <div class="container">
            <h2>Admin Dashboard</h2>

            <div class="stats">
                <div class="box">
                    <h3>Total Interns</h3>
                    <asp:Label ID="lblTotalInterns" runat="server" Text="0" style="color: blue; font-weight: bold;"></asp:Label>
                </div>
                <div class="box">
                    <h3>Active Interns</h3>
                    <asp:Label ID="lblActiveInterns" runat="server" Text="0" style="color: green; font-weight: bold;"></asp:Label>
                </div>
                <div class="box">
                    <h3>Total Logs</h3>
                    <asp:Label ID="lblTotalLogs" runat="server" Text="0" style="color: red; font-weight: bold;"></asp:Label>
                </div>
            </div>

            
            <asp:LinkButton ID="btnAddNew" runat="server" Text="Add New Intern" class="btn" OnClick="AddNewbtn"></asp:LinkButton>
               

            
            <asp:Panel ID="Popuppnl" runat="server" CssClass="popup-container" BorderStyle="Solid" Visible="false">
                <h3>Add New Intern</h3>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Enter Name"></asp:TextBox><br />
                
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Enter Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator> <br />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                    ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                    ErrorMessage="Please enter a valid email address" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" Placeholder="Enter Password" TextMode="Password"></asp:TextBox><br />
                
                <asp:CheckBox ID="chkShowPassword" runat="server" AutoPostBack="true" OnCheckedChanged="chkShowPasswordchange" Text="Show Password" />
                <br />
                

                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                    <asp:ListItem Text="User" Value="User"></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" />
            </asp:Panel>



            <!-- Edit Intern Popup -->
            <asp:Panel ID="EditPopupPanel" runat="server" CssClass="popup-container" BorderStyle="Solid" Visible="false">
                <h3>Edit Intern</h3>

                <!-- ID (Hidden) -->
                <asp:TextBox ID="txtEditUserID" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>

                <!-- Name -->
                <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control" Placeholder="Enter Name"></asp:TextBox><br />

                <!-- Email -->
                <asp:TextBox ID="txtEditEmail" runat="server" CssClass="form-control" Placeholder="Enter Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEditEmail" runat="server" ControlToValidate="txtEditEmail"
                    ErrorMessage="*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="revEditEmail" runat="server" ControlToValidate="txtEditEmail"
                    ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                    ErrorMessage="Please enter a valid email address" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                
                <!-- Password (Optional) -->
                <asp:TextBox ID="txtEditPassword" runat="server" CssClass="form-control" Placeholder="Enter New Password (leave blank to keep current)" TextMode="Password"></asp:TextBox><br />
                
                <!-- Role -->
                <asp:DropDownList ID="ddlEditRole" runat="server" CssClass="form-control">
                    <asp:ListItem Text="User" Value="User"></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                </asp:DropDownList>

                <!-- Buttons -->
                <div class="popup-buttons">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnCloseEdit" runat="server" Text="Close" CssClass="btn" OnClick="btnCloseEdit_Click" />
                </div>
            </asp:Panel>

            <h3>Intern List</h3>
            <asp:GridView ID="gvInterns" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID">
                <Columns>
                    <asp:BoundField DataField="UserID" HeaderText="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Role" HeaderText="Role" />
                    <asp:BoundField DataField="CreatedAt" HeaderText="Created Date" DataFormatString="{0:MMM dd, yyyy}" />

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <div class="action-links">
                                <asp:LinkButton ID="Editbtn" runat="server" Text="Edit" OnClick="EditIntern"></asp:LinkButton>
                                <asp:LinkButton ID="Delbtn" runat="server" Text="Delete" CssClass="delete-link" 
                                    OnClick="DeleteIntern" OnClientClick="return confirm('Are you sure you want to delete this intern?');"></asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

    </form>
</body>
</html>
