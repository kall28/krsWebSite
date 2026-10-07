var WebNavHelper = function () {
    return {
        getBaseUrl: function () {
            var baseUrl = "http://";
            if (window.location.href.indexOf("www") >= 0) {
                baseUrl += "www.";
            }
            baseUrl += "krsinfoserve.com/WebAql/";
            return baseUrl;
        },
        redirectToPageMain: function (code) {
            var pageUrl = WebNavHelper.getBaseUrl();
            switch (code) {
                case "home": pageUrl = pageUrl + "Home.aspx"; break;
                case "shop": pageUrl = pageUrl + "ShopProductList.aspx"; break;
                case "subscription": pageUrl = pageUrl + "Subscriptions.aspx"; break; 
                case "fpwd": pageUrl = pageUrl + "PasswordRecovery.aspx"; break;
                case "profile": pageUrl = pageUrl + "ProfileDetails.aspx"; break;
                case "profileord": pageUrl = pageUrl + "ProfileDetails.aspx#orders"; break;
                case "profilesub": pageUrl = pageUrl + "ProfileDetails.aspx#subscriptions"; break;
                case "profileadd": pageUrl = pageUrl + "ProfileDetails.aspx#address"; break;
                case "profilewish": pageUrl = pageUrl + "ProfileDetails.aspx#wishlist"; break;
                case "products": pageUrl = pageUrl + "Products.aspx"; break;
                case "productDet": pageUrl = pageUrl + "ProductDetails.aspx"; break;
                case "cart": pageUrl = pageUrl + "Cart.aspx"; break;
                case "checkout": pageUrl = pageUrl + "CheckOut.aspx"; break;
                case "payment": pageUrl = pageUrl + "Payments.aspx"; break;
                case "processcod": pageUrl = pageUrl + "Payment/COD/ProcessRequest.aspx"; break;

                case "aboutUs": pageUrl = pageUrl + "AboutUs.aspx"; break;
                case "blogs": pageUrl = pageUrl + "Blogs.aspx"; break;
                case "recipes": pageUrl = pageUrl + "Recipes.aspx"; break;
                case "blogDetails": pageUrl = pageUrl + "BlogDetails.aspx"; break;
                case "contactUs": pageUrl = pageUrl + "ContactUs.aspx"; break;
                case "faq": pageUrl = pageUrl + "FAQ.aspx"; break;
                case "tnc": pageUrl = pageUrl + "TermsOfUse.aspx"; break;
                case "policy": pageUrl = pageUrl + "PrivacyPolicy.aspx"; break;
            }
            window.location = pageUrl;
        },

        redirectToPageApp: function (code) {
            var pageUrl = WebNavHelper.getBaseUrl() + "app/";
            switch (code) {
                case "app_authors": pageUrl = pageUrl + "Authors.aspx"; break;
            }
            window.location = pageUrl;
        },
        redirectToPageContent: function (code) {
            var pageUrl = WebNavHelper.getBaseUrl() + "cnt/";
            switch (code) {
                case "cnt_webpages": pageUrl = pageUrl + "WebPageContent.aspx"; break;
                case "cnt_webpagebanners": pageUrl = pageUrl + "WebPageBanners.aspx"; break;
                case "cnt_news": pageUrl = pageUrl + "News.aspx"; break;
                case "cnt_promo": pageUrl = pageUrl + "Promotions.aspx"; break;
                case "cnt_mobpages": pageUrl = pageUrl + "MobAppContent.aspx"; break;
                case "cnt_careerpages": pageUrl = pageUrl + "WebPageCareerContent.aspx"; break;
                case "cnt_careerdept": pageUrl = pageUrl + "DepartmentsCareer.aspx"; break;
            }
            window.location = pageUrl;
        },
        redirectToPageMst: function (code) {
            var pageUrl = WebNavHelper.getBaseUrl() + "masters/";
            switch (code) {
                case "mst_loc": pageUrl = pageUrl + "Locations.aspx"; break;
                case "mst_cur": pageUrl = pageUrl + "Currencies.aspx"; break;
                case "mst_btype": pageUrl = pageUrl + "BusinessTypes.aspx"; break;
                case "mst_enttype": pageUrl = pageUrl + "EntityTypes.aspx"; break;
                case "mst_entbranchtype": pageUrl = pageUrl + "EntityBranchTypes.aspx"; break;
                case "mst_srv": pageUrl = pageUrl + "Services.aspx"; break;
                case "mst_source": pageUrl = pageUrl + "Sources.aspx"; break;
                case "mst_tag": pageUrl = pageUrl + "Tags.aspx"; break;
                case "mst_genre": pageUrl = pageUrl + "Genres.aspx"; break;
                case "mst_lang": pageUrl = pageUrl + "Languages.aspx"; break;
                case "mst_roles": pageUrl = pageUrl + "Roles.aspx"; break;
            }
            window.location = pageUrl;
        },
        redirectToPageEcomm: function (code) {
            var pageUrl = WebNavHelper.getBaseUrl() + "ecomm/";
            switch (code) {
                case "ecm_cat": pageUrl = pageUrl + "Categories.aspx"; break;
                case "ecm_prodtype": pageUrl = pageUrl + "ProductTypes.aspx"; break;
                case "ecm_prodbooks": pageUrl = pageUrl + "Books.aspx"; break;
                case "ecm_prodtagbooks": pageUrl = pageUrl + "BooksTagwise.aspx"; break;
            }
            window.location = pageUrl;
        },
        redirectToPageComm: function (code) {
            var pageUrl = WebNavHelper.getBaseUrl() + "comm/";
            switch (code) {
                case "com_theme": pageUrl = pageUrl + "Theames.aspx"; break;
                case "com_template": pageUrl = pageUrl + "Templates.aspx"; break;
            }
            window.location = pageUrl;
        },
        redirectToPageEnt: function (code) {
            var pageUrl = WebNavHelper.getBaseUrl() + "ent/";
            switch (code) {
                case "ent_branchinfotype": pageUrl = pageUrl + "EntityBranchInfoType.aspx"; break;
                case "ent_branch": pageUrl = pageUrl + "EntityBranch.aspx"; break;
                case "ent_branchInfo": pageUrl = pageUrl + "EntityBranchInfo.aspx"; break;
            }
            window.location = pageUrl;
        },
        redirectToPageMov: function (code) {
            var pageUrl = WebNavHelper.getBaseUrl() + "mov/";
            switch (code) {
                case "mov_sclass": pageUrl = pageUrl + "ScreenClasses.aspx"; break;
                case "mov_screen": pageUrl = pageUrl + "CinemaScreen.aspx"; break;
                case "mov_infotype": pageUrl = pageUrl + "MovieInfoTypes.aspx"; break;
                case "mov_movie": pageUrl = pageUrl + "Movie.aspx"; break;
                case "mov_movieinfo": pageUrl = pageUrl + "MovieInfo.aspx"; break;
            }
            window.location = pageUrl;
        },
        redirectToPageRpt: function (code) {
            var pageUrl = WebNavHelper.getBaseUrl() + "rpt/";
            switch (code) {
                case "rpt_ordersearch": pageUrl = pageUrl + "RptOrderSearch.aspx"; break;
            }
            window.location = pageUrl;
        },
        getTextEditorBasicConfig: function () {
            return strBaseUrl + "/js/helpers/ckeditor-basic.js";
        }
    };
}();
