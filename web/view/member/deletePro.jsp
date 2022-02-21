<%@ page import="model.Member" %>
<%@ page import="service.MemberDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  request.setCharacterEncoding("utf-8");
  String msg = "";
  String url = "";
  String login = (String) session.getAttribute("memberID");
  if (login == null || login.trim().equals("")) {
%>
<script>
  alert("로그인이 필요합니다");
  location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp";
</script>
<%
  } else {
    String pass = request.getParameter("pass");
    MemberDao md = new MemberDao();
    Member mb = md.selectOne(login);

    if(mb.getPass().equals(pass)){
      int num = md.deleteMember(mb);
      if(num==0){
        msg=login + " 오류발생";
        url = request.getContextPath()+"/view/main.jsp";
      }else{
        session.invalidate();
        msg=login + "탈퇴 완료";
        url = request.getContextPath()+"/view/main.jsp";
      }
    } else{
      msg = "비밀번호 오류";
      url = request.getContextPath()+"/view/member/deleteForm.jsp";
    }
  } %>

<script>
  alert("<%=msg%>");
  location.href="<%=url%>";
</script>
</body>
</html>
