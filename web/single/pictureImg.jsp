<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String path = application.getRealPath("/")+"upload/";

    String filename = null;
    MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "utf-8");
    filename = multi.getFilesystemName("picture");

%>
<script>
    const img = opener.document.getElementById("pict");
    img.src = "<%=request.getContextPath()%>/upload/<%=filename%>";
    opener.document.f.picture.value = "<%=filename%>";
    self.close();
</script>
</body>
</html>
