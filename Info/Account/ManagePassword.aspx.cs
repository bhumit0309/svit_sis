using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace Info.Account
{
    public partial class ManagePassword : System.Web.UI.Page
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
            
            if (Session["Role"] == null)
            {
                Session.Abandon();
                Session.Clear();
                Response.Redirect("../Default.aspx?msg=2");
            }
        }
        Class1 c = new Class1();
        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                if(CurrentPassword.Text == Session["Password"].ToString())
                {
                    string query = "UPDATE "+ Session["Role"].ToString() +"_Reg" + " SET Password='" + NewPassword.Text + "' Where UserID='" + Session["UserID"].ToString() + "' and Password='"+ Session["Password"].ToString() +"'";
                    Session["Password"] = NewPassword.Text;
                    c.insert(query);
                    if(Session["Role"].ToString() == "Admin")
                    {
                        Response.Redirect("../Account/WebForm1.aspx?msg=4");
                    }
                    else if(Session["Role"].ToString() == "Student")
                    {
                        Response.Redirect("../Student/WebForm1.aspx?msg=4");
                    }
                    else if (Session["Role"].ToString() == "Faculty")
                    {
                        Response.Redirect("../Faculty/WebForm1.aspx?msg=4");
                    }
                }
                else
                {
                    ErrorLine.Visible = true;
                }
            }
        }
    }
}