<%@ page import="service.MemberDao" %>
<%@ page import="model.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</head>
<body>


<%
    String login = (String) session.getAttribute("memberID");
    session.invalidate();
%>
<script>
    <%--alert("<%=login%>님이 로그아웃 되었습니다");--%>
    location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp";
</script>
</body>
</html>
