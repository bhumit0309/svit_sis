using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Info.Faculty
{
    public partial class ManageAttendance : System.Web.UI.Page
    {
        protected override void OnInit(EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.MinValue);
            base.OnInit(e);
        }
        private void BindData()
        {
            try
            {
                Class1 c = new Class1();
                DataSet ds = new DataSet();
                string s = "Select * from Student_att";
                ds = c.select(s);
                if (ds.Tables[0].Rows[0][0] != null)
                {
                    Attendance.DataSource = ds;
                    Attendance.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error:" + ex.Message + "');</script>");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Role"] != null)
            //{
            //    if (Session["Role"].ToString() != "Admin")
            //    {
            //        Session.Abandon();
            //        Session.Clear();
            //        Response.Redirect("../Default.aspx?msg=3");
            //    }
            //}
            //else
            //{
            //    Response.Redirect("../Default.aspx?msg=2");
            //}

            if (!IsPostBack)
            {
                BindData();
            }
        }
        //protected void EditNotice(object sender, GridViewEditEventArgs e)
        //{
        //    Attendance.EditIndex = e.NewEditIndex;
        //    BindData();
        //}

        //protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    Notice.EditIndex = -1;
        //    BindData();
        //}

        //protected void UpdateNotice(object sender, GridViewUpdateEventArgs e)
        //{
        //    string A, N, E, F, S, P;
        //    A = (Notice.Rows[e.RowIndex].FindControl("txtEditAuthor") as DropDownList).SelectedValue;
        //    N = (Notice.Rows[e.RowIndex].FindControl("txtEditNoticeText") as TextBox).Text;

        //    if ((Notice.Rows[e.RowIndex].FindControl("EditAllFlag") as CheckBox).Checked)
        //    {
        //        E = "((1))";
        //    }
        //    else
        //    {
        //        E = "((0))";
        //    }
        //    if ((Notice.Rows[e.RowIndex].FindControl("EditFFlag") as CheckBox).Checked)
        //    {
        //        F = "((1))";
        //    }
        //    else
        //    {
        //        F = "((0))";
        //    }
        //    if ((Notice.Rows[e.RowIndex].FindControl("EditSFlag") as CheckBox).Checked)
        //    {
        //        S = "((1))";
        //    }
        //    else
        //    {
        //        S = "((0))";
        //    }
        //    if ((Notice.Rows[e.RowIndex].FindControl("EditPFlag") as CheckBox).Checked)
        //    {
        //        P = "((1))";
        //    }
        //    else
        //    {
        //        P = "((0))";
        //    }
        //    string s = "Update Notice SET Author='" + A + "', NoticeText='" + N + "', AllFlag=" + E + ", FFlag=" + F + ", SFlag="
        //        + S + ", PFlag=" + P + " where NoticeID='" + (Notice.Rows[e.RowIndex].FindControl("lblNoticeID") as Label).Text + "'";
        //    Class1 c = new Class1();
        //    if (c.insert(s))
        //    {
        //        ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Notice Updated Successfully')", true);
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Notice Updated Unsuccessfully')", true);
        //    }
        //    Notice.EditIndex = -1;
        //    BindData();
        //}
        //protected void DeleteNotice(object sender, EventArgs e)
        //{
        //    Button btnDelete = (Button)sender;
        //    string s = "Delete from Notice where NoticeID='" + btnDelete.CommandArgument + "'";
        //    Class1 c = new Class1();
        //    if (c.insert(s))
        //    {
        //        ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Notice Deleted Successfully')", true);
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Notice Deleted Unsuccessfully')", true);
        //    }
        //    Notice.EditIndex = -1;
        //    BindData();
        //}

        //public void AddNotice(object sender, EventArgs e)
        //{
        //    string A, N, E, F, S, P;
        //    Class1 c = new Class1();
        //    A = (Notice.FooterRow.FindControl("txtAuthor") as DropDownList).SelectedValue;
        //    N = (Notice.FooterRow.FindControl("txtNoticeText") as TextBox).Text;

        //    if ((Notice.FooterRow.FindControl("AllFlag") as CheckBox).Checked)
        //    {
        //        E = "((1))";
        //    }
        //    else
        //    {
        //        E = "((0))";
        //    }
        //    if ((Notice.FooterRow.FindControl("FFlag") as CheckBox).Checked)
        //    {
        //        F = "((1))";
        //    }
        //    else
        //    {
        //        F = "((0))";
        //    }
        //    if ((Notice.FooterRow.FindControl("SFlag") as CheckBox).Checked)
        //    {
        //        S = "((1))";
        //    }
        //    else
        //    {
        //        S = "((0))";
        //    }
        //    if ((Notice.FooterRow.FindControl("PFlag") as CheckBox).Checked)
        //    {
        //        P = "((1))";
        //    }
        //    else
        //    {
        //        P = "((0))";
        //    }
        //    string s = "Insert into Notice (Author, Date, NoticeText, AllFlag, FFlag, SFlag, PFlag) values ('" + A + "','" + DateTime.Now.ToString("MMM dd, yyyy hh:mm:ss tt") +
        //        "','" + N + "'," + E + "," + F + "," + S + "," + P + ")";

        //    if (c.insert(s))
        //    {
        //        ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Notice Inserted Successfully')", true);
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Notice Inserted Unsuccessfully')", true);
        //    }
        //    BindData();
        //}

        //protected void OnPaging(object sender, GridViewPageEventArgs e)
        //{
        //    BindData();
        //    Notice.PageIndex = e.NewPageIndex;
        //    Notice.DataBind();
        //}

    }

}
