<%@ WebHandler Language="C#" Class="FileUpload" %>

using System;
using System.Web;

using InfiAuction.Helper;

public class FileUpload : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    int mFileSize = 0;
    public void ProcessRequest(HttpContext context)
    {
        string errDesc = "0";
        FileUploadHelper fileUploadHelper = new FileUploadHelper();
        string[] arrFilePath;
        string filepath = string.Empty;
        string msg = string.Empty;
        string file = string.Empty;
        try
        {
            if (context.Request.QueryString["path"] != null)
            {
                //Mode(0-Upload, 1-exists, 2-download, 3-Show, -1 - del)/DocumentType/FileType/UserType/UserId/EntityId
                arrFilePath = context.Request.QueryString["path"].ToString().Split('/');
                fileUploadHelper.UploadFileType = (HelperConstants.FileType)Convert.ToInt32(arrFilePath[2]);
                fileUploadHelper.EntityId = arrFilePath[5];

                switch (Convert.ToInt32(arrFilePath[0].Trim()))
                {
                    case 0://Upload
                        file = context.Request.QueryString["file"].ToString();
                        fileUploadHelper.UploadedNewFileName = file;
                        errDesc = fileUploadHelper.UploadFile((HelperConstants.DocumentType)Convert.ToInt32(arrFilePath[1]),
                            (HelperConstants.UserType)Convert.ToInt32(arrFilePath[3]),
                            Convert.ToInt32(arrFilePath[4]),
                            context.Request.Files[0]);

                        msg = "{";
                        msg += string.Format("errDesc:'{0}',\n", errDesc);
                        msg += string.Format("upfile:'{0}'\n", fileUploadHelper.UploadedFileName);
                        msg += "}";
                        context.Response.Write(msg);
                        break;
                    case 1://Check
                        filepath = fileUploadHelper.GetFilePath(
                            (HelperConstants.DocumentType)Convert.ToInt32(arrFilePath[1]),
                            (HelperConstants.UserType)Convert.ToInt32(arrFilePath[3]),
                            Convert.ToInt32(arrFilePath[4]));

                        file = context.Request.QueryString["file"].ToString();

                        if (!FileHelper.FileExists(filepath + "/" + file, true))
                        {
                            errDesc = "File not exists.";
                        }
                        context.Response.ContentType = "text/html";
                        context.Response.Write(errDesc);
                        break;
                    case 2://Download
                        filepath = fileUploadHelper.GetFilePath(
                            (HelperConstants.DocumentType)Convert.ToInt32(arrFilePath[1]),
                            (HelperConstants.UserType)Convert.ToInt32(arrFilePath[3]),
                            Convert.ToInt32(arrFilePath[4]));

                        file = context.Request.QueryString["file"].ToString();

                        if (FileHelper.FileExists(filepath + "/" + file, true))
                        {
                            string extension = System.IO.Path.GetExtension(filepath + "/" + file);
                            context.Response.Clear();
                            context.Response.ContentType = "application/octet-stream";
                            switch (extension.ToLower())
                            {
                                case ".pdf":
                                    context.Response.ContentType = "application/pdf";
                                    break;
                                case ".xls":
                                case ".xlsx":
                                    context.Response.ContentType = "application/ms-excel";
                                    context.Response.AddHeader("Content-Disposition", string.Format("attachment; filename=\"{0}\"", file));
                                    break;
                                case ".doc":
                                case ".docx":
                                    context.Response.ContentType = "application/vnd.word";
                                    context.Response.AddHeader("Content-Disposition", string.Format("attachment; filename=\"{0}\"", file));
                                    break;
                                case ".jpg":
                                case ".jpeg":
                                    context.Response.ContentType = "image/jpg";
                                    break;
                                case ".gif":
                                    context.Response.ContentType = "image/gif";
                                    break;
                                case ".png":
                                    context.Response.ContentType = "image/png";
                                    break;
                                case ".bmp":
                                    context.Response.ContentType = "image/bmp";
                                    break;
                            }
                            context.Response.WriteFile(HttpContext.Current.Server.MapPath(filepath + "/" + file));
                            //context.Response.Flush();
                        }
                        else
                        {
                            context.Response.ContentType = "text/html";
                            context.Response.Write("File Not Found");
                            context.Response.End();
                        }
                        break;
                    case 3://Show
                        filepath = fileUploadHelper.GetFilePath(
                            (HelperConstants.DocumentType)Convert.ToInt32(arrFilePath[1]),
                            (HelperConstants.UserType)Convert.ToInt32(arrFilePath[3]),
                            Convert.ToInt32(arrFilePath[4]));

                        file = context.Request.QueryString["file"].ToString();

                        if (FileHelper.FileExists(filepath + "/" + file, true))
                        {
                            string extension = System.IO.Path.GetExtension(filepath + "/" + file);
                            //context.Response.Clear();
                            context.Response.ContentType = "application/octet-stream";
                            switch (extension.ToLower())
                            {
                                case ".jpg":
                                case ".jpeg":
                                    context.Response.ContentType = "image/jpg";
                                    break;
                                case ".gif":
                                    context.Response.ContentType = "image/gif";
                                    break;
                                case ".png":
                                    context.Response.ContentType = "image/png";
                                    break;
                                case ".bmp":
                                    context.Response.ContentType = "image/bmp";
                                    break;
                            }
                            context.Response.WriteFile(HttpContext.Current.Server.MapPath(filepath + "/" + file));
                        }
                        else
                        {
                            context.Response.ContentType = "text/html";
                            context.Response.Write("File Not Found");
                        }
                        context.Response.End();
                        break;
                    case -1://delete
                        filepath = fileUploadHelper.GetFilePath(
                            (HelperConstants.DocumentType)Convert.ToInt32(arrFilePath[1]),
                            (HelperConstants.UserType)Convert.ToInt32(arrFilePath[3]),
                            Convert.ToInt32(arrFilePath[4]));

                        file = context.Request.QueryString["file"].ToString();

                        if (!FileHelper.FileDelete(filepath + "/" + file, true))
                        {
                            errDesc = "Error while deleting file.";
                        }
                        context.Response.ContentType = "text/html";
                        context.Response.Write(errDesc);
                        context.Response.End();
                        break;
                    default:
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            //context.Response.Write("Error: " + ex.Message);
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}