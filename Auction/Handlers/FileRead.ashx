<%@ WebHandler Language="C#" Class="FileRead" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;

using Framework.EnterpriseLibrary.Adapters;
using InfiAuction.Common.Entities;
using InfiAuction.Common.Helper;
using InfiAuction.Helper;
using InfiAuction.Model;
using InfiAuction.Entities;

public class FileRead : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    int mFileSize = 0;
    string errDesc = "0";
    
    public void ProcessRequest(HttpContext context)
    {        
        FileUploadHelper fileUploadHelper = new FileUploadHelper();
        string[] arrFilePath;
        string fileName = string.Empty;
        string filepath = string.Empty;
        string msg = string.Empty;
        DataSet dsData;
        DataSet dsImpData;
        try
        {
            if (context.Request.QueryString["path"] != null)
            {
                //Mode(0-Supplier Import File Read)/DocumentType/FileType
                arrFilePath = context.Request.QueryString["path"].ToString().Split('/');
                fileUploadHelper.UploadFileType = (HelperConstants.FileType)Convert.ToInt32(arrFilePath[2]);

                switch (arrFilePath[0].Trim())
                {
                    case "0"://Supplier Import File Read
                        fileName = GetFileName();

                        //Upload File
                        fileUploadHelper.UploadedNewFileName = fileName;
                        errDesc = fileUploadHelper.UploadFile((HelperConstants.DocumentType)Convert.ToInt32(arrFilePath[1]),
                            HelperConstants.UserType.None, 0, context.Request.Files[0]);

                        if (errDesc == "0")
                        {
                            filepath = fileUploadHelper.GetFilePath(
                                (HelperConstants.DocumentType)Convert.ToInt32(arrFilePath[1]),
                                HelperConstants.UserType.None, 0);

                            filepath += "/" + fileName + Path.GetExtension(context.Request.Files[0].FileName).Trim().ToLower();

                            filepath = HttpContext.Current.Server.MapPath(filepath);
                            //Read Data
                            dsData = GetSheetData(filepath);

                            if (this.errDesc == "0")
                            {
                                dsImpData = new DataSet();
                                DataTable dt = new DataTable();
                                dt.Columns.Add(new DataColumn("SN", typeof(Int32)));
                                dt.Columns.Add(new DataColumn("Id", typeof(Int32)));
                                dt.Columns.Add(new DataColumn("Name", typeof(string)));
                                dt.Columns.Add(new DataColumn("Status", typeof(string)));
                                //Check Category Data
                                GetCategoryData(dsData.Tables[0], dt);
                                if (this.errDesc == "0")
                                {
                                    dsImpData.Tables.Add(dt.Copy());

                                    dt = new DataTable();
                                    dt.Columns.Add(new DataColumn("SN", typeof(Int32)));
                                    dt.Columns.Add(new DataColumn("Id", typeof(Int32)));
                                    dt.Columns.Add(new DataColumn("Company", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Salutation", typeof(string)));
                                    dt.Columns.Add(new DataColumn("FirstName", typeof(string)));
                                    dt.Columns.Add(new DataColumn("LastName", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Designation", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Email", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Address", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Country", typeof(string)));
                                    dt.Columns.Add(new DataColumn("City", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Pin", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Website", typeof(string)));
                                    dt.Columns.Add(new DataColumn("MobileCountryCode", typeof(string)));
                                    dt.Columns.Add(new DataColumn("MobileNo", typeof(string)));
                                    dt.Columns.Add(new DataColumn("CountryCode", typeof(string)));
                                    dt.Columns.Add(new DataColumn("CityCode", typeof(string)));
                                    dt.Columns.Add(new DataColumn("PhoneNo", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Categories", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Status", typeof(string)));

                                    GetSupplierData(dsData.Tables[0], dt);
                                    if (this.errDesc == "0")
                                    {
                                        dsImpData.Tables.Add(dt.Copy());
                                        //Save in session
                                        HttpContext.Current.Session[fileName] = dsImpData;
                                    }
                                }
                            }
                        }

                        if (this.errDesc == "0")
                        {
                            msg = "{";
                            msg += string.Format("errDesc:'{0}',\n", errDesc);
                            msg += string.Format("ref:'{0}',\n", fileName);
                            msg += string.Format("upfile:'{0}'\n", fileUploadHelper.UploadedFileName);
                            msg += "}";
                        }
                        break;
                    case "00"://Supplier Import File Read - New
                        fileName = GetFileName();

                        //Upload File
                        fileUploadHelper.UploadedNewFileName = fileName;
                        errDesc = fileUploadHelper.UploadFile((HelperConstants.DocumentType)Convert.ToInt32(arrFilePath[1]),
                            HelperConstants.UserType.None, 0, context.Request.Files[0]);

                        if (errDesc == "0")
                        {
                            filepath = fileUploadHelper.GetFilePath(
                                (HelperConstants.DocumentType)Convert.ToInt32(arrFilePath[1]),
                                HelperConstants.UserType.None, 0);

                            filepath += "/" + fileName + Path.GetExtension(context.Request.Files[0].FileName).Trim().ToLower();

                            filepath = HttpContext.Current.Server.MapPath(filepath);
                            //Read Data
                            dsData = GetSheetData(filepath);

                            if (this.errDesc == "0")
                            {
                                //remove spaces 
                                foreach (DataRow dr in dsData.Tables[0].Rows)
                                {
                                    foreach (DataColumn col in dsData.Tables[0].Columns)
                                    {
                                        col.ColumnName = col.ColumnName.Trim();                                        
                                        if (col.DataType == typeof(string))
                                        {
                                            switch (col.ColumnName.ToUpper())
                                            { 
                                                case "COMPANY NAME":
                                                case "CATEGORY":
                                                case "SUB CATEGORY":
                                                    dr[col] = dr[col].ToString().Trim().ToUpper().Replace('\'', '`'); 
                                                    break;
                                            }                                            
                                        }
                                    }
                                }
                                
                                
                                dsImpData = new DataSet();
                                DataTable dt = new DataTable();
                                dt.Columns.Add(new DataColumn("SN", typeof(Int32)));
                                dt.Columns.Add(new DataColumn("Id", typeof(Int32)));
                                dt.Columns.Add(new DataColumn("Name", typeof(string)));
                                dt.Columns.Add(new DataColumn("Status", typeof(string)));
                                dt.Columns.Add(new DataColumn("SubId", typeof(string)));
                                dt.Columns.Add(new DataColumn("SubName", typeof(string)));
                                dt.Columns.Add(new DataColumn("SubStatus", typeof(string)));
                                //Check Category Data
                                GetCategoryDataNew(dsData.Tables[0], dt);
                                if (this.errDesc == "0")
                                {
                                    dsImpData.Tables.Add(dt.Copy());

                                    dt = new DataTable();
                                    dt.Columns.Add(new DataColumn("SN", typeof(Int32)));
                                    dt.Columns.Add(new DataColumn("Id", typeof(Int32)));
                                    dt.Columns.Add(new DataColumn("Company", typeof(string)));
                                    dt.Columns.Add(new DataColumn("ProductDesc", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Salutation", typeof(string)));
                                    dt.Columns.Add(new DataColumn("FirstName", typeof(string)));
                                    dt.Columns.Add(new DataColumn("LastName", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Designation", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Email", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Address", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Country", typeof(string)));
                                    dt.Columns.Add(new DataColumn("State", typeof(string)));
                                    dt.Columns.Add(new DataColumn("City", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Pin", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Website", typeof(string)));
                                    dt.Columns.Add(new DataColumn("MobileCountryCode", typeof(string)));
                                    dt.Columns.Add(new DataColumn("MobileNo", typeof(string)));
                                    dt.Columns.Add(new DataColumn("CountryCode", typeof(string)));
                                    dt.Columns.Add(new DataColumn("CityCode", typeof(string)));
                                    dt.Columns.Add(new DataColumn("PhoneNo", typeof(string)));
                                    dt.Columns.Add(new DataColumn("CCareCountryCode", typeof(string)));
                                    dt.Columns.Add(new DataColumn("CCareNo", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Turnover", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Categories", typeof(string)));
                                    dt.Columns.Add(new DataColumn("Status", typeof(string)));

                                    GetSupplierDataNew(dsData.Tables[0], dt);
                                    if (this.errDesc == "0")
                                    {
                                        dsImpData.Tables.Add(dt.Copy());
                                        //Save in session
                                        HttpContext.Current.Session[fileName] = dsImpData;
                                    }
                                }
                            }
                        }

                        if (this.errDesc == "0")
                        {
                            msg = "{";
                            msg += string.Format("errDesc:'{0}',\n", errDesc);
                            msg += string.Format("ref:'{0}',\n", fileName);
                            msg += string.Format("upfile:'{0}'\n", fileUploadHelper.UploadedFileName);
                            msg += "}";
                        }
                        break;
                    default:
                        this.errDesc = "Invalid import mode.";
                        break;
                }
            }
            else
            {
                this.errDesc = "Invalid file.";
            }
        }
        catch (Exception ex)
        {
            this.errDesc = "Error while processing file.";
            LoggingAdapter.WriteLog("File Read" + ex.Message + Environment.NewLine);
        }
        finally
        {
            if (this.errDesc != "0")
            {
                msg = "{";
                msg += string.Format("errDesc:'{0}',\n", errDesc);
                msg += string.Format("ref:'{0}',\n", string.Empty);
                msg += string.Format("upfile:'{0}'\n", string.Empty);
                msg += "}";
            }
            context.Response.Write(msg);
        }
    }

    private string GetFileName()
    {
        RandomCodeHelper lobjRandomCodeHelper = new RandomCodeHelper();
        return lobjRandomCodeHelper.GenerateRandomCode(10, 10, false, true, true, true);
    }

    private DataSet GetSheetData(string physicalPath)
    {
        OleDbCommand cmd = new OleDbCommand();
        OleDbDataAdapter da = new OleDbDataAdapter();
        DataSet ds = new DataSet();
        String connString = string.Empty;
        OleDbConnection conn = new OleDbConnection();
        try
        {
            //conn.ConnectionString = "Provider=Microsoft.JET.OLEDB.4.0;Data Source=" + physicalPath
            //    + ";Extended Properties=\"Excel 4.0;HDR=Yes;IMEX=2\"";
            conn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;;Data Source=" + physicalPath
                + ";Extended Properties=\"Excel 12.0 XML\"";
            //conn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.14.0;;Data Source=" + physicalPath
            //    + ";Extended Properties=\"Excel 14.0 XML\"";
            
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd = new OleDbCommand("SELECT * FROM [Sheet1$]", conn);
            da = new OleDbDataAdapter(cmd);
            da.Fill(ds);
            if (ds == null)
            {
                this.errDesc = "Invalid File.";
            }
            else
            {
                if (ds.Tables.Count <= 0 && ds.Tables[0].Rows.Count <= 0)
                {
                    this.errDesc = "No Data found (Sheet1).";
                }
            }
        }
        catch (Exception ex)
        {
            LoggingAdapter.WriteLog("File Read - GetSheetData" + ex.Message + Environment.NewLine);
            this.errDesc = ex.Message;
        }
        finally
        {
            if (conn.State == ConnectionState.Open) conn.Close();
        }
        return ds;
    }

    private void GetCategoryData(DataTable dt, DataTable dtImpData)
    {
        InfiModel lobjInfiModel = new InfiModel();
        IList<Category> lobjCatList = new List<Category>();
        Category lobjCat = null;
        DataRow dr;
        int cnt = 1;
        try
        {
            if (dt.Rows.Count >= 0)
            {
                if (dt.Columns.Count > 16)
                {
                    //Get existing categories
                    lobjCatList = lobjInfiModel.GetCategoryList(0, 0);

                    for (int i = 16; i < dt.Columns.Count; i++)
                    {
                        lobjCat = lobjCatList.FirstOrDefault(c => c.Name.Trim().ToLower() == dt.Columns[i].ColumnName.Trim().ToLower());
                        dr = dtImpData.NewRow();
                        dr["SN"] = cnt.ToString();

                        if (lobjCat != null)
                        {
                            dr["Id"] = lobjCat.Id;
                            dr["Name"] = lobjCat.Name;
                        }
                        else
                        {
                            dr["Id"] = 0;
                            dr["Name"] = dt.Columns[i].ColumnName;
                        }
                        dtImpData.Rows.Add(dr);
                        cnt++;
                    }
                }
                else
                {
                    this.errDesc = "Invalid File.";
                }
            }
            else
            {
                this.errDesc = "No data found.";
            }
        }
        catch (Exception ex)
        {
            LoggingAdapter.WriteLog("File Read - GetCategoryData" + ex.Message + Environment.NewLine);
            this.errDesc = ex.Message;
        }
        finally
        {

        }
    }

    private void GetCategoryDataNew(DataTable dt, DataTable dtImpData)
    {
        InfiModel lobjInfiModel = new InfiModel();
        IList<Category> lobjCatListParent = new List<Category>();
        IList<Category> lobjCatList = new List<Category>();
        Category lobjCat = null;
        DataRow dr;
        int cnt=1;
        DataTable dtImpCat = new DataTable();
        DataView dv;
        try
        {
            if (dt.Rows.Count >= 0)
            {
                dt.CaseSensitive = false;
                dv = dt.DefaultView;
                dv.Sort = "[Category], [Sub Category]";
                dtImpCat = dv.ToTable(true, "Category", "Sub Category");
                
                //Get existing Parent categories
                lobjCatListParent = lobjInfiModel.GetCategoryList(HelperConstants.ListType.All, 0);
                //Get All Categories
                lobjCatList = lobjInfiModel.GetCategoryList(HelperConstants.ListType.All, -1);

                foreach (DataRow drCat in dtImpCat.Rows)
                {
                    lobjCat = lobjCatListParent.FirstOrDefault(c => c.Name.Trim().ToLower() 
                        == drCat["Category"].ToString().Trim().ToLower());
                    dr = dtImpData.NewRow();
                    dr["SN"] = cnt.ToString();

                    if (lobjCat != null)
                    {
                        dr["Id"] = lobjCat.Id;
                        dr["Name"] = drCat["Category"].ToString().Trim();
                        dr["Status"] = "Already Exists";
                        
                        lobjCat = lobjCatList.FirstOrDefault(c => c.Name.Trim().ToLower() 
                            == drCat["Sub Category"].ToString().Trim().ToLower());

                        if (lobjCat != null)
                        {
                            if (lobjCat.ParentCategoryId == Convert.ToInt32(dr["Id"]))
                            {
                                dr["SubId"] = lobjCat.Id;
                                dr["SubName"] = drCat["Sub Category"].ToString().Trim();
                                dr["SubStatus"] = "Already Exists";
                            }
                            else
                            {
                                dr["SubId"] = -1;
                                dr["SubName"] = drCat["Sub Category"].ToString().Trim();
                                dr["SubStatus"] = "Error: Parent Category Conflict.";
                            }
                        }
                        else
                        {
                            dr["SubId"] = 0;
                            dr["SubName"] = drCat["Sub Category"].ToString().Trim();
                        }
                    }
                    else
                    {
                        dr["Id"] = 0;
                        dr["Name"] = drCat["Category"].ToString().Trim();
                        lobjCat = lobjCatList.FirstOrDefault(c => c.Name.Trim().ToLower() 
                            == drCat["Sub Category"].ToString().Trim().ToLower());
                        if (lobjCat != null)
                        {
                            dr["SubId"] = -1;
                            dr["SubName"] = drCat["Sub Category"].ToString().Trim();
                            dr["SubStatus"] = "Error: Parent Category Conflict.";
                        }
                        else
                        {
                            dr["SubId"] = 0;
                            dr["SubName"] = drCat["Sub Category"].ToString().Trim();
                        }
                    }

                    dtImpData.Rows.Add(dr);
                    cnt++;
                }
            }
            else
            {
                this.errDesc = "No data found.";
            }
        }
        catch (Exception ex)
        {
            LoggingAdapter.WriteLog("File Read - GetCategoryData" + ex.Message + Environment.NewLine);
            this.errDesc = ex.Message;
        }
        finally
        {
            
        }
    }

    private void GetSupplierData(DataTable dt, DataTable dtImpData)
    {
        InfiModel lobjInfiModel = new InfiModel();
        ServiceResponse lobjServiceResponse;
        DataRow dr;
        int cnt = 1;
        try
        {
            if (dt.Rows.Count >= 0)
            {
                if (dt.Columns.Count > 16)
                {
                    foreach (DataRow drData in dt.Rows)
                    {
                        if (drData[0].ToString().Trim() != "")
                        {
                            dr = dtImpData.NewRow();
                        
                            lobjServiceResponse = lobjInfiModel.ValidateUser(0, drData[5].ToString(),
                                drData[0].ToString(), drData[12].ToString(), HelperConstants.RegistrationType.Supplier);
                              
                            dr["SN"] = cnt;
                            dr["Id"] = 0;
                            if (lobjServiceResponse.Errcode <= 0) { dr["Id"] = 1; }
                            dr["Company"] = drData[0];
                            dr["Salutation"] = drData[1];
                            dr["FirstName"] = drData[2];
                            dr["LastName"] = drData[3];
                            dr["Designation"] = drData[4];
                            dr["Email"] = drData[5];
                            dr["Address"] = drData[6];
                            dr["Country"] = drData[7];
                            dr["City"] = drData[8];
                            dr["Pin"] = drData[9];
                            dr["Website"] = drData[10];
                            dr["MobileCountryCode"] = drData[11];
                            dr["MobileNo"] = drData[12];
                            dr["CountryCode"] = drData[13];
                            dr["CityCode"] = drData[14];
                            dr["PhoneNo"] = drData[15];
                            dr["Categories"] = "";

                            for (int i = 16; i < dt.Columns.Count; i++)
                            {
                                if (drData[i].ToString().Trim().ToUpper() == "Y")
                                {
                                    if (dr["Categories"].ToString().Trim() == "")
                                    {
                                        dr["Categories"] = dt.Columns[i].ColumnName;
                                    }
                                    else
                                    {
                                        dr["Categories"] += "," + dt.Columns[i].ColumnName;
                                    }
                                }
                            }

                            dtImpData.Rows.Add(dr);
                            cnt++;
                        }
                    }
                }
                else
                {
                    this.errDesc = "Invalid File.";
                }
            }
            else
            {
                this.errDesc = "No data found.";
            }
        }
        catch (Exception ex)
        {
            LoggingAdapter.WriteLog("File Read - GetSupplierData" + ex.Message + Environment.NewLine);
            this.errDesc = ex.Message;
        }
        finally
        {

        }
    }

    private void GetSupplierDataNew(DataTable dt, DataTable dtImpData)
    {
        InfiModel lobjInfiModel = new InfiModel();
        ServiceResponse lobjServiceResponse;
        DataRow dr;
        int cnt = 1;
        DataTable dtImpComp = new DataTable();
        DataView dv;
        bool VaildEmail = true;
        try
        {
            if (dt.Rows.Count >= 0)
            {
                dt.CaseSensitive = false;
                dv = dt.DefaultView;
                dv.Sort = "Company Name";
                dtImpComp = dv.ToTable(true, "Company Name");

                foreach (DataRow drComp in dtImpComp.Rows)
                {
                    dv.RowFilter = "";
                    dv.RowFilter = "[Company Name] = '" + drComp["Company Name"] + "'";

                    if (dv.Count > 0)
                    {
                        dr = dtImpData.NewRow();
                        dr["SN"] = cnt;
                        dr["Id"] = 0;
                        
                        if (dv[0]["Company Name"].ToString().Trim() == "")
                        {
                            dr["Status"] = "Error: Company name is empty.";
                            dr["Id"] = -1;
                        }
                        else if (dv[0]["EMail"].ToString().Trim() == "")
                        {
                            dr["Status"] = "Error: Email is empty.";
                            dr["Id"] = -1;
                        }
                        else
                        {
                            VaildEmail = HelperConstants.IsEmail(dv[0]["EMail"].ToString().Trim());
                            if (VaildEmail == false)
                            {
                                dr["Status"] = "Error: Incorrect email.";
                                dr["Id"] = -1;
                            }
                            else if (dv[0]["Mobile No"].ToString() == "")
                            {
                                dr["Status"] = "Error: Mobile No. is empty.";
                                dr["Id"] = -1;
                            }
                        }

                        if (Convert.ToInt32(dr["Id"]) == 0)
                        {
                            lobjServiceResponse = lobjInfiModel.ValidateUser(0, dv[0]["Email"].ToString(),
                                dv[0]["Company Name"].ToString(),dv[0]["MobileNo"].ToString(), HelperConstants.RegistrationType.Supplier);
                            if (lobjServiceResponse.Errcode < 0)
                            {
                                switch (lobjServiceResponse.Errcode)
                                {
                                    case -200:
                                        dr["Id"] = lobjServiceResponse.Id;
                                        dr["Status"] = "Already exists";
                                        break;
                                    case -201:
                                        dr["Id"] = -1;
                                        dr["Status"] = "Error: EMail already exists";
                                        break;
                                }
                            }
                        }
                        
                        dr["Company"] = dv[0]["Company Name"];
                        dr["ProductDesc"] = dv[0]["Product Discription"];
                        dr["Salutation"] = dv[0]["Salutation"];
                        dr["FirstName"] = dv[0]["First Name"];
                        dr["LastName"] = dv[0]["Last Name"];
                        dr["Designation"] = string.Empty;
                        dr["Email"] = dv[0]["EMail"].ToString().Trim();
                        dr["Address"] = dv[0]["Address"];
                        dr["Country"] = dv[0]["Country"];
                        dr["State"] = dv[0]["State"];
                        dr["City"] = dv[0]["City"];
                        dr["Pin"] = dv[0]["Pincode"];
                        dr["Website"] = dv[0]["Web Site"];
                        dr["MobileCountryCode"] = dv[0]["Mobile Country Code"];
                        dr["MobileNo"] = dv[0]["Mobile No"];
                        dr["CountryCode"] = dv[0]["Country Code"];
                        dr["CityCode"] = dv[0]["City Code"];
                        dr["PhoneNo"] = dv[0]["Phone No"];
                        dr["CCareCountryCode"] = dv[0]["CCare Country Code"];
                        dr["CCareNo"] = dv[0]["CCare No"];
                        dr["Turnover"] = dv[0]["Turnover"];
                        dr["Categories"] = string.Empty;

                        for (int i = 0; i < dv.Count; i++)
                        {
                            if (dr["Categories"].ToString().Trim() == "")
                            {
                                dr["Categories"] = dv[i]["Category"] + " - " + dv[i]["Sub Category"].ToString().Split(',')[0].Trim();
                            }
                            else
                            {
                                dr["Categories"] += ", " + dv[i]["Category"] + " - " + dv[i]["Sub Category"].ToString().Split(',')[0].Trim();
                            }
                        }

                        dtImpData.Rows.Add(dr);
                        cnt++;
                    }
                }
            }
            else
            {
                this.errDesc = "No data found.";
            }
        }
        catch (Exception ex)
        {
            LoggingAdapter.WriteLog("File Read - GetSupplierData" + ex.Message + Environment.NewLine);
            this.errDesc = ex.Message;
        }
        finally
        {

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