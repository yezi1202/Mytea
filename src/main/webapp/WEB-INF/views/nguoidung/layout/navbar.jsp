<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="nav">
	<div class="logo">
		<span> My<span class="orange-color">Tea</span>
		</span>
	</div>
	<div class="menu">
		<a href="/">Trang chủ</a> <a href="/sanpham">Sản phẩm</a> <a
			href="/lienhe">Liên hệ</a>
	</div>
	<form action="${base }/sanpham"
		class="search d-flex align-items-center mr-4">
		<input class="form-control" id="keyw" name="keyword"
			value="${searchModel.keyword }" placeholder="nhập từ khóa..">
		<button class="btn" type="button" onclick="search(keyw.value)">
			<i class="fa fa-search" aria-hidden="true"></i>
		</button>
	</form>
	<div class="acc-cart d-flex">
		<div class="cart">
			<span class="quantity" id="checkcart_items"> <c:choose>
					<c:when test="${totalItems > 0}">${totalItems }</c:when>
					<c:otherwise>0</c:otherwise>
				</c:choose>
			</span> <a href="/cart"> <i class="fa fa-shopping-cart"
				aria-hidden="true"></i></a>
		</div>
		<c:choose>
			<c:when test="${isLogined }">
				<div class="acc"
					style="margin-left: 1.5rem ;width: 2rem;height: 2rem;border-radius: 1rem;background: url('${base }/dulieu/${userLogined.avata}')no-repeat center ; background-size: cover;">
					<div class="meu-acc" style="margin-top: 2.1rem;">
						<ul>
							<li><a href="taikhoan">Tài khoản</a></li>
							<li><a href="/donhang">Đơn hàng</a></li>
							<li><a href="/logout">Đăng xuất <i class="fa fa-sign-out" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="acc" style="margin-left: 1.5rem;"><span>Tài khoản</span>
					<div class="meu-acc">
						<ul>
						<li><a href="/dangky">Đăng ký</a></li>
						<li><a href="/dangnhap">Đăng nhập</a></li>
						</ul>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
</div>
<!-- smail screen nav -->
<div class="nav-bottom">
	<div class="home">
		<a href="/"><i class="fa fa-home" aria-hidden="true"></i></a>
	</div>
	<div class="nav-bottom-product">
		<a href="/sanpham"><i class="fa fa-mobile" aria-hidden="true"></i></a>
	</div>
	<div class="cart">
		<a href="/cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
	</div>
	<div class="acc">
		<a href="/"><i class="fa fa-user-o" aria-hidden="true"></i></a>
	</div>
</div>