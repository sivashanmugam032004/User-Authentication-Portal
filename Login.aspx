<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Authenticate.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
    html, body {
        height: 100%;
        margin: 0;
    }

    body {
        background-image: url('images/sample.jpg.png'); /* <-- YOUR IMAGE HERE */
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
        <div class="center-container">
    <div class="login-box">

        <h2 style="text-align:center;">Login</h2>

        Email:
        <asp:TextBox ID="tbemail" runat="server"></asp:TextBox>
        
        Password:
        <asp:TextBox ID="tbpass" runat="server" ></asp:TextBox>
        

        <asp:LinkButton ID="lnkForgot" runat="server" Text="Forgot Password?" OnClick="lnkForgot_Click" ForeColor="Blue"></asp:LinkButton>


        <asp:Button ID="btnlogin" runat="server" Text="Login" BackColor="#3333FF" ForeColor="White" OnClick="btnlogin_Click" Style="cursor:pointer" />
        <br />
        Don't have an account? <asp:LinkButton ID="link" runat="server" Text="Register" OnClick="link_Click" Style="cursor:pointer" ></asp:LinkButton>


    </div>
</div>
    </form>
</body>
</html>
