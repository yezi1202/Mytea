package com.shop.Entities;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_saleorder")
public class SaleOrder extends BaseEntity {
	
	@Column(name = "code")
	private String code;

	@Column(name = "total", precision = 13, scale = 2, nullable = true)
	private BigDecimal total;

	@Column(name = "customer_name")
	private String customerName;

	@Column(name = "customer_address")
	private String customerAddress;

	@Column(name = "customer_phone")
	private String customerPhone;

	@Column(name = "coment")
	private String coment;

	@Column(name = "seo")
	private String seo;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "saleOrder", fetch = FetchType.EAGER)
	private Set<SaleOrderProducts> saleOrderProducts = new HashSet<SaleOrderProducts>();
	public void addSaleOrderProducts(SaleOrderProducts _saleOrderProducts) {
		_saleOrderProducts.setSaleOrder(this);
		saleOrderProducts.add(_saleOrderProducts);
	}
	public void removeSaleOrderProducts(SaleOrderProducts _saleOrderProducts) {
		_saleOrderProducts.setSaleOrder(null);
		saleOrderProducts.remove(_saleOrderProducts);
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Set<SaleOrderProducts> getSaleOrderProducts() {
		return saleOrderProducts;
	}

	public void setSaleOrderProducts(Set<SaleOrderProducts> saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String datefomat() {
		return new SimpleDateFormat("dd/MM/yyyy HH:mm").format(super.getCreatedDate());
	}
	public String totalfomat() {
		try {
			NumberFormat.getInstance(new Locale("vi", "VN"));
			return NumberFormat.getCurrencyInstance().format(getTotal());
		} catch (Exception e) {
			return null;
		}
		
	}

}
