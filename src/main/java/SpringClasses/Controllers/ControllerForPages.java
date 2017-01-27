package SpringClasses.Controllers;

import SpringClasses.Dao.ChatDao;
import SpringClasses.DataTranferObject.TestimonialsTransfer;
import SpringClasses.Entety.*;
import SpringClasses.ExtraClasses.ContactUs;
import SpringClasses.Service.ChatService;
import SpringClasses.Service.TestimonialsService;
import SpringClasses.Service.UserService;
import SpringClasses.StructureFiles.SendingManager;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

@Controller
public class ControllerForPages {
    @Autowired
    UserService userService;
    ObjectMapper objectMapper = new ObjectMapper();
    @Autowired
    TestimonialsService testimonialsService;

    @Autowired
    ChatService chatService;


    @Autowired
    ChatDao chatdao;
@Autowired
    SendingManager sendingManager;
    @RequestMapping(value = "/Main", method = RequestMethod.GET)

    public String main2(Principal principal,Model model) {
        if (principal != null) {
            User user = userService.getUser(principal.getName());
            model.addAttribute("user", user);
            int massCount=chatdao.countOfUsersNewMassages(user);
            if(massCount>=1){
            model.addAttribute("massages",String.valueOf(massCount));}
        }
        return "Main";
    }
    @RequestMapping(value = "/profile", method = RequestMethod.GET)

    public String profile(Principal principal,Model model) {
        if (principal != null) {
            User user = userService.getUser(principal.getName());
            model.addAttribute("user", user);
        }
        return "profile";
    }
    @RequestMapping(value = "addUser", method = RequestMethod.GET)
    public String addUser() {
        return "addUser";
    }

    @RequestMapping(value = "/newUser", method = RequestMethod.GET)
    public String newUser(@ModelAttribute User user, BindingResult bindingResult) {
        return "newUser";
    }


    @RequestMapping(value = "cabinet", method = RequestMethod.GET)
    public String cab(Principal principal, Model model) {
        User user = userService.getUser(principal.getName());
        List<ChatClass> massages = chatService.getUsersMassages(Integer.valueOf(user.getId()));
        model.addAttribute("userMass", massages);
        chatdao.setReadedMassageByUser(user);
        List<UserBlank> blanks=userService.getUsersBlankByUserEmail(user.getEmail());
        model.addAttribute("user", user);
        model.addAttribute("usersBlank", blanks);
        return "cabinet";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main(Principal principal, Model model) {
        if (principal != null) {
            User user = userService.getUser(principal.getName());
            model.addAttribute("user", user);
            int massCount=chatdao.countOfUsersNewMassages(user);
            if(massCount>=1){
                model.addAttribute("massages",String.valueOf(massCount));}
        }
        return "Main";
    }

    @RequestMapping(value = "/getJasonMasseges", method = RequestMethod.GET)
    @ResponseBody
    public String getMasToJson() {
        List<String> test = new LinkedList<>();
        List<Testimonials> testimonialses = testimonialsService.getAllTestimonials();
        for (Testimonials testimonialse : testimonialses) {
            test.add(testimonialse.getTestimonial());
        }
        String json = null;
        try {
            json = objectMapper.writeValueAsString(testimonialses.get(0));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        System.out.println(json);
        return json;
    }
    @RequestMapping(value = "/refreshMassages", method = RequestMethod.GET, produces = {"application/json; charset=UTF-8"})
    @ResponseBody
    public String refresh(
            HttpServletResponse servletResponse) {
        List<Testimonials> list = testimonialsService.getAllTestimonials();
        List<TestimonialsTransfer> testimTranfer = new LinkedList<>();
        for (Testimonials testimonials : list) {
            TestimonialsTransfer test = new TestimonialsTransfer(testimonials);
            testimTranfer.add(test);
        }
        String json = new Gson().toJson(testimTranfer);
        System.out.println(json);
        servletResponse.setContentType("text/html");
        servletResponse.setCharacterEncoding("utf-8");

        return json;
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model) {
      List<User> list=userService.getAllUsers();
      model.addAttribute("allUsers",list);
        List<ChatClass> chata=chatService.getUsersMassages(Integer.valueOf(list.get(0).getId()));
        List<UserBlank> blanks=userService.getUsersBlankByUserEmail(list.get(0).getEmail());
        model.addAttribute("usersBlank", blanks);
        model.addAttribute("UsersChat",chata);
        for (ChatClass chatClass : chata) {
            System.out.println(chatClass.getMassage());
        }
        model.addAttribute("userId",userService.getUserById(list.get(0).getId()));
        return "AdminPanel";
    }

    @RequestMapping(value = "/ajaxtest", method = RequestMethod.GET)
    @ResponseBody
    public Set<SubscribedEmails> ajaxTest() {
        Set<SubscribedEmails> records = new HashSet<>();
        SubscribedEmails sub = new SubscribedEmails();
        sub.setEmail("one email");
        records.add(sub);
        SubscribedEmails sub2 = new SubscribedEmails();
        sub2.setEmail("two");
        records.add(sub2);

        return records;
    }

    @RequestMapping(value = "/contactUS", method = RequestMethod.POST)
    @ResponseBody
    public String pddost(@RequestBody ContactUs h,Principal principal) {
        System.out.println(h.getName()+ "  "+h.getEmail()+" "+h.getText());
        if(principal!=null){
            User user = userService.getUser(principal.getName());
            h.setEmail(user.getEmail());
            h.setName(user.getName());
        }
        System.out.println(h.getName()+ "  "+h.getEmail()+" "+h.getText());
        sendingManager.contactUs(h);
        return "nvjnjv";
    }

}