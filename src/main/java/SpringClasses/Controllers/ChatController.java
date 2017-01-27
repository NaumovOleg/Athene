package SpringClasses.Controllers;

import SpringClasses.DataTranferObject.ChatsTransfer;
import SpringClasses.Entety.ChatClass;
import SpringClasses.Entety.User;
import SpringClasses.Entety.UserBlank;
import SpringClasses.Service.ChatService;
import SpringClasses.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.LinkedList;
import java.util.List;

import static org.springframework.data.jpa.domain.AbstractPersistable_.id;

@Controller
@RequestMapping(value = "/chat")
public class ChatController {
    @Autowired
    ChatService chatService;
    @Autowired
    UserService userService;

    @RequestMapping(value = "/userSendMassage", method = RequestMethod.POST)
    public
    @ResponseBody
    String addmasFromUser(@RequestBody String mass, Principal principal) {
        System.out.println(mass+"  controller===================================");
        chatService.addMassageFromUser(principal.getName(), mass);
        System.out.println("controller===================================");
        return mass;
    }





//    @RequestMapping(value = "/getUsersMassagesAtHisPage", method = RequestMethod.GET)
//    @ResponseBody
//    public List<ChatClass> getMassages(Principal principal) {
//        return chatService.getUsersMassages(principal.getName());
//    }

    @RequestMapping(value = "/getUsersmassages/{id}", method = RequestMethod.GET)
    public String getUsersmassages(@PathVariable("id") String id, Model model) {
        List<User> allusers=userService.getAllUsers();
        System.out.println(allusers.size()+"ppppppppppppppppppppppppppppp");
        model.addAttribute("allUsers",allusers);
        List<ChatClass> chats = chatService.getUsersMassages(Integer.valueOf(id));
        System.out.println(chats.size()+"chat size----------------------------------------");
        List<ChatsTransfer> chatsTransferList=new LinkedList<>();
//        if(!chats.isEmpty()){

        System.out.println(id+" tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt");

        for (ChatClass chatClass : chats) {
            chatsTransferList.add(new ChatsTransfer(chatClass));
            System.out.println(chatClass.getUser().getId());
        }
         List<UserBlank> blanks=userService.getUsersBlankByUserId(Integer.valueOf(id));
        model.addAttribute("usersBlank", blanks);
        model.addAttribute("userId",userService.getUserById(Integer.valueOf(id)));
        model.addAttribute("UsersChat", chatsTransferList);
        return "AdminPanel";
    }

    @RequestMapping(value = "/sendMassageToUser/{userId}" ,method = RequestMethod.GET)
    public String sendMassageFromUsToUser(@PathVariable("userId") String userId,@RequestParam("massage")String massage,Model model){
        System.out.println(userId+"-userId-------------------------------------------------------");
        System.out.println(massage+"=============================================================");

        chatService.addmassageFromussToUser(userId,massage);
        List<User> allusers=userService.getAllUsers();
        System.out.println(allusers.size()+"ppppppppppppppppppppppppppppp");
        model.addAttribute("allUsers",allusers);
        List<ChatClass> chats = chatService.getUsersMassages(Integer.valueOf(userId));
        System.out.println(chats.size()+"chat size----------------------------------------");
        List<ChatsTransfer> chatsTransferList=new LinkedList<>();
//        if(!chats.isEmpty()){

        System.out.println(id+" tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt");

        for (ChatClass chatClass : chats) {
            chatsTransferList.add(new ChatsTransfer(chatClass));
            System.out.println(chatClass.getUser().getId());
        }

        System.out.println("added-------------------------------------------");
//        }

        List<UserBlank> blanks=userService.getUsersBlankByUserId(Integer.valueOf(userId));
        model.addAttribute("usersBlank", blanks);
        model.addAttribute("userId",userService.getUserById(Integer.valueOf(userId)));
        model.addAttribute("UsersChat", chatsTransferList);
        return "AdminPanel";
    }
}