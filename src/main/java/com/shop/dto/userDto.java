package com.shop.dto;

import java.util.List;

public class userDto {
	public Integer id;
	public List<Integer> roleid;
	public String  anh;
	public String name, username, email, address, password, phone;

	/**
	 * 
	 */
	public userDto() {

	}

	/**
	 * @param id
	 * @param roleid
	 * @param name
	 * @param username
	 * @param email
	 * @param address
	 * @param password
	 * @param phone
	 * @param anh
	 */
	public userDto(Integer id, List<Integer> roleid, String name, String username, String email, String address,
			String password, String phone, String anh) {
		super();
		this.id = id;
		this.roleid = roleid;
		this.name = name;
		this.username = username;
		this.email = email;
		this.address = address;
		this.password = password;
		this.phone = phone;
		this.anh = anh;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<Integer> getRoleid() {
		return roleid;
	}

	public void setRoleid(List<Integer> roleid) {
		this.roleid = roleid;
	}

	public String getanh() {
		return anh;
	}

	public void setanh(String anh) {
		this.anh = anh;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	

}
