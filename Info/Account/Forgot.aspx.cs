using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Info.Models;
using System.Net.Mail;
using System.Data;

namespace Info.Account
{
    public partial class ForgotPassword : Page
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
        }
        protected void SendEmail(string toAddress, string body)
        {
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(toAddress);
            mail.From = new MailAddress("bhumit.120410107047@gmail.com", "SVIT-SIS", System.Text.Encoding.UTF8);
            mail.Subject = "SVIT-SIS: Login details.";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = body;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential("bhumit.120410107047@gmail.com", "65536@0309");
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            try
            {
                client.Send(mail);
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                }
            }
        }
                    
        protected void Forgot(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Class1 c = new Class1();
                string query;
                query = "Select UserID, Password from " + Role.SelectedValue + "_Reg where Email='" + Email.Text + "'";
                DataSet ds = new DataSet();
                ds = c.select(query);
                try {
                    if (ds.Tables[0].Rows[0][0] != null)
                    {
                        string mailbody;
                        mailbody = "**********************************************<br/>" +
                                   "As per your request we are sending you your credentials.<br/>" +
                                   "UserID: " + ds.Tables[0].Rows[0][0].ToString() + "<br/>" +
                                   "Password: " + ds.Tables[0].Rows[0][1].ToString() + "<br/>" +
                                   "<p color=#b00> Note: We are suggesting you to change your password immediately.</p>" +
                                   "**********************************************";
                        SendEmail(Email.Text, mailbody);
                        loginForm.Visible = false;
                        DisplayEmail.Visible = true;
                    }
                    else
                    {
                        Response.Write("<Script>alert('Error!!!');</Script)");
                    }
                }
                catch(Exception ex)
                {
                    Response.Write("<Script>alert('" + ex.Message + "!!!');</Script)");
                }
            }
        }
    }
}