package SpringClasses.Controllers;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
class GlobalControllerException {
    @ResponseStatus(HttpStatus.CONFLICT)
    @ExceptionHandler(DataIntegrityViolationException.class)
    public void handleConflict() {
    }

    @ExceptionHandler(value = org.springframework.web.multipart.MultipartException.class)
    public ModelAndView handleIOException() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("OldMain");
        return modelAndView;
    }
    @ExceptionHandler(value=EmptyResultDataAccessException.class)
    public String man(){
        return "/Main";
    }
    @ExceptionHandler(NoHandlerFoundException.class)
    public String dealWithNoHandlerFoundException()   {
        return "404";
    }

}
