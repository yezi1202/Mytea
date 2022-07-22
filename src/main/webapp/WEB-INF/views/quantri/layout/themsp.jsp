<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
 
<div class="container">
	<sf:form action="${base }/admin/sanpham" method="post"
		modelAttribute="product" enctype="multipart/form-data"
		class="form-control">
		<h3 class="text-center">Thêm sửa sản phẩm</h3>
		<div class="row d-flex justify-content-center">
			<div class="col-4">
				<sf:hidden path="id" />
				<div>
					<span>Nhập tên sản phẩm:</span>
					<sf:input name="title" type="text" path="title"
						class="form-control" />
				</div>
				<div>
					<span>Mô tả:</span>
					<sf:input name="shortDes" type="text" path="shortDes"
						class="form-control" />
				</div>
				<div>
					<span>Loại:</span>
					<sf:select path="categories.id" class="form-control" id="category">
						<option value="0">Khác</option>
						<sf:options items="${categories }" itemValue="id" itemLabel="name" />
					</sf:select>
				</div>
				<div>
					<span>Đơn giá: (VND)</span>
					<sf:input name="shortDes" type="number" path="price"
						class="form-control" />
				</div>
				<div>
					<span class="mt-4">Chi tiết sản phẩm:</span>

				</div>
			</div>
			<div class="col-4">
				<div class="my-4 text-center">
					<sf:checkbox path="isHot" />Sản phẩm nổi bật 
				</div>
				<div class="my-4 text-center">
				
					<c:choose>
						<c:when test="${product.avatar != null}">
							<img onclick="upavt()" title="chọn vào ảnh để thay đổi"
								style="cursor: pointer;" id="vta"
								src="${base }/dulieu/${product.avatar}" alt="your image"
								width="50%" ;height="50%" class="rounded" />
						</c:when>
						<c:otherwise>
							<img onclick="upavt()" title="chọn vào ảnh để thay đổi"
								style="cursor: pointer;" class="border rounded" id="vta"
								src="${base }/dulieu/img/noimg.png" alt="your image" width="50%"
								;height="50%" class="rounded" />
						</c:otherwise>
					</c:choose>
					<br> <span>Ảnh minh họa</span><br> <small>*Ấn vào
						ảnh để thay đổi*</small> <br> <input style="display: none;"
						id="ptavatar" name="ptavatar" placeholder="avatar" type="file" />
				</div>

			</div>
		</div>
		<div class="row d-flex justify-content-center my-4">
			<sf:textarea autocomplete="off" class="summernote col-8"
				path="details" id="details" name="details" rows="3" />
		</div>
		<div class="row d-flex justify-content-center my-4">
			<button class="btn btn-success mr-2" name="submit" type="submit">
				<i class="fa fa-floppy-o" aria-hidden="true"></i> Lưu
			</button>
			<button class="btn btn-primary " name="submit" type="submit">
				<i class="fa fa-plus" aria-hidden="true"></i> Thêm mới
			</button>
		</div>
	</sf:form>
</div>