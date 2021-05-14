

function fax_GetFavoriteSearchWord() {
    $.ajax({
        async: true,
        type: "POST",
        url: "/New/Controls/Header/Ajax/axSearchWord.aspx/BindFavoriteSearchWord",
        dataType: "json",
        contentType: "application/json",
        success: function (data, textStatus) {
            if (data != "") {
                $("#ulFavoriteSearchWord").html(data.d.html);
            }
        },
        error: function (xhr, textStatus, errorThrown) {
            //$("#dialogAlert").jAlert({ "msg": "데이터 조회 에러가 발생하였습니다." });
        },
        beforeSend: function (xhr, settings) {
            //jsf_com_AjaxLoader(jcAJAX_BEFORESEND, 0, 0, "", ".entry");
        },
        complete: function (xhr, textStatus) {
        }
    });
}

function fax_GetRecentSearchWord() {
    $.ajax({
        async: true,
        type: "POST",
        url: "/New/Controls/Header/Ajax/axSearchWord.aspx/BindRecentSearchWord",
        dataType: "json",
        contentType: "application/json",
        success: function (data, textStatus) {
            if (data != "" && data.d.html != "") {
                $("#ulRecentSearchWord").html(data.d.html);
                $(".pf-srch-drop .before-right .drop-none").hide();
                $("#ulRecentSearchWord").show();
            }
            else {
                $(".pf-srch-drop .before-right .drop-none").show();
            }
        },
        error: function (xhr, textStatus, errorThrown) {
            //$("#dialogAlert").jAlert({ "msg": "데이터 조회 에러가 발생하였습니다." });
        },
        beforeSend: function (xhr, settings) {
            //jsf_com_AjaxLoader(jcAJAX_BEFORESEND, 0, 0, "", ".entry");
        },
        complete: function (xhr, textStatus) {
        }
    });
}

function fax_AddRecentSearchWord() {
    $.ajax({
        async: true,
        type: "POST",
        url: "/New/Controls/Header/Ajax/axSearchWord.aspx/AddRecentSearchWord",
        data: JSON.stringify({
            SearchWord: $("#searchWord").val()
        }),
        dataType: "json",
        contentType: "application/json",
        success: function (data, textStatus) {
            if (data != "") {
                if (data.d.Result == "1") {
                    fax_GetRecentSearchWord();
                }
            }
        },
        error: function (xhr, textStatus, errorThrown) {
            //$("#dialogAlert").jAlert({ "msg": "데이터 조회 에러가 발생하였습니다." });
        },
        beforeSend: function (xhr, settings) {
            //jsf_com_AjaxLoader(jcAJAX_BEFORESEND, 0, 0, "", ".entry");
        },
        complete: function (xhr, textStatus) {
        }
    });
}

function fax_RemoveRecentSearchWord() {
    $.ajax({
        async: true,
        type: "POST",
        url: "/New/Controls/Header/Ajax/axSearchWord.aspx/RemoveRecentSearchWord",
        dataType: "json",
        contentType: "application/json",
        success: function (data, textStatus) {
            if (data.d.Result == "1") {
                fax_GetRecentSearchWord();
            }
        },
        error: function (xhr, textStatus, errorThrown) {
            //$("#dialogAlert").jAlert({ "msg": "데이터 조회 에러가 발생하였습니다." });
        },
        beforeSend: function (xhr, settings) {
            //jsf_com_AjaxLoader(jcAJAX_BEFORESEND, 0, 0, "", ".entry");
        },
        complete: function (xhr, textStatus) {
        }
    });
}