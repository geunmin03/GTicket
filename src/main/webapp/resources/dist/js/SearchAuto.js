(function ($) {
    $.fn.jry_Search_autoComplete = function (options) {
        var 
		panel = this,
		joCtrl = $(this),
		acInterval = null,
		oldKeyWord = "";

        this.option = jQuery.extend({ delay: 500, minlength: 2 }, options);

        this.initialize = function () {
            oldKeyWord = "";

            if (!acInterval) {
                clearInterval(acInterval);
            }
        }

        this.watch = function () {
            var newKeyWord = $.trim(joCtrl.val());

            if (newKeyWord == "") {
                $("#ulAutoSearchWord").empty();
                $(".pf-srch-drop .after").hide();
            }
            else if (oldKeyWord != newKeyWord && newKeyWord.length >= panel.option.minlength) {
                oldKeyWord = newKeyWord;
                panel.autoComplete(newKeyWord);
            }
        }

        this.autoComplete = function (keyWord) {
            $.ajax({
                async: true,
                type: "POST",
                url: "/New/Controls/Header/Ajax/axSearchAuto.aspx",
                data: { keyWord: keyWord },
                dataType: "html",
                success: function (data, textStatus) {
                    $("#ulAutoSearchWord").empty().html(data);
                    if ($.trim(data) != "") {
                        $(".pf-srch-drop .after").show();
                        $(".pf-srch-drop .before").hide();
                    };
                },
                error: function (xhr, textStatus, errorThrown) {
                },
                beforeSend: function (xhr, settings) {
                    //jsf_com_AjaxLoader(jcAJAX_BEFORESEND, 0, 0, "", "#ulAutoSearchWord");
                },
                complete: function (xhr, textStatus) {
                    //jsf_com_AjaxLoader(jcAJAX_COMPLETE, 0, 0, "", "#ulAutoSearchWord");
                }
            });
        }

        joCtrl.unbind("focus").bind("focus", function () {
            acInterval = setInterval(panel.watch, panel.option.delay);
        });

        joCtrl.unbind("blur").bind("blur", function () {
            clearInterval(acInterval);
        });

        joCtrl.unbind("keydown").bind("keydown", function (evt) {
            if (evt.which == 13) {
                evt.preventDefault();
                //goSearchByWord($(this).val());
                jsf_mm_Search();
            }
        });

        this.initialize();
    }
})(jQuery);


function jsf_SearchAuto_click(perfName) {
    $("#searchWord").val(perfName);
    goSearchByWord($("#searchWord").val());
}

function jsf_SearchAuto_Display(perfImg, perfTitle, perfSDate, perfEDate, perfTheater, perfID) {
    searchAutoIdPerf = perfID;
    $("#imgSearchAuto").attr("src", perfImg);
    $("#titSearchAuto").html(perfTitle);

    var perfPeriod = perfSDate.substr(0, 4) + "." + perfSDate.substr(4, 2) + "." + perfSDate.substr(6, 2) + "~" + perfEDate.substr(0, 4) + "." + perfEDate.substr(4, 2) + "." + perfEDate.substr(6, 2);
    $("#dateSearchAuto").html(perfPeriod + "</br>" + perfTheater);
}