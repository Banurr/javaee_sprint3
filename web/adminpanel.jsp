<%@ page import="bitlab.techorda.db.News" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bitlab.techorda.db.Translations" %><%--
  Created by IntelliJ IDEA.
  User: nurbolyermagambetov
  Date: 09.07.2023
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String id = request.getAttribute("lang").toString();
        String site = id.equals("2") ? "Панель Админа" : "Admin Panel";
        String title = id.equals("2") ? "Заголовок" : "Title";
        String date = id.equals("2") ? "Дата публикации" : "Publication date";
        String til = id.equals("2") ? "Язык" : "Language";
        String more = id.equals("2") ? "Подробности" : "Details";
        String button = id.equals("2") ? "Добавить" : "Add new";
        int index = Integer.parseInt(id)-1;
        ArrayList<ArrayList<String>> list = (ArrayList<ArrayList<String>>) request.getAttribute("yazk");
    %>
    <title><%=site%></title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<button type="button" class="btn btn-success mt-4 ml-4 mb-4" data-toggle="modal" data-target="#exampleModal"> + <%=button%></button>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form action="/addnews" method="post">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><%=list.get(index).get(0)%></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="recipient-name"><%=list.get(index).get(1)%></label>
                        <input type="text" class="form-control" id="recipient-name" name="title" style="width : 70%" placeholder="<%=list.get(index).get(1)%>">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label"><%=list.get(index).get(2)%></label>
                        <textarea class="form-control" id="message-text" name="content" rows="5" placeholder="<%=list.get(index).get(2)%>"></textarea>
                    </div>
                    <div class="form-group" style="width:70%">
                        <label for="city" class="my-1 mr-sm-2 mt-3"><%=list.get(index).get(3)%></label>
                        <select class="custom-select my-1 mr-sm-2" id="city" name="dil">
                            <option value="1">English</option>
                            <option value="2">Русский</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><%=list.get(index).get(4)%></button>
                    <button class="btn btn-success"><%=list.get(index).get(5)%></button>
                </div>
            </div>
        </div>
    </form>
</div>
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col"><%=title%></th>
        <th scope="col"><%=date%></th>
        <th scope="col"><%=til%></th>
        <th scope="col"><%=more%></th>
    </tr>
    </thead>
    <%
        ArrayList<News> news = (ArrayList<News>) request.getAttribute("novosti");
        if(news!=null)
        {
            for(News n : news)
            {
                String bb = n.getLanguage_id()==1 ? "English" : "Русский";

    %>
    <tr>
        <th><%=n.getId()%></th>
        <th><%=n.getTitle()%></th>
        <th><%=n.getPostDate().toString().replace("-",".").substring(0,16)%></th>
        <th><%=bb%></th>
        <th><button class="btn btn-primary" data-toggle="modal" data-target="#aaa<%=n.getId()%>"><%=more%></button></th>
        <div class="modal fade" id="aaa<%=n.getId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <form action="/updatenews" method="post">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="g"><%=list.get(index).get(7)%> </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="t<%=n.getId()%>"><%=list.get(index).get(1)%></label>
                                <input type="text" class="form-control" id="name<%=n.getId()%>" name="newtitle" style="width : 70%" value="<%=n.getTitle()%>">
                            </div>
                            <div class="form-group">
                                <label for="c<%=n.getId()%>"><%=list.get(index).get(2)%></label>
                                <textarea class="form-control" id="surname<%=n.getId()%>" name="newcontent" style="width : 70%" ><%=n.getContent()%></textarea>
                            </div>
                            <div class="form-group" style="width:70%">
                                <label for="city<%=n.getId()%>" class="my-1 mr-sm-2 mt-3"><%=list.get(index).get(3)%></label>
                                <select class="custom-select my-1 mr-sm-2" id="city<%=n.getId()%>" name="newdil">
                                    <%if(n.getLanguage_id()==1)
                                    {
                                    %>
                                    <option value="1" selected>English</option>
                                    <option value="2">Русский</option>
                                    <%
                                        }
                                        else
                                        {
                                    %>
                                    <option value="1">English</option>
                                    <option value="2" selected>Русский</option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" value="<%=n.getId()%>" name="aidi">
                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deletion<%=n.getId()%>"><%=list.get(index).get(8)%></button>
                            <button class="btn btn-primary"><%=list.get(index).get(6)%></button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="modal fade" id="deletion<%=n.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">YOU WILL DELETE THIS NEWS</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ARE YOU SURE?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <form method="post" action="/deletenews">
                            <input name="iddd" type="hidden" value="<%=n.getId()%>">
                            <button class="btn btn-danger"><%=list.get(index).get(8)%></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%}}%>
    </tr>
    <tbody>
</table>
</body>
</html>
