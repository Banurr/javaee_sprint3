package bitlab.techorda.servlets;

import bitlab.techorda.db.DBConnector;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(value = "/updatenews")
public class UpdateNewsServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        long id = Long.parseLong(request.getParameter("aidi"));
        String title = request.getParameter("newtitle");
        String content = request.getParameter("newcontent");
        int lang = Integer.parseInt(request.getParameter("newdil"));
        DBConnector.updateNews(id,title,content,lang);
        response.sendRedirect("/admin");

    }
}
