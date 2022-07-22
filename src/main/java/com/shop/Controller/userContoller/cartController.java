package com.shop.Controller.userContoller;

import java.io.IOException;
import java.io.Writer;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.Controller.baseController;
import com.shop.Entities.Product;
import com.shop.Entities.SaleOrder;
import com.shop.Entities.SaleOrderProducts;
import com.shop.Entities.User;
import com.shop.Service.SaleOrderService;
import com.shop.Service.SaleProductsevice;
import com.shop.dto.Cart;
import com.shop.dto.CartItem;
import com.shop.dto.saleOrderProductDto;

import net.bytebuddy.implementation.bind.annotation.Super;

@Controller
public class cartController extends baseController {

	@Autowired
	private SaleOrderService saleOrderService;
	@Autowired
	private SaleProductsevice saleProductsevice;

	@RequestMapping(value = { "/cart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {
		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		boolean isExists = false;

		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());

			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng
		if (!isExists) {
			Product productInDb = productService.getById(cartItem.getProductId());

			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPrice());
			cartItem.setAvatadb(productInDb.getAvatar());
			cart.getCartItems().add(cartItem);
		}

		// tính tổng tiền
		this.calculateTotalPrice(request);
		// trả về kết quả
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		session.setAttribute("totalItems", getTotalItems(request));
		jsonResult.put("totalprice", super.currencyFormat(cart.getTotalPrice()));
		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = { "/cart-updateQuanlityCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_updateToCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				item.setQuanlity(cartItem.getQuanlity());
			}
		}

		// tính tổng tiền
		this.calculateTotalPrice(request);
		// trả về kết quả
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		session.setAttribute("totalItems", getTotalItems(request));
		jsonResult.put("totalprice", super.currencyFormat(cart.getTotalPrice()));
		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = { "/cart/delect/{pid}" }, method = RequestMethod.GET)
	public String deleteToCart(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			final @PathVariable("pid") int pid) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu có trong giỏ hàng thì xóa
		for (int i = 0; i < cartItems.size(); i++) {
			if (cartItems.get(i).getProductId() == pid) {
				cartItems.remove(cartItems.get(i));
			}
		}

		// tính tổng tiền
		this.calculateTotalPrice(request);
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		session.setAttribute("totalItems", getTotalItems(request));

		return "redirect:/cart";
	}

	private void calculateTotalPrice(final HttpServletRequest request) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		BigDecimal total = BigDecimal.ZERO;

		for (CartItem ci : cartItems) {
			total = total.add(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuanlity())));
		}
		cart.setTotalPrice(total);
	}

	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		} else {
			Cart cart = (Cart) httpSession.getAttribute("cart");
			List<CartItem> cartItems = cart.getCartItems();

			int total = 0;
			for (CartItem item : cartItems) {
				total += item.getQuanlity();
			}

			return total;
		}

	}

	@RequestMapping(value = { "/cart" }, method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
//		model.addAttribute("user", super.getUserLogined());
		return "nguoidung/giohang"; // -> đường dẫn tới View.
	}

	@RequestMapping(value = { "/donhang" }, method = RequestMethod.POST)
	public String donhang(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String customerFullName = request.getParameter("customerFullName");
		String customerAddress = request.getParameter("customerAddress");
		String coment = request.getParameter("coment");
		String customerPhone = request.getParameter("customerPhone");
		BigDecimal total = getBigDecimal(request, "total");
		
		
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCustomerName(customerFullName);
		saleOrder.setComent(coment);
		saleOrder.setCustomerAddress(customerAddress);
		saleOrder.setCustomerPhone(customerPhone);
		saleOrder.setTotal(total);
		// tạo hóa đơn

		// kiểm tra xem khách hàng có phải đã login hay chưa?
		if (super.isLogined()) {
			User userLogined = super.getUserLogined();
			saleOrder.setUser(userLogined); // khóa ngoại user_id
		}

		// mã hóa đơn
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));

		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		for (CartItem cartItem : cart.getCartItems()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuanlity());

			// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}
		saleOrderService.saveOrUpdate(saleOrder);

		// xóa dữ liệu giỏ hàng trong session
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", "0");

		return "redirect:/donhang"; // -> đường dẫn tới View.
	}

	@RequestMapping(value = { "/donhang" }, method = RequestMethod.GET)
	public String donhangview(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		if (super.isLogined()) {
			List<saleOrderProductDto> dtos = new ArrayList<saleOrderProductDto>();
			for (SaleOrder saleOrder : saleOrderService.findNotStratusAllByUSerId(super.getUserLogined().getId())) {
				saleOrderProductDto saleOrderProductDto = new saleOrderProductDto();
				saleOrderProductDto.setOrder(saleOrder);
				saleOrderProductDto.setProducts(saleProductsevice.findAllBYSaleOrderId(saleOrder.getId()));
				dtos.add(saleOrderProductDto);
			}

			model.addAttribute("saleOL", dtos);
			return "nguoidung/donhang";
		} else 
			return null;
		

	}

	@RequestMapping(value = { "/tinhtrang" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_status(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody SaleOrderProducts orderProducts) {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		saleProductsevice.getById(orderProducts.getId()).setStatus(false);
		saleProductsevice.saveOrUpdate(saleProductsevice.getById(orderProducts.getId()));
		String ht = "<button class=\"btn btn-light\" disabled>Đã giao</button>";
		jsonResult.put("tb", "Đã giao hàng thành công!\nCảm ơn quý khách hàng đã tin dùng.");
		jsonResult.put("ht", ht);

		return ResponseEntity.ok(jsonResult);
	}

}
