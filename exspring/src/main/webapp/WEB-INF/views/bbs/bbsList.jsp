<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title> 게시판 목록 </title>
</head>
<body>

<jsp:include page="/WEB-INF/views/menu.jsp" />

<h1> 게시글 목록 </h1>

<table>
	<thead>
		<tr>
			<th> 번호 </th>
			<th> 제목 </th>
			<th> 작성자 </th>
			<th> 등록일시 </th>
		</tr>
	</thead>
		
	<tbody>
		<c:forEach var="vo" items="${bbsList}">	
			<tr><%-- ${vo.getMemId()} : ${vo.getMemPass()} : ${vo.getMemName()} : ${vo.getMemPoint()}  c:out으로 악성스크립트를 차단 해주어야 한다. --%>
				<td> ${vo.bbsNo} </td>
				<td> 
					<a href="${pageContext.request.contextPath}/bbs/edit.do?bbsNo=${vo.bbsNo}">
						<c:out value="${vo.bbsTitle}"/> 
					</a>
				</td>
				<td> 
					<c:out value="${vo.bbsWriter}"/> 
				</td>
				<td> 
					<fmt:formatDate value="${vo.bbsRegDate}" pattern="yyyy/MM/dd HH:mm:ss"/>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<a href="${pageContext.request.contextPath}/bbs/add.do"><button type='button'> 글쓰기 </button></a>
	
</body>
</html>


