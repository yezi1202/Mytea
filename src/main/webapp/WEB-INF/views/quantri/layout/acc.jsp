<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>



<div class="account_manage">
	<button class="btn_account">
	<div style="width: 2rem;height: 2rem;border-radius: 1rem;background: url(${base }/dulieu/${userLogined.avata}) no-repeat center ; background-size: cover;">
	
	</div>
		<%-- <img src="${base }/dulieu/${userLogined.avata}"
			class="rounded-circle " style="width: 2rem; height: 2rem"> --%>
		${userLogined.name} <i class="fas fa-angle-down"></i>
		<div class="sub_menu" id="submenu_account">
			<ul>
				<li><a href="${base }/admin/sua/taikhoan/${userLogined.id}">Profile
						<i class="fas fa-user"></i>
				</a></li>
				<li><a href="/logout">Logout <i class="fas fa-sign-out-alt"></i>
				</a></li>
			</ul>
		</div>
	</button>
</div>