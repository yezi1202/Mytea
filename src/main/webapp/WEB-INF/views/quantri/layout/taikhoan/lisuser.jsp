<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>



<div class="container">
	<form action="${base }/admin/taikhoan" method="get">
		<div class="row my-3">
			<input type="hidden" id="page" name="page" class="form-control">
			Loại: &nbsp <select name="rowId" id="rowId">
				<option value="0">All</option>
				<c:forEach items="${listrole}" var="r">
					<option value="${r.id }">${r.name }</option>
				</c:forEach>
			</select>
			<div class="ml-4 d-flex">
				<input name="keyword" value="${searchModel.keyword }" type="text"
					placeholder="Nhập tên cần tìm..">
				<button type="submit" id="btnSearch" class="btn btn-secondary">Tìm
					kiếm</button>
			</div>
			<a role="button" class="btn btn-outline-danger them ml-auto mr-3"
				href="${base }/admin/them/taikhoan"><i class="fa fa-plus-square"
				aria-hidden="true"></i> Thêm tài khoản</a>
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
						<th>Avatar</th>
						<th>Họ tên</th>
						<th>Tên Tài khoản</th>
						<th>Email</th>
						<th>Quyền</th>
						<th>Trạng thái</th>
						<th>Thao tác</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users.data}" var="u" varStatus="loop">
						<c:if test="${u.id != userLogined.id}">
							<tr>
								<th scope="row">${loop.index + 1}</th>
								<td>
									<div
										style="width: 3rem;height: 3rem;border-radius: 3rem;background: url('${base }/dulieu/${u.avata}')no-repeat center ; background-size: cover;"></div>
								</td>
								<td>${u.name }</td>
								<td>${u.username}</td>
								<td>${u.email }</td>
								<td><c:forEach items="${u.roles }" var="r">
										<p>${r.name }</p>
									</c:forEach></td>
								<td><span id="_user_status_${u.id}"> <c:choose>
											<c:when test="${u.status }">
												<input onchange="trangthai(${u.id})" id="${u.id}"
													type="checkbox" checked="checked" readonly="readonly">
											</c:when>
											<c:otherwise>
												<input onchange="trangthai(${u.id})" id="${u.id}"
													type="checkbox" readonly="readonly">
											</c:otherwise>
										</c:choose>
								</span></td>
								<td class="align-items-center">
									<div class="d-flex">
										<a href="${base }/admin/sua/taikhoan/${u.id}"
											class="btn btn-warning btn-circle btn-sm mx-2"> <i
											class="fas fa-edit"></i>
										</a> <a href="${base }/admin/xoa/taikhoan/${u.id}"
											onclick="return confirm('Bạn muốn xóa tài khoản ${u.username } ?')"
											class="btn btn-danger btn-circle btn-sm"> <i
											class="fas fa-trash"></i>
										</a>
									</div>
								</td>
							</tr>
						</c:if>
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

