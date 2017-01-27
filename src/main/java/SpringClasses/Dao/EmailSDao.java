package SpringClasses.Dao;

import java.util.List;

public interface EmailSDao {

    public List<String> getAllMails();
    public List<String> checkEmaiIfExists(String mail);
    List<String >  getAllUsersEmails();
}
