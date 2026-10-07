var WebNavHelper = function () {
    return {
        getBaseUrl: function () {
            var baseUrl = "http://";
            if (window.location.href.indexOf("www") >= 0) {
                baseUrl += "www.";
            }
            baseUrl += "localhost:61293/";
            return baseUrl;
        },
        redirectToPageMain: function (code) {
            var pageUrl = strBaseUrl;
            switch (code) {
                case "home": pageUrl = pageUrl + "admin/Dashboard.aspx"; break;
                case "profile": pageUrl = pageUrl + "admin/UserProfile.aspx"; break;
                case "settings": pageUrl = pageUrl + "admin/UserSettings.aspx"; break;
                case "logout": pageUrl = pageUrl + "admin/Login.aspx"; break;
            }
            window.location = pageUrl;
        },
        redirectToPageApp: function (code) {
            var pageUrl = strBaseUrl + "app/";
            switch (code) {
                case "app_authors": pageUrl = pageUrl + "Authors.aspx"; break;
            }
            window.location = pageUrl;
        },
        redirectToPageContent: function (code) {
            var pageUrl = strBaseUrl + "cnt/";
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
            var pageUrl = strBaseUrl + "masters/";
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
            var pageUrl = strBaseUrl + "ecomm/";
            switch (code) {
                case "ecm_cat": pageUrl = pageUrl + "Categories.aspx"; break;
                case "ecm_prodtype": pageUrl = pageUrl + "ProductTypes.aspx"; break;
                case "ecm_prodbooks": pageUrl = pageUrl + "Books.aspx"; break;
                case "ecm_prodtagbooks": pageUrl = pageUrl + "BooksTagwise.aspx"; break;
            }
            window.location = pageUrl;
        },
        redirectToPageComm: function (code) {
            var pageUrl = strBaseUrl + "comm/";
            switch (code) {
                case "com_theme": pageUrl = pageUrl + "Theames.aspx"; break;
                case "com_template": pageUrl = pageUrl + "Templates.aspx"; break;
            }
            window.location = pageUrl;
        },
        redirectToPageEnt: function (code) {
            var pageUrl = strBaseUrl + "ent/";
            switch (code) {
                case "ent_branchinfotype": pageUrl = pageUrl + "EntityBranchInfoType.aspx"; break;
                case "ent_branch": pageUrl = pageUrl + "EntityBranch.aspx"; break;
                case "ent_branchInfo": pageUrl = pageUrl + "EntityBranchInfo.aspx"; break;
            }
            window.location = pageUrl;
        },
        redirectToPageMov: function (code) {
            var pageUrl = strBaseUrl + "mov/";
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
            var pageUrl = strBaseUrl + "rpt/";
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

var strBaseUrl = WebNavHelper.getBaseUrl();
