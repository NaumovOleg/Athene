package SpringClasses.Service;

import java.util.List;

/**
 * Created by Олег on 15.12.2016.
 */
public interface EmailsService {
    public List<String> getAllAmails();
    public List<String> checkEmaiIfExists(String mail);
    List<String > getAllUsersEmails();
}
