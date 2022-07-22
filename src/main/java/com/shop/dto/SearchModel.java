package com.shop.dto;

import java.math.BigDecimal;
import java.util.List;

public class SearchModel extends BaseSearchModel {

	// tìm theo keyword
	public String keyword;

	// tìm theo category
	public Integer categoryId;
	public Integer rowId;
	public String seo;
	public Boolean isHot;
	public Boolean newprod;
	public BigDecimal minpri, maxpri;
	public Integer sapxep;
	public int ordered;//đơn hàng đã hoàn thành
	

	public int getOrdered() {
		return ordered;
	}

	public Integer getRowId() {
		return rowId;
	}

	public Boolean getNewprod() {
		return newprod;
	}

	public Integer getSapxep() {
		return sapxep;
	}

	public BigDecimal getMinpri() {
		return minpri;
	}

	public BigDecimal getMaxpri() {
		return maxpri;
	}

	public String getKeyword() {
		return keyword;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public String getSeo() {
		return seo;
	}

	public boolean getIsHot() {
		return isHot;
	}

	public boolean getNewProd() {
		return newprod;
	}

}
