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
        if (maile.isEmpty()) {
            return "empty";
        }
        return "notEmpty";
    }

    @RequestMapping(value = "/registerUsertobase", method = RequestMethod.POST)
    @ResponseBody
    public String addUserEE(@RequestBody String pass
    ) throws IOException {
        USerTRansfer UserTransfer = mapper.readValue(pass, USerTRansfer.class);
        User user = new User(UserTransfer);
        user.setRole("USER");
        sendingManager.sendMailAfterRegistrationToUser(user);
        String passw=user.getPassword();
        user.setPassword(passwordEncoder.encode(passw));
        user.setDateOfregistration(new Date());
        userService.addUser(user);
        return "addUser";
    }


    @RequestMapping(value = "/editUser", method = RequestMethod.POST)
@ResponseBody
    public String aditUser(@RequestBody User user, Principal principal
    ) {
        System.out.println(user.getName());
userService.editUser(principal.getName(),user);
        return "addUser";
    }

}
