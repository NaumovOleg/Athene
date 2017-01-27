package SpringClasses.Controllers;

import SpringClasses.Entety.ChatClass;
import SpringClasses.Entety.User;
import SpringClasses.Entety.UserBlank;
import SpringClasses.Service.ChatService;
import SpringClasses.Service.UserService;
import SpringClasses.StructureFiles.SendingManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class UserBlanksControllers {
    @Autowired
    UserService userService;
@Autowired
    SendingManager sendingManager;
    @Autowired
    ChatService chatService;

    @RequestMapping(value = "/addUsersBlank/{userId}", method = RequestMethod.POST)
    public String addUsersBlank(@PathVariable("userId") String userId,
                                @RequestParam("projectName") String projectName,
                                @RequestParam("projectInfo") String projectInfo, Model model) {


        userService.addUsersBlankByUserEmail(userId, projectName, projectInfo);
        List<User> list = userService.getAllUsers();
        model.addAttribute("allUsers", list);
        System.out.println("fffffffffffllllllllllllllllllllllllllll0000000000000000000000000000000000000000000000000000000");
        List<ChatClass> chata = chatService.getUsersMassages(Integer.valueOf(userId));
        model.addAttribute("UsersChat", chata);
        for (ChatClass chatClass : chata) {
            System.out.println(chatClass.getMassage());
        }
        List<UserBlank> blanks=userService.getUsersBlankByUserId(Integer.valueOf(userId));
        model.addAttribute("usersBlank", blanks);
        model.addAttribute("userId",userService.getUserById(Integer.valueOf(userId)));
//        model.addAttribute("userId",chatsTransferList.get(0).getUserId());
        System.out.println(chata.size() + "fffffffffffuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
        return "AdminPanel";
    }


    @RequestMapping(value = "/setAccomplishProject/{blankId}/{userId}", method = RequestMethod.GET)
    public String setAccomplishProject(@PathVariable ("blankId") Integer blankId,@PathVariable ("userId") String userId,Model model){


        userService.setAccomplishProject(blankId);
        List<User> list = userService.getAllUsers();
        model.addAttribute("allUsers", list);
        System.out.println("fffffffffffllllllllllllllllllllllllllll0000000000000000000000000000000000000000000000000000000");
        List<ChatClass> chata = chatService.getUsersMassages(Integer.valueOf(userId));
        model.addAttribute("UsersChat", chata);
        for (ChatClass chatClass : chata) {
            System.out.println(chatClass.getMassage());
        }
        List<UserBlank> blanks=userService.getUsersBlankByUserId(Integer.valueOf(userId));
        model.addAttribute("usersBlank", blanks);
       User user= userService.getUserById(Integer.valueOf(userId));
        sendingManager.sendMailaboutaccomplishProject(user.getName(),user.getEmail(),  userService.blankNameByBlankId(blankId));
        model.addAttribute("userId",user);


        return "AdminPanel";
    }




}
