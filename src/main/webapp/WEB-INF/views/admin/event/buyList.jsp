<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<%@include file="/WEB-INF/views/admin/include/head.jsp" %>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="canonical"
	href="https://getbootstrap.com/docs/3.4/examples/signin/">

<title>ADMIN SIGNIN</title>

<head>

<%-- 버튼 클릭 이벤트 메소드 --%>
<script>
$(document).ready(function(){
	var srchForm = $('form.js-srch-frm');
	
	/* 검색 버튼 클릭 시 */
	$(".js-srch-btn").on("click", function(e){
		e.preventDefault();
		
		self.location = "eventList"
			+ '${pm.makeQuery(1)}'
			+ "&searchType="
			+ srchForm.find('.js-srch-type').val()
			+ "&keyword=" + srchForm.find('.js-srch-kwd').val();
	});

	
	/* 전체 선택 체크박스 클릭 시 */
	$("#checkAll").on("click", function(){
		// 전체선택 클릭 여부로 다른 체크박스 체크
		$(".check").prop('checked', this.checked);
	});
	
	/* 체크박스 중 선택안된 체크박스 존재 시 전체선택 해제 */ 
	$(".check").on("click", function(){
		$("#checkAll").prop('checked', false);
	});

	
	/* 선택 상품 수정 버튼 클릭 시 */ 
	$("#btn_edit_check").on("click", function(){

		// 체크여부 유효성 검사
		if($("input[name='check']:checked").length==0){
			alert("수정할 예매를 선택해주세요.");
			return;
		}
		
		var checkArr = [];
		var amountArr = [];
		var buyArr = [];
		
		var evt_amount = $("#evt_amount").val();
		var evt_buy = $("#evt_buy:selected").val();
		
		// 체크 된 상품의 value(evt_num)을 가져옴
		$("input[name='check']:checked").each(function(i){
			var evt_num = $(this).val();
			var evt_amount = $("input[name='amount_"+evt_num+"']").val();
			var evt_buy = $("select[name='buy_"+evt_num+"']").val();
			
			checkArr.push(evt_num);			
			amountArr.push(evt_amount);			
			buyArr.push(evt_buy);
			
		});
		
		$.ajax({
			url: '/admin/event/editChecked',
			type: 'post',
			dataType: 'text',
			data: {
					checkArr : checkArr,
					amountArr : amountArr,
					buyArr : buyArr
				   },
			success : function(data) {
				alert("수정이 완료되었습니다.");
				location.href="/admin/event/eventList${pm.makeSearch(pm.cri.page)}";
			}

		});
	});
	
	/* 선택 상품 삭제 버튼 클릭 시 */
	$("#btn_delete_check").on("click", function(){

		// 체크여부 유효성 검사
		if($("input[name='check']:checked").length==0){
			alert("삭제할 예매를 선택해주세요.");
			return;
		}
	
		// 체크 된 상품이 존재할 경우 진행
		var result = confirm("선택한 예매를 삭제하시겠습니까?");
		if(result){
			
			var checkArr = [];
			var imgArr = [];
			
			// 체크 된 상품의 value(evt_num)을 가져옴
			$("input[name='check']:checked").each(function(i){
				var evt_num = $(this).val();
				var evt_img = $("input[name='img_"+evt_num+"']").val();
				
				checkArr.push(evt_num);
				imgArr.push(evt_img);
			});
			
			$.ajax({
				url: '/admin/event/deleteChecked',
				type: 'post',
				dataType: 'text',
				data: {
						checkArr : checkArr,
						imgArr : imgArr
					   },
				success : function(data) {
					alert("삭제가 완료되었습니다.");
					location.href = "/admin/event/eventList${pm.makeSearch(pm.cri.page)}";
				}
			});
		} else{}
	});

	/* 상품 리스트 - 삭제 버튼 클릭 시 */
	$("button[name=btn_delete]").on("click", function(){
		var result = confirm("이 예매를 삭제하시겠습니까?");
		if(result){
			$(this).parent().submit();  // 아래 코드로 작성시 맨 아래 코드가 삭제되는 버그가 발생 해당 코드를 감싸는 부모태그(form)을 전송하기 위해 parent사용
			//$(".deleteForm").submit();
		} 
	});
});
</script>
<script>
	/* 상품 수정 버튼 클릭 시 */
	var clickEdit = function(evt_num){
		var url = '/admin/event/eventDetail${pm.makeSearch(pm.cri.page)}&evt_num=' + evt_num;
		location.href= url;
	};
	
	var clickBuy = function(evt_num){
		var url = '/admin/event/eventBuy?evt_num=' + evt_num;
		location.href= url;
	};
</script>
<%-- 메시지 처리 --%>
<script>
	if ("${msg}" == "INSERT_SUCCESS") {
		alert("예매등록이 완료되었습니다.");
		
	} else if ("${msg}" == "EDIT_SUCCESS") {
		alert("예매 수정이 완료되었습니다.");
		
	} else if ("${msg}" == "DELETE_SUCCESS") {
		alert("예매 삭제가 완료되었습니다.");
	}
