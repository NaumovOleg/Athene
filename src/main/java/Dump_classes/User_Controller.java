//package Dump_classes;
//
//import SpringClasses.Service.UserService;
//import SpringClasses.StructureFiles.MAil;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.servlet.ModelAndView;
//
//@Controller
//public class User_Controller {
//@Autowired
//MAil mail;
//    @Autowired
//    UserService userService;





//    @RequestMapping(value = "/registration",method = RequestMethod.POST)
//    public String addUser(@ModelAttribute User user, BindingResult bindingResult, Model model){
//        if(bindingResult.hasErrors()){
//            return "newUser";
//        }else {
//            user.setRole("USER");
//            user.setEnabled(true);
//            userService.addUser(user);
//        }
//        return "Main";
//    }




//
//    public ModelAndView handleIOException() {
//        ModelAndView modelAndView=new ModelAndView();
//        modelAndView.addObject("message","cdbcdncjdk");
//        modelAndView.setViewName("login");
//        System.out.println("--------------------------------===================------------------------");
//        return modelAndView;
//    }
//}
