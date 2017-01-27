//package SpringClasses.Controllers;
//
//import SpringClasses.DataTranferObject.USerTRansfer;
//import SpringClasses.Entety.User;
//import SpringClasses.Service.EmailsService;
//import SpringClasses.Service.UserService;
//import SpringClasses.StructureFiles.SendingManager;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import java.io.IOException;
//import java.util.Date;
//import java.util.List;
//
//@Controller
//public class registerUser {
//    @Autowired
//    EmailsService mailer;
//    @Autowired
//    SendingManager sendingManager;
//    @Autowired
//    UserService userService;
//    ObjectMapper mapper = new ObjectMapper();
//    @RequestMapping(value = "ckeckMail", method = RequestMethod.POST)
//    @ResponseBody
//    public String checkMAil(@RequestBody String mail) {
//        List<String> maile = mailer.checkEmaiIfExists(mail);
//        if (maile.isEmpty()) {
//            return "empty";
//        }
//        return "notEmpty";
//    }
//
//    @RequestMapping(value = "/registerUsertobase", method = RequestMethod.POST)
//    @ResponseBody
//    public String addUserEE(@RequestBody String pass
//    ) throws IOException {
//        USerTRansfer UserTransfer = mapper.readValue(pass, USerTRansfer.class);
//        User user = new User(UserTransfer);
//        user.setRole("USER");
//        user.setEnabled(true);
//        user.setDateOfregistration(new Date());
//        sendingManager.sendMailAfterRegistration(user);
//        userService.addUser(user);
//
//        return "addUser";
//    }
//
//}
