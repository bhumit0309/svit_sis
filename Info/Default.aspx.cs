using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Info
{
    public partial class Default : Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["Role"] != null)
            {
                if (Session["Role"].ToString() == "Admin")
                {
                    Response.Redirect("~/Account/WebForm1");
                }
                else if (Session["Role"].ToString() == "Student")
                {
                    Response.Redirect("~/Student/WebForm1");
                }
                else if (Session["Role"].ToString() == "Faculty")
                {
                    Response.Redirect("~/Faculty/WebForm1");
                }
                else
                {
                    Response.Redirect("Default.aspx?msg=3");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("msg") == "1")
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Logged out successfully.')", true);
            }
            else if (Request.QueryString.Get("msg") == "2")
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Session Expired. Login again!')", true);
            }
            else if (Request.QueryString.Get("msg") == "3")
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Unauthorized activity. Login again!')", true);
            }
        }
    }
}