<%--
  Created by IntelliJ IDEA.
  User: fanxin806
  Date: 2018/11/13
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>登录</title>
</head>
<body>
<%
    try {
        String username=request.getParameter("Username");
        String pwd=request.getParameter("Password");
        Class.forName("com.mysql.jdbc.Driver");//数据库驱动
        String url = "jdbc:mysql://localhost:3306/student";//数据库链接地址
        String user = "root";//用户名
        String password = "";//密码
        Connection conn = DriverManager.getConnection(url, user, password);//建立connection
        Statement stmt = conn.createStatement();
        String sql = "select * from user where username = '"+username+"' and password='"+pwd+"'";//检测数据库是否有对应的username和password的sql
        ResultSet rs=stmt.executeQuery(sql);
        if(rs!=null && rs.next()){
            session.setAttribute("username",username);
            pageContext.forward("index.jsp");
        }
        else{
            pageContext.forward("login.html");
        }
    } catch (Exception e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
%>
</body>
</html>
