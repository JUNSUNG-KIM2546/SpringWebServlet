<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title> 게시판 글쓰기 </title>
</head>
<body>

<jsp:include page="/WEB-INF/views/menu.jsp" />

<h1> 글쓰기 </h1>
<form action='${pageContext.request.contextPath}/bbs/add.do' method='post'>
		제목 : <input type='text' name='bbsTitle' 	value=''><br>
		내용 : <textarea name='bbsContent' rows="10" cols="60"></textarea><br>
		<input type='submit'/>
</form>
	<h2>=================================================================</h2> 
	<h2> 게시판 목록으로 가기 </h2>
<a href='${pageContext.request.contextPath}/bbs/list.do' method='post'>
		<button type='button'> 게시판 목록 </button>
</a>
</body>
</html>                 	