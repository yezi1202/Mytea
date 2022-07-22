package com.shop.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.Entities.SaleOrderProducts;

@Service
public class SaleProductsevice extends BaseService<SaleOrderProducts> {
	@Override
	protected Class<SaleOrderProducts> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProducts.class;
	}
	
	public List<SaleOrderProducts> findAllBYSaleOrderId(Integer soId) {
		if(soId != null && soId>0) {
			String sql = "SELECT * FROM tbl_saleorder_products WHERE saleorder_id = " + soId;
			return listSql(sql);
		}else return null;
	}
	
}
