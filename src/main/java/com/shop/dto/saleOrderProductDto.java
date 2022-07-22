package com.shop.dto;

import java.util.List;

import com.shop.Entities.SaleOrder;
import com.shop.Entities.SaleOrderProducts;

public class saleOrderProductDto {
	private SaleOrder order;
	private List<SaleOrderProducts> products;
	public SaleOrder getOrder() {
		return order;
	}
	public void setOrder(SaleOrder order) {
		this.order = order;
	}
	public List<SaleOrderProducts> getProducts() {
		return products;
	}
	public void setProducts(List<SaleOrderProducts> products) {
		this.products = products;
	}
	
}
