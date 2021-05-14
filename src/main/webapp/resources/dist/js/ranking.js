$(function(){

	//캘린더	
	//afterShow 옵션만들어주기
	$.datepicker._updateDatepicker_original = $.datepicker._updateDatepicker;
    $.datepicker._updateDatepicker = function(inst) {
        $.datepicker._updateDatepicker_original(inst);
        var afterShow = this._get(inst, 'afterShow');
        if (afterShow){
            afterShow.apply((inst.input ? inst.input[0] : null)); 
		}// trigger custom callback
    }

	//캘린더 실행 - 주간
	$("#rank-calendar").datepicker({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['01','02','03','04','05','06','07','08','09','10','11','12'],
	  monthNamesShort: ['01','02','03','04','05','06','07','08','09','10','11','12'],
	  dayNames: ['일','월','화','수','목','금','토'],
	  dayNamesShort: ['일','월','화','수','목','금','토'],
	  dayNamesMin: ['일','월','화','수','목','금','토'],
	  showMonthAfterYear: true,
	  yearSuffix: '.',
		afterShow: function(){
			rank();	
			active_day();
			hover_day();
		},
	  maxDate: 0,
	  onSelect: function(date) { jsf_rank_CalendarDateSelectedWeek(date); }
	
	});
	//캘린더 실행 - 일간
	$("#rank-calendar2").datepicker({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['01','02','03','04','05','06','07','08','09','10','11','12'],
	  monthNamesShort: ['01','02','03','04','05','06','07','08','09','10','11','12'],
	  dayNames: ['일','월','화','수','목','금','토'],
	  dayNamesShort: ['일','월','화','수','목','금','토'],
	  dayNamesMin: ['일','월','화','수','목','금','토'],
	  showMonthAfterYear: true,
	  yearSuffix: '.',
		afterShow: function(){
			rank();	
		},
	  maxDate: 0,
	  onSelect: function(date) { jsf_rank_CalendarDateSelected(date); }
	});


	//공연날짜에 클래스 붙여주기
	function rank(){
		var exxx = $("#rank-calendar td[data-month=\"8\"]");
		if($("#rank-calendar td[data-month=\"8\"]")){
			for(var t=0; t<32; t++){
				var exnum = exxx.eq(t).find("a").text();
				if(exnum>15){
					if(exnum<23){
						exxx.eq(t).find("a").addClass("eveon");
					}
				}
			}		
		}
		
	}
	//주간캘린더 - 현재 주 표시(주황색)
	function active_day(){
		var curDate = new Date();
		curDate.setHours(9);
		curDate.setMinutes(0);
		curDate.setSeconds(0);
		curDate.setMilliseconds(0);
		var d = new Date($("#salesRankDateWeek").val());
		d.setHours(9);
		d.setMinutes(0);
		d.setSeconds(0);
		d.setMilliseconds(0);
		var n = d.getUTCDay();

		var dayOfWeekMonday = 1 - (curDate.getUTCDay());
		if (dayOfWeekMonday > 0)
		{
			dayOfWeekMonday -= 7;
		}

		var beginDate = new Date(curDate);
		var endDate = new Date(curDate);
		beginDate.setTime(curDate.getTime() + ((1000 * 60 * 60 * 24 ) * dayOfWeekMonday));
		endDate.setTime(beginDate.getTime() + ((1000 * 60 * 60 * 24 ) * 6));


		if(beginDate.getTime() <= d.getTime() && endDate >= d.getTime()){	
			if(n == 6){
				var i = 0;		
				while(i <= n){
					$("#rank-calendar .ui-state-active").parent("td").siblings("td").eq(i).find("a").addClass("ui-state-active");
					i++;
				}
			} else {
				var i = 0;		
				while(i <= n){
					$("#rank-calendar .ui-state-active").parent("td").siblings("td").eq(i).find("a").addClass("ui-state-active");
					i++;
				}

				var z = 6;
				$("#rank-calendar .ui-state-active").parent("td").parent("tr").prev("tr").find("td").eq(z).find("a").addClass("ui-state-active");
				while(z - 1 > n){
					z--;
					$("#rank-calendar .ui-state-active").parent("td").parent("tr").find("td").eq(z).find("a").addClass("ui-state-active");
				}
			}
		}else {
			if(n == 0){
				$("#rank-calendar .ui-state-active").parent("td").parent("tr").prev("tr").find("td").find("a").addClass("ui-state-active");
				$("#rank-calendar .ui-state-active").parent("td").siblings("td").eq(0).find("a").removeClass("ui-state-active");
			}else{
				$("#rank-calendar .ui-state-active").parent("td").siblings("td").find("a").addClass("ui-state-active");
				$("#rank-calendar .ui-state-active").parent("td").siblings("td").eq(0).find("a").removeClass("ui-state-active");
				$("#rank-calendar .ui-state-active").parent("td").parent("tr").next("tr").find("td").eq(0).find("a").addClass("ui-state-active");
			}		
		}
		
	}
	//주간캘린더 - 마우스 오버한 한 주를 표시(연분홍색)
	function hover_day(){
		$("#rank-calendar a.ui-state-default").on('mouseenter',function(){
			var curDate = new Date();
			curDate.setHours(9);
			curDate.setMinutes(0);
			curDate.setSeconds(0);
			curDate.setMilliseconds(0);
			var d = new Date($(this).closest('.ui-datepicker').find('.ui-datepicker-year').text() + '-' + $(this).closest('.ui-datepicker').find('.ui-datepicker-month').text() + '-' + ($(this).text().length > 1 ? $(this).text() : '0'+ $(this).text()));
			d.setHours(9);
			d.setMinutes(0);
			d.setSeconds(0);
			d.setMilliseconds(0);
			var n = d.getUTCDay();

			var dayOfWeekMonday = 1 - (curDate.getUTCDay());
		    if (dayOfWeekMonday > 0)
			{
				dayOfWeekMonday -= 7;
			}

			var beginDate = new Date(curDate);
			var endDate = new Date(curDate);
			beginDate.setTime(curDate.getTime() + ((1000 * 60 * 60 * 24 ) * dayOfWeekMonday));
			endDate.setTime(beginDate.getTime() + ((1000 * 60 * 60 * 24 ) * 6));
			if(beginDate.getTime() <= d.getTime() && endDate >= d.getTime()){
				if(n == 6){
					var i = 0;		
					while(i <= n){
						$(this).parent("td").parent("tr").find("td").eq(i).addClass("enter");
						i++;
					}
				} else {
					var i = 0;		
					while(i <= n){
						$(this).parent("td").parent("tr").find("td").eq(i).addClass("enter");
						i++;
					}

					var z = 6;
					while(z > n){
						$(this).parent("td").parent("tr").prev("tr").find("td").eq(z).addClass("enter");
						z--;
					}
				}
			}else {
				if(n == 0){
					$(this).parent("td").addClass("enter");
					$(this).parent("td").parent("tr").prev("tr").find("td").addClass("enter");
					$(this).parent("td").parent("tr").prev("tr").find("td").eq(0).removeClass("enter");
				}else{
					$(this).parent("td").addClass("enter");
					$(this).parent("td").siblings("td").addClass("enter");
					$(this).parent("td").siblings("td").eq(0).removeClass("enter");
					$(this).parent("td").parent("tr").next("tr").find("td").eq(0).addClass("enter");
				}
			}
		});
		$("#rank-calendar a.ui-state-default").on('mouseleave',function(){
			$(this).parent("td").removeClass("enter");
			$(this).parent("td").siblings("td").removeClass("enter");
			$(this).parent("td").parent("tr").next("tr").find("td").removeClass("enter");
			$(this).parent("td").parent("tr").prev("tr").find("td").removeClass("enter");
		});
	}	
	//랭킹 하위메뉴 클릭할때 
	$(".rank-division a").on('click',function(e){
		console.log('on');
		//e.preventDefault();
		//$(".rank-division a").removeClass("on");
		//$(this).addClass("on");
	});
	
	//일간, 주간, 월간, 연간 클릭할때
	$(".rank-cate-tit a").on('click',function(e){
		e.preventDefault();
		var cateIdx = $(this).index()*1;
		var endTime;
		$(".rank-cate-tit a").removeClass("on");
		$(this).addClass("on");
		$(".rank-cate-cont > div").css("display","none");
		$(".rank-cate-cont > div").eq(cateIdx).css("display","block");
		
		//값 변경
		$(".rank-cate-tit").attr("selectedCategoryId", $(this).attr("categoryId"));
		//TODO 일간, 주간, 월간 연간 랭킹 불러오기
		switch($(".rank-cate-tit").attr("selectedCategoryId")){
				case "1" : endTime = $("#salesRankDate").val();
							break;
				case "2" : endTime = $("#salesRankDateWeek").val();
							break;	
				case "3" : endTime = $("#salesRankMonthYear").val() + "-" + $("#salesRankMonth").val() + "-01";
							break;	
				case "4" : endTime = $("#salesRankYear").val() + "-01-01";
							break;										
				default :  endTime = $("#salesRankDate").val();
							break;			
		}		

		jsf_rank_loadDailyWeeklyMonthlySalesRank($(".rank-cate-tit").attr("selectedCategoryId"),  $("#categoryId").val(), endTime, $('.rank-cate'), $('.rank-best'), $('.rank-list'), $(".rank-cate-date"));
	});
	
	//날짜 누를때
	$(".rank-cate-date").on('click',function(){
		if($(".rank-cate-cont").is(".on")){
			$(this).removeClass("on");
			$(".rank-cate-cont").css("display","none");
			$(".rank-cate-cont").removeClass("on");
		}else{
			$(this).addClass("on");
			$(".rank-cate-cont").css("display","block");
			$(".rank-cate-cont").addClass("on");
		}		
	});
	
	//월간 달력에서 월 선택시.
	$(".rank-cld-ver3-month a").on('click',function(e){
		e.preventDefault();
		if($(this).css("cursor") == "pointer"){
			$(".rank-cld-ver3-month a").removeClass("on");
			$(this).addClass("on");
			$("#salesRankMonth").val($(this).attr("month"));
			$("#salesRankMonthYear2").val($('#salesRankMonthYear').val());
			var endTime = $("#salesRankMonthYear").val() + "-" + $("#salesRankMonth").val() + "-01";
			jsf_rank_loadDailyWeeklyMonthlySalesRank($(".rank-cate-tit").attr("selectedCategoryId"),  $("#categoryId").val(), endTime, $('.rank-cate'), $('.rank-best'), $('.rank-list'), $(".rank-cate-date"));
		}
	});
	
	//년간 달력에서 년도 선택시.
	$(".rank-cld-ver4 a").on('click',function(e){
		e.preventDefault();
		$(".rank-cld-ver4 a").removeClass("on");
		$(this).addClass("on");
		$("#salesRankYear").val($(this).attr("year"));
		var endTime = $("#salesRankYear").val() + "-01-01";
		jsf_rank_loadDailyWeeklyMonthlySalesRank($(".rank-cate-tit").attr("selectedCategoryId"),  $("#categoryId").val(), endTime, $('.rank-cate'), $('.rank-best'), $('.rank-list'), $(".rank-cate-date"));
	});
});

