<%@ page import="java.util.ArrayList" %>
<%@ page import="bitlab.techorda.db.News" %><%--
  Created by IntelliJ IDEA.
  User: nurbolyermagambetov
  Date: 09.07.2023
  Time: 02:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-16" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp"%>
    <title>NEWS.COM</title>
</head>
<body>
<%
    String id = request.getAttribute("lang").toString();
%>
<%@include file="vendor/navbar.jsp"%>
<%
    ArrayList<News> news = (ArrayList<News>) request.getAttribute("novosti");
    if(news != null)
    {
        for(News n : news)
        {
%>
<div style="width : 80%;margin: auto auto">
<div class="jumbotron mt-5">
    <h1 class="display-4"><%=n.getTitle()%></h1>
    <div class="lead" style="width : 50%;overflow : visible"><%=n.getContent()%></div>
    <hr class="my-4">
    <p>Posted at : <%=n.getPostDate().toString().replace("-",".").substring(0,16)%></p>
</div>
</div>
<%}}%>
</body>
</html>
