using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Info.Student
{
    public partial class Profile : System.Web.UI.Page
    {
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
                if (Session["Role"].ToString() != "Student")
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
            string query = "Select * from " + Session["Role"].ToString() + "_Reg where UserID='" + Session["UserID"].ToString() + "'";
            string photo = "select URL from Photo where UserID='" + Session["UserID"].ToString() + "'";
            DataSet ds = new DataSet();
            DataSet ps = new DataSet();
            ds = c.select(query);
            ps = c.select(photo);
            if (ds.Tables[0].Rows[0][0].ToString() != null)
            {
                FirstName.InnerText = ds.Tables[0].Rows[0][2].ToString();
                MiddleName.InnerText = ds.Tables[0].Rows[0][3].ToString();
                LastName.InnerText = ds.Tables[0].Rows[0][4].ToString();
                UserID.InnerText = ds.Tables[0].Rows[0][0].ToString();
                Department.InnerText = ds.Tables[0].Rows[0][5].ToString();
                CurrentSemester.InnerText = ds.Tables[0].Rows[0][11].ToString();
                Contact_P.InnerText = ds.Tables[0].Rows[0][8].ToString();
                Contact_S.InnerText = ds.Tables[0].Rows[0][7].ToString();
                Email.InnerText = ds.Tables[0].Rows[0][9].ToString();
                Address.InnerText = ds.Tables[0].Rows[0][10].ToString();
                ProfilePicsThumb.ImageUrl = ps.Tables[0].Rows[0][0].ToString();
                ProfilePicture.ImageUrl = ps.Tables[0].Rows[0][0].ToString();
            }
            DataTable dtd = c.fetchtable("Select MAX(Semester) as Sem from Result where StudentID='" + Session["UserID"].ToString() + "'");
            DataSet result = new DataSet();
            int sem = Convert.ToInt16(dtd.Rows[0][0].ToString());
            int a;
            for (a = 1; a <= sem; a++)
            {
                string q = "Select Subject.SubjectID, Subject.SubjectName, Result.Marks from Result INNER JOIN Subject ON Result.SubjectName=Subject.SubjectName where Result.StudentID='" + Session["UserID"].ToString() + "' and Result.Semester=" + a;

                DataTable dt = c.fetchtable(q);
                result.Tables.Add(dt);
                result.Tables[a - 1].TableName = "Sem" + a;
                GridView DynamicGrids = new GridView();
                DynamicGrids.CssClass = "mydatagrid";
                DynamicGrids.AllowPaging = false;
                DynamicGrids.ShowFooter = false;
                DynamicGrids.AutoGenerateColumns = true;
                DynamicGrids.HeaderStyle.CssClass = "header";
                DynamicGrids.RowStyle.CssClass = "rows";
                result.Tables["Sem" + a.ToString()].Columns[0].ColumnName = "Subject Code";
                result.Tables["Sem" + a.ToString()].Columns[1].ColumnName = "Subject Name";
                result.Tables["Sem" + a.ToString()].Columns[2].ColumnName = "Obtained Marks/30";

                DynamicGrids.DataSource = result.Tables["Sem" + a.ToString()];
                DynamicGrids.DataBind();
                DynamicGrids.ID = "DynamicGrid" + a;
                Result.Controls.Add(new LiteralControl("<h2>Semester " + a + "</h2>"));
                Result.Controls.Add(DynamicGrids);
                Result.Controls.Add(new LiteralControl("<br /><br />"));
            }
            int total = 0;
            string success = "progress-bar progress-bar-success";
            string warning = "progress-bar progress-bar-warning";
            string danger = "progress-bar progress-bar-danger";
            string css;
            DataTable subs = c.fetchtable("Select SubjectName from Subject where Department='" + Session["Department"] + "' and Semester='" + Session["Semester"] + "'");
            for (a = 1; a <= subs.Rows.Count; a++)
            {
                string sqlquery = "SELECT DISTINCT"
                    + " (SELECT COUNT(*) FROM Attendance INNER JOIN Subject ON Attendance.Subject=Subject.SubjectName WHERE Attendance.StudentID='" + Session["UserID"] + "' AND Subject.Semester='" + Session["Semester"] + "' AND Attendance.Present=((1)) AND Attendance.Subject='" + subs.Rows[a-1][0] + "') AS Present,"
                    + " (SELECT COUNT(*) FROM Attendance INNER JOIN Subject ON Attendance.Subject=Subject.SubjectName WHERE Attendance.StudentID='" + Session["UserID"] + "' AND Subject.Semester='" + Session["Semester"] + "' AND Attendance.Present=((0)) AND Attendance.Subject='" + subs.Rows[a-1][0] + "') AS Absent"
                    + " FROM Attendance, Subject";
                DataTable dt = c.fetchtable(sqlquery);
                int prs = Convert.ToInt16(dt.Rows[0][0].ToString());
                int abs = Convert.ToInt16(dt.Rows[0][1].ToString());
                int pp = (prs * 100) / (prs + abs);
                int ap = 100 - pp;
                total = total + pp;
                if(pp > 70)
                {
                    css = success;
                }
                else if(pp > 50 && pp <= 70)
                {
                    css = warning;
                }
                else
                {
                    css = danger;
                }
                switch (a)
                {
                    case 1:
                        Sub1.Visible = true;
                        Div1.Visible = true;
                        Sub1.Style.Add("width", pp.ToString() + "%");
                        Sub1.Attributes.Add("class", css);
                        Sub1.Attributes.Add("aria-valuenow", pp.ToString());
                        p1.InnerText = pp + "% in " + subs.Rows[a - 1][0];
                        break;
                    case 2:
                        Sub2.Visible = true;
                        Div2.Visible = true;
                        Sub2.Style.Add("width", pp.ToString() + "%");
                        Sub2.Attributes.Add("class", css);
                        Sub2.Attributes.Add("aria-valuenow", pp.ToString());
                        p2.InnerText = pp + "% in " + subs.Rows[a - 1][0];
                        break;
                    case 3:
                        Sub3.Visible = true;
                        Div3.Visible = true;
                        Sub3.Style.Add("width", pp.ToString() + "%");
                        Sub3.Attributes.Add("class", css);
                        Sub3.Attributes.Add("aria-valuenow", pp.ToString());
                        p3.InnerText = pp + "% in " + subs.Rows[a - 1][0];
                        break;
                    case 4:
                        Sub4.Visible = true;
                        Div4.Visible = true;
                        Sub4.Style.Add("width", pp.ToString() + "%");
                        Sub4.Attributes.Add("class", css);
                        Sub4.Attributes.Add("aria-valuenow", pp.ToString());
                        p4.InnerText = pp + "% in " + subs.Rows[a - 1][0];
                        break;
                    case 5:
                        Sub5.Visible = true;
                        Div5.Visible = true;
                        Sub5.Style.Add("width", pp.ToString() + "%");
                        Sub5.Attributes.Add("class", css);
                        Sub5.Attributes.Add("aria-valuenow", pp.ToString());
                        p5.InnerText = pp + "% in " + subs.Rows[a - 1][0];
                        break;
                    case 6:
                        Sub6.Visible = true;
                        Div6.Visible = true;
                        Sub6.Style.Add("width", pp.ToString() + "%");
                        Sub6.Attributes.Add("class", css);
                        Sub6.Attributes.Add("aria-valuenow", pp.ToString());
                        p6.InnerText = pp + "% in " + subs.Rows[a - 1][0];
                        break;
                }    
            }
            total = total / (a - 1);

            if (total > 70)
            {
                css = success;
            }
            else if (total > 50 && total <= 70)
            {
                css = warning;
            }
            else
            {
                css = danger;
            }
            AttendanceStatusOverall.Style.Add("width", total + "%");
            AttendanceStatusOverall.Attributes.Add("class", css);
            AttendanceStatusOverall.Attributes.Add("aria-valuenow", total.ToString());
            p0.InnerText = total + "%";
        }

        
    }
}