package com.shop.Controller.adminContoller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shop.Controller.baseController;
import com.shop.Entities.Product;
import com.shop.Service.ProductService;
import com.shop.dto.SearchModel;

;

@Controller
public class adminspController extends baseController {

	@Autowired
	private ProductService productService;

	/* lấy sản phẩm trả về trang quan li san pham */
	@RequestMapping(value = { "/admin/sanpham" }, method = RequestMethod.GET)
	public String adminsanpham(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		SearchModel searchModel = new SearchModel();
		searchModel.categoryId = super.getInteger(request, "categoryId");
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		/* trả về danh sách sản phẩm theo page */
		model.addAttribute("product", productService.search(searchModel, true));
		model.addAttribute("searchModel", searchModel);
		if (productService.search(searchModel, true).getData().size() == 0
				|| productService.search(searchModel, true).getData() == null) {
			model.addAttribute("thongbao",
					"Không có sản phẩm nào phù hợp với từ khóa: '" + searchModel.keyword + "'  ");
							
		}
		return "quantri/quanlisp";
	}

	@RequestMapping(value = { "/admin/them/sanpham" }, method = RequestMethod.GET)
	public String adminthemsanpham(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		model.addAttribute("product", new Product()); // đẩy sản phẩm mới tạo xuống view
		return "quantri/quanlithemsp";
	}

	/* Đẩy sản phảm lên */
	@RequestMapping(value = { "/admin/sanpham" }, method = RequestMethod.POST)
	public String adminsanpham_Post(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("product") Product product, // spring-form biding với
			// product model
			@RequestParam("ptavatar") MultipartFile ptavatar) // hứng file đẩy lên
			// @RequestParam("ptpictures") MultipartFile[] ptpictures)// hứng file đẩy lên)
			throws IOException {
		// set nổi bật vs ms cho sp

			if (product.getCategories().getId() == 0) { /// lấy category rỗng cho bsanr phẩm
				product.setCategories(null);
			}
			// cần kiểm tra xem id của product
			// = null || = 0 thì thêm mới
			// ngược lại là chỉnh sửa
			if (product.getId() == null || product.getId() <= 0) { // thêm mới
				productService.add(product, ptavatar);
			} else { // chỉnh sửa

				productService.update(product, ptavatar);
			}
		return "redirect:/admin/sanpham";
	}

	@RequestMapping(value = { "/admin/sua/sanpham/{productId}" }, method = RequestMethod.GET)
	public String admin_editproductg(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("productId") int productId) throws IOException {

		Product product = productService.getById(productId);

		// edit sản phẩm
		model.addAttribute("product", product);
		return "quantri/quanlithemsp";

	}

	@RequestMapping(value = { "/admin/xoa/sanpham/{productId}" }, method = RequestMethod.GET)
	public String admin_deleteproductg(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("productId") int productId) throws IOException {
		Product product = productService.getById(productId);
		productService.delete(product);
		return "redirect:/admin/sanpham";

	}

	// status
	@RequestMapping(value = { "/admin/status/sanpham" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> status_ajax(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody Product product) throws IOException {
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		try {
			productService.getById(product.getId()).setStatus(product.getStatus());
			productService.saveOrUpdate(productService.getById(product.getId()));
			jsonResult.put("tb", true);
		} catch (Exception e) {
			jsonResult.put("tb", false);
		}

		return ResponseEntity.ok(jsonResult);
	}
}
