<%--
  Created by IntelliJ IDEA.
  User: fanxin806
  Date: 2018/11/17
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>添加学生</title>
</head>
<body>
<%
    try {
        String Sno=request.getParameter("Sno");
        String name=request.getParameter("name");
        String sex=request.getParameter("sex");
        String classno=request.getParameter("class");
        String age=request.getParameter("age");
        Class.forName("com.mysql.jdbc.Driver");//数据库驱动
        String url = "jdbc:mysql://localhost:3306/student?useUnicode=true&characterEncoding=UTF-8";//数据库链接地址
        String user = "root";//用户名
        String password = "";//密码
        Connection conn = DriverManager.getConnection(url, user, password);//建立connection
        Statement stmt = conn.createStatement();
        String sql ="insert into info values ('"+Sno+"','"+name+"','"+sex+"','"+classno+"','"+age+"')";
        stmt.execute(sql);
        response.sendRedirect("Query.jsp");
    } catch (Exception e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
%>
</body>
</html>
