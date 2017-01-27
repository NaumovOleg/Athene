package SpringClasses.JavaConfig.Secirity;

import SpringClasses.Service.UserServiceIml.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.sql.DataSource;

@Configuration
@EnableWebMvcSecurity
@EnableGlobalMethodSecurity
public class AppSecurityConfig extends WebSecurityConfigurerAdapter {

/*    @Bean(name = "dataSource2")
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/lynx");
        dataSource.setUsername("root");
        dataSource.setPassword("hippi26");
        return dataSource;
    }*/
    @Autowired
    private DataSource dataSource;
@Autowired
UserServiceImpl userService;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) {
        try {
            auth.inMemoryAuthentication().withUser("user").password("user").roles("USER");
            auth.inMemoryAuthentication().withUser("admin").password("admin").roles("ADMIN");
            auth.userDetailsService(userService).passwordEncoder(passwordEncoder());
        } catch (Exception e) {
        }
    }




//    @Autowired
//    public void configureGlobal(AuthenticationManagerBuilder auth) {
//        try {
//
//            auth.inMemoryAuthentication().withUser("user").password("user").roles("USER");
//
//            auth.inMemoryAuthentication().withUser("admin").password("admin").roles("ADMIN");
//            auth.jdbcAuthentication().dataSource(
//                    dataSource
//            ).passwordEncoder(passwordEncoder())
//                    .usersByUsernameQuery(
//                            "select email ,password ,enabled,email from user where email=?")
//                    .authoritiesByUsernameQuery(
//                            "select email,  role  from user where email=?");
//        } catch (Exception e) {
//        }
//    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeRequests()
                .antMatchers("/login").access("hasRole('USER')")
                .antMatchers("/newUser").access("hasRole('ADMIN')")
                .antMatchers("/editUser").authenticated().
                antMatchers("/addTestim").authenticated().
                antMatchers("/chat").authenticated().
                antMatchers("/cabinet").authenticated()
                .and().formLogin().defaultSuccessUrl("/Main", false);
        http.formLogin()
                .loginPage("/")
                .loginProcessingUrl("/loginprocessing")
                .usernameParameter("username")
                .passwordParameter("password");
        http.logout()
                .logoutUrl("/logout")

                .logoutSuccessUrl("/Main")

                .invalidateHttpSession(false);
        http.exceptionHandling()
                .accessDeniedPage("/Main");
    }


    @Bean
    @Qualifier("passwordEncoder")
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}



