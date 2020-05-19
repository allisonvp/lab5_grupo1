package sw2.lab5.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;

    @Override
    protected void configure(HttpSecurity http) throws Exception  {
        http.formLogin()
                .loginPage("/loginForm")
                .loginProcessingUrl("/processLogin")
                .defaultSuccessUrl("/redirectByRole");

        http.logout()
                .logoutSuccessUrl("/post")
                .deleteCookies("JSESSIONID")
                .invalidateHttpSession(true);

        http.authorizeRequests()
                .antMatchers("/user","/user/list").hasAuthority("admin")
                .antMatchers("/post","/post/delete").hasAuthority("admin")
                .antMatchers("/user","/user/edit").hasAnyAuthority("admin","user")
                .antMatchers("/post","/post/create").hasAnyAuthority("admin","user")
                .antMatchers("/post","/post/edit").hasAnyAuthority("admin","user")
                .anyRequest().permitAll();

    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
            .dataSource(dataSource)
            .passwordEncoder(new BCryptPasswordEncoder())
            .usersByUsernameQuery("SELECT email, password, active FROM user WHERE email = ?")
            .authoritiesByUsernameQuery("SELECT u.email, r.role_name FROM user u \n" +
                    "INNER JOIN role r ON (u.id_role = r.id_role) WHERE u.email = ? and u.active = 1");
    }
}