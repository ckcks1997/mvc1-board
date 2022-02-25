<%@page import="service.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  String sessionID = (String)session.getAttribute("memberID");


String path = application.getRealPath("/")+"/boardupload/";
int size = 10*1024*1024;
MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8");
Board board = new Board();

board.setWriter(multi.getParameter("writer"));
board.setPass(multi.getParameter("pass"));
board.setSubject(multi.getParameter("subject"));
board.setContent(multi.getParameter("content"));
board.setFile1(multi.getFilesystemName("file1"));

board.setIp(request.getRemoteAddr());
board.setBoardid((String)session.getAttribute("boardid"));

BoardDao bd = new BoardDao();
  board.setNum(bd.nextNum());
  board.setRef(board.getNum());

String msg="게시물 등록 실패";
String url = "writeForm.jsp";
int num=0;
if(sessionID != null && sessionID.equals(board.getWriter())) {
  num = bd.insertBoard(board);
}
if(num==1){
  msg = "등록되었습니다." ;
  url = "list.jsp";
}

%>
<script >
alert('<%=msg%>');
location.href="<%=url%>";
</script>
</body>
</html>