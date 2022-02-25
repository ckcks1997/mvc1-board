<%@ page import="service.BoardDao" %>
<%@ page import="model.Board" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String user = (String)session.getAttribute("memberID");

    int num = Integer.parseInt(request.getParameter("num"));
    BoardDao bd = new BoardDao();

    Board b = bd.boardOne(num);
    if(user == null){
%>
<script>
    alert("로그인 이후 사용 가능합니다");
    location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp";
</script>
<%}%>
<div class="container">
    <form name="f" action="boardReplyPro.jsp"  method="post">
        <h2 id="center">게시판입력</h2>
        <input type="hidden" name="num" value="<%=b.getNum()%>">
        <input type="hidden" name="ref" value="<%=b.getRef()%>">
        <input type="hidden" name="reflevel" value="<%=b.getReflevel()%>">
        <input type="hidden" name="refstep" value="<%=b.getRefstep()%>">
        <div class="form-group">
            <input type="hidden" name="boardid" value="">
            <label>작성자:</label>
            <input type="text" class="form-control" name="writer" value="<%=user%>" readonly = "readonly"/>
            <label>비번:</label>
            <input type="password" class="form-control" name="pass" />
            <label>제목:</label>
            <input type="text" class="form-control" name="subject" value="re:<%=b.getSubject()%>"/>
        </div>
        <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="10" cols="50" name="content"></textarea>
        </div>

        <br>
        <div class="container text-center">
            <button type="submit" class="btn btn-primary ">등록</button>
            <a type="submit" class="btn btn-secondary " onclick="history.back()">취소</a>
        </div>
    </form>
</div>
</body>
</html>
