<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<%@include file="/WEB-INF/views/admin/include/head.jsp" %>
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
<script>
	$(document).ready(function(){
		var srchForm = $('form.js-srch-frm');
		
		/* 검색 버튼 클릭 시 */
		$(".js-srch-btn").on("click", function(e){
			e.preventDefault();
			
			self.location = "memberList"
				+ '${pm.makeQuery(1)}'
				+ "&searchType="
				+ srchForm.find('.js-srch-type').val()
				+ "&keyword=" + srchForm.find('.js-srch-kwd').val();
		});
		
		//배송현황 변경 버튼 클릭 시
		$("button[name=btn_modify]").on("click",function() {
				var odr_code = $(this).val();  
				var delivery = $("select[name='delivery_"+odr_code+"']").val();
				
				$.ajax({
					url : "/admin/order/modify",
					type : "post",
					dataType : "text",
					data : {
						odr_code : odr_code,
						delivery : delivery
					},
					success : function(data) {
						alert("회원정보가 변경되었습니다.");
						location.href="/admin/member/memberList${pm.makeQuery(pm.cri.page)}";
					}
				});

			});
	});
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
			<section class="content-header">
				<h1>
					회원 리스트 <small>Member List</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 회원 관리</a></li>
					<li class="active">회원 리스트</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">
				<div class="col-12">
					<div class="row">

					<div class="box" style="border: none;">
						<div class="box-header">
						<!-- <div class="row pull-right">
			<div style="display: inline-block; float: right; margin-right:15px;">
							<button id="btn_edit_check"  class="btn btn-default" >선택 공연 수정</button>
							<button id="btn_delete_check"  class="btn btn-default" >선택 공연 삭제</button>
							<button class="btn btn-primary"
								onClick="location.href='/admin/product/insert'">공연 등록</button>
							</div> -->
							<nav class="navbar navbar-default">
							  <div class="container-fluid">							
							    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							      <form class="navbar-form navbar-left js-srch-frm">
							      	<select class="form-select js-srch-type">
										<option value="null"
											<c:out value="${cri.searchType == null?'selected':''}"/>>검색조건 선택</option>
										<option value="name"
											<c:out value="${cri.searchType eq 'name'?'selected':''}"/>>이름</option>
										<option value="id"
											<c:out value="${cri.searchType eq 'id'?'selected':''}"/>>아이디</option>
										<option value="email"
											<c:out value="${cri.searchType eq 'email'?'selected':''}"/>>이메일</option>
										<option value="name_id"
											<c:out value="${cri.searchType eq 'name_id'?'selected':''}"/>>이름+아이디</option>
										<option value="all"
											<c:out value="${cri.searchType eq 'all'?'selected':''}"/>>이름+아이디+이메일</option>
									</select> 
							        <div class="form-group">
							          <input type="text" class="form-control js-srch-kwd" placeholder="검색" value="<c:out value="${cri.keyword == ''?'':cri.keyword}"/>">
							        </div>
							        <button type="submit" class="btn btn-default js-srch-btn">검색</button>
							      </form>
							      <ul class="nav navbar-nav navbar-right">
							       <li><a href="/admin/member/insertf">회원 등록</a></li>
							      </ul>
							    </div>
							  </div><!-- /.container-fluid -->
							</nav>
						</div>
						<div class="box-body">
						
							<table class="table table-striped text-center">
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>이메일</th>
									<th>휴대폰 번호</th>
									<th>등록일</th>
									<th></th>
								</tr>

							<tbody>
	                	<c:if test="${empty memberList}">
				    		<tr>
								<td colspan="6"> 
									
									<p>검색된 예매 정보가 존재하지 않습니다.</p>
								</td>
								
							</tr>
				   		 </c:if>
								<%-- 주문 리스트 출력 --%>
								<c:forEach items="${memberList}" var="memberVO">
									<tr>
										<td class="col-md-2">${memberVO.mb_id}</td>
										<td class="col-md-1">${memberVO.mb_name}</td>
										<td class="col-md-1"><p>${memberVO.mb_email}</p></td>
										<td class="col-md-1">${memberVO.mb_phone}</td>
										<td class="col-md-1"><p><fmt:formatDate value="${memberVO.mb_Date_up}" pattern="yyyy.MM.dd HH:mm:ss"/></p></td>
										<td class="col-md-1">
											<%-- <button type="button" name="btn_modify" class="btn btn-primary" value="${memberVO.mb_accept_e}" >변경</button> --%>
											<a href="/admin/member/memberDetail${pm.makeQuery(pm.cri.page)}&mb_id=${memberVO.mb_id}" class="btn btn-primary">수정</a>
											<a href="/admin/member/memberDelete${pm.makeQuery(pm.cri.page)}&mb_id=${memberVO.mb_id}" class="btn btn-primary">삭제</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
						<!-- /.box-body -->


						<!-- 페이징 기능 -->
						<div class="box-footer">

							<div class="text-center">
								<ul class="pagination">
									<!-- 이전표시 여부  [이전] -->
									<c:if test="${pm.prev}">
										<li><a href="memberList${pm.makeQuery(pm.startPage-1)}">&laquo;</a>
										</li>
									</c:if>
									<!-- 페이지목록번호 :  1  2  3  4  5  -->
									<c:forEach begin="${pm.startPage}" end="${pm.endPage}"
										var="idx">
										<li <c:out value="${pm.cri.page == idx?'class =active':''}"/>>
											<a href="memberList${pm.makeQuery(idx)}">${idx}</a>
										</li>
									</c:forEach>
									<!-- 다음표시 여부  [다음]-->
									<c:if test="${pm.next && pm.endPage > 0}">
										<li><a href="memberList${pm.makeQuery(pm.endPage +1)}">&raquo;</a>
										</li>
									</c:if>

								</ul>
							</div>

						</div>
						<!-- /.box-footer-->
					</div>
					</div>
				</div>
				<!--/.col (left) -->

				

			</section>
			<!-- /.content -->
		</div>
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