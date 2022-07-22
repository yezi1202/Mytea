<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>



<div class="container">
	<form action="${base }/admin/sanpham" method="get">
		<div class="row my-3">
			<input type="hidden" id="page" name="page" class="form-control">
			Loại: &nbsp <select name="categoryId" id="categoryId">
				<option value="0">All</option>
				<c:forEach items="${categories}" var="category">
					<option value="${category.id }">${category.name }</option>
				</c:forEach>
			</select>
			<div class="ml-4 d-flex">
				<input name="keyword" value="${searchModel.keyword }" type="text"
					placeholder="Nhập sản phẩm cần tìm..">
				<button type="submit" id="btnSearch" class="btn btn-secondary">Tìm
					kiếm</button>
			</div>
			<a role="button" class="btn btn-outline-danger them ml-auto mr-3"
				href="${base }/admin/them/sanpham"><i class="fa fa-plus-square"
				aria-hidden="true"></i> Thêm sản phẩm</a>
		</div>
		<!-- <div class="row mb-3">
			<select name="solht" id="solht">
				<option value="0">số lượng hiển thị</option>
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="50">50</option>
			</select>
			<button type="submit" id="sbh" class="btn btn-secondary">Hiển
				thị</button>
		</div> -->
		<div class="row">
			<table class="table table-bordered text-center">
				<thead class="thead-dark">
					<tr>
						<th>STT</th>
						<th>Hình ảnh</th>
						<th>Tên sản phẩm</th>
						<th>Đơn giá</th>
						<th>Loại</th>
						<th>Trạng thái</th>
						<th>Thao tác</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${product.data}" var="pr" varStatus="loop">
						<tr>
							<th scope="row">${loop.index + 1}</th>
							<td><div style="width: 3rem;height: 3rem;border-radius: 0.5rem;background: url('${base }/dulieu/${pr.avatar}')no-repeat center ; background-size: cover;"></div></td>
							<td>${pr.title }</td>
							<td><fmt:setLocale value="vi_VN" scope="session" /> <fmt:formatNumber
									value="${pr.price }" type="currency" /></td>
							<td>${pr.categories.name }</td>
							<td><span id="_product_status_${pr.id}"> <c:choose>
										<c:when test="${pr.status }">
											<input onchange="trangthai(${pr.id})" id="${pr.id}" type="checkbox" checked="checked" readonly="readonly">
										</c:when>
										<c:otherwise>
											<input onchange="trangthai(${pr.id})" id="${pr.id}" type="checkbox" readonly="readonly">
										</c:otherwise>
									</c:choose>
							</span></td>
							<td class="align-items-center">
								<div class="d-flex">
									<a href="${base }/admin/sua/sanpham/${pr.id}"
										class="btn btn-warning btn-circle btn-sm mx-2"> <i
										class="fas fa-edit"></i>
									</a> <a href="${base }/admin/xoa/sanpham/${pr.id}"
										onclick="return confirm('Bạn muốn xóa ${pr.title } ?')"
										class="btn btn-danger btn-circle btn-sm"> <i
										class="fas fa-trash"></i>
									</a>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${thongbao != null}">
				<div style="font-weight: bold; font-style: italic;">${thongbao }</div>
			</c:if>
		</div>
		<div class="row d-flex justify-content-center">
			<div id="paging"></div>
		</div>
	</form>
</div>

