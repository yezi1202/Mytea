<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="get_in_touch_contents">
					<h1>Liên hệ</h1>
					
					<sf:form id="contact" action="/lienhe" method="post"
								modelAttribute="cont">
								<h4>
									<br>
								</h4>
								<div class="col-md-6 mb-3">
								<c:if test="${not empty TB }">
				        	<div class="alert alert-primary" role="alert">
								${TB }
							</div>
			        	</c:if>
			        	<c:if test="${not empty ERROR }">
				        	<div class="alert alert-danger" role="alert">
								${ERROR }
							</div>
			        	</c:if>
			        	</div>
								<div class="col-md-6 mb-3">
									<sf:input path="name" class="form-control" id="name" name="name"
										placeholder="Your name" type="text" />
								</div>
								<div class="col-md-6 mb-3">
									<sf:input path="email" class="form-control" id="email" name="email"
										placeholder="Your Email Address" type="email" />
								</div>
								<div class="col-md-6 mb-3">
									<sf:textarea path="message" class="form-control" placeholder="message" id="message"
										name="message" rows="6" />
								</div>
								<div class="col-md-6 mb-3">
									<button class="form-control btn-danger text-white" name="submit" type="submit"
										data-submit="...Sending">Gửi</button>
								</div>
							</sf:form>
				</div>




