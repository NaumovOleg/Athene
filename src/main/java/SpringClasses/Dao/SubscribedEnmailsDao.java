package SpringClasses.Dao;

import SpringClasses.Entety.SubscribedEmails;

import java.util.List;

/**
 * Created by Олег on 04.01.2017.
 */
public interface SubscribedEnmailsDao {
    public List<SubscribedEmails> getAllSubscribedemails();
    public void addSubscribedemail(String mail);
    public List<SubscribedEmails> checkIfExistsThisMail(String mail);
}
