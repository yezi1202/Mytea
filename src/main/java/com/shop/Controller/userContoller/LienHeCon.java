package com.shop.Controller.userContoller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.Entities.contact;
import com.shop.Service.contactService;


@Controller
public class LienHeCon {
	@Autowired
	private contactService conService;

	@RequestMapping(value = { "/lienhe" }, method = RequestMethod.GET)
	public String lienhe(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
			contact c = new contact();
			model.addAttribute("cont", c);
		
				return "nguoidung/lienhe";
	}
	@RequestMapping(value = { "/lienhe" }, method = RequestMethod.POST)
	public String lienhep(final Model model, final HttpServletRequest request, final HttpServletResponse response,@ModelAttribute("cont") contact cont)
			throws IOException {
		
				conService.saveOrUpdate(cont);
				model.addAttribute("TB",
						"Cảm ơn " + cont.getName() + ", chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất!");
				// sau khi xử lí xong thì đưa contact về trạng thái mới
				model.addAttribute("cont", new contact());
				return "nguoidung/lienhe";
	}
}
