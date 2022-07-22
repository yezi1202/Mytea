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

	<div class="container mt-4">
		<div class="row d-flex justify-content-center mt-4">
			<div class="col-6 mt-4"
				style="border: 1px dashed #ccc; box-shadow: 0 0 1rem #ccc; padding: 2rem 1rem;">
				<sf:form class="form" id="form2" method="POST"
					action="${base }/admin/taikhoan" modelAttribute="user"
					enctype="multipart/form-data">
					<h3 class="text-center orange-color">Thiết lập tài khoản</h3>
					<c:if test="${not empty tb}">
						<div class="alert alert-danger" role="alert">${tb}</div>
					</c:if>
					<div class="form-group d-flex justify-content-center">
						<div class="text-center">
							<label class="orange-color" onclick="avtup()">Ảnh đại
								diện:</label><br>
							<c:choose>
								<c:when test="${user.anh.length() > 0 && user.anh != null}">
									<div onclick="avtup()" id="showavt"
										style="border: 1px dashed #ccc;width: 10rem;height: 10rem;border-radius: 10rem;background: url('${base}/dulieu/${user.anh }')no-repeat center ; background-size: cover;">
									</div>
								</c:when>
								<c:otherwise>
									<div onclick="avtup()" id="showavt"
										style="border: 1px dashed #ccc;width: 10rem;height: 10rem;border-radius: 10rem;background: url('${base}/dulieu/img/av.png')no-repeat center ; background-size: cover;">
									</div>
								</c:otherwise>
							</c:choose>

						</div>
						<input type="file" name="avatar" id="avatarup"
							style="display: none;">
					</div>
					<sf:hidden path="id" />
					<div class="form-group d-md-flex">
						<div class="col-md-6 col-sm-12">
							<label for="username" class="orange-color">Tên tài khoản:</label><br>
							<div class="d-flex">
								<sf:input type="text" path="username" id="username"
									class="form-control" />
								<button type="button" title="Chỉnh sửa"
									style="border: none; background: none; outline: none;">
									<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								</button>
							</div>
							<small class="orange-color">*Không được để trống!</small>
						</div>
						<div class="col-md-6 col-sm-12">
							<label for="username" class="orange-color">Email:</label><br>
							<div class="d-flex">
								<sf:input type="email" path="email" id="email" name="email"
									class="form-control" />
								<button type="button" title="Chỉnh sửa"
									style="border: none; background: none; outline: none;">
									<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								</button>
							</div>
							<small class="orange-color">*Không được để trống!</small>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="orange-color">Mật khẩu:</label><br>
						<div class="d-flex">
							<input type="password" name="password" id="password"
								class="form-control" />
							<button type="button" title="Chỉnh sửa"
								style="border: none; background: none; outline: none;">
								<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
							</button>

						</div>
						<small class="orange-color">*Không được để trống!</small>
					</div>
					<div class="form-group d-flex">
						<div class="col-md-6 col-sm-12">
							<label class="orange-color">Họ và tên:</label><br>
							<sf:input type="text" path="name" class="form-control" />
						</div>
						<div class="col-md-6 col-sm-12">
							<label class="orange-color">Số điện thoại:</label><br>
							<sf:input type="number" class="form-control" path="phone" />
						</div>
					</div>
					<div class="form-group">
						<label class="orange-color">Địa chỉ:</label><br>
						<sf:input type="text" class="form-control" path="address" />

						<p id="error_password" style="color: red"></p>
					</div>
					<c:if test="${user.id != userLogined.id}">
						<div class="form-group">
							<label class="orange-color">Phân quyền:</label><br>
							<sf:select path="roleid" class="form-control col-md-6 col-sm-12">
								<sf:option items="${listrole }" itemLabel="name" itemValue="id"></sf:option>
							</sf:select>
							<p id="error_password" style="color: red"></p>
						</div>


					</c:if>
					<div class="form-group d-flex justify-content-center mt-4 pt-4">
						<input type="submit" name="submit" class="btn orange-btn btn-md"
							value="Tạo tài khoản">
					</div>

				</sf:form>

			</div>
		</div>
	</div>

</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#showavt').css("background",
						"url(" + e.target.result + ")no-repeat center").css(
						"background-size", "cover");
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$("#avatarup").change(function() {
		readURL(this);
	});
	function avtup() {
		$('#avatarup').trigger("click")
	}
	var m = true
	$('.eye_item').click(function() {
		if (m) {
			$(this).parent().parent().children().attr('type', 'text');
			$(this).addClass("fa-eye-slash").removeClass("fa-eye");
			m = false;
		} else {
			$(this).parent().parent().children().attr('type', 'password');
			$(this).addClass("fa-eye").removeClass("fa-eye-slash");
			m = true
		}

	});
</script>

</html>
