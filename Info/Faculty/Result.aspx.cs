using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Info.Faculty
{
    public partial class Result : System.Web.UI.Page
    {
        string depart, sbj, semst;
        protected override void OnInit(EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.MinValue);

            base.OnInit(e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] != null)
            {
                if (Session["Role"].ToString() != "Faculty")
                {
                    Session.Abandon();
                    Session.Clear();
                    Response.Redirect("../Default.aspx?msg=3");
                }
            }
            else
            {
                Response.Redirect("../Default.aspx?msg=2");
            }
            Class1 c = new Class1();
            string str = "Select URL FROM Photo where UserID='" + Session["UserID"].ToString() + "'";
            DataSet ds = new DataSet();
            ds = c.select(str);
            ProfilePicsThumb.ImageUrl = ds.Tables[0].Rows[0][0].ToString();


            if (IsPostBack)
            {
                Button_Show.Visible = true;
            }
            else
            {
                Button_Show.Visible = false;
            }

        }

        protected void Show(object sender, EventArgs e)
        {
            Submit.Visible = true;
            depart = Department.SelectedValue;
            sbj = Subject.SelectedValue;
            semst = Sem.SelectedValue;
            BindData();
            Submit.CommandArgument = depart + "," + sbj + "," + semst;
            
        }
        protected void BindData()
        {
            try
            {
                Class1 c = new Class1();
                DataSet ds = new DataSet();
                string s = "Select Student_Reg.UserID, Photo.URL, Student_Reg.FirstName, Student_Reg.MiddleName, Student_Reg.LastName from Student_Reg INNER JOIN Photo ON Student_Reg.UserID = Photo.UserID and Student_Reg.Department='" + Department.SelectedValue + "' and Student_Reg.Semester='" + Sem.SelectedValue + "'";
                ds = c.select(s);
                if (ds.Tables[0].Rows[0][0] != null)
                {
                    string str = ds.Tables[0].Rows[0][0].ToString();
                    AttendanceGrid.DataSource = ds;
                    AttendanceGrid.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error:" + ex.Message + "');</script>");
            }
        }

        protected void ItemTextBox_TextChanged(object sender, EventArgs e)
        {
            TextBox ItemTextBox = sender as TextBox;
            GridViewRow row = (GridViewRow)ItemTextBox.NamingContainer;
            int m = Convert.ToInt16(ItemTextBox.Text);
            if (m <= 30 && m >= 0)
            {
                if (m < 12)
                {
                    row.Style.Add("background-color", "#ff6666");
                }
                else
                {
                    row.Style.Add("background-color", "#66ff66");
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Marks should be between 0 to 30.')", true);
                ItemTextBox.Text = "";
                row.Style.Add("background-color", "#ffff66");
                ItemTextBox.Focus();
            }
            
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            BindData();
            AttendanceGrid.PageIndex = e.NewPageIndex;
            AttendanceGrid.DataBind();
        }

        
        protected void Submit_Click(object sender, EventArgs e)
        {
            Button Submit = (Button)sender;
            string[] commands = Submit.CommandArgument.Split(',');
            depart = commands[0];
            sbj = commands[1];
            semst = commands[2];
            string query;
            Class1 c = new Class1();
            foreach (GridViewRow row in AttendanceGrid.Rows)
            {
                TextBox ItemTextBox = (TextBox)row.FindControl("ItemTextBox");
                Label enroll = (Label)row.FindControl("lblStudentID");
                query = "Insert into Result (StudentID, Semester, SubjectName, Marks, Department) values ('" + enroll.Text + "','" + semst + "','" + sbj + "','" + ItemTextBox.Text + "','" + depart + "')";
                c.insert(query);
            }
            Response.Redirect("WebForm1.aspx?msg=6");
        }
    }
}