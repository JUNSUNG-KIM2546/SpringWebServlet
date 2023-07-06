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
		제목 : 		<input type="text" 		name='bbsTitle' value='<c:out value="${bvo.bbsTitle}" />' /><br>
		내용 : 		<textarea name="bbsContent" rows="10" cols="60"><c:out value="${bvo.bbsContent}"/></textarea><br>
		<c:forEach var="vo" items="${bvo.attachList}">
			첨부 파일 : <a href="${pageContext.request.contextPath}/bbs/down.do?attNo=${vo.attNo}"><c:out value="${vo.attOrgName}"/></a><br>
		</c:forEach>
 		작성자 : 		<c:out value="${bvo.bbsWriter}" /><br>
 		등록일 : 		<fmt:formatDate value="${bvo.bbsRegDate}" pattern="yyyy/MM/dd HH:mm:ss"/><br>
		조회수 : 		<c:out value="${bvo.bbsCount}" /><br>
		<input type='submit' value="저장" />	
		
		<a href='${pageContext.request.contextPath}/bbs/del.do?bbsNo=${bvo.bbsNo}'><button type='button'> 삭제 </button></a>
</form>

<hr>
<form action="${pageContext.request.contextPath}/reply/add.do" method="post">
	<input type="hidden" name="repBbsNo" value="${bvo.bbsNo}" />
	<textarea rows="2" cols="40" name="repContent"></textarea>
	<input id="repSaveBtn" type="button" value="저장" />
</form>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript">
	//저장버튼을 클릭했을 때, AJAX 댓글 저장 요청을 전송
	//AJAX
	//(1)XmlHttpRequest 객체 사용
	//(2)fetch() 함수 사용
	//(3)$.ajax() 메서드 사용
	
		$('#repSaveBtn').on('click', function () {
			
			$.ajax({
			  url: "${pageContext.request.contextPath}/reply/add.do",	//요청주소
			  method: "POST",	//요청방식
			  data: { repBbsNo : ${bvo.bbsNo}, repContent : $('[name="repContent"]').val() },	//요청파라미터
			  dataType: "html"	//응갑데이터타입
			}).done(function( msg ) {	//요청 전송 후 성공적으로 응갑을 받았을 때 실행
				alert(msg);
			}).fail(function( jqXHR, textStatus ) {	//요청 처리에 오류가 발생했을때 실행
			  alert( "Request failed: " + textStatus );
			});
			
		});

</script>


<hr>
	<h2> 게시판 목록으로 가기 </h2>
	<a href='${pageContext.request.contextPath}/bbs/list.do' method='post'>
		<button type='button'> 게시판 목록 </button>
	</a>
		
</body>
</html>
            	