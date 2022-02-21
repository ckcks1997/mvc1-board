<%@ page import="service.MemberDao" %>
<%@ page import="model.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/ajax.js"></script>
    <script>

        function idChk() {
            const id = document.f.id.value;
            let result = document.querySelector("#result");
            const param = "id="+id;
            if(id.length<8){
                result.style.color= 'red';
                result.innerHTML = 'id는 8자리 이상 입력하세요';
                document.f.chk.value="no";
            }else{
                ajax("<%=request.getContextPath()%>/single/readId.jsp", param, callback, 'get');

            }
        }

        function callback(){
            if (this.readyState == 4 && this.status == 200) {
                let result = document.querySelector("#result");
                let chk = this.responseText.trim();
                if(chk=='false'){
                    result.style.color="blue";
                    result.innerHTML = "사용가능한 아이디입니다"
                    document.f.chk.value="ok";
                }
                else{
                    result.style.color="red";
                    result.innerHTML = "이미 사용중인 아이디입니다"
                    document.f.chk.value="no";
                }
            }
        }
        function inputChk(f){
            if(f.id.value=='' ){
                alert("아이디 입력하세요")
                f.id.focus()
                return false;
            }
            if(f.pass.value=='' ){
                alert("비밀번호를 입력하세요")
                f.pass.focus()
                return false;
            }
            if(f.name.value=='' ){
                alert("이름을 입력하세요")
                f.name.focus()
                return false;
            }
            if(f.tel.value=='' ){
                alert("번호를 입력하세요")
                f.tel.focus()
                return false;
            }
            if(f.email.value=='' ){
                alert("이메일을 입력하세요")
                f.email.focus()
                return false;
            }
            if(f.chk.value!='ok' ){
                alert(document.querySelector("#result").innerHTML);
                f.id.focus()
                return false;
            }
            return true;
        }

        function win_upload(){
            const op = "width=500, height=150, left=150, top=150";
            open('<%=request.getContextPath()%>/single/pictureForm.jsp', "",op);
        }
    </script>
</head>
<body>


<!-- 회원가입 -->
<br />
<div class="container-md text-center " id="register">
    <h3>회원가입</h3>
    <br />
    <form class="mx-md-5 p-5 border border-1 rounded  bg-light"
          method="post"
          name="f"
          action="<%=request.getContextPath()%>/view/member/memberRegisterPro.jsp"
          onsubmit="return inputChk(this)">
        <input type="hidden" name="picture">
        <input type="hidden" name="chk">
        <div class="row row-cols-3">
            <div class="form-group col-3">
                <div class="col img">
                    <img width="150" height="200" src="" alt="" id="pic"/>
                    <br />
                    <a onclick="win_upload()">사진등록</a>
                </div>
            </div>
            <div class="container form-group col-9">
                <div class="">
                    <div class="p-2 row">
                        <div class="col-3"></div>
                        <div class="mb-2 col text-left text-decoration-none" ><span id="result"></span></div> <!-- 아이디 검증값 출력부분-->
                    </div>
                    <div class="p-2 row">

                        <p class="my-auto col col-3">아이디</p>
                        <input type="text" class="form-control col mx-3" name="id" onkeyup="idChk()"/>
                    </div>
                    <hr />
                    <div class="p-2 row">
                        <p class="my-auto col col-3">비밀번호</p>
                        <input type="password" class="form-control col mx-3" name="pass"/>
                    </div>
                    <hr />
                    <div class="p-2 row">
                        <p class="my-auto col col-3">이름</p>
                        <input type="text" class="form-control col mx-3" name="name"/>
                    </div>
                    <hr />
                    <div class="p-2 row">
                        <p class="my-auto col col-3">성별</p>
                        <div class="col d-flex justify-content-center">
                            <input type="radio" class="orm-check-input my-auto p-2" name="gender" id="m" value="1" />
                            <label for="m" class="my-auto p-2 text-start">남성</label>
                            &nbsp;&nbsp;
                            <input type="radio" class="orm-check-input my-auto p-2" name="gender" id="f" value="2" />
                            <label for="f" class="my-auto p-2 text-start">여성</label>
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>
        <div class="form-group row">
            <div class="col col-3 my-auto">
                <label class="text-center my-auto">전화번호</label>
            </div>
            <div class="col-9">
                <input type="tel" class="form-control col col-5" name="tel"/>
            </div>
        </div>
        <hr />
        <div class="form-group row">
            <div class="col-3 my-auto">
                <label class="text-center my-auto">이메일</label>
            </div>
            <div class="col-9">
                <input type="email" class="form-control" name="email"/>
            </div>
        </div>
        <hr />
        <button type="submit" class="btn btn-primary">회원가입</button>
    </form>
</div>
<br />
<hr />
<br />


</body>
</html>
