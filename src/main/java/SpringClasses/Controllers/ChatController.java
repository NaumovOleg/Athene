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
        chatService.addMassageFromUser(principal.getName(), mass);
        return mass;
    }

    @RequestMapping(value = "/getUsersmassages/{id}", method = RequestMethod.GET)
    public String getUsersmassages(@PathVariable("id") String id, Model model) {
        List<User> allusers=userService.getAllUsers();
        model.addAttribute("allUsers",allusers);
        List<ChatClass> chats = chatService.getUsersMassages(Integer.valueOf(id));
        System.out.println(chats.size()+"chat size----------------------------------------");
        List<ChatsTransfer> chatsTransferList=new LinkedList<>();
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
        chatService.addmassageFromussToUser(userId,massage);
        List<User> allusers=userService.getAllUsers();
        model.addAttribute("allUsers",allusers);
        List<ChatClass> chats = chatService.getUsersMassages(Integer.valueOf(userId));
        List<ChatsTransfer> chatsTransferList=new LinkedList<>();
        for (ChatClass chatClass : chats) {
            chatsTransferList.add(new ChatsTransfer(chatClass));
            System.out.println(chatClass.getUser().getId());
        }
        List<UserBlank> blanks=userService.getUsersBlankByUserId(Integer.valueOf(userId));
        model.addAttribute("usersBlank", blanks);
        model.addAttribute("userId",userService.getUserById(Integer.valueOf(userId)));
        model.addAttribute("UsersChat", chatsTransferList);
        return "AdminPanel";
    }
}