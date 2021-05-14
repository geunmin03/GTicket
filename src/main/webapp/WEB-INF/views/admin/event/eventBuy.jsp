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
					공연 <c:out value="${vtype == 'u'?'상세':'등록'}"/><small>Member <c:out value="${vtype == 'u'?'Detail':'Buy'}"/></small>
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
							
							<table>
							   <tr height="40"><td bgcolor="yellow">공연명</td>
							      <td>${vo.evt_name}</td></tr>   
							   <tr height="40"><td bgcolor="yellow" >시행사</td>
							      <td>${vo.evt_company}</td>
							   </tr>
							   <tr height="40"><td bgcolor="yellow">공연상세정보</td>
							    <td><textarea rows="10" cols="40" readonly="readonly">${vo.evt_detail}</textarea></td>
								<tr height="40"><td bgcolor="yellow">공연 가격</td>
							      <td id = "evt_price">${vo.evt_price}</td></tr>
							       <tr height="40"><td bgcolor="yellow">남은 수량</td>
							      <td><span id="stock">${vo.evt_amount - vo.evt_discount} </span></td></tr>
							      <tr height="40"><td bgcolor="yellow">이미지</td>
							      <td> <img alt="" src="${vo.evt_img}" width =70 height="70"></td></tr>
							      
							       <tr height="40"><td bgcolor="gray">예매자</td>
							      <td> <input type="text" name="mb_id" id="mb_id"> <br>
							      <span id="idmessage"></span>
							      </td></tr>
							      <tr height="40"><td bgcolor="gray">예매수량</td>
							      <td> <input type="text" name="BUY_COUNT" id="BUY_COUNT"> 
							      		<input type="button" id="BUY_BUTTON" value="구매하기" onclick="buyTicket()"> <br>
							      	   <span id="emessage"></span>
							      	   </td></tr>
							      	   <td hidden="hidden" id="evt_num">${vo.evt_num}</td>
							 </table>
							<!-- /.box-header -->

							
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

    
function buyTicket() {
	   
	      c = parseInt($('#BUY_COUNT').val());
		  s = parseInt($('#stock').html());
		  n = $('#evt_num').html();
		  p = $('#evt_price').html();
		  t = parseInt(p) * c;
		  method = '카드';
		  id = $('#mb_id').val();
		  console.log('수량'+ c+' , 재고 '+s + ' , 공연번호 ' + n);
		  
		  if(id<=' ') {
			  $('#idmessage').html('구매자 id를 입력하세요.');
			  return false;
		  } else {
			  $('#idmessage').html('');
		  }
		  
		  if(c>s) {
			  $('#emessage').html('재고가 부족합니다.');
			  return false;
		  } else {
				$('#emessage').html('');
			}	
		  
		  confirm('가격은 '+ t +'원 입니다. 구매하시겠습니까?');
		  
		  
		  if(confirm){
				
			  if(confirm('결제 방법은 카드(확인), 현금은(취소)을 선택하세요.')) {
					 method = '카드'	
			  } else {
						method = '현금'
			  	} // 결제방법 선택
			  			
			$.ajax({
				
				type:'Get',
		         url:'payevent',
		         data: {
		        	 buy_count: c,
		        	 evt_num: n,
		        	 buy_totalprice: t,
		         	 buy_method: method,
		         	 mb_id: id
		         },
				
		         success:function(resultData){
		        	 
		        	 if (resultData.success=='T') {
		        		 location.reload();
		        	 	if (confirm(resultData.message+'\n 계속 입력하려면 (확인) 을 선택하고, 공연 list 보려면 (취소)를 선택하세요.')) {
		        	 		$('#mb_id').focus();
		        	 	} else {
		        	 		location.href='/admin/event/eventList';
		        	 	} 
						 
		        	 } else {
		        		 alert(resultData.message);
		        	 }
		        		 
		        	},
				error:function(){
					$('#resultArea1').html("~~ 오류발생 ~~");
					
				}	
			}); //ajax
			
		}else {
			return false;
		}
		
	} // buy_buy
		 


</script>   
</body>
</html>