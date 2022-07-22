package com.shop.Service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.shop.Entities.SaleOrder;
import com.shop.Entities.SaleOrderProducts;
import com.shop.Entities.User;
import com.shop.dto.PagerData;
import com.shop.dto.SearchModel;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {
	@Autowired
	SaleProductsevice saleProductsevice;

	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}

	public List<SaleOrder> findNotStratusAllByUSerId(Integer uId) {
		if (uId != null && uId > 0) {
			String sql = "SELECT * FROM tbl_saleorder WHERE user_id = " + uId;
			return super.listSql(sql);
		} else
			return null;
	}

	public PagerData<SaleOrder> search(SearchModel searchModel) {
		String sql = "SELECT * FROM tbl_saleorder u  WHERE 1=1";
		if (searchModel != null) {
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (u.code like '%" + searchModel.keyword + "%')";
			}

		}

		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage(),
				searchModel == null ? 0 : searchModel.getOrdered());
	}

	@SuppressWarnings("unchecked")
	public PagerData<SaleOrder> executeByNativeSQL(String sql, int page, int wan) {
		PagerData<SaleOrder> result = new PagerData<SaleOrder>();

		try {
			Query query = entityManager.createNativeQuery(sql, clazz());
			List<SaleOrder> orders = query.getResultList();
			List<SaleOrder> oSaleOrders = new ArrayList<SaleOrder>();
			if (wan == 1) {
				for (int i = 0; i < orders.size(); i++) {

					if (isOrdered(orders.get(i).getId())) {
						oSaleOrders.add(orders.get(i));
					}
				}

			}else
			if (wan == 2) {
				for (int i = 0; i < orders.size(); i++) {
					if (!isOrdered(orders.get(i).getId())) {
						oSaleOrders.add(orders.get(i));
					}
				}
			}else {
				oSaleOrders=orders;
			}
			
			// trường hợp có thực hiện phân trang thì kết quả trả về
			// bao gồm tổng số page và dữ liệu page hiện tại
			if (page > 0) {
				result.setCurrentPage(page);
				result.setTotalItems(oSaleOrders.size());

				query.setFirstResult((page - 1) * SIZE_OF_PAGE);
				query.setMaxResults(SIZE_OF_PAGE);
			}

			result.setData(oSaleOrders);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public String ordered(Integer soId) {
		int dem = 0;
		for (SaleOrderProducts sop : saleProductsevice.findAllBYSaleOrderId(soId)) {
			if (!sop.getStatus()) {
				dem++;
			}
		}
		return dem + "/" + saleProductsevice.findAllBYSaleOrderId(soId).size() + " hoàn thành";
	}

	public boolean isOrdered(Integer soId) {
		int dem = 0;
		for (SaleOrderProducts sop : saleProductsevice.findAllBYSaleOrderId(soId)) {
			if (!sop.getStatus()) {
				dem++;
			}
		}
		if (dem == saleProductsevice.findAllBYSaleOrderId(soId).size()) {
			return true;
		}
			return false;
	}
}
