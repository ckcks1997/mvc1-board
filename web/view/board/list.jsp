<%@page import="model.Board" %>
<%@page import="java.util.List" %>
<%@page import="service.BoardDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        a {
            text-decoration: none;
        }
        @media (max-width: 767px) {
            .hide {
                display: none;
            }
        }
    </style>

</head>
<body>
<%
    String boardid = "";
    int pageInt = 1; //현재 페이지
    int limit = 10;

    if (request.getParameter("boardid") != null) {
        session.setAttribute("boardid", request.getParameter("boardid"));
        session.setAttribute("pageNum", "1");
    }
    boardid = (String) session.getAttribute("boardid");
    if (boardid == null) {
        boardid = "1";
    }


    if (request.getParameter("pageNum") != null) {
        session.setAttribute("pageNum", request.getParameter("pageNum"));
    }
    String pageNum = (String) session.getAttribute("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }
    pageInt = Integer.parseInt(pageNum);

    BoardDao bd = new BoardDao();
    int boardcount = bd.boardCount(boardid);

    int bottomLine = 3;
    int startPage = (pageInt - 1) / bottomLine * bottomLine + 1;
    int endPage = startPage + bottomLine - 1;
    int maxPage = (boardcount / limit) + (boardcount % limit == 0 ? 0 : 1);
    if (endPage > maxPage) endPage = maxPage;

    List<Board> list = bd.boardList(pageInt, limit, boardcount, boardid);
    int boardnum = boardcount - (pageInt - 1) * limit;

    String[] boardName = {"공지사항", "자유게시판", "QnA"};
%>


<div class="container-lg">
    <h2 id="center"><%=boardName[Integer.parseInt(boardid) - 1] %>
    </h2>
    <p align="right">
        <%if (boardcount > 0) { %>
        전체 글: <%=boardcount %>
        <%} else { %>
        등록된 글이 없습니다.
        <%} %>
    </p>
    <div class="">
    <table class="table table-hover border">
        <thead>
        <tr class="table-light">
            <th>번호</th>
            <th style="min-width: 30vw">제목</th>
            <th  class="hide">작성자</th>
            <th >등록일</th>
            <th class="hide">파일</th>
            <th>조회수</th>

        </tr>
        </thead>
        <tbody style="cursor:pointer">
        <%
            for (Board i : list) {
        %>
        <tr class=" " onClick=" location.href='boardInfo.jsp?num=<%=i.getNum()%>' ">
            <td><%=(boardnum--)%>
            </td>
            <td>
                <%if(i.getReflevel() > 0){
                    for (int j = 0; j < i.getReflevel(); j++) {
                %>
                <span class="hide">&nbsp;&nbsp;</span>
                    <%}%>
                <i class="fa-solid fa-comment-dots"></i>
                <%}%>
                <%=i.getSubject() %>
            </td>
            <td class="hide"><%=i.getWriter() %>
            </td>
            <td><%=i.getRegdate() %>
            </td>
            <td class="hide"><%if(i.getFile1() == null){ %> - <%}else{%> <%=i.getFile1()%> <%}%>
            </td>
            <td><%=i.getReadcnt() %>
            </td>
        </tr>
        <%} %>
        <%if (boardcount == 0) { %>
        <td class="text-center" colspan="6">등록된 글이 없습니다.</td>
        <%}%>
        </tbody>
    </table>
    </div>
    <div class=" text-end">
        <button class="btn btn-primary">
            <a href="<%=request.getContextPath()%>/view/board/writeForm.jsp" style="color:white;">게시판입력</a>
        </button>

    </div>


    <div class="container">
        <ul class="pagination justify-content-center">

            <li class="page-item <%if(startPage<= bottomLine){ %>disabled <%}%>">
                <a class="page-link" href="?boardid=<%=boardid%>&pageNum=<%=startPage-bottomLine%>">
                <span aria-hidden="true">&laquo;</span> </a>
            </li>
            <%
                for (int i = startPage; i <= endPage; i++) {
            %>
            <li class="page-item <%=pageInt==i?"active":"" %> "><a class="page-link  "
                                                                   href="?boardid=<%=boardid%>&pageNum=<%=i%>"><%=i %>
            </a></li>

            <%} %>
            <li class="page-item <%if(endPage>= maxPage){ %>disabled <%}%> "><a class="page-link"
                                                                                href="?boardid=<%=boardid%>&pageNum=<%=startPage+bottomLine%>">
                <span aria-hidden="true">&raquo;</span></a>
            </li>
        </ul>
    </div>
</div>
</body>
</html>