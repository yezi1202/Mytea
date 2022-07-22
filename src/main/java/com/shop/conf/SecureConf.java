package com.shop.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.shop.Service.UserDetailsServiceImpl;





@Configuration
@EnableWebSecurity
public class SecureConf extends WebSecurityConfigurerAdapter {
	
	@Autowired private UserDetailsServiceImpl userDetailsService;
	
	@Override
	protected void configure(final HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests() // bắt đầu cấu hình: tất cả các requests từ 
		// trình duyệt đều được bắt trong hàm này

		//cho phép các request static resources không bị ràng buộc(permitAll)
		.antMatchers("/css/**", "/js/**", "/upload/**", "/login", "/logout").permitAll()

		//các request kiểu: "/admin/" là phải đăng nhập (authenticated)
		.antMatchers("/admin**","/admin/**").hasAnyAuthority("ADMIN")

		.and()
		
		//cấu hình trang đăng nhập
		// /login là 1 action
		.formLogin().loginPage("/login").loginProcessingUrl("/perform_login")
		.successHandler(authenticationSuccessHandler())
		.failureUrl("/login?login_error=true")

		.and()

		//cấu hình cho phần logout
		.logout().logoutUrl("/logout").logoutSuccessUrl("/home").invalidateHttpSession(true)
		.deleteCookies("JSESSIONID");
//		.and().rememberMe().key("uniqueAndSecret").tokenValiditySeconds(86400)
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder(4));
	}
	
	@Bean
	public AuthenticationSuccessHandler authenticationSuccessHandler(){
	    return new UrlAuthenticationSuccessHandler();
	}
}
