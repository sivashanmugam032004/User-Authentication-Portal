<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Authenticate.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
        <title>New</title>

<style>
    html, body {
        height: 100%;
        margin: 0;
    }

    body {
        background-image: url('images/New registration1.png'); /* <-- YOUR IMAGE HERE */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }

    .center-container {
        height: 100vh; 
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .login-box {
        width: 300px;
        background: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0,0,0,0.4);
        display: flex;
        flex-direction: column;
        gap: 12px;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

               <div class="center-container">
       <div class="login-box">
    Name:<asp:TextBox ID="tbname" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvname" runat="server" ControlToValidate="tbname" Display="Dynamic" ErrorMessage="Enter an name" ForeColor="#CC0000">*This field is required</asp:RequiredFieldValidator>
    <br />
    Phone no: <div style="display:flex; gap:10px; align-items:center;">
           <asp:DropDownList ID="ddlCountryCode" runat="server" Width="50px" AutoPostBack="true" OnSelectedIndexChanged="ddlCountryCode_SelectedIndexChanged" style="height: 25px" > </asp:DropDownList>
              <asp:TextBox ID="tbphone" runat="server" Width="240px"></asp:TextBox>
              </div>
           <asp:RequiredFieldValidator ID="rfvnumber" runat="server" ControlToValidate="tbphone" Display="Dynamic" ErrorMessage="Enter a phone number" ForeColor="#CC0000">*Phone number is required</asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="revnumber" runat="server" ControlToValidate="tbphone" Display="Dynamic" ErrorMessage="Enter a phone number" ForeColor="#CC0000" ValidationExpression="^[6-9]\d{9}$">*Enter a phone number</asp:RegularExpressionValidator>
    <br />
    Email:<asp:TextBox ID="tbemail" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvmail" runat="server" ControlToValidate="tbemail" Display="Dynamic" ErrorMessage="Enter the email" ForeColor="#CC0000">*This field is required</asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="revmail" runat="server" ControlToValidate="tbemail" Display="Dynamic" ErrorMessage="Enter the email" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*This field is required</asp:RegularExpressionValidator>
    <br />
    Password:<asp:TextBox ID="tbpass" runat="server" TextMode="Password" ValidationGroup="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&amp;])[A-Za-z\d@$!%*?&amp;]{8,}$"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvpass" runat="server" ControlToValidate="tbpass" Display="Dynamic" ErrorMessage="Enter the password" ForeColor="#CC0000">*This field is required</asp:RequiredFieldValidator>
    <br />
   
    
    <asp:Button ID="btnregister" runat="server" Text="Register" OnClick="btnregister_Click"  Style="cursor:pointer" />
</div>
</div>

        </div>
    </form>
</body>
</html>
