package SpringClasses.Service.UserServiceIml;

import SpringClasses.Dao.ChatDao;
import SpringClasses.Dao.UserDao;
import SpringClasses.Entety.ChatClass;
import SpringClasses.Entety.User;
import SpringClasses.Entety.UserBlank;
import SpringClasses.Service.ChatService;
import SpringClasses.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ChatServiceImpl implements ChatService {
    @Autowired
    ChatDao chatDao;
    @Autowired
    UserService userService;

@Autowired
    UserDao userDao;
    @Override
    public List<ChatClass> getUsersMassages(int UserId) {
        List<ChatClass>List= chatDao.getUsersMassages(UserId);
        for (ChatClass chatClass : List) {
           chatClass.setReadedByUser(true);
        }
        return List;
    }

    @Override
    public void addMassageFromUser(String userEmail, String massage) {

        User user=userService.getUser(userEmail);
        ChatClass mass = new ChatClass();
        mass.setDirect("tous");
        mass.setDate(new Date());
        mass.setReadedByUs(false);
        mass.setReadedByUser(true);
        mass.setMassage(massage);
        mass.setUser(user);
        System.out.println(massage+"service add massage from user====================================");
        chatDao.addMassage(mass);
    }



    @Override
    public void addMassageToUser(String userEmail, String massage) {
        User user=userService.getUser(userEmail);
        ChatClass mass = new ChatClass();
        mass.setDirect("touser");
        mass.setDate(new Date());
        mass.setReadedByUs(true);
        mass.setReadedByUser(false);
        chatDao.addMassage(mass);
    }

    @Override
    public void deleteMassageFromUserPage(int massage) {
     chatDao.getMassageById(massage);
    }

    @Override
    public void deleteMassageFromBase(int mas) {

    }

    public void  addmassageFromussToUser(String id,String massage){
        ChatClass massage2=new ChatClass();
        User user=userDao.getUserById(Integer.valueOf(id));
        massage2.setUser(user);
        massage2.setReadedByUser(false);
        massage2.setReadedByUs(true);
        massage2.setMassage(massage);
        massage2.setDate(new Date());
        massage2.setDirect("fromUs");
        chatDao.addMassage(massage2);
    }


}
