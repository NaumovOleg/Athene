package SpringClasses.Controllers;

import SpringClasses.Dao.writePhoto;
import SpringClasses.Entety.Testimonials;
import SpringClasses.Entety.User;
import SpringClasses.Service.TestimonialsService;
import SpringClasses.Service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
public class DefaultController {
    @Autowired
    writePhoto writePhoto;
    @Autowired
    UserService userService;
    @Autowired
    TestimonialsService testimonialsService;
    ObjectMapper mapper = new ObjectMapper();
    @RequestMapping(value = "/saveImage", method = RequestMethod.POST)
    @ResponseBody
    public String saveim(@RequestBody String  multipartFile) throws IOException {
        writePhoto.write(multipartFile.getBytes());
        String file=multipartFile.getBytes().toString();
        return "Main";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "OldMain";
    }


    @RequestMapping(value = "/addTestim" ,method = RequestMethod.POST)
    @ResponseBody
    public String addTstim(@RequestBody String testim, Principal principal){
        User user=userService.getUser(principal.getName());
        List<Testimonials> list=user.getTestimonial();
        testimonialsService.addTestimonial(testim,principal.getName());
        return "good";
    }
}
