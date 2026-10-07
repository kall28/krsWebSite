<%@ WebHandler Language="C#" Class="FileCreate" %>

using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using iTextSharp.tool.xml;
using iTextSharp.tool.xml.html;
using iTextSharp.tool.xml.parser;
using iTextSharp.tool.xml.css;
using iTextSharp.tool.xml.pipeline.html;
using iTextSharp.tool.xml.pipeline.css;
using iTextSharp.tool.xml.pipeline.end;

public class FileCreate : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    string errDesc = "0";
    public void ProcessRequest (HttpContext context) {
        string[] arrFilePath;
        arrFilePath = context.Request.QueryString["det"].ToString().Split('/');
        switch (Convert.ToInt16(arrFilePath[0]))
        { 
            case 0://Excel
                GetExcelFile(context, arrFilePath[1].Trim());
                break;
            case 1://Word
                break;
            case 2://PDF
                GetPDFFile(context, arrFilePath[1].Trim());
                break;
            case 3:
                GetExcelMultiSheetFile(context, arrFilePath[1].Trim());
                break;
        }
    }

    private void GetPDFFile(HttpContext context, string strKey)
    {
        StringWriter sw;
        HtmlTextWriter htw;
        PdfWriter writer;
        HtmlPipelineContext htmlContext;
        ICSSResolver cssResolver;
        IPipeline pipeline;
        XMLWorker worker;
        XMLParser xmlParse;
        StringReader sr;
        string str = string.Empty;
        var doc = new Document(PageSize.A3, 45, 5, 5, 5);
        try
        {
            context.Response.Clear();
            if (context.Session[strKey] != null)
            {
                str = context.Session[strKey].ToString();
                sw = new StringWriter();
                htw = new HtmlTextWriter(sw);

                writer = PdfWriter.GetInstance(doc, context.Response.OutputStream);
                doc.Open();

                htmlContext = new HtmlPipelineContext(null);
                htmlContext.SetTagFactory(Tags.GetHtmlTagProcessorFactory());
                cssResolver = XMLWorkerHelper.GetInstance().GetDefaultCssResolver(false);

                pipeline = new CssResolverPipeline(cssResolver,
                    new HtmlPipeline(htmlContext, new PdfWriterPipeline(doc, writer)));

                worker = new XMLWorker(pipeline, true);
                xmlParse = new XMLParser(true, worker);

                sr = new StringReader(str);
                xmlParse.Parse(sr);
                xmlParse.Flush();
                doc.Close();
            }
            else
            {
               this.errDesc = "Invalid file parameter.";
            }
        }
        catch (Exception ex)
        {
            this.errDesc = ex.Message;
        }
        finally
        {
            if (this.errDesc == "0")
            {
                context.Response.ContentType = "application/pdf";
                context.Response.Write(doc);
            }
            else
            {
                context.Response.Clear();
                context.Response.ContentType = "text/html";
                context.Response.Write(this.errDesc);
            }
        }        
    }

    private void GetExcelFile(HttpContext context, string strKey)
    {
        DataTable dt;
        //String which will return content
        string strExportContent = "";
        try
        {
            context.Response.Clear();
            if (context.Session[strKey] != null)
            {
                dt = (DataTable)context.Session[strKey];
                if (dt != null)
                {
                    // Create StringWriter object to pass in HTML Writer
                    using (StringWriter sb = new StringWriter())
                    {
                        using (HtmlTextWriter htmlWriter = new HtmlTextWriter(sb))
                        {
                            // Creating table for holding data
                            Table table = new Table();
                            table.GridLines = GridLines.Horizontal;
                            table.BorderWidth = new Unit(1);

                            TableRow rowHeader = new TableRow();                            
                            foreach (DataColumn dtHeader in dt.Columns)
                            {
                                TableHeaderCell headerCell = new TableHeaderCell();
                                headerCell.Text = dtHeader.ColumnName;
                                rowHeader.Cells.Add(headerCell);
                            }

                            table.Rows.Add(rowHeader);

                            foreach (DataRow dr in dt.Rows)
                            {
                                TableRow row = new TableRow();
                                TableCell cell = new TableCell();
                                foreach (DataColumn dtHeader in dt.Columns)
                                {
                                    TableCell tableCell = new TableCell();
                                    tableCell.Text = dr[dtHeader.ColumnName].ToString();
                                    row.Cells.Add(tableCell);
                                }
                                table.Rows.Add(row);
                            }
                            
                            //Render Output of table content to provided HtmlWriter
                            table.RenderControl(htmlWriter);
                            strExportContent = sb.ToString();
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            this.errDesc = ex.Message;
        }
        finally
        {
            if (this.errDesc == "0")
            {
                context.Response.AddHeader("content-disposition", "attachment; filename=" + strKey + ".xls");
                context.Response.ContentType = "application/ms-excel";
                context.Response.Write(strExportContent);
            }
            else
            {
                context.Response.Clear();
                context.Response.ContentType = "text/html";
                context.Response.Write(this.errDesc);
            }
        }
    }

    private void GetExcelMultiSheetFile(HttpContext context, string strKey)
    {
        DataSet ds;
        //DataTable dt;
        //String which will return content
        string strExportContent = "";
        try
        {
            context.Response.Clear();
            if (context.Session[strKey] != null)
            {
                //dt = (DataTable)context.Session[strKey];
                ds = (DataSet)context.Session[strKey];
                //if (dt != null)
                if (ds != null)
                {
                    if (ds.Tables.Count > 0)
                    {
                        for (int i = 0; i < ds.Tables.Count; i++)
                        {
                            // Create StringWriter object to pass in HTML Writer
                            using (StringWriter sb = new StringWriter())
                            {
                                using (HtmlTextWriter htmlWriter = new HtmlTextWriter(sb))
                                {
                                    // Creating table for holding data
                                    Table table = new Table();
                                    table.GridLines = GridLines.Horizontal;
                                    table.BorderWidth = new Unit(1);

                                    TableRow rowHeader = new TableRow();
                                    foreach (DataColumn dtHeader in ds.Tables[i].Columns)
                                    {
                                        TableHeaderCell headerCell = new TableHeaderCell();
                                        headerCell.Text = dtHeader.ColumnName;
                                        rowHeader.Cells.Add(headerCell);
                                    }

                                    table.Rows.Add(rowHeader);

                                    foreach (DataRow dr in ds.Tables[i].Rows)
                                    {
                                        TableRow row = new TableRow();
                                        TableCell cell = new TableCell();
                                        foreach (DataColumn dtHeader in ds.Tables[i].Columns)
                                        {
                                            TableCell tableCell = new TableCell();
                                            tableCell.Text = dr[dtHeader.ColumnName].ToString();
                                            row.Cells.Add(tableCell);
                                        }
                                        table.Rows.Add(row);
                                    }

                                    //Render Output of table content to provided HtmlWriter
                                    table.RenderControl(htmlWriter);
                                    strExportContent += sb.ToString();
                                }
                            }
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            this.errDesc = ex.Message;
        }
        finally
        {
            if (this.errDesc == "0")
            {
                context.Response.AddHeader("content-disposition", "attachment; filename=" + strKey + ".xls");
                context.Response.ContentType = "application/ms-excel";
                context.Response.Write(strExportContent);
            }
            else
            {
                context.Response.Clear();
                context.Response.ContentType = "text/html";
                context.Response.Write(this.errDesc);
            }
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}