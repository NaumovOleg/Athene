package SpringClasses.Service;

import SpringClasses.Entety.SubscribedEmails;

import java.util.List;

/**
 * Created by Олег on 04.01.2017.
 */
public interface SubscribedEmailesService {
    public boolean checkIfExistsThisMail(String mail);
    public List<SubscribedEmails> getAllSubscribedemails();
    public void addSubscribedemail(String mail);

}
