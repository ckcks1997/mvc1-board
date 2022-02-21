<%@page import="model.Member"%>
<%@page import="service.MemberDao"%>
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
    String msg = "";
    String url = "";
    String login = (String) session.getAttribute("memberID");
    if(login == null || login.trim().equals("")){
%>
<script >
    alert("로그인이 필요합니다");
    location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp";
</script>
<% } else{


    MemberDao md = new MemberDao();
    Member mem = md.selectOne(login);
    String pass = request.getParameter("pass");
    String newpass = request.getParameter("newpass");


    if(mem.getPass().equals(pass)){
        int res = md.changePass(login, newpass);
        if(res>0){
            msg = "수정되었습니다";
            url = "main.jsp";
        }else{
            msg="오류가 발생했습니다";
            url = "main.jsp";
        }
    }else{
        msg = "비밀번호가 다릅니다";
        url = "member/passwordForm.jsp";
    }

} %>

<script>
    alert("<%=msg%>");
    location.href="<%=request.getContextPath()%>/view/<%=url%>";
</script>
</body>
</html>