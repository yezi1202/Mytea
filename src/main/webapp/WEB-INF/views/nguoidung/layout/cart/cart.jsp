<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="product-cart">
	<div class="row d-flex">
		<div class="col-sm-12 col-md-8 pl-md-4 d-block">
			<c:choose>
				<c:when test="${totalItems > 0}">
					<table class="table">
						<thead>
							<tr>
								<th>Sản phẩm</th>
								<th>Đơn giá</th>
								<th>Số lượng</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cart.cartItems }" var="ci">
								<tr>
									<td><img src="${base }/dulieu/${ci.avatadb }" alt=""
										width="70px" height="70px" style="border-radius: 1rem">
										<span>${ci.productName }</span></td>
									<td class="price" id="price"><fmt:setLocale value="vi_VN"
											scope="session" /> <fmt:formatNumber
											value="${ci.priceUnit }" type="currency" /></td>
									<td><input id="quantity_${ci.productId}" type="number"
										style="width: 100px" class="form-control"
										onchange="UpdateCart('${base }', ${ci.productId},this.value)"
										value="${ci.quanlity }" min="1"></td>
									<td><a href="/cart/delect/${ci.productId}" id="xoa"
										class="btn text-dark"> <i class="fa fa-trash"></i>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<div class="text-center" style="padding: 3rem 0">
						<h3>
							Giỏ hàng trống quay lại <span><a href="/"> trang chủ</a></span>
							để mua hàng.
						</h3>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="col-sm-12 col-md-4 justify-content-center"
			style="padding: 1rem 2.5rem;">
			<c:if test="${totalItems >0 }">
				<div style="border: 0.1rem dashed #ccc;">
					<form action="/donhang" method="post">
						<div class="text-center orange-color">
							<h3>Thanh toán</h3>
						</div>

						<table class="table">
							<tr>
								<td>Tổng tiền:</td>
								<td class="totalprice"><fmt:setLocale value="vi_VN"
										scope="session" /> <fmt:formatNumber
										value="${cart.totalPrice }" type="currency" /></td>
							</tr>
							<tr>
								<td>Phí vận chuyển:</td>
								<td>Miễn phí</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">Tổng thanh toán:</td>
								<td class="totalprice" style="color: red; font-weight: bold;"><fmt:setLocale
										value="vi_VN" scope="session" /> <fmt:formatNumber
										value="${cart.totalPrice }" type="currency" /></td>
							</tr>
							<tr>
								<th colspan="2">Thông tin nhận hàng:</th>
							</tr>
							<tr></tr>
							<tr>
								<td>Tên người nhận:</td>
								<td><input class="form-control" name="customerFullName"
									value="${userLogined.name }"></td>
							</tr>
							<tr>
								<td>Số điện thoại:</td>
								<td><input class="form-control" name="customerPhone"
									value="${userLogined.phone}"></td>
							</tr>
							<tr>
								<td>Địa chỉ nhận hàng:</td>
								<td><input class="form-control" name="customerAddress"
									value="${userLogined.address }" /></td>
							</tr>
							<tr>
								<td>Ghi chú:</td>
								<td><textarea class="form-control" name="coment" rows="3"></textarea></td>
							</tr>
						</table>
						<input type="hidden" name="total" value="${cart.totalPrice }"
							id="totalprice">
						<div class="text-center orange-color" style="padding: 1.5rem 0;">

							<c:choose>
								<c:when test="${isLogined }">
									<button class=" btn orange-btn" type="submit">Thanh
										toán</button>
								</c:when>
								<c:otherwise>
									<input value="Thanh toán" class=" btn orange-btn"
										type="button" onclick="alert('Đăng nhập để thanh toán')">
								</c:otherwise>
							</c:choose>

						</div>

					</form>
				</div>
			</c:if>
		</div>


	</div>
</div>




