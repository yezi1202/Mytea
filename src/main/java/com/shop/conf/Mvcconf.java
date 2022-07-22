package com.shop.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
public class Mvcconf implements WebMvcConfigurer{
	
	private webfilelink link = new webfilelink();
	
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		// classpath: <-> src/main/resources
		registry.addResourceHandler("/user/**").addResourceLocations("classpath:/user/");
		registry.addResourceHandler("/admin/**").addResourceLocations("classpath:/admin/");
		registry.addResourceHandler("/dulieu/**").addResourceLocations("file:" + link.pathproject()+"/dulieu/");
	}
	@Bean // -> BEAN này dùng để chỉ ra thư mục chứa Views
	public ViewResolver viewResolver() {

		InternalResourceViewResolver bean = new InternalResourceViewResolver();

		// thiết lập view engine
		bean.setViewClass(JstlView.class);

		// Đường dẫn folder chứa Views.
		bean.setPrefix("/WEB-INF/views/");

		// Tên đuôi của View
		bean.setSuffix(".jsp");

		return bean;

	}
}
