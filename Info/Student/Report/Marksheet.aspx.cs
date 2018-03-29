using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

namespace Info.Student.Report
{
    public partial class Marksheet : System.Web.UI.Page
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
            ProfilePicsThumb.ImageUrl = "../" + ds.Tables[0].Rows[0][0].ToString();

        }
        

        protected void GenerateReport_Click(object sender, EventArgs e)
        {
            Class1 c = new Class1();
            DataSet ms = new DataSet();
            int a = Convert.ToInt16(Session["Semester"].ToString());
            string Name = Session["FirstName"].ToString() + " " + Session["LastName"].ToString();
            long Enrollment = Convert.ToInt64(Session["UserID"].ToString());
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            StringBuilder sb = new StringBuilder();

            //Generate Invoice (Bill) Header.
            sb.Append("<table width='100%' cellspacing='0' cellpadding='3'>");
            sb.Append(@"<tr><td align='center' bgcolor=#18B5F0 colspan = '2' style='font-size: 14px' ><b>Sardar Vallabhbhai Patel Institute of Technology, Vasad-388306</b></td></tr>");
            sb.Append("<tr><td colspan = '2'></td></tr>");
            sb.Append("<tr><td><b>Enrollment No: </b>");
            sb.Append(Enrollment);
            sb.Append("</td><td align = 'right'><b>Date: </b>");
            sb.Append(DateTime.Now.ToShortDateString());
            sb.Append(" </td></tr>");
            sb.Append("<tr><td colspan = '2'><b>Name: </b>");
            sb.Append(Name);
            sb.Append("</td></tr>");
            sb.Append("<tr><td>Department: ");
            sb.Append(Session["Department"].ToString());
            sb.Append("</td><td>Current Semester: ");
            sb.Append(Session["Semester"].ToString());
            sb.Append("</td></tr>");
            sb.Append("</table>");
            
            int all;
            all = Convert.ToInt16(Semester.SelectedValue);
            //Generate result Grid.
            for (int i = 1; i <= all; i++)
            { 
                string q = "Select Subject.SubjectID, Subject.SubjectName, Result.Marks from Result INNER JOIN Subject ON Result.StudentID='" + Session["UserID"].ToString() + "' and Result.SubjectnAME=Subject.SubjectnAME and Result.Semester='" + i + "'";
                DataTable dt = c.fetchtable(q);
                dt.Columns[0].ColumnName = "Subject Code";
                dt.Columns[1].ColumnName = "Subject Name";
                dt.Columns[2].ColumnName = "Marks";
                dt.Columns[2].DataType = typeof(int);
                sb.Append("<br /><br /><p align='center'>Semester ");
                sb.Append(i);
                sb.Append("</p><br />");
                sb.Append("<table border = '1'>");
                sb.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    sb.Append("<th bgcolor=#D20B0C style = 'color:#FFFFFF;'>");
                    sb.Append(column.ColumnName);
                    sb.Append("</th>");
                }
                sb.Append("</tr>");
                foreach (DataRow row in dt.Rows)
                {
                    sb.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        sb.Append("<td>");
                        sb.Append(row[column]);
                        sb.Append("</td>");
                    }
                    sb.Append("</tr>");
                }
                sb.Append("<tr><td align='right' colspan='");
                sb.Append(dt.Columns.Count - 1);
                sb.Append("'>Total<td>");
                sb.Append(dt.Compute("Sum(Marks)", ""));
                sb.Append("</td></tr>");
                sb.Append("</table>");
            }
            //Export HTML String as PDF.
            StringReader sr = new StringReader(sb.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
#pragma warning disable CS0612 // Type or member is obsolete
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
#pragma warning restore CS0612 // Type or member is obsolete
            PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Marksheet_" + Enrollment + ".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Write(pdfDoc);
            Response.End();
        }
    }
}