<%@ page import="service.BoardDao" %>
<%@ page import="model.Board" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<%
  int num = Integer.parseInt(request.getParameter("num"));
  String sessUser  = (String)session.getAttribute("memberID");

  BoardDao bd = new BoardDao();
  Board board = bd.boardOne(num);

  String msg = "접속자 검증 오류";
  String href="boardDeleteForm.jsp?num="+num;
  if(sessUser.equals(board.getWriter())){
    if(bd.deleteBoard(num)>0){
      msg="삭제되었습니다";
      href="list.jsp";
    }else{
      msg="알 수 없는 오류";
      href="list.jsp";
    };
  }
%>

<script>
  alert("<%=msg%>");
  location.href="<%=href%>";
</script>
</body>
</html>