package SpringClasses.Service;

import SpringClasses.Entety.ChatClass;
import SpringClasses.Entety.UserBlank;

import java.util.List;

/**
 * Created by Олег on 11.01.2017.
 */
public interface ChatService {
    public List<ChatClass> getUsersMassages(int UserId);
    public void addMassageFromUser(String userEmail,String massage );
    public void addMassageToUser(String userEmail,String massage );
    public void deleteMassageFromUserPage(int massage);
    public void deleteMassageFromBase(int  mas);
    public void  addmassageFromussToUser(String id,String massage);


}
