using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Info.Account
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
            if (Request.QueryString.Get("msg") == "1")
            {
                Response.Write("<Script>alert('Details are succesfully inserted.');</Script>");
            }
            else if (Request.QueryString.Get("msg") == "2")
            {
                Response.Write("<Script>alert('Details are succesfully updated.');</Script>");
            }
            else if (Request.QueryString.Get("msg") == "3")
            {
                Response.Write("<Script>alert('Details are succesfully deleted.');</Script>");
            }
            else if (Request.QueryString.Get("msg") == "4")
            {
                Response.Write("<Script>alert('Your Password is changed successfully.');</Script>");
            }
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
    }
}