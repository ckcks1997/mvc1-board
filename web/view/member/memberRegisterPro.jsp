<%@ page import="service.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    MemberDao md = new MemberDao();
    String name = request.getParameter("name");
    int num = md.insertMember(request);
    String msg = "";
    String url = "";
    if (num > 0) {

        msg = name + " 님 가입되었습니다.";
        url = request.getContextPath() + "/view/member/loginForm.jsp";
    } else {
        msg = "가입실패";
        url = request.getContextPath() + "/view/main.jsp";
    }

%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>

</body>
</html>
