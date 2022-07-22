package com.shop.Controller.adminContoller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.Controller.baseController;
import com.shop.Entities.Categories;
import com.shop.Entities.Product;


@Controller
public class admincateController extends baseController {
	
	@RequestMapping(value = { "/admin/danhmuc" }, method = RequestMethod.GET)
	public String admindanhmuc(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		return "quantri/quanlicate";
	}
	
	@RequestMapping(value = { "/admin/them/danhmuc" }, method = RequestMethod.GET)
	public String themdanhmuc(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("category", new Categories()); // đẩy sản phẩm mới tạo xuống view
		return "quantri/quanlithemcate";
	}
	
	@RequestMapping(value = { "/admin/danhmuc" }, method = RequestMethod.POST)
	public String admindanhmuc_post(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("category") Categories categories
			)
			throws IOException {
		try {
			super.categoriesService.saveOrUpdate(categories);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:/admin/danhmuc";
	}
	@RequestMapping(value = { "/admin/sua/danhmuc/{cateId}" }, method = RequestMethod.GET)
	public String admin_editcat(final Model model, final HttpServletRequest request,
			final HttpServletResponse response,@PathVariable("cateId") int cateId) throws IOException {
			Categories categories = categoriesService.getById(cateId);
			model.addAttribute("category", categories);
		
		return "quantri/quanlithemcate";

	}
	@RequestMapping(value = { "/admin/xoa/danhmuc/{cateId}" }, method = RequestMethod.GET)
	public String admin_deletecat(final Model model, final HttpServletRequest request,
			final HttpServletResponse response,@PathVariable("cateId") int cateId) throws IOException {
			Categories categories = categoriesService.getById(cateId);
			categoriesService.delete(categories);
		
		return "redirect:/admin/danhmuc";

	}
	// status
		@RequestMapping(value = { "/admin/status/danhmuc" }, method = RequestMethod.POST)
		public ResponseEntity<Map<String, Object>> status_ajax(final Model model, final HttpServletRequest request,
				final HttpServletResponse response, final @RequestBody Categories categories) throws IOException {
			
			Map<String, Object> jsonResult = new HashMap<String, Object>();
			try {
				categoriesService.getById(categories.getId()).setStatus(categories.getStatus());
				categoriesService.saveOrUpdate(categoriesService.getById(categories.getId()));
				jsonResult.put("tb", true);
			} catch (Exception e) {
				jsonResult.put("tb", false);
			}

			return ResponseEntity.ok(jsonResult);
		}

}
