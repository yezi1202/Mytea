<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>



<div class="container">
	<form action="${base }/admin/chitietdonhang" method="get">
		<div class="row">
			<table class="table table-bordered text-center">
				<thead class="thead-dark">
					<tr>
						<th>STT</th>
						<th>Sản phẩm</th>
						<th>Số lượng</th>
						<th>Đơn giá</th>
						<th>Trạng thái</th>
						<th>Tổng tiền</th>
						<th>Thao tác</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${soP}" var="pr" varStatus="loop">
						<tr>
							<th scope="row">${loop.index + 1}</th>
							<td class="d-flex align-items-center justify-content-start">
								<div
									style="width: 3rem;height: 3rem;border-radius: 0.5rem;background: url('${base}/dulieu/${pr.product.avatar }')no-repeat center ; background-size: cover;">

								</div> <span>${pr.product.title }</span>
							</td>
							<td class=" text-center">(${pr.quality })</td>
							<td>${pr.product.pricefomat() }</td>
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
							<td class=" text-center"><fmt:setLocale value="vi_VN"
									scope="session" /> <fmt:formatNumber
									value="${pr.quality * pr.product.price }" type="currency" /></td>
							<td class="align-items-center">
								<div>
									<a href="${base }/admin/xoa/donhang/${u.id}"
										onclick="return confirm('Bạn muốn xóa tài khoản ${u.username } ?')"
										class="btn btn-danger btn-circle btn-sm"> <i
										class="fas fa-trash"></i>
									</a>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
</div>

