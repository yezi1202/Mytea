<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="container mt-4">
	<div class="row d-flex justify-content-center mt-4">
		<div class="col-6 mt-4"
			style="border: 1px dashed #ccc; box-shadow: 0 0 1rem #ccc; padding: 2rem 1rem;">
			<sf:form class="form" id="form2" method="POST"
				action="${base }/dangky" modelAttribute="user"
				enctype="multipart/form-data">
				<h3 class="text-center orange-color">Đăng Ký</h3>
				<script type="text/javascript">
				/* alert(${tb}) */
				</script>
				<c:if test="${tb.length() > 0 }">
					<div class="alert alert-danger" role="alert">${tb}</div>
				</c:if>

				<div class="form-group d-md-flex">
					<div class="col-md-6 col-sm-12">
						<label for="username" class="orange-color">Tên tài khoản:</label><br>
						<sf:input type="text" path="username" id="username"
							class="form-control" />
						<small class="orange-color">*Không được để trống!</small>
					</div>
					<div class="col-md-6 col-sm-12">
						<label for="username" class="orange-color">Email:</label><br>
						<sf:input type="email" path="email" id="username"
							class="form-control" />
						<small class="orange-color">*Không được để trống!</small>
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="orange-color">Mật khẩu:</label><br>
					<div class="d-flex">
						<input type="password" name="Password" id="password"
							class="form-control">&nbsp <span
							style="line-height: 2.5rem"><i
							class="fa fa-eye orange-color eye_item" aria-hidden="true"></i></span>

					</div>
					<small class="orange-color">*Không được để trống!</small>
				</div>
				<div class="form-group">
					<label for="password" class="orange-color">Xác nhận mật
						khẩu:</label><br>
					<div class="d-flex">
						<input type="password" id="passwordx" class="form-control">&nbsp
						<span style="line-height: 2.5rem"><i
							class="fa fa-eye orange-color eye_item" aria-hidden="true"></i></span>
					</div>
					<p id="error_password" style="color: red"></p>
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
				<div class="form-group d-flex justify-content-center">
					<div class="text-center">
						<label class="orange-color" onclick="avtup()">Ảnh đại
							diện:</label><br>
						<div onclick="avtup()" id="showavt"
							style="border: 1px dashed #ccc;width: 10rem;height: 10rem;border-radius: 10rem;background: url('${base}/dulieu/img/av.png')no-repeat center ; background-size: cover;">
						</div>
					</div>
					<input type="file" name="avatar" id="avatarup"
						style="display: none;">
				</div>
				<div class="form-group d-flex justify-content-center mt-4 pt-4">
					<input type="submit" name="submit" class="btn orange-btn btn-md"
						value="Tạo tài khoản">
				</div>

			</sf:form>

		</div>
	</div>
</div>

