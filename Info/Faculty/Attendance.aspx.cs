using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Info.Faculty
{
    public partial class Attendance : System.Web.UI.Page
    {
        string depart, slt, semst;
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
                string s = "Select MAX(Attendance.Slot) as Slot from Attendance INNER JOIN Student_Reg ON Student_Reg.UserID = Attendance.StudentID where Attendance.Date='" + DateTime.Now.ToString("MM-dd-yyyy") + "' and Student_Reg.Department='" + Department.SelectedValue + "' and Student_Reg.Semester = '" + Sem.SelectedValue + "'";
                DataTable dt = c.fetchtable(s);
                if(dt.Rows[0][0].ToString() == "6")
                {
                    Slot.Items.Clear();
                    Response.Write("<Script>alert('All attendance are marked for today.');</Script>");
                }
                else
                { 
                    if (dt.Rows[0][0] != DBNull.Value)
                    {
                        int i = Convert.ToInt16(dt.Rows[0][0]) + 1;
                        Slot.Items.Clear();
                        for (; i <= 6; i++)
                        {
                            Slot.Items.Add(i.ToString());
                        }
                    }
                    else
                    {
                        Slot.Items.Clear();
                        for (int i = 1; i <= 6; i++)
                        {
                            Slot.Items.Add(i.ToString());
                        }
                    }
                }
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
            slt = Slot.SelectedValue;
            semst = Sem.SelectedValue;
            BindData();
            Submit.CommandArgument = slt;
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

        protected void HeaderCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox HeaderCheckBox = (CheckBox)AttendanceGrid.HeaderRow.FindControl("HeaderCheckBox");

            foreach(GridViewRow row in AttendanceGrid.Rows)
            {
                CheckBox ItemCheckBox = (CheckBox)row.FindControl("ItemCheckBox");
                if(HeaderCheckBox.Checked == true)
                {
                    ItemCheckBox.Checked = true;
                    ItemCheckBox.Text = " Present";
                    row.Style.Add("background-color", "#66ff66");
                }
                else
                {
                    ItemCheckBox.Checked = false;
                    ItemCheckBox.Text = " Absent";
                    row.Style.Add("background-color", "#ff6666");
                }
            }
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            BindData();
            AttendanceGrid.PageIndex = e.NewPageIndex;
            AttendanceGrid.DataBind();
        }

        protected void ItemCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ItemCheckBox = sender as CheckBox;
            GridViewRow row = (GridViewRow)ItemCheckBox.NamingContainer;
            CheckBox ItemCheckBox1 = (CheckBox)row.FindControl("ItemCheckBox");
            if(ItemCheckBox1.Checked)
            {
                row.Style.Add("background-color", "#66ff66");
                ItemCheckBox1.Text = " Present";
            }
            else
            {
                row.Style.Add("background-color", "#ff6666");
                ItemCheckBox1.Text = " Absent";
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            Button Submit = (Button)sender;
            slt = Submit.CommandArgument;
            string query, p;
            Class1 c = new Class1();
            foreach(GridViewRow row in AttendanceGrid.Rows)
            {
                CheckBox ItemCheckBox = (CheckBox)row.FindControl("ItemCheckBox");
                Label enroll = (Label)row.FindControl("lblStudentID");
                if (ItemCheckBox.Checked)
                {
                    p = "((1))";
                    query = "Insert into Attendance (Date, Slot, StudentID, Present) values ('" + DateTime.Now.ToString("MM-dd-yyyy") + "','" + slt + "','" + enroll.Text + "'," + p + ")";
                }
                else
                {
                    p = "((0))";
                    query = "Insert into Attendance (Date, Slot, StudentID, Present) values ('" + DateTime.Now.ToString("MM-dd-yyyy") + "','" + slt + "','" + enroll.Text + "'," + p + ")";
                }
                c.insert(query);
            }
            Response.Redirect("WebForm1.aspx?msg=5");
        }
    }
}