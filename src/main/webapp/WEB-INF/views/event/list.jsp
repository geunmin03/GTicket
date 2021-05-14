<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 포맷팅 관련 태그라이브러리(JSTL/fmt) --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>YES24 티켓</title>
  
	<%@ include file="/WEB-INF/views/common/headFront.jsp" %>
	<link rel="stylesheet" type="text/css" href="/dist/css/main2.css">
   
	<link rel="stylesheet" type="text/css" href="/dist/css/swiper.css">
	<link rel="stylesheet" type="text/css" href="/dist/css/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="/dist/css/ranking.css">
	
	<script type="text/javascript" src="/dist/js/jquery-migrate-1.4.1.min.js"></script>
	<!-- <script type="text/javascript" src="/dist/js/ranking.js"></script> -->
</head>
<body style="padding-top: 0px;">
<%@ include file="/WEB-INF/views/common/topFront.jsp" %>

<div class="content-min-wrap">
	<p class="big-title">공연</p>
	<div class="rank-division">
		<a href="http://ticket.yes24.com/New/Rank/Ranking.aspx">전체</a>
		<a href="http://ticket.yes24.com/New/Rank/Ranking.aspx?genre=15456" class="on">콘서트</a>
		<a href="http://ticket.yes24.com/New/Rank/Ranking.aspx?genre=15457">뮤지컬</a>
	</div>
	<div class="rank-cate">
		<div class="rank-cate-cate">
			<div class="rank-cate-tit category" selectedcategoryid="1">
				<a style="cursor:pointer;" categoryid="1" class="on">일간</a>
				<a style="cursor:pointer;" categoryid="2">주간</a>
				<a style="cursor:pointer;" categoryid="3">월간</a>
				<a style="cursor:pointer;" categoryid="4">연간</a>
			</div>
			<p class="rank-cate-date" style="">2021.03.31 (수) <span>12:30</span></p>
		</div>
		<div class="rank-cate-cont">		
			<div class="rank-cld-ver2" style="display:block;">
				<div class="rank-cld hasDatepicker" id="rank-calendar2">
				<div class="ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" style="display: block;"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all"><a class="ui-datepicker-prev ui-corner-all" onclick="DP_jQuery_1617163156777.datepicker._adjustDate(&#39;#rank-calendar2&#39;, -1, &#39;M&#39;);" title="이전 달"><span class="ui-icon ui-icon-circle-triangle-w">이전 달</span></a><a class="ui-datepicker-next ui-corner-all ui-state-disabled" title="다음 달"><span class="ui-icon ui-icon-circle-triangle-e">다음 달</span></a><div class="ui-datepicker-title"><span class="ui-datepicker-year">2021</span>.&nbsp;<span class="ui-datepicker-month">03</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="일">일</span></th><th><span title="월">월</span></th><th><span title="화">화</span></th><th><span title="수">수</span></th><th><span title="목">목</span></th><th><span title="금">금</span></th><th class="ui-datepicker-week-end"><span title="토">토</span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">1</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">2</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">3</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">4</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">5</a></td><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">6</a></td></tr><tr><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">7</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">8</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">9</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">10</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">11</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">12</a></td><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">13</a></td></tr><tr><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">14</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">15</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">16</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">17</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">18</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">19</a></td><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">20</a></td></tr><tr><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">21</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">22</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">23</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">24</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">25</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">26</a></td><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">27</a></td></tr><tr><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">28</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">29</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">30</a></td><td class=" ui-datepicker-days-cell-over  ui-datepicker-current-day ui-datepicker-today" onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar2&#39;,2,2021, this);return false;"><a class="ui-state-default ui-state-highlight ui-state-active ui-state-hover" href="http://ticket.yes24.com/Rank/Concert#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div></div>
			</div>
			<div class="rank-cld-ver1">
				<div class="rank-cld hasDatepicker" id="rank-calendar">
				<div class="ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" style="display: block;"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all"><a class="ui-datepicker-prev ui-corner-all" onclick="DP_jQuery_1617163156777.datepicker._adjustDate(&#39;#rank-calendar&#39;, -1, &#39;M&#39;);" title="이전 달"><span class="ui-icon ui-icon-circle-triangle-w">이전 달</span></a><a class="ui-datepicker-next ui-corner-all ui-state-disabled" title="다음 달"><span class="ui-icon ui-icon-circle-triangle-e">다음 달</span></a><div class="ui-datepicker-title"><span class="ui-datepicker-year">2021</span>.&nbsp;<span class="ui-datepicker-month">03</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="일">일</span></th><th><span title="월">월</span></th><th><span title="화">화</span></th><th><span title="수">수</span></th><th><span title="목">목</span></th><th><span title="금">금</span></th><th class="ui-datepicker-week-end"><span title="토">토</span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">1</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">2</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">3</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">4</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">5</a></td><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">6</a></td></tr><tr><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">7</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">8</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">9</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">10</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">11</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">12</a></td><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">13</a></td></tr><tr><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">14</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">15</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">16</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">17</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">18</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">19</a></td><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">20</a></td></tr><tr><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">21</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">22</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">23</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default" href="http://ticket.yes24.com/Rank/Concert#">24</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default ui-state-active" href="http://ticket.yes24.com/Rank/Concert#">25</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default ui-state-active" href="http://ticket.yes24.com/Rank/Concert#">26</a></td><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default ui-state-active" href="http://ticket.yes24.com/Rank/Concert#">27</a></td></tr><tr><td class=" ui-datepicker-week-end " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default ui-state-active" href="http://ticket.yes24.com/Rank/Concert#">28</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default ui-state-active" href="http://ticket.yes24.com/Rank/Concert#">29</a></td><td class=" " onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default ui-state-active" href="http://ticket.yes24.com/Rank/Concert#">30</a></td><td class=" ui-datepicker-days-cell-over  ui-datepicker-current-day ui-datepicker-today" onclick="DP_jQuery_1617163156777.datepicker._selectDay(&#39;#rank-calendar&#39;,2,2021, this);return false;"><a class="ui-state-default ui-state-highlight ui-state-active ui-state-hover" href="http://ticket.yes24.com/Rank/Concert#">31</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div></div>
			</div>
			<div class="rank-cld-ver3">
				<div class="rank-cld-ver3-arrow"><a href="http://ticket.yes24.com/Rank/Concert#" onclick="javascript:jsf_rank_CalendarMonthChange($(&#39;.rank-cld-ver3-arrow&#39;), &#39;prev&#39;); return false;" class="rank-cld-ver3-left"></a>2021<a href="http://ticket.yes24.com/Rank/Concert#" onclick="javascript:jsf_rank_CalendarMonthChange($(&#39;.rank-cld-ver3-arrow&#39;), &#39;next&#39;); return false;" class="rank-cld-ver3-right ui-state-disabled"></a></div>
				<div class="rank-cld-ver3-month">
					<a style="cursor:pointer;" month="01">1월</a>
					<a style="cursor:pointer;" month="02">2월</a>
					<a style="cursor:pointer;" month="03" class="on">3월</a>
					<a style="" month="04">4월</a><br>
					<a style="" month="05">5월</a>
					<a style="" month="06">6월</a>
					<a style="" month="07">7월</a>
					<a style="" month="08">8월</a><br>
					<a style="" month="09">9월</a>
					<a style="" month="10">10월</a>
					<a style="" month="11">11월</a>
					<a style="" month="12">12월</a>
				</div>
			</div>
			<div class="rank-cld-ver4">
                <a href="http://ticket.yes24.com/Rank/Concert#" year="2021" class="on">2021</a><a href="http://ticket.yes24.com/Rank/Concert#" year="2020">2020</a><a href="http://ticket.yes24.com/Rank/Concert#" year="2019">2019</a><a href="http://ticket.yes24.com/Rank/Concert#" year="2018">2018</a><a href="http://ticket.yes24.com/Rank/Concert#" year="2017">2017</a><a href="http://ticket.yes24.com/Rank/Concert#" year="2016">2016</a><a href="http://ticket.yes24.com/Rank/Concert#" year="2015">2015</a><a href="http://ticket.yes24.com/Rank/Concert#" year="2014">2014</a><a href="http://ticket.yes24.com/Rank/Concert#" year="2013">2013</a><a href="http://ticket.yes24.com/Rank/Concert#" year="2012">2012</a><a href="http://ticket.yes24.com/Rank/Concert#" year="2011">2011</a><a href="http://ticket.yes24.com/Rank/Concert#" year="2010">2010</a><a href="http://ticket.yes24.com/Rank/Concert#" year="2009">2009</a><a href="http://ticket.yes24.com/Rank/Concert#" year="2008">2008</a>
			</div>		
		</div>
	</div>
	
	<c:choose>
	<c:when test="${empty vo}">
        <div class="rank-list">
			<strong>검색 결과가 없습니다!!</strong>
		</div>
    </c:when>
    <c:otherwise>
    	<div class="rank-best">
		<c:forEach var="b" items="${vo}" begin="0" end="2" varStatus="status">
			<div>
				<a href="http://ticket.yes24.com/pages/perf/detail/detail.aspx?IdPerf=38661" title="${b.brd_title}">
					<span class="rank-best-img"><img src="/dist/img/20210318-38661.jpg" alt="${b.brd_title}" class="rank-best-img"></span>
					<p class="rlb-tit">${b.brd_num}</p>
					<p class="rlb-sub-tit">${b.mb_id}</p>
					<p class="rlb-sub-tit">2021.04.04~2021.04.04<br>${b.brd_title}</p>
					<p class="rank-best-point"><strong>50.8%</strong><span class="like-point">394</span></p>
					<p class="rank-best-number"><span>${status.index+1}위</span><span>-</span>&gt;</p>
				</a>
			</div>
		</c:forEach>
		</div>
		
		<div class="rank-list">
		<c:forEach var="b" items="${vo}" begin="3" varStatus="status">
			<div>
				<div class="fluctuation">
					<%-- <p><span>${status.index+1}위</span></p> --%>
					<p>-</p>
				</div>
				<div>
					<a href="http://ticket.yes24.com/pages/perf/detail/detail.aspx?IdPerf=38547">
						<img src="/dist/img/20210304-38547.jpg" alt="${b.brd_title}" class="rank-list-img">
					</a>
				</div>
				<div>
					<p class="rank-list-tag">단독</p>
					<p class="rank-list-tit"><a href="http://ticket.yes24.com/pages/perf/detail/detail.aspx?IdPerf=38547">${b.brd_title}</a></p>
					<p class="rank-list-grade"><span class="like-point">${b.brd_num}</span></p>
				</div>
				<div>
					<p>2021.04.03~2021.04.03<br>${b.mb_id}</p>
				</div>
				<div>2%</div>
			</div>
		</c:forEach>
		</div>
		<!--
			<tr style="color: gray;">
				<td>
					
					<a style="margin-top: 0; height: 40px; color: orange;" href="<c:url value='/board/content/${b.brd_num}${param.page == null ? pm.makeSearch(1) : pm.makeSearch(param.page)}'/>">
						
					</a>
					&nbsp;
					
					<c:if test="${b.newMark}">
						<span class="badge badge-pill badge-danger">new</span>
					</c:if>
				</td>
			</tr> 
			
			<div>
				<a href="http://ticket.yes24.com/pages/perf/detail/detail.aspx?IdPerf=38676" title="[일반] Beyond LIVE - SHINee : SHINee WORLD">
					<span class="rank-best-img"><img src="/dist/img/20210318-38676.jpg" alt="[일반] Beyond LIVE - SHINee : SHINee WORLD" class="rank-best-img"></span>
					<p class="rlb-tit">[일반] Beyond LIVE - SHINee : SHINee WORLD</p>
					<p class="rlb-sub-tit">2021.04.04~2021.04.04<br>NAVER V LIVE (Beyond LIVE)</p>
					<p class="rank-best-point"><strong>41.1%</strong><span class="like-point">164</span></p>
					<p class="rank-best-number"><span>2위</span><span>-</span>&gt;</p>
				</a>
			</div>
			<div>
				<a href="http://ticket.yes24.com/pages/perf/detail/detail.aspx?IdPerf=38738" title="Falling in Euihyun, 장의현 음감회">
					<span class="rank-best-img"><img src="/dist/img/20210324-38738.jpg" alt="Falling in Euihyun, 장의현 음감회" class="rank-best-img"></span>
					<p class="rlb-tit">Falling in Euihyun, 장의현 음감회</p>
					<p class="rlb-sub-tit">2021.04.04~2021.04.04<br>서울 나음아트홀</p>
					<p class="rank-best-point"><strong>5.1%</strong><span class="like-point">13</span></p>
					<p class="rank-best-number"><span>3위</span><span class="rank-best-number-up">4</span>&gt;</p>
				</a>
			</div>
			-->
		
		<!-- 
		
			
			<div>
				<div class="fluctuation">
					<p><span>5위</span></p>
					<p class="rank-list-number-up">8</p>
				</div>
				<div>
					<a href="http://ticket.yes24.com/pages/perf/detail/detail.aspx?IdPerf=38548">
						<img src="/dist/img/20210304-38548.jpg" alt="[2부관람권] [온라인] 2021 LOVESOME - 참 애썼다, 그것으로 되었다" class="rank-list-img">
					</a>
				</div>
				<div>
					<p class="rank-list-tag">단독</p>
					<p class="rank-list-tit"><a href="http://ticket.yes24.com/pages/perf/detail/detail.aspx?IdPerf=38548">[2부관람권] [온라인] 2021 LOVESOME - 참 애썼다, 그것으로 되었다</a></p>
					<p class="rank-list-grade"><span class="like-point">12</span></p>
				</div>
				<div>
					<p>2021.04.03~2021.04.03<br>온라인</p>
				</div>
				<div>0.5%</div>
			</div>
			<div>
				<div class="fluctuation">
					<p><span>6위</span></p>
					<p class="rank-list-number-up">12</p>
				</div>
				<div>
					<a href="http://ticket.yes24.com/pages/perf/detail/detail.aspx?IdPerf=38678">
						<img src="/dist/img/20210329-38678.jpg" alt="HIKE on PARK MUSIC FESTIVAL_관람권 [5/14]" class="rank-list-img">
					</a>
				</div>
				<div>
					<p class="rank-list-tit"><a href="http://ticket.yes24.com/pages/perf/detail/detail.aspx?IdPerf=38678">HIKE on PARK MUSIC FESTIVAL_관람권 [5/14]</a></p>
					<p class="rank-list-grade"><span class="like-point">1</span></p>
				</div>
				<div><p>2021.05.14~2021.05.14<br>온라인</p></div>
				<div>0.5%</div>
			</div>
		</div> -->
    </c:otherwise>
	</c:choose>
	
	<input type="hidden" id="hidSalesRankTrackingPeriod" value="2021.03.31 (수) &lt;span&gt;12:30&lt;/span&gt;">
    
    <div class="rank-noti">
		집계대상: 예스24 티켓 웹, 모바일(웹/앱), Global, 고객센터, 제휴사(결제완료 기준) <br>
		당일 오전의 경우 판매비중이 낮기 때문에 오전 10시 30분 이전까지는 전일 24시간의 집계현황을 알려드립니다.<br>
		일간/주간은 1시간 단위로 업데이트 되며, 월간/연간은 일 단위로 업데이트 됩니다. 
	</div>
</div>

<input type="hidden" id="salesRankDate" value="2021-03-31">
<input type="hidden" id="salesRankDateWeek" value="2021-03-31">
<input type="hidden" id="salesRankMonth" value="03">
<input type="hidden" id="salesRankNowYear" value="2021">
<input type="hidden" id="salesRankNowYearMonth" value="2021-03">
<input type="hidden" id="salesRankMonthYear" value="2021">
<input type="hidden" id="salesRankMonthYear2" value="2021">
<input type="hidden" id="salesRankYear" value="2021">
<input type="hidden" id="categoryId" value="15">

<!--#### Footer ####-->
<%@ include file="/WEB-INF/views/common/footerFront.jsp" %>
<!--#### Footer ####-->

<script type="text/javascript">
    $(function(){
        $('.rank-division a').eq(1).addClass('on');
        $(".rank-cld-ver3-right").addClass("ui-state-disabled");
        $(".rank-cld-ver3-month a").eq($("#salesRankMonth").val() - 1).addClass("on");
        $(".rank-cld-ver4 a").eq($("#salesRankYear").val() - 1).addClass("on")
        $(".rank-cld-ver4 a").eq(0).addClass("on");
        /* jsf_rank_CalendarMonthCheck(); */
    });

    $(document).ready(function () {
        /* jsf_rank_loadDailyWeeklyMonthlySalesRank($(".rank-cate-tit").attr("selectedCategoryId"), $("#categoryId").val(), $("#salesRankDate").val(), $('.rank-cate'), $('.rank-best'), $('.rank-list'), $(".rank-cate-date")); */

//    $j("#rankCategoryTab a").click(function() {
//        jsf_rank_SelectTab($j(this));
//        jsf_rank_loadDailyWeeklyMonthlySalesRank(1, $j("#rankCategoryTab").attr("selectedCategoryId"), $j("#salesRankDate").val(), $j("#salesRankChart"), $j("#salesRankTrackingPerid"));
//    });
    });
</script>
</body>
</html>