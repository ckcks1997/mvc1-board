<%@page import="model.Member"%>
<%@page import="service.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");

    int num=0;

    String login = (String) session.getAttribute("memberID");
    if(login == null || login.trim().equals("")){
%>
<script >
    alert("로그인이 필요합니다");
    location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp";
</script>
<% } else{
    String email = request.getParameter("email");
    String tel = request.getParameter("tel");
    String pict = request.getParameter("picture");
    String pass = request.getParameter("pass");

    MemberDao md = new MemberDao();
    Member mem = md.selectOne(login);

    //member에 email, tel을 저장
    mem.setEmail(email);
    mem.setTel(tel);
    mem.setPicture(pict);

    String msg = "비밀번호가 틀립니다.";
    String url = request.getContextPath()+"/view/member/memberUpdate.jsp";


    if(mem.getPass().equals(pass) ){
        num = md.memberUpdate(mem);
        if(num==1) {
            msg = "변경되었습니다";
        }else{
            msg="오류발생";
        }
    }
    %>
<script>
    alert("<%=msg%>");
    location.href="<%=url%>";
</script>
<%
    }
%>


</body>
</html>