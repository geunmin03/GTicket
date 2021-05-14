<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
    $(document).ready(function () {
       if (0 == "1") {
            getExhbt();
        }
    });

    function getExhbt() {
        $.ajax({
            async: true,
            type: "POST",
            url: "/New/Controls/Main/Ajax/axExhbt.aspx",
            dataType: "html",
            success: function (data, textStatus) {
                if (data != "") {
                    //$(".sec07").after(data)
                    $(".sec07").append(data)
                }
            },
            error: function (xhr, textStatus, errorThrown) {
            },
            beforeSend: function (xhr, settings) {
            },
            complete: function (xhr, textStatus) {
            }
        });
    }
</script>

<div id="dialogAlert" style="display:none;"></div>
<div id="dialogConfirm" style="display:none;"></div>
<div id="dialogPopup" style="display:none;"></div>
<img id="imgAjaxLoader" style="display: none; z-index: 1000;" src="/dist/img/loader.gif" alt="ajaxLoader"> 


<div class="cp-top-wrap">
<!--#### consice 공통 ####-->

	<div class="consice" id="consice" style="position: relative;">
		<div class="consice-left">
			<a href="http://www.yes24.com/" target="_blank">YES24</a>
			<a href="http://movie.yes24.com/" target="_blank">영화</a>
		       <a href="http://www.yes24.com/Mall/Main/Music/003?CategoryNumber=003" target="_blank" class="ccl-etc3">CD/LP</a>
		       <a href="http://www.yes24.com/Mall/Main/Dvd/004?CategoryNumber=004" target="_blank" class="ccl-etc4">DVD/BD</a>
			<a href="https://yes24livehall.com/" target="_blank" class="ccl-etc1">예스24라이브홀</a>
		       <a href="https://yes24stage.com/" target="_blank" class="ccl-etc2">예스24스테이지</a>
		</div>
		<div class="consice-right">
			<a href="https://www.yes24.com/Templates/FTLogin.aspx" id="consiceLogin">로그인</a>
			<a href="http://www.yes24.com/Member/FTMypageMain.aspx" target="_blank">마이페이지</a>
			<a href="http://www.yes24.com/Mall/Help/Main" target="_blank">고객센터</a>
		</div>
	</div>

	<script type="text/javascript">
	    $(document).ready(function () {
	
	        if (('False').toLowerCase() == 'false') {
	            $('#consiceLogin').html("로그인");
	
	            if (sTLPage == "1") {
	               $('#consiceLogin').attr("href", "/Pages/Login/LoginEnt.aspx?ReturnURL=" + jsf_base_GetYesFormatUrl());
	            }else{
	               $('#consiceLogin').attr("href", "https://www.yes24.com/Templates/FTLogin.aspx");
	            }
	        }
	        else {
	            $('#consiceLogin').html("로그아웃");
	
	            if (sTLPage == "1") {
	               $('#consiceLogin').attr("href", "/Pages/Login/LogoutEnt.aspx?ReturnURL=http://ticket.yes24.com");
	            }else{
	               $('#consiceLogin').attr("href", "https://www.yes24.com/Templates/FTLogOut.aspx?ReturnURL=http://ticket.yes24.com");
	            }
	        }
	
	    });
	
	    $(function(){
	        if ($.cookie("EXanadu") != null || $.cookie("Benefit") == "2314") {
	           $(".consice").hide();
	           $(".perform-top").css("top", "0px");
	           $("#pf-gnb-wrap").css("top", "0px");
	
	           if(99 == 1){ //장르메인
	               $(".cp-top-wrap").next().css("top", "100px");
	               $("section").first().css("padding-top", "100px");
	           }
	           else if(99 == 2){ //상세,경량화상세
	               $(".renew-wrap").css("top", "100px");
	           }
	           else if(99 == 3){ //장르리스트
	               $(".list-sec").css("padding-top","100px");
	           }
	           else{ //그 외
	               $(".content-min-wrap").css("padding-top", "100px");
	
	               if(99 == 4){ //검색
	                   $(".srch-scroll-slide").css("padding-top","100px");
	               }
	           }
	       }
	   });
	   
	</script>
