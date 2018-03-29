using System;
using System.Web;
using System.Web.UI;

namespace Info.Account
{
    public partial class Register : Page
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
                query = "Insert into Student_Reg values " + "('" + UserID.Text + "','" + Password.Text + "','" + FirstName.Text + "','" + MiddleName.Text
                    + "','" + LastName.Text + "','" + Department.SelectedItem.Text + "','" + Year.SelectedItem.Text + "','" + Contact_S.Text
                    + "','" + Contact_P.Text + "','" + Email.Text + "','" + Address.Text + "',((1)),1)";
                photo = "Insert into Photo (UserID) values ('" + UserID.Text + "')";
                c.insert(query);
                c.insert(photo);
                Response.Redirect("../Account/Webform1.aspx?msg=1");
            }
            finally
            {
                
            }
        }
    }
}