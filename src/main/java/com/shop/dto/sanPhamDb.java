package com.shop.dto;

import java.util.List;

import com.shop.Entities.Product;


public class sanPhamDb {
	private int hotp;
	private int newp;
	private List<Product> listNewPro;
	private List<Product> listHotPro;
	
	public int getHotp() {
		return hotp;
	}
	public void setHotp(int hotp) {
		this.hotp = hotp;
	}
	public int getNewp() {
		return newp;
	}
	public void setNewp(int newp) {
		this.newp = newp;
	}
	public List<Product> getListNewPro() {
		return listNewPro;
	}
	public void setListNewPro(List<Product> listNewPro) {
		this.listNewPro = listNewPro;
	}
	public List<Product> getListHotPro() {
		return listHotPro;
	}
	public void setListHotPro(List<Product> listHotPro) {
		this.listHotPro = listHotPro;
	}
	
}
