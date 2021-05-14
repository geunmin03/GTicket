<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<%@include file="/WEB-INF/views/admin/include/head.jsp" %>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="canonical"
	href="https://getbootstrap.com/docs/3.4/examples/signin/">

<link href="/dist/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    
<script src="/ckeditor/ckeditor.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@include file="/WEB-INF/views/admin/include/main_header_admin.jsp" %>
		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="/WEB-INF/views/admin/include/left_admin.jsp" %>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					공연 <c:out value="${vtype == 'u'?'상세':'등록'}"/><small>Member <c:out value="${vtype == 'u'?'Detail':'Register'}"/></small>
				</h1>
				<ol class="breadcrumb">
					<li>
						<a href="#"><i class="fa fa-dashboard"></i> 상품관리</a>
					</li>
					<li class="active">상품등록</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<!-- 상품등록 폼 -->
				<div class="row">
					<!-- left column -->
					<div class="col-md-12">
						<!-- general form elements -->
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">[공연 정보]</h3>
							</div>
							<!-- /.box-header -->

							<form role="form" action="/admin/event/<c:out value="${vtype == 'u'?'edit':'insert'}"/>" method="post" enctype="multipart/form-data" class="js-submit-form">
								<c:if test="${vtype eq 'u'}">
								    <input name="evt_num" type="hidden" value="${vo.evt_num}" />
								</c:if>
								
								<div class="box-body">
									<div class="form-group">
										<input type="hidden" name="page" value="${cri.page}" />
										<input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
										<input type="hidden" name="searchType" value="${cri.searchType}" />
										<input type="hidden" name="keyword" value="${cri.keyword}" />
									</div>
									
									<div class="form-group">
										<label for="mainCategory" style="width:30%; margin-right:20px;" >1차 카테고리</label>
										<label for="subCategory" style="width:30%;" >2차 카테고리</label> <br />
										<select class="form-control" id="mainCategory" name="cg_code_prt" style="width:30%; margin-right:10px; display: inline-block;" >
											<option value="default">1차 카테고리 선택</option>
											<c:forEach items="${cateList}" var="list">
												<option value="${list.cg_code}"<c:out value="${vo.cg_code_prt == list.cg_code?'selected':''}"/>>${list.cg_name}</option>
											</c:forEach>
										</select>
										<select class="form-control" id="subCategory" name="cg_code" style="width: 30%; display: inline-block;">
										 	<option value="default">2차 카테고리 선택</option>
										 	<c:forEach items="${subCateList}" var="subList">
										  		<option value="${subList.cg_code}"<c:out value="${vo.cg_code == subList.cg_code?'selected':''}"/>>${subList.cg_name}</option>
										 	</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">공연명</label> <input
											type="text" id="evt_name" name="evt_name" class="form-control"
											value="${vo.evt_name}">
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">시행사</label> <input
											type="text" id="evt_company" name="evt_company" class="form-control"
											value="${vo.evt_company}">
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1" style="width:40%; margin-right:10px;">가격</label> 
										<label for="exampleInputEmail1" style="width:40%;">판매량</label> 
										<input style="width:40%; margin-right:10px; display: inline-block;"
											type="text" id="evt_price" name="evt_price" class="form-control" 
											value="${vo.evt_price}" />
										<input style="width:40%; display: inline-block;"
											type="text" id="evt_discount" name="evt_discount" class="form-control "
											value="${vo.evt_discount}" />
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">공연상세</label>
										<textarea class="form-control" id="evt_detail" name="evt_detail" rows="8">
											${vo.evt_detail}</textarea>
									</div>
									<div class="form-group">
										<input type="hidden" name="evt_img" value="${vo.evt_img}" />	
										<label for="exampleInputEmail1">썸네일 이미지</label> 
										<span id="fileName" style="margin-left:5px; font-size:14px;">현재 등록된 파일: <c:out value="${originFile}" /></span>
										<input onchange="fileChange(this)"
											type="file" id="file1" name="file1" class="form-control" />
									</div>
							 
								 
								 
										<label for="evt_amount" style="width:30%; margin-right:10px;">Amount</label>
									<!-- evt_numtEmail1" style="width:30%; margin-right:10px;">Amount</label> --> 
										<label for="evt_buy" style="width:15%;">Buy availability</label><br /> 
										<input style="width:30%; margin-right:10px; display: inline-block;"
											type="text" id="evt_amount" name='evt_amount' class="form-control" 
											value="${vo.evt_amount}" />
										<select class="form-control" id="evt_buy" name="evt_buy" style="width: 15%; display: inline-block;">
										  <option 
										  	<c:out value="${vo.evt_buy == 'Y'?'selected':''}"/>>Y</option>
										  <option
										  	<c:out value="${vo.evt_buy == 'N'?'selected':''}"/>>N</option>
										</select>
									</div>
									<div class="form-group col-xs-6">
						                <label for="trg_open_ts" style="width:40%; margin-right:10px;">시작일자</label>
						                <div class="input-group date js-input-datetime col-md-8" id="trg_open_ts" 
											data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="evt_open_ts">
						                    <input class="form-control" id="trg_open_ts" size="16" type="text" value="${vo.evt_open_ts}" readonly>
						                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
											<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
						                </div>
										<input type="hidden" id="evt_open_ts" name="evt_open_ts" value="${vo.evt_open_ts}" />
						            </div>
						
						            <div class="form-group col-xs-6">
						                <label for="trg_close_ts" style="width:40%;">종료일자</label>
						                <div class="input-group date js-input-datetime col-md-8" id="trg_close_ts" 
											data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="evt_close_ts">
						                    <input class="form-control" id="trg_close_ts" size="16" type="text" value="${vo.evt_close_ts}" readonly>
						                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
											<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
						                </div>
										<input type="hidden" id="evt_close_ts" name="evt_close_ts" value="${vo.evt_close_ts}" />
						            </div>
								</div>
								
								
								<!-- /.box-body -->

								<div class="box-footer">
									<div>
										<hr>
									</div>

									<ul class="mailbox-attachments clearfix uploadedList">
									</ul>

									<button type="submit"  class="btn btn-primary js-btn-submit" >저장</button>
									<button type="button" id="list" class="btn btn-default js-btn-list" >목록</button>
								</div>
							</form>


						</div>
						<!-- /.box -->	
					</div>
					<!--/.col (left) -->

				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->


		<!-- Main Footer -->
		<%@ include file="/WEB-INF/views/admin/include/main-footer.jsp" %>
		
	</div>
<c:set var="rand"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>
<script type="text/javascript" src="/dist/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="/dist/js/bootstrap-datetimepicker.ko.js" charset="UTF-8"></script>
<script type="text/javascript" src="/asset/js/adminEventDetail.js?e=${rand}" charset="UTF-8"></script>
<%-- Handlebar Template --%>
<script id="subCGListTemplate" type="text/x-handlebars-template">
	<option value="default">2차 카테고리  선택</option>
	{{#each .}}
	<option value="{{cg_code}}"> {{cg_name}} </option>
	{{/each}}
</script>
<script>
// 파일 변경 이벤트 메소드
var fileChange = function(fis) {
	var str = fis.value;
	$(fis).html("파일이 변경됨");
}

$(function() {
	var body = $('body');
	
	window.asb.AdminEventDetailView.init(body, {
		'ckeditor': CKEDITOR	
		, 'mode': "${vtype}" 
	});
	

});

$("#list").click(function() {
	location.href = "/admin/event/eventList";
});


</script>
</body>
</html>