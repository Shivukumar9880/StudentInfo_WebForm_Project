using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.IO;


namespace WebForms_6V
{
    public partial class _Default : Page
    {
        //
        SqlConnection SqlConnection = new SqlConnection(@"Data Source=ZEROBOOK\SQLEXPRESS;Initial Catalog=WeFormsDb;Integrated Security=True;Encrypt=False");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //GetAllStudentDetails();
            }

            if (Session["user"] != null)
            {

                string name = Session["password"].ToString();
                SqlConnection.Open();

                SqlCommand cmd = new SqlCommand(" exec SearchStudentByName '" + name + "'", SqlConnection);
                //cmd.Parameters.AddWithValue("@StudentId",id); 
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }

        //  String ConnectionString = "@Data Source=ZEROBOOK\\SQLEXPRESS;Initial Catalog=WeFormsDb;Integrated Security=True;Encrypt=False;Trust Server Certificate=True";

        //protected void GetAllStudentDetails()
        //{


        //        using (SqlCommand cmd = new SqlCommand("exec GetAllStudents", SqlConnection))
        //        {
        //            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        //            DataTable dt = new DataTable();
        //            adapter.Fill(dt);
        //            GridView1.DataSource = dt;
        //            GridView1.DataBind();
        //        } // SqlCommand will be disposed automatically

        //        // Connection will be closed automatically when leaving the 'using' block

        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
          //  SqlConnection.Open();


            int stdid = int.Parse(TextBox2.Text);
            string name = TextBox3.Text;
            string Adress = TextBox4.Text;
            string email = TextBox5.Text;
            string branch = DropDownList1.SelectedValue;
            DateTime date = DateTime.Parse(TextBox6.Text);

            String imagePath = null;

            String path = Server.MapPath("Images/");

            if (FileUpload1.HasFile)
            {
                String filename = Path.GetFileName(FileUpload1.FileName);
                String extention = Path.GetExtension(filename);
                HttpPostedFile postedFile = FileUpload1.PostedFile;

                int length = postedFile.ContentLength;

                if (extention.ToLower() == ".jpg" || extention.ToLower() == ".png" || extention.ToLower() == ".jpeg")
                {
                    FileUpload1.SaveAs(path+filename);
                    imagePath = "Images/" + filename;
                }
                else
                {
                    Label1.Text = "Image Format Not Supported";
                    Label1.ForeColor = Color.Red;
                    Label1.Visible = true;
                }
            } 
            else
            { 
             Label1.Text = "Please Upload An image";
                Label1.ForeColor = Color.Red;
                Label1.Visible = true;
            }

            SqlCommand cmd = new SqlCommand("InsertData", SqlConnection);
            cmd.CommandType = CommandType.StoredProcedure;

          

            // Use parameters to avoid SQL injection and handle data types correctly
            cmd.Parameters.AddWithValue("@StudentId", stdid);
            cmd.Parameters.AddWithValue("@StudentName", name);
            cmd.Parameters.AddWithValue("@Student_Address", Adress);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Branch", branch);
            cmd.Parameters.AddWithValue("@Reg_Date", date);
            cmd.Parameters.AddWithValue("@St_Image", imagePath);
            cmd.ExecuteNonQuery();
            SqlConnection.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Student Sucessfully Registered');", true);
           // GetAllStudentDetails();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

     //       SqlConnection.Open();


            int stdid = int.Parse(TextBox2.Text);
            string name = TextBox3.Text;
            string Adress = TextBox4.Text;
            string email = TextBox5.Text;
            string branch = DropDownList1.SelectedValue;
            DateTime date = DateTime.Parse(TextBox6.Text);



            String imagePath = null;

            String path = Server.MapPath("Images/");

            if (FileUpload1.HasFile)
            {
                String filename = Path.GetFileName(FileUpload1.FileName);
                String extention = Path.GetExtension(filename);
                HttpPostedFile postedFile = FileUpload1.PostedFile;

                int length = postedFile.ContentLength;

                if (extention.ToLower() == ".jpg" || extention.ToLower() == ".png" || extention.ToLower() == ".jpeg")
                {
                    FileUpload1.SaveAs(path + filename);
                    imagePath = "Images/" + filename;
                }
                else
                {
                    //Label1.Text = "Image Format Not Supported";
                    //Label1.ForeColor = Color.Red;
                    //Label1.Visible = true;
                }
            }
            else
            {
                //Label1.Text = "Please Upload An image";
                //Label1.ForeColor = Color.Red;
                //Label1.Visible = true;
            }


            SqlCommand cmd = new SqlCommand("UpdateStudent", SqlConnection);
            cmd.CommandType = CommandType.StoredProcedure;



            // Use parameters to avoid SQL injection and handle data types correctly
            cmd.Parameters.AddWithValue("@StudentId", stdid);
            cmd.Parameters.AddWithValue("@StudentName", name);
            cmd.Parameters.AddWithValue("@Student_Address", Adress);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Branch", branch);
            cmd.Parameters.AddWithValue("@Reg_Date", date);
     //       cmd.Parameters.AddWithValue("St_Image", imagePath);
            cmd.ExecuteNonQuery();
            SqlConnection.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Student Details Updated Sucessfully ');", true);
         //   GetAllStudentDetails();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
       //     SqlConnection.Open();

            int stdid = int.Parse(TextBox2.Text);
            SqlCommand cmd = new SqlCommand("DeleteStudent", SqlConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StudentId", stdid);
            cmd.ExecuteNonQuery();
            SqlConnection.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Student Deleted Successfully');", true);
        //    GetAllStudentDetails();

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
       //     SqlConnection.Open();
            int id=int.Parse(TextBox2.Text);
            SqlCommand cmd = new SqlCommand(" exec SearchStudent '"+id+"'" ,SqlConnection);
            //cmd.Parameters.AddWithValue("@StudentId",id); 
            SqlDataReader read=cmd.ExecuteReader();

            while (read.Read())
            {
                TextBox3.Text = read.GetString(1).ToString();
                TextBox4.Text = read.GetString(2).ToString();
                TextBox5.Text = read.GetString(3).ToString();
                DropDownList1.SelectedValue = read.GetString(4).ToString();
                TextBox6.Text = read.IsDBNull(5) ? string.Empty : read.GetDateTime(5).ToString("dd-MM-yyyy");

            }




        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("GetAll.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
        //    SqlConnection.Open();
           String name=TextBox3.Text;
            SqlCommand cmd = new SqlCommand(" exec SearchStudentByName '" + name+ "'", SqlConnection);
            //cmd.Parameters.AddWithValue("@StudentId",id); 
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }


        protected void UserCustomValidate(object source, ServerValidateEventArgs args)
        {
            int userId;

            // Try to parse the user ID as an integer
            if (int.TryParse(args.Value, out userId))
            {
                // Check if the user ID is greater than 0
                args.IsValid = userId > 0;
            }
            else
            {
                // If parsing fails, consider it invalid
                args.IsValid = false;
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

  

        protected void Button7_Click1(object sender, EventArgs e)
        {
            Response.Redirect("GetAll.aspx");
        }

        protected void GetName_Click(object sender, EventArgs e)
        {

            String letter = TextBox7.Text;

            String query="select * from Student where StudentName like '"+ letter + "%'";

           // SqlCommand cmd = new SqlCommand(" exec SearchStudentByStartLetter '" + letter + "'", SqlConnection);
            SqlCommand cmd = new SqlCommand(query, SqlConnection);


            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}