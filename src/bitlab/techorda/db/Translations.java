package bitlab.techorda.db;

import java.util.ArrayList;

public class Translations
{
    public static ArrayList<ArrayList<String>> translations = new ArrayList<>();
    static
    {
        ArrayList<String> russian = new ArrayList<>();
        ArrayList<String> english = new ArrayList<>();
        english.add("Add news");
        english.add("Title");
        english.add("Description");
        english.add("Language");
        english.add("Cancel");
        english.add("Add");
        english.add("Update");
        english.add("Modifying");
        english.add("Delete");
        russian.add("Добавить новость");
        russian.add("Заголовок");
        russian.add("Содержание");
        russian.add("Язык");
        russian.add("Отмена");
        russian.add("Добавить");
        russian.add("Обновить");
        russian.add("Модификация");
        russian.add("Удалить");
        translations.add(english);
        translations.add(russian);
    }
    public Translations()
    {

    }
    public static ArrayList<ArrayList<String>> getTranslations(){return translations;}
}
