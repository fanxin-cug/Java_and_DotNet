<%--
  Created by IntelliJ IDEA.
  User: fanxin806
  Date: 2018/11/17
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>学生信息</title>
</head>
<body>
<h3 align="center">浏览学生信息</h3>
<table border=1 cellspacing=1 align="center">
    <tr>
        <td>学号</td><td>姓名</td><td>性别</td><td>班级</td><td>年龄</td>
    </tr>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");//数据库驱动
            String url = "jdbc:mysql://localhost:3306/student";//数据库链接地址
            String user = "root";//用户名
            String password = "";//密码
            Connection conn = DriverManager.getConnection(url, user, password);//建立connection
            Statement stmt = conn.createStatement();
            String sql = "select * from info";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs != null && rs.next()) {
                out.print("<tr><td>" + rs.getString("Sno") + "</td>");
                out.print("<td>" + rs.getString("name") + "</td>");
                out.print("<td>" + rs.getString("sex") + "</td>");
                out.print("<td>" + rs.getString("class") + "</td>");
                out.print("<td>" + rs.getString("age") + "</td></tr>");
            }
        }catch(Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>
