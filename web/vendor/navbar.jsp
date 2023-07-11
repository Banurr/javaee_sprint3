<div class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div style="display: flex;width: 85%;margin:auto auto">
        <a class="navbar-brand" href="/"><b>NEWS.COM</b></a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav" style="margin-right:0;margin-left: auto;gap: 5px;cursor:pointer;">
                <%
                    String admin = id.equals("1") ? "ADMIN PANEL" : "AДМИН ПАНЕЛЬ";
                %>
                <li><a class="nav-link" href="/admin"><%=admin%></a></li>
                <li><a class="nav-link" href="/setlang?id=2">RUS</a></li>
                <li><a class="nav-link" href="/setlang?id=1">ENG</a></li>
            </ul>
        </div>
    </div>
</div>