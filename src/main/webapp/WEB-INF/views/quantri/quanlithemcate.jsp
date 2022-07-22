<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/quantri/layout/css.jsp"></jsp:include>

</head>
<body>

	<div class="container d-flex justify-content-center text-center">
		<sf:form action="${base }/admin/danhmuc" method="post"
			modelAttribute="category" class="form-control col-5">
			<div class="row">
				<div class="col">
					<h3>Thêm cập nhật danh mục sản phẩm</h3>
					<h4>
						<br>
					</h4>
					<sf:hidden path="id" />
					<sf:input class="form-control" path="name" id="name" name="name"
						placeholder="Tên danh mục" type="text" />
					<sf:textarea class="form-control" path="description"
						placeholder="Mô tả" id="description" name="description" rows="3" />
					<div class=" d-flex justify-content-center my-4">

						<!-- <div class="col-sm-12 col-md-6 mt-4">-->
						<button class="btn btn-success mr-2" name="submit" type="submit">
							<i class="fa fa-floppy-o" aria-hidden="true"></i> Lưu
						</button>
						<button class="btn btn-primary " name="submit" type="submit">
							<i class="fa fa-plus" aria-hidden="true"></i> Thêm mới
						</button>

					</div>
				</div>
			</div>
		</sf:form>
	</div>

</body>
</html>