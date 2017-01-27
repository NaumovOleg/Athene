package SpringClasses.Dao;

import SpringClasses.Entety.User;

import java.util.List;

/**
 * Created by Олег on 12.12.2016.
 */
public interface UserDao {
    public void addUser(User user);
    public User findUserByEmail(String mail);
    public List<User> getList(String name);
    public void mergeUser(User user);
    public void editUser(User user);
    public List getAllUsers();
    public User getUserById(int id);
}
