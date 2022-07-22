<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="product-page">
	<div class="row">
		<div class="col-4">

			<div class="col-4 left-menu">
				<div style="border: none;">
					<h3>Danh mục:</h3>
				</div>
				<c:forEach items="${categories }" var="cte">
					<div class="${cte.id }" onclick="cateid(${cte.id })">
						<span>${cte.name }</span>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="col-sm-12 col-md-8 justify-content-center">
			<c:forEach items="${product.data }" var="pr">
				<div class="col-lg-4 col-sm-6 float-left">
						<div class="product">
							<div class="item-img">
								<div class="img"
									style="background: url(${base }/dulieu/${pr.avatar }) no-repeat center ; background-size: cover;">

								</div>
							</div>
							<div class="product-body d-block text-center">
								<div class="title">
									<a href="/sanpham/${pr.seo }"><h3 style="color: inherit;">${pr.title }</h3></a>
								</div>
								<div class="price-cart d-flex">
									<div class="price col-sm-8 col-12">
										<p>
											<fmt:setLocale value="vi_VN" scope="session" />
											<fmt:formatNumber value="${pr.price }" type="currency" />
										</p>
									</div>
									<div class="cart col-4">
										<div class="cart-item" onclick="javascript:AddToCart('${base }', ${pr.id}, 1)">
											<i class="fa fa-cart-plus" aria-hidden="true" ></i>
										</div>
									</div>
								</div>
							</div>
						</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-sm-12 col-md-8 d-flex justify-content-center">
			<div id="paging"></div>
		</div>
	</div>
</div>
<form action="${base }/sanpham">
	<input type="hidden" name="keyword" id="keyword"
		value="${searchModel.keyword }" /> <input type="hidden"
		name="categoryId" id="categoryId" value="${searchModel.categoryId }" />
	<input type="hidden" name="sapxep" id="sapxep"
		value="${searchModel.sapxep }" /> <input type="hidden" name="page"
		id="page" value="${searchModel.page}" />
	<button style="display: none;" type="submit" id="btnSearch"></button>
</form>



