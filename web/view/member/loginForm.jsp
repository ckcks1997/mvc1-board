<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</head>
<body>


<!-- 로그인 -->
<br>
<div class="container-md" id="login">
    <h3 class="text-center">로 그 인</h3>
    <form class="mx-md-5 p-5 border border-3 rounded bg-light" form action="<%=request.getContextPath()%>/view/member/loginPro.jsp" method="post">
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
                    <input type="password" class="form-control" name="pass" />
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">로그인</button>
                <button type="submit" class="btn btn-secondary">회원가입</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
