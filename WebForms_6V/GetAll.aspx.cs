using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForms_6V
{
    public partial class GetAll : System.Web.UI.Page
    {

        SqlConnection SqlConnection = new SqlConnection(@"Data Source=ZEROBOOK\SQLEXPRESS;Initial Catalog=WeFormsDb;Integrated Security=True;Encrypt=False");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllStudentDetails();
            }
        }

        protected void GetAllStudentDetails()
        {


            using (SqlCommand cmd = new SqlCommand("exec GetAllStudents", SqlConnection))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            } // SqlCommand will be disposed automatically

            // Connection will be closed automatically when leaving the 'using' block

        }



        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}