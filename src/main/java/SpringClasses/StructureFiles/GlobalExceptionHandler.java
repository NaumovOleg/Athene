package SpringClasses.StructureFiles;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@ControllerAdvice
@Component("handler")
public class GlobalExceptionHandler implements AccessDeniedHandler {
    @ExceptionHandler(org.springframework.security.authentication.InternalAuthenticationServiceException.class)
    public String handleSQLException(){
        return "Main";
    }


    @Override
    public void handle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AccessDeniedException e) throws IOException, ServletException {
    }
}