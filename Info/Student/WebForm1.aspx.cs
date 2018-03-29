using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Info.Student
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

            if (Session["Role"] != null)
            {
                if (Session["Role"].ToString() != "Student")
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
                string s = "Select NoticeID, Author, Date, NoticeText from Notice WHERE AllFlag = ((1)) OR SFlag = ((1))";
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
        protected void UploadProfilePicture(object sender, EventArgs e)
        {
            string uploadfolder = Request.PhysicalApplicationPath + "Student\\ProfilePictures\\";
            if (FileUpload1.HasFile)
            {
                string extension = Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();
                string[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                int flag = 0;
                for (int i = 0; i < allowedExtensions.Length; i++)
                { 
                    if (extension == allowedExtensions[i])
                    {
                        string photo = "../Student/ProfilePictures/" + Session["UserID"].ToString() + extension;
                        FileUpload1.SaveAs( uploadfolder + Session["UserID"].ToString() + extension );
                        string q = "Update Photo SET URL='" + photo + "' where UserID='" + Session["UserID"].ToString() + "'";
                        Class1 c = new Class1();
                        c.insert(q);
                        flag = 1;
                        FileUpload1.Attributes.Clear();
                        Response.Redirect(Request.RawUrl);
                    }
                }
                if(flag == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Select .jpg, .jpeg, .png or .gif file to upload.')", true);
                }
                
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('Select Picture to upload.')", true);
            }
        }
    }
}