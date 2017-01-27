package SpringClasses.Dao;

import SpringClasses.Entety.ChatClass;
import SpringClasses.Entety.User;

import java.util.List;

/**
 * Created by Олег on 11.01.2017.
 */
public interface ChatDao {
    public List<ChatClass> getUsersMassages(int UserId);
    public void addMassage(ChatClass mas);
    public void deleteMassageFromUserPage(ChatClass mas);
    public void deleteMassageFromBase(ChatClass mas);

    public ChatClass getMassageById(int id);
    public void  setReadedMassageByUser(User em);
    public void SetReadedByUs();

    public int countOfUsersNewMassages(User user);
    public void  addMassageFromUsToUser(ChatClass massage);
}
