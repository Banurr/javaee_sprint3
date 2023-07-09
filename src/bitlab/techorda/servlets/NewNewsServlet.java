package bitlab.techorda.servlets;

import bitlab.techorda.db.DBConnector;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(value = "/addnews")
public class NewNewsServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int languageid = Integer.parseInt(request.getParameter("dil"));
        DBConnector.addNews(title,content,languageid);
        response.sendRedirect("/admin");
    }
}
