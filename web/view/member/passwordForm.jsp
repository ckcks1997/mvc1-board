<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
</head>
<body>

<script>
    function inputChk(f) {
        if (f.pass.value == '') {
            alert("비밀번호를 입력하세요")
            f.pass.focus()
            return false;
        }
        if (f.newpass.value == '') {
            alert("새로운 비밀번호를 입력하세요")
            f.newpass.focus()
            return false;
        }
        if (f.newpass.value != f.newpass2.value) {
            alert("비밀번호가 서로 다릅니다")
            f.newpass.value = '';
            f.newpass2.value = '';
            f.newpass.focus();
            return false;
        }
        return true;
    }
</script>

<%
    String login = (String) session.getAttribute("memberID");
    if (login == null || login.trim().equals("")) {
%>
<script>
    alert("로그인이 필요합니다");
    location.href = "<%=request.getContextPath()%>/view/member/loginForm.jsp";
</script>
<% } else { %>
<!-- 로그인 -->
<br>
<div class="container-md" id="login">
    <h3 class="text-center">비밀번호 변경</h3>
    <form class="mx-md-5 p-5 border border-3 rounded bg-light"
          action="<%=request.getContextPath()%>/view/member/passwordPro.jsp"
          method="post"
          onsubmit="return inputChk(this)"
          name="f" >
        <div class="px-md-5">
            <div class="form-group row m-3">
                <div class="col-3 text-center my-auto">
                    <label>아이디</label>
                </div>
                <div class="col-9">
                    <input type="text" class="form-control" name="id"/>
                </div>
            </div>
            <div class="form-group row m-3">
                <div class="col-3 text-center my-auto">
                    <label>비밀번호</label>
                </div>
                <div class="col-9">
                    <input type="password" class="form-control" name="pass"/>
                </div>
            </div>
            <div class="form-group row m-3">
                <div class="col-3 text-center my-auto">
                    <label>변경할 비밀번호</label>
                </div>
                <div class="col-9">
                    <input type="password" class="form-control" name="newpass"/>
                </div>
            </div>
            <div class="form-group row m-3">
                <div class="col-3 text-center my-auto">
                    <label> 비밀번호 확인</label>
                </div>
                <div class="col-9">
                    <input type="password" class="form-control" name="newpass2"/>
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">변경</button>
                <a class="btn btn-secondary" onclick="history.back()">취소</a>
            </div>
        </div>
    </form>
</div>
<%}%>
</body>
</html>
