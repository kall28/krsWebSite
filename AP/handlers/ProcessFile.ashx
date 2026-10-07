<%@ WebHandler Language="C#" Class="ProcessFile" %>

using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.SessionState;
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

using Lib.Common.Entities;
using Lib.Common.Logger;

public class ProcessFile : IHttpHandler, IRequiresSessionState {

	public void ProcessRequest(HttpContext context)
	{
		ErrorTrace errorTrace = new ErrorTrace();
		ExportParams exportParams;
		string key = string.Empty;
		try
		{
			if (context.Request.QueryString["ref"] != null)
			{
				key = context.Request.QueryString["ref"].ToString().Trim();
				exportParams = WebSessionHelper.GetReportOrderDataParams(key);
				if (exportParams != null)
				{
					switch (exportParams.ExportType)
					{
						case ExportTypes.ExcelSheet:
							GetExcelFile(context, exportParams);
							break;
						case ExportTypes.ExcelSheets:
							//GetExcelMultiSheetFile(context, arrFilePath[1].Trim());
							break;
						case ExportTypes.WordDocument ://Word
							break;
						case ExportTypes.PDF://PDF
							GetPDFFile(context, key);
							break;
						case ExportTypes.TXT:
							break;
					}
				}
				else
				{
					errorTrace.SetErrorTrace(302, "No data found");
				}
			}
			else
			{
				errorTrace.SetErrorTrace(301, "Invalid parameters");
			}

		}
		catch (Exception ex)
		{
			errorTrace.SetErrorTrace("WEB-HND-FILE", "ProcessFile_ProcessRequest",
				-500, ex.Message, ex.StackTrace);
		}
		finally
		{
			if (errorTrace.ErrDescription.ErrorCode != 0)
			{
				AppLogFileHelper.ProcessErrorTrace(new ErrorTraceLog
				{
					ErrTrace = errorTrace,
					LogFolderPath = WebSettings.ErrorLogFolderPathWeb
				});

				context.Response.Clear();
				context.Response.ContentType = "text/html";
				context.Response.Write(errorTrace.ErrDescription.ErrorMessage);
			}
		}
	}

	public bool IsReusable {
		get {
			return false;
		}
	}

	private void GetPDFFile(HttpContext context, string strKey)
	{
		ErrorTrace errorTrace = new ErrorTrace();
		StringWriter sw;
		HtmlTextWriter htw;
		PdfWriter writer;
		HtmlPipelineContext htmlContext;
		ICSSResolver cssResolver;
		IPipeline pipeline;
		XMLWorker worker;
		XMLParser xmlParse=new XMLParser();
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


				////	Response.ContentType = "application/pdf";
				////Response.AddHeader("content-disposition", "attachment;filename=TestPage.pdf");
				////Response.Cache.SetCacheability(HttpCacheability.NoCache);
				//StringWriter sw = new StringWriter();
				//HtmlTextWriter hw = new HtmlTextWriter(sw);
				//this.Page.RenderControl(hw);
				//StringReader sr = new StringReader(sw.ToString());
				////Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
				//HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
				//PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
				//pdfDoc.Open();
				//htmlparser.Parse(sr);
				//pdfDoc.Close();
				//Response.Write(pdfDoc);
				//Response.End();

			}
			else
			{
				errorTrace.SetErrorTrace(401, "Invalid file parameter.");
			}
		}
		catch (Exception ex)
		{
			errorTrace.SetErrorTrace("WEB-HND-FILE", "ProcessFile_GetPDFFile",
				-500, ex.Message, ex.StackTrace);
		}
		finally
		{
			if (errorTrace.ErrDescription.ErrorCode == 0)
			{
				context.Response.ContentType = "application/pdf";
				context.Response.Write(doc);
			}
			else
			{
				AppLogFileHelper.ProcessErrorTrace(new ErrorTraceLog
				{
					ErrTrace = errorTrace,
					LogFolderPath = WebSettings.ErrorLogFolderPathWeb
				});

				context.Response.Clear();
				context.Response.ContentType = "text/html";
				context.Response.Write(errorTrace.ErrDescription.ErrorMessage);
			}
		}
	}

	private void GetExcelFile(HttpContext context, ExportParams exportParams)
	{
		ErrorTrace errorTrace = new ErrorTrace();
		//String which will return content
		string strExportContent = "";
		try
		{
			context.Response.Clear();

			if (exportParams.ReportData != null)
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
						foreach (DataColumn dtHeader in exportParams.ReportData.Columns)
						{
							TableHeaderCell headerCell = new TableHeaderCell();
							headerCell.Text = dtHeader.ColumnName;
							headerCell.BorderWidth = new Unit(1);
							headerCell.BorderStyle = BorderStyle.Dotted;
							rowHeader.Cells.Add(headerCell);
						}
						//rowHeader.BorderWidth= new Unit(1);
						table.Rows.Add(rowHeader);

						foreach (DataRow dr in exportParams.ReportData.Rows)
						{
							TableRow row = new TableRow();
							//TableCell cell = new TableCell();
							foreach (DataColumn dtHeader in exportParams.ReportData.Columns)
							{
								TableCell tableCell = new TableCell();
								tableCell.BorderWidth = new Unit(1);
								tableCell.BorderStyle = BorderStyle.Dotted;
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
		catch (Exception ex)
		{
			errorTrace.SetErrorTrace("WEB-HND-FILE", "ProcessFile_GetExcelFile",
				-500, ex.Message, ex.StackTrace);
		}
		finally
		{
			if (errorTrace.ErrDescription.ErrorCode == 0)
			{
				context.Response.AddHeader("content-disposition", "attachment; filename=" + exportParams.FileName + ".xls");
				context.Response.ContentType = "application/ms-excel";
				context.Response.Write(strExportContent);
			}
			else
			{
				context.Response.Clear();
				context.Response.ContentType = "text/html";
				context.Response.Write(errorTrace.ErrDescription.ErrorMessage);
			}
		}
	}

}