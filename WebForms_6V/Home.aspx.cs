using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebForms_6V.Master
{
    public partial class Home : System.Web.UI.Page
    {

        SqlConnection SqlConnection = new SqlConnection(@"Data Source=ZEROBOOK\SQLEXPRESS;Initial Catalog=WeFormsDb;Integrated Security=True;Encrypt=False");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["id"] != null && Request.Cookies["name"] != null)
                {
                    TextBox1.Text = Request.Cookies["id"].Value;

                    TextBox2.Text = Request.Cookies["name"].Value;
                }
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

            SqlConnection.Open();
            int id = int.Parse(TextBox1.Text);
            String name=TextBox2.Text;
            SqlCommand cmd = new SqlCommand("Select * from Student Where StudentId= '" + id + "' and StudentName='" + name + "'", SqlConnection);

            var result=cmd.ExecuteReader();
            if (result.HasRows)
            {
                Session["user"] = TextBox1.Text;
                Session["password"] = TextBox2.Text;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Login successfull');", true);

                if (CheckBox1.Checked)
                {
                    Response.Cookies["id"].Value = TextBox1.Text;
                    Response.Cookies["name"].Value = TextBox2.Text;
                    Response.Cookies["id"].Expires = DateTime.Now.AddMinutes(1);
                    Response.Cookies["name"].Expires = DateTime.Now.AddMinutes(1);

                }
                else
                {
                    Response.Cookies["id"].Expires = DateTime.Now.AddMinutes(-1);
                    Response.Cookies["name"].Expires = DateTime.Now.AddMinutes(-1);
                }
                Response.Write("Login Successfull");
                Response.Redirect("Default.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Login Failed...!');", true);
                //cmd.Parameters.AddWithValue("@StudentId",id); 
            }  
        
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}