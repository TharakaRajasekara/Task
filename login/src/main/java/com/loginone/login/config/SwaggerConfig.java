package com.loginone.login.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
public class SwaggerConfig {


    @Bean
    public InMemoryUserDetailsManager userDetailsService(){

        UserDetails user = User.withDefaultPasswordEncoder()
                .username("root")
                .password("Ts@1102r")
                .roles("USER")
                .build();
        return new InMemoryUserDetailsManager(user);
    }
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception
    {
        http.authorizeHttpRequests((authz)->authz
                                .antMatchers("/api/vi/Student/register")
                                //.anyRequest()
                                .authenticated()
                )
                .httpBasic();
        return http.build();
    }

}
