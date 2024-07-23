<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="hero__search__form">
	<form action="${pageContext.servletContext.contextPath }/product/search.htm" method="get">
		<input type="text" placeholder="Bạn cần tìm gì?" aria-label="Search" name="search" required id="search">
		<button type="submit" class="site-btn">Tìm kiếm</button>
	</form>
</div>	