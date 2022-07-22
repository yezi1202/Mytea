package com.shop.Controller.adminContoller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.Controller.baseController;
import com.shop.Entities.Product;
import com.shop.Entities.SaleOrderProducts;
import com.shop.Service.SaleOrderService;
import com.shop.Service.SaleProductsevice;
import com.shop.dto.SearchModel;

@Controller
public class admindonhang extends baseController {
	@Autowired
	private SaleProductsevice saleProductsevice;
	@Autowired
	private SaleOrderService saleOrderService;

	@RequestMapping(value = { "/admin/donhang" }, method = RequestMethod.GET)
	public String admindonhang(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		SearchModel searchModel = new SearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.ordered = getInteger(request, "ordered");
		searchModel.setPage(getCurrentPage(request));
		model.addAttribute("saleO", saleOrderService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		model.addAttribute("saleoservice", saleOrderService);
		return "quantri/quanlidonhang";

	}

	@RequestMapping(value = { "/admin/chitietdonhang/{id}" }, method = RequestMethod.GET)
	public String admin_editproductg(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("id") int id) throws IOException {

		model.addAttribute("soP", saleProductsevice.findAllBYSaleOrderId(saleOrderService.getById(id).getId()));

		return "quantri/chitietdonhang";

	}

	@Override
	public Integer getInteger(HttpServletRequest request, String paramName) {
		try {
			return Integer.parseInt(request.getParameter(paramName));
		} catch (Exception e) {
			return 0;
		}
	}

	@RequestMapping(value = { "/admin/xoa/donhang/{Id}" }, method = RequestMethod.GET)
	public String admin_deleteproductg(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("Id") int Id) throws IOException {
		for (SaleOrderProducts sl : saleOrderService.getById(Id).getSaleOrderProducts()) {
			saleProductsevice.delete(sl);
		}
		saleOrderService.delete(saleOrderService.getById(Id));
		return "redirect:/admin/donhang";

	}
}
