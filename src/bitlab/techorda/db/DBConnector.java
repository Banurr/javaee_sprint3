package bitlab.techorda.db;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class DBConnector
{
    private static Connection connection;

    static
    {
        try
        {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/JavaEE-bitlab",
                    "postgres",
                    "s63amg");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    public static void deleteNews(Long id)
    {
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from news where id=?");
            preparedStatement.setLong(1,id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    public static void updateNews(Long id,String title,String content,int language_id)
    {
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("update news set title = ?, content=?,language_id=? where id=?");
            preparedStatement.setString(1,title);
            preparedStatement.setString(2,content);
            preparedStatement.setInt(3,language_id);
            preparedStatement.setLong(4,id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    public static void addNews(String title,String content,int language_id)
    {
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("insert into news(title,content,language_id,post_date) values(?,?,?,?)");
            preparedStatement.setString(1,title);
            preparedStatement.setString(2,content);
            preparedStatement.setInt(3,language_id);
            preparedStatement.setDate(4, Date.valueOf(LocalDate.now()));
            preparedStatement.executeUpdate();
            preparedStatement.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    public static ArrayList<News> allNews()
    {
        ArrayList<News> news = new ArrayList<>();
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from news");
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next())
            {
                News news1 = new News();
                news1.setId(resultSet.getLong("id"));
                news1.setTitle(resultSet.getString("title"));
                news1.setContent(resultSet.getString("content"));
                news1.setLanguage_id(resultSet.getInt("language_id"));
                news1.setPostDate(resultSet.getTimestamp("post_date"));
                news.add(news1);
            }
            preparedStatement.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return news;
    }
    public static ArrayList<News> langNews(long id)
    {
        ArrayList<News> news = new ArrayList<>();
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from news where language_id = ?");
            preparedStatement.setLong(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next())
            {
                News news1 = new News();
                news1.setId(resultSet.getLong("id"));
                news1.setTitle(resultSet.getString("title"));
                news1.setContent(resultSet.getString("content"));
                news1.setLanguage_id(resultSet.getInt("language_id"));
                news1.setPostDate(resultSet.getTimestamp("post_date"));
                news.add(news1);
            }
            preparedStatement.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return news;
    }
}
