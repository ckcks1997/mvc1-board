<%@ page import="service.MemberDao" %>
<%@ page import="model.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
</head>
<body>

<%
    String login = (String) session.getAttribute("memberID");
    if (login == null || login.trim().equals("")) {
%>
<script>
    alert("로그인이 필요합니다");
    location.href = "<%=request.getContextPath()%>/view/member/loginForm.jsp";
</script>
<%
} else {
    MemberDao md = new MemberDao();
    Member mem = md.selectOne(login);
%>
<!-- 회원가입 -->
<br/>
<div class="container-md text-center" id="register">
    <h3>정보수정</h3>
    <br/>
    <form class="mx-md-5 p-5 border border-3 rounded bg-light" method="post"
          action="<%=request.getContextPath()%>/view/member/memberUpdatePro.jsp" name="f">
        <input type="hidden" name="picture" value="<%=mem.getPicture()%>">
        <div class="row row-cols-3">
            <div class="form-group col-3">
                <div class="col img">
                    <img width="150" height="200" src="<%=request.getContextPath()%>/upload/<%=mem.getPicture() %>" alt="" id="pict"/>
                    <br/>
                    <button type="button" class="btn btn-dark"  onclick="win_upload()">사진등록</button>
                </div>
            </div>
            <div class="container form-group col-9">
                <div class="">
                    <div class="p-2 row">
                        <p class="my-auto col col-3">아이디</p>
                        <input type="text" class="form-control col mx-3" name="id" value="<%=mem.getId()%>" readonly = "readonly"/>
                    </div>
                    <hr/>
                    <div class="p-2 row">
                        <p class="my-auto col col-3">비밀번호</p>
                        <input type="password" class="form-control col mx-3" name="pass" />
                    </div>
                    <hr/>
                    <div class="p-2 row">
                        <p class="my-auto col col-3">이름</p>
                        <input type="text" class="form-control col mx-3" name="name" value="<%=mem.getName()%>" readonly = "readonly"/>
                    </div>
                    <hr/>
                    <div class="p-2 row">
                        <p class="my-auto col col-3">성별</p>
                        <div class="col d-flex justify-content-center">
                            <input type="radio" class="orm-check-input my-auto p-2" name="gender" <%=mem.getNum() == 1 ? "checked" : "" %>  id="m" value="1" onclick="return(false);"/>
                            <label for="m" class="my-auto p-2 text-start">남성</label>
                            &nbsp;&nbsp;
                            <input type="radio" class="orm-check-input my-auto p-2" name="gender" <%=mem.getNum() == 2 ? "checked" : "" %>  id="f" value="2" onclick="return(false);"/>
                            <label for="f" class="my-auto p-2 text-start">여성</label>
                        </div>
                    </div>
                    <hr/>
                </div>
            </div>
        </div>
        <div class="form-group row">
            <div class="col col-3 my-auto">
                <label class="text-center my-auto">전화번호</label>
            </div>
            <div class="col-9">
                <input type="tel" class="form-control col col-5" name="tel" value="<%=mem.getTel()%>"/>
            </div>
        </div>
        <hr/>
        <div class="form-group row">
            <div class="col-3 my-auto">
                <label class="text-center my-auto">이메일</label>
            </div>
            <div class="col-9">
                <input type="email" class="form-control" name="email" value="<%=mem.getEmail()%>"/>
            </div>
        </div>
        <hr/>
        <button type="submit" class="btn btn-primary">정보수정</button>
         <a class="btn btn-secondary" href="<%=request.getContextPath()%>/view/member/passwordForm.jsp">비밀번호 변경</a>
    </form>
</div>
<%} %>
<br/>

<br/>

<script >
    function win_upload(){
        const op = "width=500, height=150, left=150, top=150";
        open('<%=request.getContextPath()%>/single/pictureForm.jsp', "",op);
    }
</script>
</body>
</html>
