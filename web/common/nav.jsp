<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-md navbar-light pt-3 ">
    <div class="container-fluid">
        <a class="navbar-brand mx-auto" href="<%=request.getContextPath()%>/view/main.jsp"><i class="fab fa-dev"></i> 안녕하세요</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll"
                aria-controls="navbarScroll">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <%
                    String memid = (String) session.getAttribute("memberID");
                    if (memid == null) {
                %>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page"href="<%=request.getContextPath()%>/view/member/memberRegister.jsp">회원가입</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/view/member/loginForm.jsp">로그인</a>
                </li>
                <%
                } else {
                %>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/view/member/memberUpdate.jsp"><%=memid%>님:회원정보 수정</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/view/member/logout.jsp">로그아웃</a>
                </li>
                <%
                    }
                %>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/view/board/list.jsp?boardid=1">공지사항[]</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/view/board/list.jsp?boardid=2">자유게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/view/board/list.jsp?boardid=3">QnA</a>
                </li>
                <% if(memid != null && memid.equals("admin")){%>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/view/member/memberList.jsp">회원리스트</a>
                </li>
                <%}%>
            </ul>
        </div>
    </div>
</nav>