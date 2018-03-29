using System;
using System.Web;
using System.Web.UI;

namespace Info.Account
{
    public partial class Register1 : Page
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
        Class1 c = new Class1();
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            try
            {
                string query, photo;
                query = "Insert into Faculty_Reg values " + "('" + UserID.Text + "','" + Password.Text + "','" + FirstName.Text + "','" + MiddleName.Text
                    + "','" + LastName.Text + "','" + Qualification.SelectedItem.Text + "','" + University.Text + "','" + Department.SelectedItem.Text + "','"
                    + JoiningYear.SelectedItem.Text + "','" + Contact.Text + "','" + Email.Text + "','" + Address.Text + "')";
                photo = "Insert into Photo (UserID) values ('" + UserID.Text + "')";
                c.insert(query);
                c.insert(photo);
                Response.Redirect("../Account/Webform1.aspx?msg=2");
            }
            finally
            {

            }
        }
    }
}