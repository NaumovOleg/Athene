package SpringClasses.JavaConfig;

import SpringClasses.JavaConfig.Secirity.AppSecurityConfig;
import SpringClasses.Service.UserServiceIml.UserServiceImpl;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.Filter;

public class MyWebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[] { SpringWebConfig.class };
    }
    @Override
    protected String[] getServletMappings() {
        return new String[] {"/"};
    };

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] { AppSecurityConfig.class, PersistenceJPAConfig.class,SpringWebConfig.class, UserServiceImpl.class};
    }
    @Override
    protected Filter[] getServletFilters() {
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);

        return new Filter[] { characterEncodingFilter};
    }
}