package com.shop.Entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.*;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "tbl_users")
public class User extends BaseEntity implements UserDetails {

	@Column(name = "username", length = 45, nullable = false)
	private String username;

	@Column(name = "password", length = 100, nullable = false)
	private String password;

	@Column(name = "email", length = 45, nullable = false)
	private String email;
	@Column(name = "avata", length = 200, nullable = true)
	private String avata;
	@Column(name = "address", length = 100, nullable = true)
	private String address;
	@Column(name = "name", length = 45, nullable = true)
	private String name;
	@Column(name = "phone", length = 100, nullable = true)
	private String phone;

	
	public User() {
		
	}
	/**
	 * @param username
	 * @param email
	 * @param address
	 * @param name
	 * @param phone
	 */
	public User(String username, String email, String address, String name, String phone) {
		super();
		this.username = username;
		this.email = email;
		this.address = address;
		this.name = name;
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAvata() {
		return avata;
	}

	public void setAvata(String avata) {
		this.avata = avata;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "users")
	private Set<Role> roles = new HashSet<Role>();

	public void addRoles(Role role) {
		role.getUsers().add(this);
		roles.add(role);
	}

	public void deleteRole(Role role) {
		role.getUsers().remove(this);
		roles.remove(role);
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "user")
	private Set<SaleOrder> saleOrders = new HashSet<SaleOrder>();

	public void addSaleOrder(SaleOrder saleOrder) {
		saleOrders.add(saleOrder);
		saleOrder.setUser(this);
	}

	public void deleteSaleOrder(SaleOrder saleOrder) {
		saleOrders.remove(saleOrder);
		saleOrder.setUser(null);
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Set<SaleOrder> getSaleOrders() {
		return saleOrders;
	}

	public void setSaleOrders(Set<SaleOrder> saleOrders) {
		this.saleOrders = saleOrders;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Set<Role> roles = this.getRoles();
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
		for (Role role : roles) {
			authorities.add(new SimpleGrantedAuthority(role.getName()));
		}
		return authorities;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
