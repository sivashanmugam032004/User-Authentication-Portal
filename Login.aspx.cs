using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Authenticate
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void link_Click(object sender, EventArgs e)
        {
            // Redirect to registration page
            Response.Redirect("registration.aspx");
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string email = tbemail.Text.Trim();
            string password = tbpass.Text.Trim();

            // CASE 1: Blank fields
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                Response.Write("<script>alert('Please enter Email and Password');</script>");
                return;
            }

            // Hash the entered password
            string hashedPassword = Convert.ToBase64String(
                System.Security.Cryptography.SHA256.Create()
                .ComputeHash(System.Text.Encoding.UTF8.GetBytes(password))
            );

            SqlConnection con = new SqlConnection("data source = LOGESHWARAN\\SQLEXPRESS ; initial catalog = createusers ; integrated security = sspi");

            try
            {
                con.Open();

                // 1️⃣ Check if email exists
                SqlCommand checkEmail = new SqlCommand("SELECT COUNT(*) FROM Users WHERE LOWER(Email)=LOWER(@e)", con);
                checkEmail.Parameters.AddWithValue("@e", email.Trim());
                int emailCount = (int)checkEmail.ExecuteScalar();

                if (emailCount == 0)
                {
                    // Email not registered
                    Response.Write("<script>alert('Account does not exist');</script>");
                    return;
                }

                // 2️⃣ Check if password matches
                SqlCommand cmd = new SqlCommand("SELECT FullName FROM Users WHERE LOWER(Email)=LOWER(@e) AND PasswordHash=@p", con);

                cmd.Parameters.AddWithValue("@e", email.Trim());
                cmd.Parameters.AddWithValue("@p", hashedPassword);

                object result = cmd.ExecuteScalar();

                if (result != null)
                {
                    // SUCCESS: Redirect to Home page
                    Session["FullName"] = result.ToString();
                    Response.Redirect("homepage.aspx");
                }
                else
                {
                    // Wrong password
                    Response.Write("<script>alert('Invalid Email or Password');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }

        protected void lnkForgot_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgetPassword.aspx");
        }
    }
}
