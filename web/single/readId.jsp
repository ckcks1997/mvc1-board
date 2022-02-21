<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
if(id ==null) id = " ";
String line = "aaaaaaaa";
boolean chk = line.contains(id);
%>
<%=chk %>
