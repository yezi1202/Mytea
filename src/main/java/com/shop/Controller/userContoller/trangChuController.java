package com.shop.Controller.userContoller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.Controller.baseController;
import com.shop.dto.userDto;


@Controller
public class trangChuController extends baseController {

	
	@RequestMapping(value = { "/","trangchu" }, method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("sphot", productService.findAllHot());
		return "nguoidung/trangchu";
	}
	@RequestMapping(value = { "/demo" }, method = RequestMethod.GET)
	public String demo(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("user", new userDto(10, null, "oke", "demo", null, null, null, null,"img/av.png"));
		return "ddemo";
	}
}
