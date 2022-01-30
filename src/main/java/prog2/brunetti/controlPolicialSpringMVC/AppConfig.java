/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prog2.brunetti.controlPolicialSpringMVC;

/**
 *
 * @author Grandalf
 */
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@ComponentScan({"prog2.brunetti.controlPolicialSpringMVC", "prog2.brunetti.controllers", "prog2.brunetti.entities", "prog2.brunetti.repositories"})
@EnableWebMvc
public class AppConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(final ResourceHandlerRegistry reg) {
        reg.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }

    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver vr = new InternalResourceViewResolver();
        vr.setViewClass(JstlView.class);
        vr.setPrefix("/vistas/");
        vr.setSuffix(".jsp");
        return vr;
    }

    @Bean(name = "dbName")
    public String getDBName() {
        return "control_policial";
    }

    @Bean(name = "dbURL")
    public String getDBURL() {
        return "127.0.0.1";
    }

    @Bean(name = "dbUser")
    public String getDBUser() {
        return "";
    }

    @Bean(name = "dbPswd")
    public String getDBPswd() {
        return "";
    }
}
