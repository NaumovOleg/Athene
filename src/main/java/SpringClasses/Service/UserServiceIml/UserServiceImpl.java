package SpringClasses.Service.UserServiceIml;

import SpringClasses.Dao.UserDao;
import SpringClasses.Dao.UsersBlankDao;
import SpringClasses.Entety.User;
import SpringClasses.Entety.UserBlank;
import SpringClasses.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.NoResultException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Service()
public class UserServiceImpl implements UserService,UserDetailsService {
    @Autowired
    UserDao userADo;
    @Autowired
    UsersBlankDao usersBlankDao;
    @Autowired
    BCryptPasswordEncoder passwordEncoder;



    public void addUser(String name, String surname, String email) {
        User user = new User();
        user.setEmail(email);
        user.setName(name);
        user.setSurname(surname);
        userADo.addUser(user);
        System.out.printf("service good =================================");
    };

    @Override
    public void addUser(User user) {
        userADo.addUser(user);
    }

    @Override
    public User getUser(String login) {
        System.out.println(login+" find user by email=======================================");
        return userADo.findUserByEmail(login);
    }

    public User getUserByEmail(String mail) {
        return userADo.findUserByEmail(mail);}
//    }
public List<User> listUsers(String nam){
    return userADo.getList(nam);
}

    @Override
    public void editUser(String name, User user) {
        User find=userADo.findUserByEmail(name);
        System.out.println(user.getEmail()+"--email------------------------------------------------");
        System.out.println(user.getName()+"-name-------------------------------------------------");
        System.out.println(user.getPassword()+"pass--------------------------------------------------");
        System.out.println(user.getPhone()+"--phone------------------------------------------------");




        System.out.println(find.getEmail()+  "Userd finded================================================");
        if(user.getEmail()!=""){

        find.setEmail(user.getEmail());
            System.out.println(find.getEmail()+"email+++++++++++++++++++++++++++++++++++++++++");}
        if(user.getName()!=""){
        find.setName(user.getName());
            System.out.println(find.getName()+"+++name++++++++++++++++++++++++++++++++++++++");}
        if(user.getPassword()!=""){
        find.setPassword(passwordEncoder.encode(user.getPassword()));
            System.out.println(find.getPassword()+"++pass+++++++++++++++++++++++++++++++++++++++");}
       if (user.getPhone()!=""){
        find.setPhone(user.getPhone());
            System.out.println(find.getPhone()+"++++++phone+++++++++++++++++++++++++++++++++++");}

        System.out.println("DAO EDIT +++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        userADo.editUser(find);

    }

    @Override
    public List getAllUsers() {
        System.out.println("serv user -----------------------------------");
        return userADo.getAllUsers();
    }

    @Override
    public List<UserBlank> getUsersBlankByUserEmail(String email) {
        System.out.println("Service  UserbLank-------------------------------------------------------");
        return usersBlankDao.getUsersBlankByUsersEmai(email);
    }

    @Override
    public void addUsersBlankByUserEmail(String id, String projectName, String projectInfo) {
        UserBlank blank=new UserBlank();
        User user=userADo.getUserById(Integer.valueOf(id));
        blank.setProjectInfo(projectInfo);
        blank.setUser(user);
        blank.setRedyPercent("In process");
        blank.setProjectNamae(projectName);
        usersBlankDao.addBlank(blank);
    }

    @Override
    public void setAccomplishProject(Integer id) {
        usersBlankDao.setAccomplishProject(Integer.valueOf(id));
    }

    @Override
    public List<UserBlank> getUsersBlankByUserId(int id) {
        return usersBlankDao.getUsersBlankByUserId(id);
    }

    @Override
    public String blankNameByBlankId(int id) {
        return usersBlankDao.blankNameByBlankId(id);
    }

    @Override
    public User getUserById(int id) {
        return userADo.getUserById(id);
    }


    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user;
        try{
       user =getUserByEmail(email);}catch (NoResultException e ){
            System.out.println(e.getMessage());
            return null;
        }
        Collection<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();

            authorities.add(new SimpleGrantedAuthority("USER"));
        return new org.springframework.security.core.userdetails.User(String.valueOf(user.getEmail()),user.getPassword(),authorities);

    }


}

