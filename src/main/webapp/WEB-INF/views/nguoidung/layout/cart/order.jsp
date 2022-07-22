<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	<div class="row d-flex justify-content-center">
		<c:forEach items="${saleOL }" var="so">
			<div class="col-7 float-left"
				style="border: 1px dashed #ccc; padding: 2rem 1rem">
				<div style="padding-bottom: 2rem; text-align: center;">
					<h3>Thông tin đơn hàng</h3>
				</div>
				<div class="col-8" style="padding-bottom: 2rem;">
					<table class="table" border="0">
						<tr>
							<td style="border: none">Mã giao dịch:</td>
							<td style="border: none; color: #ccc;">${so.order.code }</td>
						</tr>
						<tr>
							<td style="border: none">Người nhận:</td>
							<td style="border: none; color: #ccc;">${so.order.customerName }</td>
						</tr>
						<tr>
							<td style="border: none">Số điện thoại:</td>
							<td style="border: none; color: #ccc;">${so.order.customerPhone }</td>
						</tr>
						<tr>
							<td style="border: none">Địa chỉ nhận hàng:</td>
							<td style="border: none; color: #ccc;">${so.order.customerAddress }</td>
						</tr>
						<tr>
							<td style="border: none">Ngày đặt:</td>
							<td style="border: none; color: #ccc;">${so.order.datefomat() }</td>
						</tr>
					</table>
				</div>
				<div>
					<table class="table">
						<tr style="font-weight: bold;">
							<td>Sản phẩm</td>
							<td class=" text-center">số lượng</td>
							<td class=" text-center">Đơn giá</td>
							<td class=" text-center">Trạng thái</td>
							<td class=" text-center">Thành tiền</td>
						</tr>
						<c:forEach items="${so.products }" var="pr">
							<tr>
								<td class="">
									<div
										style="width: 3rem;height: 3rem;border-radius: 0.5rem;background: url('${base}/dulieu/${pr.product.avatar }')no-repeat center ; background-size: cover;">

									</div> <span>${pr.product.title }</span>
								</td>
								<td class=" text-center">(${pr.quality })</td>
								<td class=" text-center">x <fmt:setLocale value="vi_VN"
										scope="session" /> <fmt:formatNumber
										value="${pr.product.price }" type="currency" />
								</td>
								<td id="${pr.id }"><c:choose>
										<c:when test="${pr.status }">
											<button title="Chọn để xác nhận đã nhận được hàng"
												type="button" class="btn btn-danger"
												onclick="xacnhan(${pr.id })">Đã nhận</button>
										</c:when>
										<c:otherwise>
											<button class="btn btn-light" disabled>Đã giao</button>
										</c:otherwise>
									</c:choose></td>
								<td class=" text-center">= <fmt:setLocale value="vi_VN"
										scope="session" /> <fmt:formatNumber
										value="${pr.quality * pr.product.price }" type="currency" />
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="4" style="font-weight: bold;">Chiết khấu:</td>
							<td>0%</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="4" style="font-weight: bold;">Tổng tiền:</td>
							<td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
									value="${so.order.total }" type="currency" /></td>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
		</c:forEach>

	</div>
</div>