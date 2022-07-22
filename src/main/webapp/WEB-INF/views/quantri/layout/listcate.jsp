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
			<a role="button" class="btn btn-outline-danger them ml-auto mr-3"
				href="${base }/admin/them/danhmuc"><i class="fa fa-plus-square"
				aria-hidden="true"></i> Thêm danh mục</a>
		</div> 
			<div class="row">
				<table class="table table-bordered text-center" cellspacing="0" role="grid">
					<thead class="thead-dark">
						<tr>
							<th>STT</th>
							<th>Danh mục</th>
							<th>Mô tả</th>
							<th>Trạng thái</th>
							<th>Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${categories}" var="ct" varStatus="loop">
							<tr>
								<th scope="row">${loop.index + 1}</th>
								<td>${ct.name }</td>
								<td>${ct.description }</td>
								<td><span id="_cate_status_${ct.id}"> <c:choose>
											<c:when test="${ct.status }">
												<input onchange="trangthai(${ct.id})" id="${ct.id}" type="checkbox" checked="checked" readonly="readonly">
											</c:when>
											<c:otherwise>
												<input onchange="trangthai(${ct.id})" id="${ct.id}" type="checkbox" readonly="readonly">
											</c:otherwise>
										</c:choose>
								</span></td>
								<td class="d-flex"><a
									href="${base }/admin/sua/danhmuc/${ct.id}"
									class="btn btn-warning btn-circle btn-sm mx-2"> <i
										class="fas fa-edit"></i>
								</a> <a href="${base }/admin/xoa/danhmuc/${ct.id}"
									onclick="return confirm('Bạn muốn xóa ${ct.name } ?')"
									class="btn btn-danger btn-circle btn-sm"> <i
										class="fas fa-trash"></i>
								</a></td>
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

