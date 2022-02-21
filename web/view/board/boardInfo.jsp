<%@page import="model.Board"%>
<%@page import="service.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  int boardnum = Integer.parseInt(request.getParameter("num"));
BoardDao bd = new BoardDao();
Board b = bd.boardOne(boardnum);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        .table>tbody>tr>td{
            padding : 12px;
        }
	</style>
</head>
<body>

	<div class="container">
		<h2 id="center">게시판 보기</h2>
		<table class="table border ps-5">
			<tbody>
            <tr><td>작성자:</td><td style="min-width: 50vw;"><%=b.getWriter()%></td></tr>
            <tr><td>제목:</td><td><%=b.getSubject()%></td></tr>
            <tr height="250px"><td>내용:</td> <td><%=b.getContent()%></td></tr>
            <tr><td>파일:</td>
                <td> <% if(b.getFile1() != null){%><img style=" max-width: 300px; max-height: 300px; " src="<%=request.getContextPath()%>/boardupload/<%=b.getFile1()%>"><%}%></td>
            </tr>
			</tbody>
		</table>
		<div style="padding:3px; text-align: center;">
			<button class="btn btn-primary" onclick="location.href=''">답변</button>

			<button class="btn btn-primary" onclick="location.href='boardUpdateForm.jsp?num=<%=b.getNum()%>'">수정</button>
			<button class="btn btn-secondary"  onclick="history.back()">목록</button>
		</div>
	</div>
	<br><br>
</body>
</html>