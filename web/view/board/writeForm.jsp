<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
	</head>
	<%
		String user = (String)session.getAttribute("memberID");
		if(user == null){
	%>
	<script>
		alert("로그인 이후 사용 가능합니다");
		location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp";
	</script>
	<%}else{%>
	<body>
		<div class="container">
			<form name="f" action="writePro.jsp" enctype="multipart/form-data" method="post">
				<h2 id="center">게시판입력</h2>
				<div class="form-group">
					<input type="hidden" name="boardid" value="">
					<label>작성자:</label>
					<input type="text" class="form-control" name="writer" value="<%=user%>" readonly = "readonly"/>
					<label>비번:</label>
					<input type="password" class="form-control" name="pass" />
					<label>제목:</label>
					<input type="text" class="form-control" name="subject" />
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="10" cols="50" name="content"></textarea>
				</div>
				<div class="form-group">
					<label>파일저장:</label>
					<input class="form-control" type="file" name="file1">
				</div>
				<br>
				<div class="container text-center">
					<button type="submit" class="btn btn-primary ">등록</button>
					<a type="submit" class="btn btn-secondary " onclick="history.back()">취소</a>
				</div>
			</form>
		</div>
	</body>
<%}%>
</html>
