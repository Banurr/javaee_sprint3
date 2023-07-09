package bitlab.techorda.servlets;

import bitlab.techorda.db.DBConnector;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(value = "/deletenews")
public class DeleteNewsServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        long id = Long.parseLong(request.getParameter("iddd"));
        DBConnector.deleteNews(id);
        response.sendRedirect("/admin");
    }
}
