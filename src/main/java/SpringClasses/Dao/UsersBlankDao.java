package SpringClasses.Dao;

import SpringClasses.Entety.UserBlank;

import java.util.List;

public interface UsersBlankDao {

    public void addBlank(UserBlank blank);
    public List<UserBlank> getUsersBlankByUsersEmai(String email);
public void editUserBlank(UserBlank userBlank);
    public void  setAccomplishProject(int id);
    public List<UserBlank> getUsersBlankByUserId(int id);

    public String blankNameByBlankId(int id);
}