//TODO 일간, 주간, 월간 연간 각 날짜 랭킹 불러오기
function jsf_rank_loadDailyWeeklyMonthlySalesRank(periodType, categoryId, endTime, contentsContainer, removeContents1, removeContents2,  trackingPeriodContainer) {
    n_click_logging($.ajax({
        async: true,
        type: "POST",
        url: "/New/Rank/Ajax/RankList.aspx",
         data: {
			 pt: periodType,
             ci: categoryId,
             et: endTime
         },
        dataType: "html",
        success: function (data, textStatus) {
			removeContents1.remove();
			removeContents2.remove();
			$("#hidSalesRankTrackingPeriod").remove();
			contentsContainer.after(data);
            trackingPeriodContainer.html($("#hidSalesRankTrackingPeriod").val());
			if(trackingPeriodContainer.css("display") == "none"){
				trackingPeriodContainer.show();
			}
            //$j("#salesRankRatioGuideImage").click(jsf_rank_showSalesRankRatioGuide);
        },
        error: function (xhr, textStatus, errorThrown) {
            $("#dialogAlert").jAlert({ "msg": "랭킹 정보를 조회 하는 중에 일시적인 오류가 발생하였습니다." });
        },
        beforeSend: function (xhr, settings) {
            jsf_com_AjaxLoader(jcAJAX_BEFORESEND, 0, 0, "", contentsContainer);
        },
        complete: function (xhr, textStatus) {
            jsf_com_AjaxLoader(jcAJAX_COMPLETE, 0, 0, "", contentsContainer);
        }
    }));
}

