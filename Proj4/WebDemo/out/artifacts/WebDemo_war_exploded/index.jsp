<%--
  Created by IntelliJ IDEA.
  User: fanxin806
  Date: 2018/11/1
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>学生信息系统</title>
    <link type="text/css" rel="stylesheet" href="css/style1.css" />
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>
  </head>
  <body>
  <div class="top"></div>
  <div id="header">
    <div class="logo">学生信息系统</div>
    <div class="navigation">
      <ul>
        <li>欢迎您，<%=session.getAttribute("username") %>！</li>
        <li><a href="exit.jsp">退出</a></li>
      </ul>
    </div>
  </div>
  <div id="content">
    <div class="left_menu">
      <ul id="nav_dot">
        <li>
          <h4 class="M1"><span></span>信息查询</h4>
          <div class="list-item none">
            <a href='Query.jsp' target="main">浏览学生信息</a>
          </div>
        </li>
        <li>
          <h4 class="M2"><span></span>信息管理</h4>
          <div class="list-item none">
            <a href='add.html' target="main">添加学生</a>
            <a href='delete.html' target="main">删除学生</a>
          </div>
        </li>
      </ul>
    </div>
    <div class="m-right">
      <div class="main">
        <iframe  name="main" src="" frameborder="0" scrolling="auto" width="100%" height="100%" ></iframe>
      </div>
    </div>
  </div>
  <div class="bottom"></div>
  <div id="footer"><p>Copyright©  2018 版权所有  来源:<a href=https://github.com/xinvan target="_blank">范鑫</a></p></div>
  <script>navList(12);</script>
  </body>
</html>
