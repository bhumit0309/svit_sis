using System;
using System.Data;
using System.Web;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace Info.Student.Report
{
    public partial class Bonafide : System.Web.UI.Page
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

            other.Visible = false;
            Class1 c = new Class1();
            string s = "Select URL FROM Photo where UserID='" + Session["UserID"].ToString() + "'";
            DataSet ds = new DataSet();
            ds = c.select(s);
            ProfilePicsThumb.ImageUrl = "../" + ds.Tables[0].Rows[0][0].ToString();

        }
        protected void showhidediv(object sender, EventArgs e)
        {
            if(Purpose.SelectedValue == "Others")
            {
                other.Visible = true;
                other.Disabled = false;
            }
            else
            {
                other.Visible = false;
                other.Disabled = true;
            }
        }

        protected void GenerateReport_Click(object sender, EventArgs e)
        {
            string pp;
            if(Purpose.SelectedValue == "Passport")
            {
                pp = "Passport";
            }
            else
            {
                pp = SpecialPurpose.Text.Trim();
            }
            Class1 c = new Class1();
            string fontpath = Server.MapPath(@"..\..");
            BaseFont customfont = BaseFont.CreateFont(fontpath + "\\fonts\\DancingScript-Regular.ttf", BaseFont.CP1252, BaseFont.EMBEDDED);
            Font normalfont = new Font(customfont, 16, Font.NORMAL, BaseColor.BLACK);
            Font heading = new Font(customfont, 24, Font.NORMAL, BaseColor.BLUE);
            Font highlightfont = new Font(customfont, 16, Font.UNDERLINE, BaseColor.BLACK);
            DataRow dw = c.fetchtable("Select * from Student_Reg where UserID='" + Session["UserID"].ToString() + "'").Rows[0];
            Document document = new Document(PageSize.A4, 88f, 88f, 10f, 10f);
            using (System.IO.MemoryStream ms = new System.IO.MemoryStream())
            {
                PdfWriter writer = PdfWriter.GetInstance(document, ms);
                Phrase phrase;
                PdfPCell cell;
                PdfPTable table;
                BaseColor color;

                document.Open();

                table = new PdfPTable(2);
                table.TotalWidth = 500f;
                table.LockedWidth = true;
                table.SetWidths(new float[] { 0.3f, 1f });
                cell = ImageCell("../SVIT.png",10f,PdfPCell.ALIGN_CENTER);
                table.AddCell(cell);
                phrase = new Phrase();
                phrase.Add(new Chunk("Sardar Vallabhbhai Patel Institute of technology, Vasad - 388306 \n", heading));
                cell = PhraseCell(phrase, PdfPCell.ALIGN_CENTER);
                table.AddCell(cell);
                color = BaseColor.DARK_GRAY;
                DrawLine(writer, 25f, document.Top - 79f, document.PageSize.Width - 25f, document.Top - 79f, color);
                DrawLine(writer, 25f, document.Top - 80f, document.PageSize.Width - 25f, document.Top - 80f, color);
                document.Add(table);
                
                table = new PdfPTable(2);
                table.TotalWidth = 500f;
                table.LockedWidth = true;
                table.SetWidths(new float[] { 0.3f, 0.7f });
                table.SpacingBefore = 20f;

                cell = PhraseCell(new Phrase("Date: " + DateTime.Today.ToLongDateString(), normalfont), PdfPCell.ALIGN_RIGHT);
                cell.Colspan = 2;
                table.AddCell(cell);
                cell = PhraseCell(new Phrase(" "), PdfPCell.ALIGN_CENTER);
                cell.Colspan = 2;
                cell.PaddingBottom = 30f;
                table.AddCell(cell);

                cell = PhraseCell(new Phrase("BONAFIDE STUDENT CERTIFICATE", heading), PdfPCell.ALIGN_CENTER);
                cell.Colspan = 2;
                table.AddCell(cell);

                cell = PhraseCell(new Phrase(" "), PdfPCell.ALIGN_CENTER);
                cell.Colspan = 2;
                cell.PaddingBottom = 30f;
                table.AddCell(cell);

                Chunk c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11;
                c1 = new Chunk("\t This is to certify that Mr./Ms./Mrs. ", normalfont);
                c2 = new Chunk(dw["FirstName"] + " " + dw["MiddleName"] + " " + dw["LastName"], highlightfont);
                c3 = new Chunk(" is a bonafide student of this college presently studying in ", normalfont);
                c4 = new Chunk(dw["Semester"] + "th Semester ", highlightfont);
                c5 = new Chunk("of course ", normalfont);
                c6 = new Chunk(dw["Department"].ToString(), highlightfont);
                c7 = new Chunk(" and bears identification number ", normalfont);
                c8 = new Chunk(dw["UserID"].ToString(), highlightfont);
                c9 = new Chunk(".\n Note: This certificate is issued for ", normalfont);
                c10 = new Chunk(pp, highlightfont);
                c11 = new Chunk(" use only.", normalfont);
                Phrase ph = new Phrase();
                ph.Add(c1);
                ph.Add(c2);
                ph.Add(c3);
                ph.Add(c4);
                ph.Add(c5);
                ph.Add(c6);
                ph.Add(c7);
                ph.Add(c8);
                ph.Add(c9);
                ph.Add(c10);
                ph.Add(c11);
                ph.Leading = 35f;
                cell.AddElement(ph);
                cell.BorderColor = BaseColor.WHITE;
                cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
                cell.HorizontalAlignment = PdfPCell.ALIGN_JUSTIFIED;
                cell.PaddingBottom = 0f;
                cell.PaddingTop = 0f;
                cell.Colspan = 2;
                table.AddCell(cell);
                document.Add(table);    
                document.Close();

                byte[] bytes = ms.ToArray();
                ms.Close();
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=SVIT-Bonafide.pdf");
                Response.ContentType = "application/pdf";
                Response.Buffer = true;
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(bytes);
                Response.End();
                Response.Close();
            }
        }
        public static void DrawLine(PdfWriter writer, float x1, float y1, float x2, float y2, BaseColor color)
        {
            PdfContentByte contentbyte = writer.DirectContent;
            contentbyte.SetColorStroke(color);
            contentbyte.MoveTo(x1, y1);
            contentbyte.LineTo(x2, y2);
            contentbyte.Stroke();
        }
        private static PdfPCell PhraseCell(Phrase phrase, int align)
        {
            PdfPCell cell = new PdfPCell(phrase);
            cell.BorderColor = BaseColor.WHITE;
            cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
            cell.HorizontalAlignment = align;
            cell.PaddingBottom = 0f;
            cell.PaddingTop = 0f;
            return cell;
        }
        private static PdfPCell ImageCell(string path, float scale, int align)
        {
            iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance(HttpContext.Current.Server.MapPath(path));
            image.ScalePercent(scale);
            PdfPCell cell = new PdfPCell(image);
            cell.BorderColor = BaseColor.WHITE;
            cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
            cell.HorizontalAlignment = align;
            cell.PaddingBottom = 0f;
            cell.PaddingTop = 0f;
            return cell;
        }
      
    }
}