//TODO 일간, 주간 달력에서 날짜 선택시.
function jsf_rank_CalendarDateSelected(date) {
	$("#salesRankDate").val(date);
	jsf_rank_loadDailyWeeklyMonthlySalesRank($(".rank-cate-tit").attr("selectedCategoryId"), $("#categoryId").val(), $("#salesRankDate").val(), $('.rank-cate'), $('.rank-best'), $('.rank-list'), $(".rank-cate-date"));
}

function jsf_rank_CalendarDateSelectedWeek(date) {
	$("#salesRankDateWeek").val(date);
	jsf_rank_loadDailyWeeklyMonthlySalesRank($(".rank-cate-tit").attr("selectedCategoryId"), $("#categoryId").val(), $("#salesRankDateWeek").val(), $('.rank-cate'), $('.rank-best'), $('.rank-list'), $(".rank-cate-date"));
}

//TODO 월간 년도 이동시.
function jsf_rank_CalendarMonthChange(contentsContainer, move) {
	$('.rank-cld-ver3-month a').removeClass('on');
	var monthYear = parseInt($("#salesRankMonthYear").val());
	if(move == "prev" && 2008 != monthYear){
		monthYear = monthYear - 1;
	} else if(move == "next" && $("#salesRankNowYear").val() != monthYear){
		monthYear = monthYear + 1
	}
	
	if(2008 == monthYear) {
		$(".rank-cld-ver3-left").addClass("ui-state-disabled");
	}else if($("#salesRankNowYear").val() == monthYear) {
		$(".rank-cld-ver3-right").addClass("ui-state-disabled");
	} else {
		$(".rank-cld-ver3-left").removeClass("ui-state-disabled");
		$(".rank-cld-ver3-right").removeClass("ui-state-disabled");
	}


	
	
	if(monthYear == $("#salesRankMonthYear2").val()){
		$('.rank-cld-ver3-month a').eq(parseInt($('#salesRankMonth').val()) - 1).addClass('on');
	}
	
	
	contentsContainer.contents()[1].textContent = monthYear;
	$("#salesRankMonthYear").val(monthYear);
	
	jsf_rank_CalendarMonthCheck();
}

function jsf_rank_CalendarMonthCheck() {
	var m = 0;
	while(m < 12){
		if($('#salesRankNowYearMonth').val().split('-')[0] == $('#salesRankMonthYear').val()){
			if(parseInt($('#salesRankNowYearMonth').val().split('-')[1]) > m){
				$('.rank-cld-ver3-month a').eq(m).css("cursor", "pointer");
			}else{
				$('.rank-cld-ver3-month a').eq(m).css("cursor", "");
			}
		} else{
			$('.rank-cld-ver3-month a').eq(m).css("cursor", "pointer");
		}
		m++
	}
}