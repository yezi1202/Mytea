package com.shop.Controller.userContoller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.Controller.baseController;
import com.shop.Entities.Product;
import com.shop.dto.sanPhamDb;

@Controller
public class ajaxController extends baseController {

	@RequestMapping(value = { "/trangchu" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> trangchu_ajax(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody sanPhamDb sanPhamDb) throws IOException {
		StringBuffer out = new StringBuffer();
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("hotl", out);
		jsonResult.put("newl", out);
		jsonResult.put("hotnum", sanPhamDb.getHotp());
		jsonResult.put("newnum", sanPhamDb.getNewp());
		return ResponseEntity.ok(jsonResult);
	}
}
