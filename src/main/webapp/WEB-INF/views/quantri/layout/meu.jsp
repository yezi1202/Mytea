<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>



<div class="sidebar">
	<div class="logo">Quản Trị</div>
	<div class="menu_sidebar">
		<ul>
			<li><a href="#">Trang quản lý</a></li>
			<li><a href="${base }/admin/danhmuc">Quản lý danh mục</a></li>
			<li><a href="${base }/admin/sanpham">Quản lý sản phẩm</a></li>
			<li><a href="${base }/admin/taikhoan">Quản lý tài khoản</a></li>
			<li><a href="${base }/admin/donhang">Quản lý đơn hàng</a></li>
		</ul>
	</div>
</div>