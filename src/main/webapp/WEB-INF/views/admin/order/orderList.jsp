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
<script>
	$(document).ready(function(){
	
		
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
						alert("배송현황이 변경되었습니다.");
						location.href="/admin/order/orderList${pm.makeQuery(pm.cri.page)}";
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
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					예매 리스트 <small>Order List</small>
				</h1>
				
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<!--------------------------
		        | Your Page Content Here |
		        -------------------------->
				 <ul class="nav navbar-nav navbar-right">
					  <li><a href="#"> 예매 삭제</a></li>
				        <li><a href="/admin/order/orderinsertf">에매 등록</a></li>
				</ul>
				
				<div class="row">
					<!-- left column -->
					<%-- 검색 조건 설정 및 페이지 이동에도 해당 값 유지 --%>
					<div class="col-md-12">
						

						<div class="box" style="border: none;">
							<div class="box-body">
							
								<table class="table table-striped text-center">
									<tr>
										<th>Buy_Code</th><th>공연코드</th><th>구매자코드</th>
										<th>수량</th><th>판매금액</th><th>결제수단</th>
										<th>예매날짜</th>
									</tr>
								<tbody>
		                	<c:if test="${empty buyList}">
					    		<tr>
									<td colspan="10"> 
										
										<p>예매 정보가 존재하지 않습니다.</p>
									</td>
								</tr>
					   		 </c:if>
									<%-- 예매 리스트 출력 --%>
									<c:forEach var="buy" items="${buyList}">
										<tr>
											<%-- <td><input type="checkbox" name="check" class="check" value="${event.evt_num}" style=""></td> --%>
											<%-- <td class="col-md-1">${event.evt_num}</td>
											<td class="col-md-2"> --%>
											
											<td >${buy.buy_code}</td>
											<td class="col-md-2"> ${buy.evt_num}</td>
												<td>${buy.mb_id}</td>
											<td class="col-md-1">${buy.buy_count}</td>
											<td class="col-md-1" ><fmt:formatNumber  value="${buy.buy_totalprice}" pattern="###,###,###" /></td>
											<td>${buy.buy_method}</td>
											<td>${buy.buy_date}</td>
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
											<li><a href="orderList${pm.makeQuery(pm.startPage-1)}">&laquo;</a>
											</li>
										</c:if>
										<!-- 페이지목록번호 :  1  2  3  4  5  -->
										<c:forEach begin="${pm.startPage}" end="${pm.endPage}"
											var="idx">
											<li <c:out value="${pm.cri.page == idx?'class =active':''}"/>>
												<a href="orderList${pm.makeQuery(idx)}">${idx}</a>
											</li>
										</c:forEach>
										<!-- 다음표시 여부  [다음]-->
										<c:if test="${pm.next && pm.endPage > 0}">
											<li><a href="orderList${pm.makeQuery(pm.endPage +1)}">&raquo;</a>
											</li>
										</c:if>

									</ul>
								</div>

							</div>
							<!-- /.box-footer-->
						</div>
					</div>
					<!--/.col (left) -->

				</div>

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