package SpringClasses.Controllers;

import SpringClasses.DataTranferObject.USerTRansfer;
import SpringClasses.Entety.User;
import SpringClasses.Service.EmailsService;
import SpringClasses.Service.UserService;
import SpringClasses.StructureFiles.SendingManager;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.security.Principal;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    BCryptPasswordEncoder passwordEncoder;
    @Autowired
    EmailsService mailer;
    @Autowired
    SendingManager sendingManager;
    @Autowired
    UserService userService;
    ObjectMapper mapper = new ObjectMapper();

    @RequestMapping(value = "/ckeckMail", method = RequestMethod.POST)
    @ResponseBody
    public String checkMAil(@RequestBody String mail) {
        List<String> maile = mailer.checkEmaiIfExists(mail);
        System.out.println(mail+"1111111111222222222222222222333333333333333333444444444444444444");
        if (maile.isEmpty()) {
            return "empty";
        }

        return "notEmpty";
    }

    @RequestMapping(value = "/registerUsertobase", method = RequestMethod.POST)
    @ResponseBody
    public String addUserEE(@RequestBody String pass
    ) throws IOException {
        System.out.println("8888888888888888888888888888888888888888");
        USerTRansfer UserTransfer = mapper.readValue(pass, USerTRansfer.class);
        User user = new User(UserTransfer);
        user.setRole("USER");
//        user.setEnabled(true);
        sendingManager.sendMailAfterRegistrationToUser(user);
//        sendingManager.sendThatUserWasRegistered(user);
        String passw=user.getPassword();
        user.setPassword(passwordEncoder.encode(passw));
//        user.setPassword(passw);
        user.setDateOfregistration(new Date());
        userService.addUser(user);
//        System.out.println("9999999999999999999999999999999999999999999999999999999999999");
//        Authentication authentication=new UsernamePasswordAuthenticationToken(user.getEmail(),user.getPassword());
        return "addUser";
    }



    @RequestMapping(value = "/eeeee", method = RequestMethod.POST)

    public String addUserEE(@RequestParam("name") String name,@RequestParam("mail") String mail
    ) {
        System.out.println("8888888888888888888888888888888888888888");
        System.out.println(name);
        System.out.println("9999999999999999999999999999999999999999999999999999999999999");
        return "addUser";
    }

    @RequestMapping(value = "/editUser", method = RequestMethod.POST)
@ResponseBody
    public String aditUser(@RequestBody User user, Principal principal
    ) {
        System.out.println("111111111111111111111111111111111111111111111111111111111");
        System.out.println(user.getName());
userService.editUser(principal.getName(),user);
        System.out.println("1111111111111111111111111111111111111111111111111111111111");
        return "addUser";
    }

}
