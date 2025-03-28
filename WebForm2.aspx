<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="_2tfinalconnectivity.WebForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WebForm2</title>
    <style>
        .header, .footer {
            text-align: center;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            font-size: 20px;
            font-weight: bold;
        }
        .content {
            margin: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <asp:Panel ID="pnlHeader" runat="server" CssClass="header">
            
        </asp:Panel>

        <!-- Main Content -->
        <div class="content">
            <table border="1">
                <tr>
                    <td>Name:</td>
                    <td>
                        <asp:TextBox ID="txtunm" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td>
                        <asp:RadioButtonList ID="rdbgen" runat="server">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Hobbies:</td>
                    <td>
                        <asp:CheckBoxList ID="Chkhb" runat="server">
                            <asp:ListItem>Cricket</asp:ListItem>
                            <asp:ListItem>Volleyball</asp:ListItem>
                            <asp:ListItem>Football</asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td>
                        <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td>
                        <asp:TextBox ID="txtadd" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Country:</td>
                    <td>
                        <asp:DropDownList ID="ddlcountry" runat="server">
                            <asp:ListItem>USA</asp:ListItem>
                            <asp:ListItem>UK</asp:ListItem>
                            <asp:ListItem>India</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />
                    </td>
                </tr>
            </table>

            <br>

            <!-- GridView -->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="305px" Width="100%" 
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="auto-style1" 
                BackColor="#CC99FF" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="Label13" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="Label14" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <asp:Label ID="Label15" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hobbies">
                        <ItemTemplate>
                            <asp:Label ID="Label16" runat="server" Text='<%# Eval("Hobbies") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="Label17" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>
                            <asp:Label ID="Label18" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country">
                        <ItemTemplate>
                            <asp:Label ID="Label19" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edit">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <!-- Footer -->
        <asp:Panel ID="pnlFooter" runat="server" CssClass="footer">
            
        </asp:Panel>
    </form>
</body>
</html>