<!--#### consice 공통 ####-->

	<!--#### Header 공통 ####-->
	<header class="perform-top" id="perform-top">
	
	<div id="divGepsMain" class="floating" style="width:245px;position:absolute; left:50%;top:250px; margin-left:-125px;"></div>
	<map name="map_floating">
	<area shape="rect" coords="200,5,240,40" href="javascript:$(&#39;#divGepsMain&#39;).hide()" alt="닫기"> 
	<area shape="rect" coords="40,40,200,210" href="http://ticket.yes24.com/Pages/Events/HotEvent/PromotionInfo.aspx?id=2602" alt="단독할인공연 기획전 바로가기"> 
	</map>
	
	
	
	 	<div class="pf-left">
			<a href="http://ticket.yes24.com/#" class="pf-ham off">
				<span class="pf-ham1"></span>
				<span class="pf-ham2"></span>
				<span class="pf-ham3"></span>
			</a>
			<h1>
	            <a href="/" class="pf-logo">
	                <svg viewBox="0 0 240 80" xmlns="http://www.w3.org/2000/svg" class="trans" style="width: 160px; height: 25px;">
	                   <style>
	                     /* Note that the color of the text is set with the    *
	                      * fill property, the color property is for HTML only */
	                     .Rrrrr { font: italic 60px serif; fill: red; }
	                   </style>
	                   <text x="10" y="55" class="Rrrrr">근민공짜티켓</text>
	               </svg>
	           </a>
	       </h1>
	</div>
	<div class="pf-center" style="left: 230px; transform: none;">
		<h2><a href="/event/list?eventType=15456&amp;Gcode=009_202_001">콘서트<span></span></a></h2>
		<h2><a href="/event/list?eventType=15457&amp;Gcode=009_202_002">뮤지컬<span></span></a></h2>
		
	</div>
	<div class="pf-right">
		<div class="pf-right-menu">
		    <a href="http://ticket.yes24.com/New/Recommend/Area.aspx">지역</a>
		    <a href="http://ticket.yes24.com/Rank/All">랭킹</a>
		    <a href="http://ticket.yes24.com/New/Events/Main.aspx">이벤트</a>
		</div>
		<div class="pf-top-srch" autocomplete="off">
			<input type="text" id="searchWord" autocomplete="off">
	           <input type="hidden" name="" id="searchType" value="" autocomplete="off">
			<a href="http://ticket.yes24.com/#" onclick="jsf_mm_Search();"><img src="/dist/img/pf-srch.png" alt="" class="trans"><img src="/dist/img/pf-srch-w.png" alt="" class="fixed"></a>
		</div>
		<a href="http://ticket.yes24.com/Pages/MyPage/MyPageMain.aspx?Gcode=009_204" class="my-ticket"><span>MY티켓</span></a>
		<a href="http://ticket.yes24.com/Pages/English/Perf/FnPerfList.aspx?Gcode=009_205" class="global" target="_blank"><span>GLOBAL</span></a>
	</div>
	  
	
	
	<div class="pf-gnb-wrap off" id="pf-gnb-wrap" style="left: -209px;">
		<div class="pf-gnb-top">
			<a href="http://ticket.yes24.com/#" class="pf-ham">
				<span class="pf-ham1"></span>
				<span class="pf-ham2"></span>
				<span class="pf-ham3"></span>
			</a>			
		</div>
		<div class="pf-gnb-box mCustomScrollbar _mCS_1">
			<div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0">
				<div id="mCSB_1_container" class="mCSB_container" style="position:relative; top:0; left:0;" dir="ltr">
					<div class="pf-gnb-scroll-wrap">
						<ul class="pf-gnb-list1">
							<li class=""><h2><a href="http://ticket.yes24.com/New/Genre/GenreMain.aspx?genre=15456&amp;Gcode=009_202_001" class="">콘서트</a></h2><span></span>
								<ul class="pf-gnb-2depth" style="display: none; height: 92px; padding-top: 13px; margin-top: 0px; padding-bottom: 13px; margin-bottom: 0px;">
									<li><a href="http://ticket.yes24.com/New/Genre/GenreList.aspx?genretype=1&amp;genre=15456">전체보기</a></li>
									<li><a href="http://ticket.yes24.com/New/Genre/GenreList.aspx?genretype=2&amp;genre=15462">국내뮤지션</a></li>
									<li><a href="http://ticket.yes24.com/New/Genre/GenreList.aspx?genretype=2&amp;genre=15463">해외뮤지션</a></li>
									<li><a href="http://ticket.yes24.com/New/Genre/GenreList.aspx?genretype=2&amp;genre=15464">페스티벌</a></li>
								</ul>
							</li>
							<li class=""><h2><a href="http://ticket.yes24.com/New/Genre/GenreMain.aspx?genre=15457&amp;Gcode=009_202_002" class="">뮤지컬</a></h2><span></span>
								<ul class="pf-gnb-2depth" style="display: none; height: 115px; padding-top: 13px; margin-top: 0px; padding-bottom: 13px; margin-bottom: 0px;">
									<li><a href="http://ticket.yes24.com/New/Genre/GenreList.aspx?genretype=1&amp;genre=15457">전체보기</a></li>
									<li><a href="http://ticket.yes24.com/New/Genre/GenreList.aspx?genretype=2&amp;genre=15465">라이선스</a></li>
									<li><a href="http://ticket.yes24.com/New/Genre/GenreList.aspx?genretype=2&amp;genre=15466">오리지널</a></li>
									<li><a href="http://ticket.yes24.com/New/Genre/GenreList.aspx?genretype=2&amp;genre=15467">창작</a></li>
									<li><a href="http://ticket.yes24.com/New/Genre/GenreList.aspx?genretype=2&amp;genre=15468">넌버벌 퍼포먼스</a></li>
								</ul>
							</li>
							
						</ul><!--pf-gnb-list1-->
						<div class="pf-gnb-list2">
							<a href="http://ticket.yes24.com/Pages/MyPage/MyPageMain.aspx?Gcode=009_106_002" class="pf-gnb-btn1">MY티켓</a>
						</div><!--pf-gnb-list2-->
						<ul class="pf-gnb-list3">
							<li><a href="http://ticket.yes24.com/Pages/Notice/NoticeMain.aspx">예매확인/취소</a></li>
						</ul><!--pf-gnb-list3-->
							<div class="pf-gnb-list4">
								<ul>
									<li><a href="http://ticket.yes24.com/Pages/MyPage/MyOrder.aspx?Gcode=009_106_001" id="leftMyOrder" class="pf-gnb-btn4">공지사항</a></li>
									<li><a href="http://ticket.yes24.com/Pages/MyPage/MyOrder.aspx?Gcode=009_106_001" id="leftMyOrder" class="pf-gnb-btn4">이용안내</a></li>
								</ul>				
			                    
							</div><!--pf-gnb-list4-->	
					</div>
				</div>
				
			</div>
		</div>
		<a href="http://ticket.yes24.com/#" class="pf-gnb-close"></a>
	</div>
	
	<!--검색결과-->
	
	
	   <div class="pf-srch-drop">
		<div class="before">
			<div class="left before-left">
				<p class="drop-tit">인기검색어</p>
				<p class="drop-date">2021.03.21 기준</p>
				<ul id="ulFavoriteSearchWord">
				</ul>				
			</div>
			<div class="right before-right">
				<p class="drop-tit">최근검색어</p>
				<p class="drop-del"><a href="http://ticket.yes24.com/#" onclick="fax_RemoveRecentSearchWord();">최근검색어삭제</a></p>				
				<p class="drop-none">
					최근검색어가 없습니다
				</p>
				<ul id="ulRecentSearchWord">
				</ul>
			</div>
		</div>
		<div class="after">
			<div class="left after-left">
				<ul id="ulAutoSearchWord">
				</ul>
			</div>
			<div class="right after-right">
	               <a href="http://ticket.yes24.com/#">
				<div class="drop-tail" onclick="goDetailByWord();">
						<img id="imgSearchAuto" src="http://ticket.yes24.com/" alt="">
						<p class="drop-tail-tit" id="titSearchAuto"></p>
						<p class="drop-tail-date" id="dateSearchAuto"></p>
					</div>
	                </a>
				</div>
			</div>
			<a href="http://ticket.yes24.com/#" class="drop-close"><img src="/dist/img/drop-close.png" alt=""></a>
		</div>
	
	<script type="text/javascript" src="/dist/js/SearchAuto.js"></script>
	<script type="text/javascript" src="/dist/js/SearchWord.js"></script>
	<script type="text/javascript">
	   var searchAutoIdPerf = "";
	   $(document).ready(function () {
	       $("#searchWord").jry_Search_autoComplete();
	
	       $("#searchWord").unbind("keypress.searchWord").bind("keypress.searchWord", function (evt) { if (evt.which == 13) { jsf_mm_Search(); return false; } });
	   });
	
	   function jsf_mm_Search() {
	       if (document.getElementById('searchWord').value.length == 0) {
	           //jsf_Alert("검색어를 입력하세요.");
	           alert("검색어를 입력하세요.");
	           $("#searchWord").focus();
	           return false;
	       }
	       else {
	           fax_AddRecentSearchWord();
	
	           location.href = "/Pages/Search/SearchList.aspx?SearchText=" + escape($("#searchWord").val()) + "&SearchType=" + escape($("#searchType").val()) + "&Gcode=009_203";
	       }
	   }
	
	   function goSearchByWord(str) {
	       fax_AddRecentSearchWord();
	
	       location.href = "/Pages/Search/SearchList.aspx?SearchText=" + escape(str) + "&Gcode=009_203";
	   }
	
	   function goDetailByWord() {
	       if(searchAutoIdPerf != "")
	           location.href = "/Pages/Perf/Detail/Detail.aspx?IdPerf=" + searchAutoIdPerf + "&Gcode=009_203";
	   }
	   
	</script>
	    <!--검색결과-->
	
	
	
	<script type="text/javascript">
	   var sTLPage = '0';
	
	   $(document).ready(function () {
	
	       
	       if ($.cookie("corpCookie") == "0000035") {
	           $("#divGepsMain").html($("#divgeps").html());
	       }
	
	       $("a.my-ticket, #leftMyTicket, #leftMyOrder").on('click',function(e){
	           e.preventDefault();
	           
	           if (('False').toLowerCase() == 'false') {
	               alert("로그인을 먼저 해주세요.");
	
	               if (sTLPage == "1") {
	                   location.href = "/Pages/Login/LoginEnt.aspx?ReturnURL=http://ticket.yes24.com/Pages/MyPage/MyPageMain.aspx";
	               }
	               else{
	                   location.href = "https://www.yes24.com/Templates/FTLogin.aspx?ReturnURL=http://ticket.yes24.com/Pages/MyPage/MyPageMain.aspx";
	               }
	           } else {
	               $(location).attr('href', $(this).attr("href"));
	           }
	
	       });
	
	       //$(".pf-top-srch").hide(); // 도서 점검
	
	   });
	
	   
	</script>
	</header>
	<!--#### Header 공통 ####-->
</div>

<!--#### 빅배너 ####-->