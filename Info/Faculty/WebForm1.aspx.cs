using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Info.Faculty
{
    public partial class WebForm1 : System.Web.UI.Page
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
            if (Request.QueryString.Get("msg") == "5")
            {
                Response.Write("<Script>alert('Attendance marked successfully.');</Script>");
                
            }
            else if (Request.QueryString.Get("msg") == "6")
            {
                Response.Write("<Script>alert('Marks inserted successfully.');</Script>");

            }

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
            string s = "Select URL FROM Photo where UserID='" + Session["UserID"].ToString() + "'";
            DataSet ds = new DataSet();
            ds = c.select(s);
            ProfilePicsThumb.ImageUrl = ds.Tables[0].Rows[0][0].ToString();
            if (!IsPostBack)
            {
                BindData();
            }
        }
        private void BindData()
        {
            try
            {
                Class1 c = new Class1();
                DataSet ds = new DataSet();
                string s = "Select NoticeID, Author, Date, NoticeText from Notice WHERE AllFlag = ((1)) OR FFlag = ((1))";
                ds = c.select(s);
                if (ds.Tables[0].Rows[0][0] != null)
                {
                    Notice.DataSource = ds;
                    Notice.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error:" + ex.Message + "');</script>");
            }
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            BindData();
            Notice.PageIndex = e.NewPageIndex;
            Notice.DataBind();
        }
    }
}