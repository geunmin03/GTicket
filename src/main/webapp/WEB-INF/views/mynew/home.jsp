<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>main home</h1>
<hr>
<c:if test="${message!=null}">
   <script>
      alert('${message}');
   </script>
</c:if>
<hr>
<h3>
<a href="admin">admin</a> <br>
<a href="myloginf">login</a> <br>
<hr>
<a href="member/memberList">memberList</a> <br>
<a href="member/insertf">join</a> <br>
<a href="member/memberDetail">memberDetail</a> <br>
<a href="member/memberDetail">나의 예매현황</a> <br>
<hr>
<a href="event/list">event_list</a> <br>
<a>공연등록</a> <br>
<a>공연수정</a> <br>	
<a>공연삭제</a> <br>	
<hr>
<a>공연예매</a> <br>
<a>예매수정</a> <br>
<a>예매취소</a> <br>
<a>예매리스트</a> <br>
<hr>
공지사항 <br>
Q&A	   <br>	
일반게시판 <br>
</h3>
</body>
</html>