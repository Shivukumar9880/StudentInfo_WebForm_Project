using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForms_6V
{
    public partial class Register : System.Web.UI.Page
    {


        SqlConnection SqlConnection = new SqlConnection(@"Data Source=ZEROBOOK\SQLEXPRESS;Initial Catalog=WeFormsDb;Integrated Security=True;Encrypt=False");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
              


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
                  
                }
            

                SqlCommand cmd = new SqlCommand("InsertData", SqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlConnection.Open();

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
            Response.Redirect("Home.aspx");
            

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
    }
}