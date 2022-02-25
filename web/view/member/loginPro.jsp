<%@ page import="service.MemberDao" %>
<%@ page import="model.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</head>
<body>

<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");

    MemberDao md = new MemberDao();
    //id가 없으면 mem:null, 있으면 mem return;
    Member mem = md.selectOne(id);
    String msg = "아이디를 확인하세요";
    String url = request.getContextPath() + "/view/member/loginForm.jsp";
    if (mem != null) {
        if (pass.equals(mem.getPass())) {
            session.setAttribute("memberID", mem.getId());
            msg = null;
            url = request.getContextPath() + "/view/main.jsp";
        }else {
            System.out.println(mem);
            msg = "비밀번호 확인하세요";
        }
    }
%>

<br>
<script>
    <% if(msg!=null){ %>
    alert("<%=msg%>");
    <%}%>
    location.href="<%=url%>";
</script>

</body>
</html>
