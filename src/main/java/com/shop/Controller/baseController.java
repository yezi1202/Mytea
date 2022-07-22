package com.shop.Controller;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.shop.Entities.Categories;
import com.shop.Entities.Role;
import com.shop.Entities.User;
import com.shop.Service.CategoriesService;
import com.shop.Service.ProductService;
import com.shop.Service.RoleService;
import com.shop.Service.UserService;

public abstract class baseController {

	@Autowired
	public CategoriesService categoriesService;
	@Autowired
	public ProductService productService;
	@Autowired
	public RoleService roleService;
	@Autowired
	public UserService  userService;
	
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			isLogined = true;
		}
		return isLogined;
	}

	@ModelAttribute("userLogined")
	public User getUserLogined() {
		try {
			Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (userLogined != null && userLogined instanceof UserDetails)
				
				return userService.getById(((User) userLogined).getId());
		} catch (Exception e) {
			return null;
		}

		return null;
	}
	
	@ModelAttribute("categories")
	public List<Categories> getAllCategories() {
		return categoriesService.findAll();
	}
	@ModelAttribute("listrole")
	public List<Role> getAllRoles() {
		return roleService.findAll();
	}

	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}

	public Integer getInteger(HttpServletRequest request, String paramName) {
		try {
			return Integer.parseInt(request.getParameter(paramName));
		} catch (Exception e) {
			return null;
		}
	}

	public String currencyFormat(BigDecimal n) {
		NumberFormat.getInstance(new Locale("vi", "VN"));
		return NumberFormat.getCurrencyInstance().format(n);
	}

	public boolean isEXString(String key) {
		if(key != null && key.length()>0) {
			return true;
		}
		return false;
	}
	public BigDecimal getBigDecimal(HttpServletRequest request, String paramName) {
		try {
			return new BigDecimal(request.getParameter(paramName));
		} catch (Exception e) {
			return null;
		}
	}
}
