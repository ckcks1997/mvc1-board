<%@ page import="service.MemberDao" %>
<%@ page import="service.BoardDao" %>
<%@ page import="model.Board" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
</head>
<body>

<%
    int boardNum = Integer.parseInt(request.getParameter("num"));
    BoardDao bd = new BoardDao();
    Board board = bd.boardOne(boardNum);
    if(board == null){
%>
<script>

    alert("게시글을 찾을 수 없습니다");
    location.href="<%=request.getContextPath()%>/view/main.jsp";
</script>
<%}else{%>
<div class="container">
    <form name="f" action="writePro.jsp" enctype="multipart/form-data" method="post">
        <h2 id="center">게시판입력</h2>
        <div class="form-group">
            <label>작성자:</label>
            <input type="text" class="form-control" name="writer" disabled value="<%=board.getWriter()%>"/>

            <label>제목:</label>
            <input type="text" class="form-control" name="subject"value="<%=board.getSubject()%>" />
        </div>
        <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="10" cols="50" name="content"><%=board.getContent()%></textarea>
        </div>
        <div class="form-group">
            <label>파일저장:</label>
            <input type="hidden" name="originalFile" value="<%=request.getContextPath()%>/boardupload/<%=board.getFile1()%>">
            <input class="form-control" type="file" name="file1" >

        </div>

        <div class="m-auto" style="padding: 3px">
            <button type="submit" class="btn btn-primary">저장</button>
            <a class="btn btn-secondary" onclick="history.back()">취소</a>
        </div>
    </form>
</div>
</body>
<%}%>
</html>
