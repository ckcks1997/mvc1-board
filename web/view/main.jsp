<%@ page import="service.MemberDao" %>
<%@ page import="model.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>

    body{
        background-image: url( "<%=request.getContextPath()%>/img/study.jpg");
        background-repeat: no-repeat;
        background-size: cover;

    }
    .bg{
        margin: 0;
        background: rgba(100,100,100,0.4);
    }
    .height {
        height: 80vh;
    }

    .form {
        position: relative
    }

    .form .fa-search {
        position: absolute;
        top: 20px;
        left: 20px;
        color: #9ca3af
    }

    .form span {
        position: absolute;
        right: 17px;
        top: 13px;
        padding: 2px;
        border-left: 1px solid #d1d5db
    }

    .left-pan i {
        padding-left: 10px
    }

    .form-input {
        height: 55px;
        text-indent: 33px;
        border-radius: 10px
    }

    .form-input:focus {
        box-shadow: none;
        border: 3px solid grey;
    }

</style>
</head>
<body>

<div class="  bg">
    <div class="container">
        <div class="row height d-flex justify-content-center align-items-center">
            <div class="col-md-6">
                <div class="form">
                    <i class="fa fa-search"></i><input type="text" class="form-control form-input" placeholder="검색...">
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>
