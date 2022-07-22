package com.shop.Controller.userContoller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.Controller.baseController;
import com.shop.dto.SearchModel;



@Controller
public class sanPhamController extends baseController {
	@RequestMapping(value = { "/sanpham" }, method = RequestMethod.GET)
	public String sanpham(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		SearchModel searchModel = new SearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.sapxep = getInteger(request, "sapxep");
		searchModel.setPage(getCurrentPage(request));
		searchModel.categoryId = super.getInteger(request, "categoryId");
		model.addAttribute("product", productService.search(searchModel,false));
		model.addAttribute("searchModel", searchModel);
		return "nguoidung/sanpham";
	}
	@RequestMapping(value = { "/sanpham/{pdseo}" }, method = RequestMethod.GET)
	public String chitietsanpham(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("pdseo") String pdseo)
			throws IOException {
		model.addAttribute("product",productService.getBySeo(pdseo) );
//		model.addAttribute("searchModel", );
		return "nguoidung/chitietsanpham";
	}

}
