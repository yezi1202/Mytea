<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="product-detail">
	<div class="row d-flex justify-content-center">
		<div class="col-md-6 col-sm-12 d-md-flex"
			style="box-shadow: 0 0 1rem #333;">
			<div class="col-md-6 col-sm-12">
				<div
					class="img-item d-flex justify-content-center align-items-center">
					<div class="img"
						style="background: url('${base}/dulieu/${product.avatar }')no-repeat center ; background-size: cover;;"></div>
				</div>
			</div>
			<div class=" det col-sm-12 col-md-6" style="padding-top: 2rem">
				<div class="title">
					<h3>${product.title }</h3>
				</div>
				<div class="total-show">
					<span
						style="color: red; font-weight: bold; text-decoration: overline;"><fmt:setLocale
							value="vi_VN" scope="session" /> <fmt:formatNumber
							value="${product.price }" type="currency" /></span>
				</div>
				<div style="word-wrap: break-word;">
					<span style="font-weight: bold;">Thông tin:</span><br>
					${product.details }
				</div>
				<div class="quantity">
					<input min="1" value="1" type="number" id="quantity"
						style="border: 0.1rem solid #3333; width: 5rem; outline: none;">
				</div>
				<div class="button d-flex">
					<div>
						<a class="btn" type="button"
							onclick="AddToCart('${base }', ${product.id},quantity.value )">Thêm
							vào giỏ hàng</a>
					</div>
					<div>
						<a href="/cart" class="btn" type="button"
							onclick="AddToCart('${base }', ${product.id},quantity.value )">Mua
							ngay</a>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>