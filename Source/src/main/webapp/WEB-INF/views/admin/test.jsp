<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="admin/products/createproduct.htm" method="post"
		modelAttribute="addProdBean" enctype="multipart/form-data" class="row">
		<form:input type="hidden" path="productId" class="col-md-12" />
		<div class="col-md-12 mt-2">
			<label for="inputNameProduct" class="form-label mb-2 fw-bold">Product
				Name</label>
			<form:input path="productName" class="form-control"
				id="inputNameProduct" />
		</div>
		
		<div
			class="col-12 mt-2 d-flex align-items-center justify-content-center">
			<button type="submit" class="btn btn-custom">Submit</button>
		</div>
	</form:form>
</body>
</html>