</script>
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
				<h1>예매 리스트 <small>예매 List</small></h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 예매 관리</a></li>
					<li class="active">예매 목록</li>
				</ol>
			</section>

			<%-- MAIN CONTENT --%>
			<!-- Main content -->
			<section class="content container-fluid">
				<div class="col-12">
					<div class="row text-center">
						<div class="box" style="border: none;">
							<div class="box-header">
								<nav class="navbar navbar-default">
								  <div class="container-fluid">							
								    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
								      <form class="navbar-form navbar-left js-srch-frm">
									      <select class="form-select js-srch-type">
											<option value="null"
												<c:out value="${cri.searchType == null?'selected':''}"/>>검색조건 선택</option>
											<option value="evt_name"
												<c:out value="${cri.searchType eq 'evt_name'?'selected':''}"/>>공연명</option>
											<option value="evt_num"
												<c:out value="${cri.searchType eq 'evt_num'?'selected':''}"/>>공연ID</option>
											<option value="evt_detail"
												<c:out value="${cri.searchType eq 'evt_detail'?'selected':''}"/>>내용</option>
											<option value="evt_company"
												<c:out value="${cri.searchType eq 'evt_company'?'selected':''}"/>>공연사명</option>
											<option value="name_detail"
												<c:out value="${cri.searchType eq 'name_detail'?'selected':''}"/>>공연명+내용</option>
											<option value="name_company"
												<c:out value="${cri.searchType eq 'name_company'?'selected':''}"/>>공연명+공연사명</option>
											<option value="all"
												<c:out value="${cri.searchType eq 'all'?'selected':''}"/>>공연명+내용+공연사명</option>
										</select> 
								        <div class="form-group">
								          <input type="text" class="form-control js-srch-kwd" placeholder="검색" value="<c:out value="${cri.keyword == ''?'':cri.keyword}"/>">
								        </div>
								        <button type="submit" class="btn btn-default js-srch-btn">검색</button>
								      </form>
								      <ul class="nav navbar-nav navbar-right">
								       <li><a href="/admin/event/eventInsert">공연 등록</a></li>
								      </ul>
								    </div>
								  </div><!-- /.container-fluid -->
								</nav>
							</div>
							<div class="box-body">
								<table class="table table-striped text-center">
									<tr>
										<!-- <th><input type="checkbox" id="checkAll" /></th> -->
										<th>No</th><th>공연명</th><th>구매자</th><th>수량</th><th>판매금액</th><th>결제수단</th><th>예매날짜</th><th>수정/삭제/예매</th>
									</tr>
									
									<%-- 상품 리스트 출력 --%>
									<c:if test="${empty buyList}">
										<tr>
											<td colspan="10"> 
												<p style="padding:50px 0px; text-align: center;">검색한 자료가 존재하지 않습니다.<td colspan="10"> 
											
											</td>
											
										<tr>
									</c:if>
									<c:forEach var="buy" items="${buyList}" var="event">
										<tr>
											<%-- <td><input type="checkbox" name="check" class="check" value="${event.evt_num}" style=""></td> --%>
											<%-- <td class="col-md-1">${event.evt_num}</td>
											<td class="col-md-2"> --%>
											
											<td >${buy.buy_code}</td>
											<td class="col-md-2"> ${buy.evt_num}</td>
												<td>${buy.mb_id}</td>
											<td class="col-md-1">${buy.count}</td>
											<td class="col-md-1" ><fmt:formatNumber  value="${buy.totalprice}" pattern="###,###,###" /></td>
											<td class="col-md-1">${buy.method}</td>
											<td class="col-md-1">${buy.date}</td>
											
											<td class="col-md-2">
												<form class="deleteForm" method="post"
													action="/admin/event/delete${pm.makeSearch(pm.cri.page)}">
													<!-- 상품 코드 -->
													<input type="hidden" name="buy_code"
														value="${buy.buy_code}">
													<!-- 수정기능 -->
													<span>
													<button type="button" name="btn_edit" class="btn btn-default" onclick="clickEdit(${buy.buy_code});">수정</button>
													
													<!-- 삭제기능 -->
													<button type="button" name="btn_delete" class="btn btn-danger">삭제</button>
													<button type="button" name="btn_buy" class="btn btn-danger" onclick="clickBuy(${buy.buy_code});">예매</button>
													</span>
												</form>
											</td>
										</tr>

									</c:forEach>
								</table>
							</div>
							<!-- /.box-body -->


						<!-- 페이징 기능 -->
							<div class="box-footer">

								<div class="text-center">
									<ul class="pagination">
										<!-- 이전표시 여부  [이전] -->
										<c:if test="${pm.prev}">
											<li><a href="list${pm.makeSearch(pm.startPage-1)}">&laquo;</a>
											</li>
										</c:if>
										<!-- 페이지목록번호 :  1  2  3  4  5  -->
										<c:forEach begin="${pm.startPage}" end="${pm.endPage}"
											var="idx">
											<li <c:out value="${pm.cri.page == idx?'class =active':''}"/>>
												<a href="list${pm.makeSearch(idx)}">${idx}</a>
											</li>
										</c:forEach>
										<!-- 다음표시 여부  [다음]-->
										<c:if test="${pm.next && pm.endPage > 0}">
											<li><a href="list${pm.makeSearch(pm.endPage +1)}">&raquo;</a>
											</li>
										</c:if>

									</ul>
								</div>

							</div>
							<!-- /.box-footer-->
						</div>
					</div>
				</div>
			</section>
		</div>
		<!-- /.content -->
		<!-- /.content-wrapper -->


		<!-- Main Footer -->
		<%@ include file="/WEB-INF/views/admin/include/main-footer.jsp" %>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active">
					<a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a>
				</li>
				<li>
					<a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a>
				</li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane active" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li>
							<a href="javascript:;"> <i class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
							</a>
						</li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li>
							<a href="javascript:;">
								<h4 class="control-sidebar-subheading">
									Custom Template Design
									<span class="pull-right-container">
										<span class="label label-danger pull-right">70%</span>
									</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
								</div>
							</a>
						</li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading">
								Report panel usage
								<input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->


</body>
</html>