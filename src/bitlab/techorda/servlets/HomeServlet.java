package bitlab.techorda.servlets;

import bitlab.techorda.db.DBConnector;
import bitlab.techorda.db.News;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/")
public class HomeServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        ArrayList<News> news = DBConnector.allNews();
        Cookie[] cookies = request.getCookies();
        String id = "2";
        if(cookies!=null)
        {
            for(Cookie c : cookies)
            {
                if(c.getName().equals("lang"))
                {
                    id = c.getValue();
                    break;
                }
            }
        }
        request.setAttribute("lang",id);
        request.setAttribute("novosti",news);
        request.getRequestDispatcher("/home.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }
}
