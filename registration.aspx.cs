using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Authenticate
{
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCountryCode.Items.Add("+91");
                ddlCountryCode.Items.Add(new ListItem("India (+91)", "+91"));
                ddlCountryCode.Items.Add(new ListItem("United States (+1)", "+1"));
                ddlCountryCode.Items.Add(new ListItem("United Kingdom (+44)", "+44"));
                ddlCountryCode.Items.Add(new ListItem("Australia (+61)", "+61"));
            }

            ddlCountryCode.AutoPostBack = true;
        }
        protected void ddlCountryCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Leave empty
        }
        protected void btnregister_Click(object sender, EventArgs e)
        {
            string name = tbname.Text;
            string code = ddlCountryCode.SelectedValue;
            string phone = tbphone.Text;
            string email = tbemail.Text;
            string password = tbpass.Text;

            if (string.IsNullOrEmpty(password))
            {
                Response.Write("<script>alert('Please enter a password');</script>");
                return;
            }

            // Hash password
            string hashedPassword = Convert.ToBase64String(
                System.Security.Cryptography.SHA256.Create()
                .ComputeHash(System.Text.Encoding.UTF8.GetBytes(password))
            );

            SqlConnection con = new SqlConnection("data source = LOGESHWARAN\\SQLEXPRESS ; initial catalog = createusers ; integrated security = sspi ");
            SqlCommand checkEmail = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Email=@e", con);
            checkEmail.Parameters.AddWithValue("@e", email);

            con.Open();
            int emailCount = (int)checkEmail.ExecuteScalar();

            if (emailCount > 0)
            {
                Response.Write("<script>alert('Email already exists! Login instead.');</script>");
                con.Close();
                return;
            }

            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Users (FullName, CountryCode, PhoneNumber, Email, PasswordHash) VALUES (@n, @c, @p, @e, @pw)", con);

            cmd.Parameters.AddWithValue("@n", name);
            cmd.Parameters.AddWithValue("@c", code);
            cmd.Parameters.AddWithValue("@p", phone);
            cmd.Parameters.AddWithValue("@e", email);
            cmd.Parameters.AddWithValue("@pw", hashedPassword);

            cmd.ExecuteNonQuery();
            con.Close();

            Response.Write("<script>alert('Registration Successful! Please Login.');window.location='Login.aspx';</script>");
        }


    }
}
