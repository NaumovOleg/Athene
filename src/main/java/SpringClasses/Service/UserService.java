package SpringClasses.Service;

import SpringClasses.Entety.User;
import SpringClasses.Entety.UserBlank;

import java.util.List;


public interface UserService {
   public void addUser(User user);
   public User getUser(String login);
   public void addUser(String name,String surname,String email);
   public List<User> listUsers(String nam);
   public void editUser(String name ,User user);
   public List getAllUsers();
   public List<UserBlank> getUsersBlankByUserEmail(String email);
   public void  addUsersBlankByUserEmail(String id,String projectName,String projectInfo);
   public void setAccomplishProject(Integer id);
   public List<UserBlank> getUsersBlankByUserId(int id);
    String blankNameByBlankId(int id);
   User getUserById(int id);

}
