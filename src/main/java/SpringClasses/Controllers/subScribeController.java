package SpringClasses.Controllers;

import SpringClasses.Service.EmailsService;
import SpringClasses.Service.SubscribedEmailesService;
import SpringClasses.StructureFiles.MAil;
import SpringClasses.StructureFiles.SendingManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class subScribeController {
    @Autowired
    SubscribedEmailesService subscribedEnmailsService;
    @Autowired
    EmailsService mailer;
    @Autowired
    SendingManager manager;

    @Autowired
    MAil maileSender;
@RequestMapping(value = "/addSubscribedEmail" ,method = RequestMethod.POST)
    public @ResponseBody  void addMail(@RequestBody String mail){
    System.out.println(mail);
   manager.someoneHaveSubscribed(mail);
    subscribedEnmailsService.addSubscribedemail(mail);
    System.out.println("==========------------------+++++++++++++++++++++++++++++");
}


    @RequestMapping(value = "ckeckMailAll", method = RequestMethod.POST)
    @ResponseBody
    public String checkMAilAll(@RequestBody String mail) {
        List<String> maile = mailer.checkEmaiIfExists(mail);
        System.out.println("llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");

        System.out.println(subscribedEnmailsService.checkIfExistsThisMail(mail));
        System.out.println(mail);
        if (maile.isEmpty()&& subscribedEnmailsService.checkIfExistsThisMail(mail)) {
            return "empty";
        }
        return "notEmpty";
    }



    @RequestMapping(value = "/sendMultiMassages", method = RequestMethod.POST)
    @ResponseBody
    public String sendSubscribed(@RequestBody String mail) {
        System.out.println(mail);
        List<String> maile = mailer.getAllAmails();
        List<String> usersMails=mailer.getAllUsersEmails();
        Set<String> realMAils=new HashSet<>();
        for (String usersMail : usersMails) {
            realMAils.add(usersMail);
        }
        for (String s : maile) {
            realMAils.add(s);
        }

        for (String realMAil : realMAils) {
            maileSender.sendMail("Athene",mail,realMAil);
        }

        System.out.println("llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");

        return "Admina";
    }
}
