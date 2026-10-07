<%@ WebHandler Language="C#" Class="ViewDetails" %>

using System;
using System.Collections.Generic;
using System.Web;
using System.Text;
using System.Web.SessionState;
using System.Web.Script.Serialization;
using Framework.EnterpriseLibrary.Adapters;
using InfiAuction.Entities;
using InfiAuction.Helper;
using InfiAuction.Model;
using InfiAuction.Common.Helper;
using System.Linq;

public class ViewDetails : IHttpHandler, IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        InfiModel objInfiModel = new InfiModel();
        context.Response.ContentType = "application/json; charset =utf-8";
        try
        {
            if (Convert.ToInt32(context.Request.QueryString["VendorId"]) > 0)
            {
                int EntityId = Convert.ToInt32(context.Request.QueryString["EntityId"]);
                string listBookmarkStatus = (context.Request.QueryString["BookmarkStatus"].ToString()).ToUpper();
                
                StringBuilder strB = new StringBuilder();
                IList<Category> lstCat = new List<Category>();
                IList<Category> lstVendorCat = new List<Category>();
                Category category = null;
                string strTemp = @"<div id='divVendorDet'>
                        <div id='divMsgBox'>
                            <div class='viewProfile vidPop'>
                                <img class='profile-logo' id='imgProfileLogo' src='{0}' alt='Profile Logo' width='100' height='100' />
                                <div class='profile-info'>
                                    <ul>
                                        <li>
                                            <span id='lblName'>{1}</span>
                                        </li>
                                        <li id='liRating'>{2}</li>
                                        <li class='row-title'>Pan/Tin</li>
                                        <li class='row-data'>
                                                    <label id='lblPan'>
                                                       {6}
                                                    </label>
                                                </li>
                                    </ul>
                                </div>
                                <div class='address'>
                                    <span>Address</span>
                                    <ul>
                                        <li>
                                            <label id='Address'>{4}
                                               
                                            </label>
                                        </li>
                                        <li>
                                            <label id='Address1'>
                                                   {5}
                                            </label>
                                        </li>
                                                
                                                <li><a href='{3}' class='profile-url'>
                                            <label id='lblWebsite'>
                                                {3}
                                            </label>
                                        </a></li>
                                    </ul>
                                </div>
                                <div class='bookmark'>";

                if (listBookmarkStatus == "TRUE")
                {
                    IList<BookmarkSupplier> lstBookmark = new List<BookmarkSupplier>();
                    lstBookmark = objInfiModel.GetBookmarkSupplier(0, EntityId);
                    if (lstBookmark != null)
                    {
                        lstBookmark = lstBookmark.Where(v => v.VendorId == Convert.ToInt32(context.Request.QueryString["VendorId"])).ToList();

                        if (lstBookmark.Count > 0)
                        {
                            strTemp += @" <label id='lblBookmarked' class='bookmarked'>BOOKMARKED</label> ";
                        }
                        else
                        {
                            strTemp += @" <button type='button' id='btnBookmark' runat='server' class='btnRed' style='display:block;'
                                    onclick='javascript:btnBookmarkclick({9});'>BOOKMARK</button> 
                                    <label id='lblBookmarked' class='bookmarked' style='display:none;' >BOOKMARKED</label>";
                        }
                    }
                    else
                    {
                        strTemp += @" <label id='lblBookmarked' class='bookmarked'>BOOKMARKED</label> ";
                    }
                }
                else
                {

                }


                strTemp += @"</div>
                                <div class='clear'>
                                </div>
                                <div class='col-profileData'>
                                    
                                    
                                    <div>
                                        <div class='fullWidth'>
                                            <div class='row-title div-title'>
                                                Categories
                                            </div>
                                            <div class='div-whtbox fullWidth border'>
                                                <div>
                                                    <label id='lblCategory'>
                                                       {8}
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class='fullWidth'>
                                           <div class='row-title div-title'>
                                                Description
                                            </div>
                                            <div class='div-whtbox fullWidth border'>
                                                <div>
                                                    <label id='lblDescription'>
                                                       {10}
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class='fullWidth'>
                                        <div class='row-title div-title'>
                                                Delivery Details
                                            </div>
                                        <div class='div-whtbox fullWidth border'>
                                            <div>
                                                <label id='lblCity'>
                                                  {7}
                                                </label>
                                            </div>
                                        </div>
                                    </div><br />
                                </div>
                            </div>
                        </div>
                    </div>";
                 //<div class='colRight'>
                 //                           <div class='row-title div-title'>
                 //                               Quality Certificates
                 //                           </div>
                 //                           <div class='div-whtbox'>
                 //                               <div>
                 //                                   <label id='lblCertificate'>
                 //                                      {11}
                 //                                   </label>
                 //                               </div>
                 //                           </div>
                 //                       </div>
                Vendor objVendor = objInfiModel.GetVendor(Convert.ToInt32(context.Request.QueryString["VendorId"]));
                if (objVendor != null)
                {
                    string catName = string.Empty;
                    if (objVendor != null)
                    {
                        int cnt = 0;
                        lstCat = objInfiModel.GetCategoryList(HelperConstants.ListType.Published, 0);
                        if (objVendor.CategoryList != null)
                        {
                            //lstVendorCat = objVendor.CategoryList;
                            //lstVendorCat = lstVendorCat.Where(v => v.ParentCategoryId == 0).ToList();
                            foreach (Category cat in objVendor.CategoryList)
                            {
                                if (cat.ParentCategoryId > 0)
                                {
                                    lstCat = objInfiModel.GetCategoryList(HelperConstants.ListType.Published, cat.ParentCategoryId);
                                    foreach (Category categ in lstCat)
                                    {
                                        if (categ.Id == cat.Id)
                                        {
                                            category = categ;
                                        }
                                    }
                                    //category = lstCat.FirstOrDefault(c => c.Id == cat.Id);
                                }
                                else
                                {
                                    foreach (Category categ in lstCat)
                                    {
                                        if (categ.Id == cat.Id)
                                        {
                                            category = categ;
                                        }
                                    }
                                   // category = lstCat.FirstOrDefault(c => c.Id == cat.Id);
                                }
                                if (category != null)
                                {
                                   // cat.Name = category.Name;
                                    if (cnt == 0)
                                    {
                                        catName = category.Name;
                                    }
                                    else
                                    {
                                        catName += "," + category.Name;
                                    }
                                    cnt++; 
                                }
                            }
                        }

                    }
                    string strPAN = string.Empty, strCity = string.Empty, strTNO = string.Empty, 
                                    strWeb = string.Empty,strCert=string.Empty;
                    string strDsp = string.Empty;
                    foreach (VendorDetails vendDet in objVendor.ProfileDet)
                    {
                        switch (vendDet.Code)
                        {
                            case HelperConstants.DetailsType.PAN:
                                strPAN = vendDet.Value;
                                break;
                            case HelperConstants.DetailsType.DSP:
                                strDsp = vendDet.Value;
                                break;
                            case HelperConstants.DetailsType.CTY:
                                string strCityId = string.Empty;
                                strCityId = vendDet.Value;
                                string[] arr;
                                arr = strCityId.Split(',');
                                if (arr.Length > 0 && arr[0]!="")
                                {
                                    if (arr[0] == "A")
                                    {
                                        strCity = "Pan India";
                                    }
                                    else
                                    {
                                        for (int i = 0; i < arr.Length; i++)
                                        {
                                            if (Convert.ToInt32(arr[i]) > 0)
                                            {
                                                IList<City> objCity = objInfiModel.GetCityList(Convert.ToInt32(arr[i]), "", HelperConstants.ListType.Published, 0, 0);
                                                if (objCity != null && objCity.Count > 0)
                                                {
                                                    if (strCity == string.Empty)
                                                    {
                                                        strCity = objCity[0].Name;
                                                    }
                                                    else
                                                    {
                                                        strCity += ", " + objCity[0].Name;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                break;
                            case HelperConstants.DetailsType.TNO:
                                strTNO = vendDet.Value;
                                break;
                            case HelperConstants.DetailsType.WEB:
                                strWeb = vendDet.Value;
                                break;
                            case HelperConstants.DetailsType.CRT:
                                strCert = vendDet.Document;
                                break;
                                
                        }
                    }
                    string url =WebHelper.ToAbsoluteUrl( InfiModel.GetLogo(objVendor.Id, HelperConstants.UserType.VND,false));
                    string ver = InfiModel.GetVerifiedImg(objVendor.Verified);
                    string rate = InfiModel.GetRatingImg(Convert.ToInt16(objVendor.Rating));

                    strB.Append(string.Format(strTemp, url, objVendor.Name + "" + InfiModel.GetVerifiedImg(objVendor.Verified),
                        InfiModel.GetRatingImg(Convert.ToInt16(objVendor.Rating)),strWeb,
                        objVendor.CustomerDet.AddressDet.Address1,
                        objVendor.CustomerDet.AddressDet.CountryDet.Name+","+objVendor.CustomerDet.AddressDet.CityDet.Name+","+
                        objVendor.CustomerDet.AddressDet.ZipPostalCode, strPAN, strCity, catName, objVendor.Id, strDsp));
                }
                JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
                context.Response.Write(javaScriptSerializer.Serialize(strB.ToString()));
              // context.Response.Write(strB.ToString());
                //case "ntf":
                //    if (context.Request.QueryString["VendorId"] != null)
                //    {
                //        objInfiModel.MessageStatus(Convert.ToInt32(context.Request.QueryString["Id"]),
                //            HelperConstants.MessageStatusType.Notification);
                //    }
                //    else
                //    {
                //        IList<Inbox> objlstMsg = new List<Inbox>();
                //        if (HttpContext.Current.Session[WebConstants.SessionVar.LoggedinUserCustomerId.ToString()] != null)
                //        {
                //            objlstMsg = objInfiModel.GetMessages(
                //                Convert.ToInt32(HttpContext.Current.Session[WebConstants.SessionVar.LoggedinUserCustomerId.ToString()]),
                //                HelperConstants.MessageStatusType.Notification);
                //        }
                //        JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
                //        context.Response.Write(javaScriptSerializer.Serialize(objlstMsg));
                //    }
                //    break;
            }
        }
        catch (Exception ex)
        {
            LoggingAdapter.WriteLog("Process Request Client" + ex.Message + Environment.NewLine);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}