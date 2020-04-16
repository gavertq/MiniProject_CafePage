<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/*기본 CSS 및 모바일*/
	#wrap_newsDetail{display: flex; flex-flow: column; margin: 0 auto; width: 80%; max-width: 1200px;}

	
	/*PC용 CSS*/
	@media all and (min-width:960px){		
	#wrap_newsDetail{position:relative; width:80%;}/*위에서 설정하고 아래서 따로 설정안하면 그 설정 유지. 새로 설정하면 새로 설정한값 적용*/
	
</style>

</head>
<body>
<jsp:include page="../mainPage/header.jsp"/>

	<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dao" class="members.newsDAO"/>
	<c:set var="dto" value="${dao.contentView(param.id) }"/>

	<div id="_newsDetail" align="center">
		<form action="modify.jsp" method="post">
			<input type="hidden" name="id" value="${dto.id }">
			<table border="1">
			<tr>
				<th>번호</th><td>${dto.id }</td>
			</tr>
			<tr>
				<th>조회수</th><td>${dto.hit }</td>
			</tr>
			<tr>
				<th>제목</th><td><input type="text" value="${dto.title }" name="title"></td>
			</tr>
			<tr>
				<th>내용</th><td><textarea name="content" rows="10" cols="50" style="resize: none;">${dto.content }</textarea></td>
			</tr>
			<tr>
				<th colspan="2">
				<a href="news.jsp">목록이동</a>&nbsp;&nbsp;
				</th>
			</tr>	
			</table>
		</form>
	</div>
	
<jsp:include page="../mainPage/footer.jsp"/>
</body>
</html>