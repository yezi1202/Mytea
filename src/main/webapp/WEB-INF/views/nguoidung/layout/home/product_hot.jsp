<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<style>
	.product{
		float: left;
		margin:1rem 2rem;
	}
</style>
<div class="contain">
<div class="row" style="justify-content: center;"><h2>Sản phẩm nổi bật</h2></div>
	<div class="row">
		<c:forEach items="${sphot }" var="pr">
			<div class="product my-4">
				<div class="item-img">
					<div class="img"
						style="background: url(${base }/dulieu/${pr.avatar }) no-repeat center ; background-size: cover;">

					</div>
				</div>
				<div class="product-body d-block text-center">
					<a href="${base }/sanpham/${pr.seo}">
						<div class="title" style="width:100%;color: inherit;display: inline;text-overflow: ellipsis;">
							<h3 style="width:100%;color: inherit;display: inline;text-overflow: ellipsis;" title="${pr.title }">${pr.title }</h3>
						</div>
					</a>
					<div class="price-cart d-flex">
						<div class="price col-sm-8 col-12">
							<p>
								<fmt:setLocale value="vi_VN" scope="session" />
								<fmt:formatNumber value="${pr.price }" type="currency" />
							</p>
						</div>
						<div class="cart col-4">
							<div class="cart-item"
								onclick="javascript:AddToCart('${base }', ${pr.id}, 1)">
								<i class="fa fa-cart-plus" aria-hidden="true"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
