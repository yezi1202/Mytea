package com.shop.Controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shop.Entities.Role;
import com.shop.Entities.User;
import com.shop.Service.RoleService;
import com.shop.Service.UserService;

import net.bytebuddy.implementation.bind.annotation.Super;

@Controller
public class LoginController extends baseController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String adminlogin(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		model.addAttribute("user", new User());
		return "quantri/dangnhap";
	}

	@RequestMapping(value = { "/dangnhap" }, method = RequestMethod.GET)
	public String userlogin(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("user", new User());
		return "nguoidung/dangnhap";
	}

	@RequestMapping(value = { "/dangky" }, method = RequestMethod.GET)
	public String signin(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("user", new User());
		return "nguoidung/dangky";
	}

	@RequestMapping(value = { "/dangky" }, method = RequestMethod.POST)
	public String addsignin(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("user") User user, @RequestParam("avatar") MultipartFile avatar,
			@RequestParam("Password") String pass) throws IOException {
		if (userService.isexistUserName(user)) {
			System.out.println(userService.isexistUserName(user));
			model.addAttribute("tb", "Tên tài khoản đã tồn tại!");
			return "nguoidung/dangky";
		} else if (userService.isexistEmail(user)) {
			System.out.println(userService.isexistEmail(user));
			model.addAttribute("tb", "Email đã được tài khoản khác sử dụng!<br>Vui lòng thay đổi email.");
			return "nguoidung/dangky";
		} else if (isEXString(pass) && isEXString(user.getName()) && isEXString(user.getEmail())) {
			Set<Role> roles = new HashSet<Role>();
			roles.add(roleService.getById(14));
			userService.add(user, avatar, pass, roles);
			model.addAttribute("tbal", "bạn đã tạo tài khoản thành công!");

			return "redirect:/dangnhap";
		} else {
			model.addAttribute("tb", "Không được để trống!");
			return "nguoidung/dangky";
		}

	}

	@RequestMapping(value = { "/taikhoan" }, method = RequestMethod.GET)
	public String tk(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		try {
			model.addAttribute("user",super.getUserLogined());
			return "nguoidung/taikhoan";
		} catch (Exception e) {
			return null;
		}
	}

	@RequestMapping(value = { "/taikhoan" }, method = RequestMethod.POST)
	public String tkp(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("user") User user, @RequestParam("avatar") MultipartFile avatar,
			@RequestParam("Password") String pass) throws IOException {
		
			userService.update(user, avatar, pass, null);
			model.addAttribute("tbal", "bạn đã cập nhật tài khoản thành công!");
			return "redirect:/taikhoan";
		
		

		
	}

}
