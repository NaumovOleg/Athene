package SpringClasses.Controllers;

import SpringClasses.Entety.Staff;
import SpringClasses.Service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StaffController {
    @Autowired
    StaffService staffService;

    @RequestMapping(value = "/setStaff" ,method = RequestMethod.POST,produces = {"text/html; charset=UTF-8"})
    @ResponseBody public String setStaff(@RequestBody Staff staff){
        System.out.println(staff.getDESIGNERS());
        staffService.addOrsetStaff(staff);
      return "good"  ;
    }



    @RequestMapping(value = "/getStaff" ,method = RequestMethod.GET,produces = {"application/json; charset=UTF-8"})
    @ResponseBody    public Staff getStaff(){
        System.out.println("ggggggggggggggggggggggggggggggggggggggggggpopijxcnccnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
         Staff staffa=staffService.getStaff();
        return staffa;
    }
}
