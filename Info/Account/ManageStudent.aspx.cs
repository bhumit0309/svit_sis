using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Info.Account
{
    public partial class ManageStudent : System.Web.UI.Page
    {
        Class1 c = new Class1();
        protected override void OnInit(EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.MinValue);

            base.OnInit(e);
        }
        private void BindData(string searchstring)
        {
            try
            {
                DataSet ds = new DataSet();
                ds = c.select(searchstring);
                if (ds.Tables[0].Rows[0][0].ToString() != null)
                {
                    ResultGrid.DataSource = ds;
                    ResultGrid.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error:" + ex.Message + "');</script>");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] != null)
            {
                if (Session["Role"].ToString() != "Admin")
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
        }

        protected void OnClick_Search(object sender, EventArgs e)
        {
            if (SearchBy.Text != "")
            {
                string strSel = "Select * from Student_Reg where " + SortBy.SelectedValue + "='" + SearchBy.Text + "'"; //Stores Query to be executed.
                DataSet ds = new DataSet();
                ds = c.select(strSel);

                if (ds != null)
                { //valid  
                    BindData(strSel);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('No such record found!')", true);
                }


            }
            else
            {
                string strSel = "Select * from Student_Reg"; //Stores Query to be executed.
                DataSet ds = new DataSet();
                ds = c.select(strSel);
                if (ds.Tables[0].Rows[0][0].ToString() != null)
                { //valid  
                    BindData(strSel);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('No such record found!')", true);
                }
            }
            Result.Visible = true;
            SearchBar.Visible = true;
            EditDetails.Visible = false;
        }
        protected void OnClick_Edit(object sender, EventArgs e)
        {
            Button btnEdit = (Button)sender;
            string s = "Select * from Student_Reg where UserID='" + btnEdit.CommandArgument + "'";
            DataSet ds = c.select(s);
            EditDetails.Visible = true;
            Result.Visible = false;
            SearchBar.Visible = false;
            UserID.Text = ds.Tables[0].Rows[0][0].ToString();
            FirstName.Text = ds.Tables[0].Rows[0][2].ToString();
            MiddleName.Text = ds.Tables[0].Rows[0][3].ToString();
            LastName.Text = ds.Tables[0].Rows[0][4].ToString();
            Department.SelectedValue = ds.Tables[0].Rows[0][5].ToString();
            Year.SelectedValue = ds.Tables[0].Rows[0][6].ToString();
            Contact_S.Text = ds.Tables[0].Rows[0][7].ToString();
            Contact_P.Text = ds.Tables[0].Rows[0][8].ToString();
            Email.Text = ds.Tables[0].Rows[0][9].ToString();
            Address.Text = ds.Tables[0].Rows[0][10].ToString();

        }
        protected void OnClick_Update(object sender, EventArgs e)
        {
            if (IsValid)
            {

                string query = "UPDATE Student_Reg SET FirstName='" + FirstName.Text + "',MiddleName='" + MiddleName.Text + "',LastName='" + LastName.Text + "',Department='" + Department.SelectedValue + "',Year='" + Year.SelectedValue + "',Contact_S='" + Contact_S.Text + "',Contact_P='" + Contact_P.Text + "',Email='" + Email.Text + "',Address='" + Address.Text + "'  Where UserID='" + UserID.Text + "'";
                c.insert(query);
                string strSel;
                strSel = "Select * from Student_Reg";
                BindData(strSel);

                SearchBar.Visible = true;
                Result.Visible = true;
                EditDetails.Visible = false;
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Successfully Updated!')", true);

                //Response.Redirect("../Account/WebForm1.aspx?msg=2");

            }
        }
        protected void DeleteNotice(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            try
            {
                string query = "Delete From Student_Reg where UserID='" + btnDelete.CommandArgument + "'";
                c.insert(query);
                string strSel = "Select * from Student_Reg where " + SortBy.SelectedValue + "='" + SearchBy.Text + "'";
                BindData(strSel);
                SearchBar.Visible = true;
                Result.Visible = true;
                EditDetails.Visible = false;
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Successfully deleted!')", true);

                //                Response.Redirect("../Account/WebForm1.aspx?msg=3");
            }
            catch
            {

            }
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            string strSel = "Select * from Student_Reg where " + SortBy.SelectedValue + "='" + SearchBy.Text + "'";
            BindData(strSel);
            ResultGrid.PageIndex = e.NewPageIndex;
            ResultGrid.DataBind();
        }

        protected void ResultGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                (e.Row.FindControl("ProfilePicThumb") as Image).ImageUrl = "../Student/ProfilePictures/" + Eval("UserID") + ".jpg";
            }
        }
    }
}