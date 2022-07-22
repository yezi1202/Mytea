package com.shop.Controller.adminContoller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shop.Controller.baseController;
import com.shop.Entities.Role;
import com.shop.Entities.User;
import com.shop.Service.UserService;
import com.shop.dto.SearchModel;
import com.shop.dto.userDto;

@Controller
public class adminTaikhoan extends baseController {
	@Autowired
	private UserService userService;

	@RequestMapping(value = { "/admin/taikhoan" }, method = RequestMethod.GET)
	public String admintk(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		SearchModel searchModel = new SearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		/* trả về danh sách sản phẩm theo page */
		try {
			model.addAttribute("users", userService.search(searchModel));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getLocalizedMessage());
		}
		model.addAttribute("searchModel", searchModel);

		return "quantri/quanlitaikhoan";
	}

	@RequestMapping(value = { "/admin/them/taikhoan" }, method = RequestMethod.GET)
	public String adminaddtk(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		model.addAttribute("user", new userDto());
		return "quantri/quanlithemtaikhoan";
	}

	@RequestMapping(value = { "/admin/taikhoan" }, method = RequestMethod.POST)
	public String addsignin(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("user") userDto userDto, @RequestParam("avatar") MultipartFile avatar) throws IOException {
		User user = new User(userDto.username, userDto.email, userDto.address, userDto.name, userDto.phone);
		Set<Role> roles = new HashSet<Role>();
		if(userDto.roleid != null && userDto.roleid.size()>0) {
			for (Integer r : userDto.roleid) {
				roles.add(roleService.getById(r));
			}
		}
		if (userDto.getId() == null || userDto.getId() < 0) {
			userService.add(user, avatar, userDto.password, roles);
		} else {
			user.setId(userDto.getId());
			userService.update(user, avatar, userDto.password, roles);
		}

		return "redirect:/admin/taikhoan";

	}

	@RequestMapping(value = { "/admin/sua/taikhoan/{userId}" }, method = RequestMethod.GET)
	public String admineditcont(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("userId") int userId) throws IOException {
		User user = userService.getById(userId);
		List<Integer> roleid = new ArrayList<Integer>();
		for (Role role : user.getRoles()) {
			roleid.add(role.getId());
		}
		userDto userDto = new userDto(user.getId(), roleid, user.getName(), user.getUsername(), user.getEmail(),
				user.getAddress(), user.getPassword(), user.getPhone(), user.getAvata());
		model.addAttribute("user", userDto);
		return "quantri/quanlithemtaikhoan";

	}

	@RequestMapping(value = { "/admin/xoa/taikhoan/{userId}" }, method = RequestMethod.GET)
	public String admindeletecont(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("userId") int userId) throws IOException {
		User user = userService.getById(userId);
		if (user.getRoles() != null && user.getRoles().size() > 0) {
			for (Role role : user.getRoles()) {
				user.deleteRole(role);
			}
		}
		userService.delete(user);
		return "redirect:/admin/taikhoan";

	}

}
