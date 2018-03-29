using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Info.Models;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security; 
namespace Info.Account
{
    public partial class Login : Page
    {
        Class1 c = new Class1();
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
                if (Session["Role"].ToString() == "Admin")
                {
                    Response.Redirect("WebForm1");
                }
                else if (Session["Role"].ToString() == "Student")
                {
                    Response.Redirect("../Student/WebForm1");
                }
                else if (Session["Role"].ToString() == "Faculty")
                {
                    Response.Redirect("../Faculty/WebForm1");
                }
                else
                {
                    Response.Redirect("../Default.aspx?msg=3");
                }
            }
            
            ForgotPasswordHyperLink.NavigateUrl = "Forgot";
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string strSel = "Select UserID,Password,FirstName,LastName from "+ Role.SelectedValue +"_Reg where UserID = '" + UserID.Text + "'"; //Stores Query to be executed.
                DataSet ds = new DataSet();
                ds = c.select(strSel);

                try
                {

                    if (ds.Tables[0].Rows[0][0].ToString() == UserID.Text && ds.Tables[0].Rows[0][1].ToString() == Password.Text)
                    { //valid password                
                        Session["UserID"] = ds.Tables[0].Rows[0][0].ToString();
                        Session["Password"] = ds.Tables[0].Rows[0][1].ToString();
                        Session["FirstName"] = ds.Tables[0].Rows[0][2].ToString();
                        Session["LastName"] = ds.Tables[0].Rows[0][3].ToString();
                        Session["Role"] = Role.SelectedItem.Text;
                        if (Role.SelectedItem.Text == "Admin")
                        {
                            Response.Redirect("~/Account/WebForm1");
                        }
                        else if (Role.SelectedItem.Text == "Student")
                        {
                            string s = "select Semester, Department from Student_Reg where UserID='" + Session["UserID"].ToString() + "'";
                            DataTable dt = c.fetchtable(s);
                            Session["Semester"] = dt.Rows[0][0].ToString();
                            Session["Department"] = dt.Rows[0][1].ToString();
                            Response.Redirect("../Student/WebForm1");
                        }
                        else if (Role.SelectedValue == "Faculty")
                        {
                            Response.Redirect("../Faculty/WebForm1");
                        }
                    }
                    else
                    {
                        Password.Text = "";
                        Password.Focus();
                        ErrorMsg.Text = "Invalid UserID or Password. Try Again!";
                    }

                }
                catch
                {
                    ErrorMsg.Text = "Invalid UserID or Password. Try Again!";
                }
            }
        }
    }
}