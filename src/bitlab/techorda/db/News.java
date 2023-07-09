package bitlab.techorda.db;

import java.time.LocalDateTime;
import java.util.Date;

public class News
{
    private long id;
    private String title;
    private String content;
    private int language_id;

    public News()
    {

    }

    public News(long id, String title, String content, int language_id, Date postDate)
    {
        this.id = id;
        this.title = title;
        this.content = content;
        this.language_id = language_id;
        this.postDate = postDate;
    }

    private Date postDate;

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    public int getLanguage_id()
    {
        return language_id;
    }

    public void setLanguage_id(int language_id)
    {
        this.language_id = language_id;
    }

    public Date getPostDate()
    {
        return postDate;
    }

    public void setPostDate(Date postDate)
    {
        this.postDate = postDate;
    }
}
