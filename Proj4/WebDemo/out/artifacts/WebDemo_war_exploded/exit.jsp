<%--
  Created by IntelliJ IDEA.
  User: fanxin806
  Date: 2018/11/17
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退出</title>
</head>
<body>
<%
    session.invalidate();
    pageContext.forward("login.html");
%>
</body>
</html>
