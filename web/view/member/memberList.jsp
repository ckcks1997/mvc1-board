<%@page import="model.Member" %>
<%@page import="java.util.List" %>
<%@page import="service.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    if (login != null && login.trim().equals("admin")) {

    MemberDao md = new MemberDao();
    List<Member> li = md.memberList();

%>
<hr>
<!-- table list start -->
<div class="container">
    <h2 id="center">회원 정보</h2>

    <table class="table table-hover">
        <thead>
        <tr>
            <th>id</th>
            <th>이름</th>
            <th>성별</th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>사진</th>

        </tr>
        </thead>
        <tbody>
        <%for (Member m : li) { %>
        <tr>
            <td><%=m.getId() %>
            </td>
            <td><%=m.getName() %>
            </td>
            <td><%=m.getNum() == 1 ? "남자" : "여자" %>
            </td>
            <td><%=m.getTel() %>
            </td>
            <td><%=m.getEmail() %>
            </td>
            <td><%=m.getPicture() %>
            </td>

        </tr>
        <%} %>

        </tbody>
    </table>
</div>
<% } else{%>
<h1>관리자 페이지입니다.</h1>
<%}%>
</body>
</html>