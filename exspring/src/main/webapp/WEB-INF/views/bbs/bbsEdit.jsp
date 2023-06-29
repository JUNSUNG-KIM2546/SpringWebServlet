<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title> 게시글 수정 </title>
</head>
<body>

<jsp:include page="/WEB-INF/views/menu.jsp" />

<h1> 게시글 수정 </h1>

<form action='${pageContext.request.contextPath}/bbs/edit.do' method='post'>
		<%-- 아이디 : 	 <input type="hidden" name='memId' value='<c:out value="${mbvo.memId}" />'/><br> 아이디 변경하지 못하게 인풋타입을 히든으로 --%>
		<input type="hidden"	name='bbsNo' 	value='<c:out value="${bvo.bbsNo}" />' readonly="readonly"/><br> <!-- 아이디 변경하지 못하게 readonly="readonly" -->
		제목 : 	<input type="text" 		name='bbsTitle' value='<c:out value="${bvo.bbsTitle}" />' /><br>
		내용 : 	<textarea name="bbsContent" rows="10" cols="60"><c:out value="${bvo.bbsContent}"/></textarea><br>
 		작성자 : 	<c:out value="${bvo.bbsWriter}" /><br>
 		등록일 : 	<fmt:formatDate value="${bvo.bbsRegDate}" pattern="yyyy/MM/dd HH:mm:ss"/><br>
		<input type='submit' value="저장"/>	
		
		<a href='${pageContext.request.contextPath}/bbs/del.do?bbsNo=${bvo.bbsNo}'><button type='button'> 삭제 </button></a>
</form>


	<h2>=================================================================</h2> 
	<h2> 게시판 목록으로 가기 </h2>
<a href='${pageContext.request.contextPath}/bbs/list.do' method='post'>
		<button type='button'> 게시판 목록 </button>
</a>
		
</body>
</html>
            	