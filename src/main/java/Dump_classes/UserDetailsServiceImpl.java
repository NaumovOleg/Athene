//package SpringClasses.Service;
//
//import SpringClasses.Entety.User;
//import SpringClasses.Entety.UserRoleEnum;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.util.HashSet;
//import java.util.Set;
//
////@Service
//public class UserDetailsServiceImpl implements UserDetailsService {
//    @Autowired
//    private UserService userService;
//
//    @Override
//@Transactional
//    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
//        // с помощью нашего сервиса UserService получаем User
//        User user = userService.getUser(email);
//        // указываем роли для этого пользователя
//        Set<GrantedAuthority> roles = new HashSet();
//        roles.add(new SimpleGrantedAuthority(UserRoleEnum.USER.name()));
//
//        // на основании полученныйх даных формируем объект UserDetails
//        // который позволит проверить введеный пользователем логин и пароль
//        // и уже потом аутентифицировать пользователя
//        UserDetails userDetails =
//                new org.springframework.security.core.userdetails.User(user.getUsername(),
//                        user.getPassword(),
//                        roles);
//
//        return userDetails;
//    }
//}
