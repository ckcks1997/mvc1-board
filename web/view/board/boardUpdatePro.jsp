<%@ page import="service.BoardDao" %>
<%@ page import="model.Board" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  String path = application.getRealPath("/")+"/boardupload/";
  int size = 10*1024*1024;
  MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8");
  Board board = new Board();
  board.setNum(Integer.parseInt(multi.getParameter("num")));
  board.setWriter(multi.getParameter("writer"));
//  board.setPass(multi.getParameter("pass"));
  board.setSubject(multi.getParameter("subject"));
  board.setContent(multi.getParameter("content"));
  board.setFile1(multi.getFilesystemName("file1"));

  board.setIp(request.getRemoteAddr());
  board.setBoardid("1");

  BoardDao bd = new BoardDao();

  if(board.getFile1() == null || board.getFile1().equals("")){
    board.setFile1(multi.getFilesystemName("file2"));
  }
  Board dbboard = bd.boardOne(board.getNum());
  String msg = "비밀번호가 틀렸습니다";
  String url = "boardUpdateForm.jsp?num="+board.getNum();

  if(true){
    if(bd.boardUpdate(board)>0){
      msg = "수정되었습니다.";
      url = "boardInfo.jsp?num="+board.getNum();
    }else{
      msg="오류 발생";
    }
  }

%>
<script >
  alert('<%=msg%>');
  location.href="<%=url%>";
</script>
</body>
</html>
