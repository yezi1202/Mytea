<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>



<div class="container">
	<form action="${base }/admin/donhang" method="get">
		<div class="row my-3">
			<input type="hidden" id="page" name="page" class="form-control">
			<div class="ml-4 d-flex">
				<select name="ordered" id="ordered">
					<option value="0">Tất cả</option>
					<option value="1">Đã hoàn thành</option>
					<option value="2">Chưa hoàn thành</option>
				</select> <input name="keyword" value="${searchModel.keyword }" type="text"
					placeholder="Nhập mã đơn hàng..">
				<button type="submit" id="btnSearch" class="btn btn-secondary">Tìm
					kiếm</button>
			</div>
		</div>
		<div class="row">
			<table class="table table-bordered text-center">
				<thead class="thead-dark">
					<tr>
						<th>STT</th>
						<th>Mã đơn hàng</th>
						<th>Người đặt</th>
						<th>Tổng giá</th>
						<th>Ngày đặt</th>
						<th>Trạng thái</th>
						<th>Thao tác</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${saleO.data}" var="sl" varStatus="loop">
						<tr>
							<th scope="row">${loop.index + 1}</th>
							<td>${sl.code }</td>
							<td>${sl.user.username}</td>
							<td>${sl.totalfomat()}</td>
							<td>${sl.datefomat() }</td>
							<td class="text-secondary">${saleoservice.ordered(sl.id) }</td>
							<td class="align-items-center">
								<div class="d-flex">
									<a href="${base }/admin/chitietdonhang/${sl.id}"
										class="btn btn-warning btn-circle btn-sm mx-2"> <i
										class="fas fa-eye"></i>
									</a> <a href="${base }/admin/xoa/donhang/${sl.id}"
										onclick="return confirm('Bạn muốn xóa đơn hàng ${sl.code } ?')"
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
		<div class="row d-flex justify-content-center">
			<div id="paging"></div>
		</div>
	</form>
</div>

