<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!DOCTYPE html>
<%@include file="/WEB-INF/views/layouts/user/common.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin người dùng</title>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<base href="${pageContext.servletContext.contextPath}/">

</head>

<!-- <style>
body {
	margin-top: 20px;
	color: #9b9ca1;
}

.bg-secondary-soft {
	background-color: rgba(208, 212, 217, 0.1) !important;
}

.rounded {
	border-radius: 5px !important;
}

.py-5 {
	padding-top: 3rem !important;
	padding-bottom: 3rem !important;
}

.px-4 {
	padding-right: 1.5rem !important;
	padding-left: 1.5rem !important;
}

.file-upload .square {
	height: 250px;
	width: 250px;
	margin: auto;
	vertical-align: middle;
	border: 1px solid #e5dfe4;
	background-color: #fff;
	border-radius: 5px;
}

.text-secondary {
	--bs-text-opacity: 1;
	color: rgba(208, 212, 217, 0.5) !important;
}

.btn-success-soft {
	color: #28a745;
	background-color: rgba(40, 167, 69, 0.1);
}

.btn-danger-soft {
	color: #dc3545;
	background-color: rgba(220, 53, 69, 0.1);
}

.form-control {
	display: block;
	width: 100%;
	padding: 0.5rem 1rem;
	font-size: 0.9375rem;
	font-weight: 400;
	line-height: 1.6;
	color: #29292e;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #e5dfe4;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 5px;
	-webkit-transition: border-color 0.15s ease-in-out, -webkit-box-shadow
		0.15s ease-in-out;
	transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s
		ease-in-out;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out,
		-webkit-box-shadow 0.15s ease-in-out;
}

.combobox {
	position: relative;
	width: 200px;
}

.combobox select {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
	appearance: none; /* Loại bỏ kiểu giao diện mặc định của trình duyệt */
	-webkit-appearance: none;
	/* Loại bỏ kiểu giao diện mặc định của trình duyệt Safari */
	-moz-appearance: none;
	/* Loại bỏ kiểu giao diện mặc định của trình duyệt Firefox */
	background-image:
		url('data:image/svg+xml;utf8,<svg fill="none" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M16.293 9.293l-4.293 4.293-4.293-4.293-1.414 1.414 5 5a1 1 0 0 0 1.414 0l5-5-1.414-1.414z" fill="#000"/></svg>');
	/* Thêm một biểu tượng mũi tên xuống */
	background-repeat: no-repeat;
	background-position: right 10px center;
}

/* Hover style cho combobox */
.combobox select:hover {
	border-color: #999;
}

/* Focus style cho combobox */
.combobox select:focus {
	outline: none;
	border-color: #333;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
}
</style> -->

<body>
	<script type="text/javascript">
		let provinceSelect, districtSelect, wardSelect;
		let wards, districts;

		function selectDistrictsByProvince(selectedProvinceId) {
			// Xóa tất cả các phần tử hiện có trong combobox huyện
			districtSelect.innerHTML = '';

			// Lọc danh sách các huyện dựa trên tỉnh được chọn
			var filteredDistricts = districts.filter(function(district) {
				return district.provinceId === selectedProvinceId;
			});

			// Tạo một option mặc định để yêu cầu người dùng chọn
			var defaultOption = document.createElement('option');
			districtSelect.appendChild(defaultOption);
			// Thêm các huyện đã lọc vào combobox
			filteredDistricts.forEach(function(district) {
				var option = document.createElement('option');
				option.value = district.id;
				option.text = district.name;
				districtSelect.appendChild(option);
			});
		}

		function selectWardsByDistrict(selectedDistrictId) {
			// Xóa tất cả các phần tử hiện có trong combobox xã
			wardSelect.innerHTML = '';

			// Lọc danh sách các xã dựa trên huyện được chọn
			var filteredWards = wards.filter(function(ward) {
				return ward.districtId === selectedDistrictId;
			});

			// Tạo một option mặc định để yêu cầu người dùng chọn
			var defaultOption = document.createElement('option');
			wardSelect.appendChild(defaultOption);
			// Thêm các xã đã lọc vào combobox
			filteredWards.forEach(function(ward) {
				var option = document.createElement('option');
				option.value = ward.id;
				option.text = ward.name;
				wardSelect.appendChild(option);

			});
		}

		function lazyLoading() {
			const dataDistrict = 'data-district';
			const dataProvince = 'data-province'

			provinceSelect = document.getElementById('provincescbb');
			districtSelect = document.getElementById('districtscbb');
			wardSelect = document.getElementById('wardscbb');

			districts = Array.from(districtSelect.options).map(
					function(option) {
						return {
							id : option.value,
							name : option.text,
							provinceId : option.dataset.province
						};
					});
			wards = Array.from(wardSelect.options).map(function(option) {
				return {
					id : option.value,
					name : option.text,
					districtId : option.dataset.district
				};
			});

		}

	</script>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Page title -->
				<div class="my-5">
					<h3>My Profile</h3>
					<hr>
				</div>
				<!-- Form START -->
				<table class="file-upload">
					<div class="row mb-4 gx-5">
					<%@include file="/WEB-INF/views/layouts/user/account-menu.jsp" %>
						<!-- <div class="col-lg-2 mb-4"
							style="font-size: 15px; margin-bottom: 20px;">
							<div class="col" style="min-height: 1.5rem"></div>
							<div class="col">
								<span><a href='ProfilePage.htm'> <svg fill="#000000"
											width="1em" height="1em" viewBox="0 0 256 256" id="Flat"
											xmlns="http://www.w3.org/2000/svg">
											<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
											<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
												stroke-linejoin="round"></g>
											<g id="SVGRepo_iconCarrier"> <path
												d="M231.94238,219.98975a8.00114,8.00114,0,0,1-6.93017,4.00293l-194.02295-.002a7.99981,7.99981,0,0,1-6.92432-12.00635,120.48813,120.48813,0,0,1,67.11865-54.14062,71.99995,71.99995,0,1,1,73.63294,0,120.48718,120.48718,0,0,1,67.12,54.14258A8.001,8.001,0,0,1,231.94238,219.98975Z"></path> </g></svg>
										Thông tin
								</a></span>
							</div>
							<hr>
							<div class="col">
								<span><a href="ordersHistory.htm"> <svg width="1em"
											height="1em" viewBox="0 0 1024 1024" class="icon"
											version="1.1" xmlns="http://www.w3.org/2000/svg"
											fill="#000000">
											<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
											<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
												stroke-linejoin="round"></g>
											<g id="SVGRepo_iconCarrier">
											<path
												d="M829.06 73.14h-6.48c-30.41 0-58.57 17.11-75.34 45.75-6.16 10.41-22.29 11.73-29.96 2.43-25.52-31.07-59.41-48.18-95.64-48.18-35.98 0-69.86 17.11-95.41 48.18-6.98 8.48-21.25 8.54-28.27-0.02-25.55-31.05-59.43-48.16-95.41-48.16s-69.86 17.11-95.41 48.18c-7.66 9.38-23.79 8.09-29.95-2.43-16.8-28.64-44.96-45.75-75.36-45.75h-7.23c-46.89 0-85.05 38.16-85.05 85.05V865.8c0 46.89 38.16 85.05 85.05 85.05h7.23c30.39 0 58.55-17.11 75.38-45.79 6.07-10.43 22.23-11.79 29.93-2.38 25.55 31.05 59.43 48.16 95.41 48.16s69.86-17.11 95.41-48.18c7.02-8.52 21.29-8.5 28.27 0.02 25.55 31.05 59.43 48.16 95.66 48.16 35.98 0 69.88-17.11 95.38-48.14 7.73-9.34 23.89-8 29.96 2.36 16.79 28.68 44.95 45.79 75.36 45.79h6.48c46.89 0 85.05-38.16 85.05-85.05V158.2c0-46.9-38.17-85.06-85.06-85.06z m11.91 792.66c0 6.57-5.34 11.91-11.91 11.91h-6.48c-6.14 0-10.91-7.34-12.23-9.61-16.36-27.91-46.61-45.25-78.93-45.25-27.43 0-53.16 12.16-70.64 33.39-6.59 8.02-20.41 21.46-39.14 21.46-18.48 0-32.32-13.46-38.91-21.46-34.84-42.45-106.39-42.46-141.27-0.02-6.59 8.02-20.43 21.48-38.91 21.48s-32.32-13.46-38.91-21.46c-17.43-21.23-43.18-33.39-70.62-33.39-32.36 0-62.61 17.36-78.93 45.25-1.32 2.25-6.11 9.61-12.25 9.61h-7.23c-6.57 0-11.91-5.34-11.91-11.91V158.2c0-6.57 5.34-11.91 11.91-11.91h7.23c6.14 0 10.93 7.36 12.23 9.57 16.34 27.93 46.59 45.29 78.95 45.29 27.45 0 53.2-12.16 70.62-33.38 6.59-8.02 20.43-21.48 38.91-21.48s32.32 13.46 38.91 21.46c34.88 42.48 106.43 42.43 141.27 0.02 6.59-8.02 20.43-21.48 39.16-21.48 18.48 0 32.3 13.45 38.91 21.5 17.46 21.2 43.2 33.36 70.62 33.36 32.32 0 62.57-17.34 78.95-45.29 1.3-2.23 6.07-9.57 12.21-9.57h6.48c6.57 0 11.91 5.34 11.91 11.91v707.6z"
												fill="#0F1F3C"></path>
											<path
												d="M255.83 365.46h512v73.14h-512zM255.74 548.2h365.71v73.38H255.74z"
												fill="#0F1F3C"></path></g></svg> Đơn mua
								</a></span>
							</div>
							<hr>
							<div class="col">
								<span><a href="jkdshk.com"> <svg fill="#000000"
											xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
											viewBox="0 0 100 100" xml:space="preserve" stroke="#000000">
											<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
											<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
												stroke-linejoin="round"></g>
											<g id="SVGRepo_iconCarrier"> <g> <g> <path
												d="M79.1,56.5c-0.1-0.4-0.1-0.9,0.2-1.2C81,52.2,82,48.7,82,45c0-11.6-9.9-21-22-21c-5.2,0-10,1.8-13.8,4.7 C58.7,31.4,68,42.2,68,55c0,3.6-0.7,7.1-2.1,10.2c2-0.5,3.9-1.3,5.7-2.4c0.4-0.2,0.8-0.3,1.2-0.1l6.4,2.3c1.1,0.4,2.2-0.7,1.9-1.9 L79.1,56.5z"></path> </g> <g> <path
												d="M40,34c-12.1,0-22,9.4-22,21c0,3.7,1,7.2,2.8,10.3c0.2,0.4,0.3,0.8,0.2,1.2l-2.1,6.7 c-0.4,1.2,0.7,2.3,1.9,1.9l6.4-2.3c0.4-0.1,0.9-0.1,1.2,0.1c3.4,2,7.3,3.1,11.6,3.1c12.1,0,22-9.4,22-21C62,43.4,52.1,34,40,34z M28,59c-2.2,0-4-1.8-4-4c0-2.2,1.8-4,4-4c2.2,0,4,1.8,4,4C32,57.2,30.2,59,28,59z M40,59c-2.2,0-4-1.8-4-4c0-2.2,1.8-4,4-4 c2.2,0,4,1.8,4,4C44,57.2,42.2,59,40,59z M52,59c-2.2,0-4-1.8-4-4c0-2.2,1.8-4,4-4c2.2,0,4,1.8,4,4C56,57.2,54.2,59,52,59z"></path> </g> </g> </g></svg></span><span>Feed
									back</a>
								</span>
							</div>
							<hr>
							<div class="col">
								<span><a href="changePassword.htm">
								<svg version="1.1" id="_x32_" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="1em" height="1em" viewBox="0 0 512 512" xml:space="preserve" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <style type="text/css">  .st0{fill:#000000;}  </style> <g> <path class="st0" d="M407.813,212.719h-9.5v-70.406c0.016-39.203-15.984-74.969-41.688-100.625C330.969,15.969,295.203-0.016,256,0 c-39.203-0.016-74.969,15.969-100.625,41.688c-25.703,25.656-41.703,61.422-41.672,100.625v70.406h-9.516 c-34.453,0-62.375,27.938-62.375,62.375v174.531c0,34.438,27.922,62.375,62.375,62.375h303.625 c34.453,0,62.375-27.938,62.375-62.375V275.094C470.188,240.656,442.266,212.719,407.813,212.719z M175.313,142.313 c0.016-22.391,8.984-42.375,23.625-57.063C213.641,70.594,233.625,61.625,256,61.625s42.359,8.969,57.047,23.625 c14.656,14.688,23.625,34.672,23.641,57.063v70.406H175.313V142.313z M274.031,381.672l9.828,63.703H256h-27.859l9.813-63.703 c-15.5-6.922-26.328-22.422-26.328-40.484c0-24.5,19.859-44.375,44.375-44.375c24.5,0,44.375,19.875,44.375,44.375 C300.375,359.25,289.531,374.75,274.031,381.672z"></path> </g> </g></svg>
								Đổi mật khẩu
								</a>
								</span>
							</div>
							<hr>
							                            
                            <div class="col"><span><a href="jkdshk.com">
                                <svg width="2em" height="2em" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M12 21C15.5 17.4 19 14.1764 19 10.2C19 6.22355 15.866 3 12 3C8.13401 3 5 6.22355 5 10.2C5 14.1764 8.5 17.4 12 21Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
                                Địa chỉ</a></span></div>
                               
                                
						</div> -->

						<!-- Profile detail -->
						<form:form action="UpdateProfileInfo.htm"
							modelAttribute="profileInfo" method="post">
							<div class="col-lg-6 mb-5 mb-xxl-0">
								<div class="bg-secondary-soft px-4 py-5 rounded">
									<div class="row g-3">
										<h4 class="mb-5 mt-0">Profile detail</h4>
										<div class="col-sm-12" style="visibility: hidden"></div>
										<div class="col-sm-6">
											<label class="form-label">First Name</label>
											<form:input path="FirstName" class="form-control"
												autocomplete="off" />
										</div>
										<!-- Last name -->
										<div class="col-sm-6">
											<label class="form-label">Last Name</label>
											<form:input path="LastName" class="form-control"
												autocomplete="off" />
										</div>
										<!-- Email number -->
										<div class="col-sm-8">
											<label class="form-label" class="form-control">Email</label>
											<form:input path="Email" class="form-control"
												autocomplete="off" />
										</div>
										<!-- Phone number -->
										<div class="col-sm-8">
											<label class="form-label" class="form-control">Phone
												number</label>
											<form:input path="PhoneNumber" class="form-control"
												autocomplete="off" />
											<form:input path="password" cssStyle="display:none"/>
											<form:input path="role.roleId" cssStyle="display:none"/>
										</div>
										<div
											class="gap-3 d-md-flex justify-content-md-end text-center">
											<button class="btn btn-primary btn-md">Update
												profile</button>
										</div>
									</div>
								</div>
							</div>
						</form:form>
						<!-- Upload profile -->
						<form:form>
							<div class="col-lg-4">
								<div class="bg-secondary-soft px-4 py-5 rounded">
									<div class="row g-3">
										<h4 class="mb-4 mt-0" style="text-align: center;">Your
											profile photo</h4>
										<div class="">
											<!-- Image upload -->
											<!-- <div class="square position-relative display-2 mb-3"> -->
											<div class="mb-3" style="visibility: visible">
												<i class="fas fa-fw position-absolute top-0 start-0"
													style="font-size: 5rem; width: 300px; height: 300px; visibility: visibility; margin-bottom: 1px; border: 2px solid red"></i>
											</div>
											<!-- Button -->
											<div class="col-sm-12"
												style="visibility: hidden; background-color: black; width: 300px; height: 300px"></div>
											<div class="col-sm-12"
												style="size: 500px; visibility: visibility; border: 2px solid red">
												<div class="col-sm-6">
													<input type="file" id="customFile" name="file" hidden=""
														style="border: 2px solid red">
												</div>
												<div class="col-sm-6">
													<div class="col-sm-3">
														<label class="btn btn-success"
															style="border: 2px solid red"
															;
														for="customFile">Upload</label>
													</div>

												</div>

											</div>

											<!-- Content -->
											<p class="text-muted mt-3 mb-0">
												<span class="me-1">Note:</span>Minimum size 300px x 300px
											</p>
										</div>
									</div>
								</div>
							</div>
						</form:form>
					</div>
				</table>
				<!-- Row END -->
				<div class="container mt-5">
					<h2 class="mb-4">Danh sách địa chỉ</h2>
					<table class="table table-striped" style="font-size: 16px;">
						<thead>
							<tr>
								<th scope="col">Địa chỉ</th>
								<th scope="col">Xóa</th>
							</tr>
						</thead>
						<tbody>
					<%-- 		<c:if test="${empty allAddress }">
							</c:if> --%>
							<c:forEach items="${allAdress }" var="address" varStatus="loop">
								<tr>
									<td>${address.getFullAddress()}</td>
									<td><a
										href="DeleteAddress.htm?addressId=${address.getAddressId()}"><button
												class="btn btn-danger">Xóa địa chỉ này</button></a></td>
								</tr>
							</c:forEach>
							<!-- Các dòng khác có thể được thêm vào đây -->
						</tbody>
					</table>
				</div>
				<div class="gap-3 d-md-flex justify-content-md-end text-center">
					<button type="button" class="btn btn-primary btn-lg"
						style="margin-right: 4em;">Thêm địa chỉ</button>
				</div>

				<div>

					<div class="col-9 p-3">
						<div class="h4 text-uppercase">Thêm địa chỉ mới</div>
						<hr>

						<%-- 			<c:choose>
				<c:when test="${message == 0}">
					<div class="  alert alert-danger alert-dismissible fade show"
						role="alert">
						Cập nhật thất bại!
						<button type="button" class="ms-auto btn-close"
							data-bs-dismiss="alert" aria-label="Close"></button>
					</div>


				</c:when>
				<c:when test="${message == 1}">
					<div class=" alert alert-success alert-dismissible fade show"
						role="alert">
						Cập nhật thành công!
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:when>

			</c:choose>
 --%>
						<form:form action="account/AddNewAddress.htm" id="address-form"
							modelAttribute="userAddress" method="post">

							<div class="row mb-3">
								<label class="col-sm-3 col-form-label text-start" for="province">Province:</label>
								<div class="col-sm-8">
									<form:select aria-label="Default select example"
										id="provincescbb" data-native-menu="true" class="form-control"
										path="provinceId">
										<c:forEach items="${address.provinceBean}" var="province">
											<option value="${province.id}">${province.name}</option>
										</c:forEach>
									</form:select>
								</div>
							</div>

							<div class="row mb-3">
								<label class="col-sm-3 col-form-label text-start" for="district">Quận/Huyện:
								</label>
								<div class="col-sm-8">
									<form:select path="districtId" data-native-menu="true"
										class="form-control" aria-label="Default select example"
										id="districtscbb">
										<c:forEach items="${address.districtBean}" var="district">
											<option value="${district.id}"
												data-province="${district.province.id}">${district.name}</option>
										</c:forEach>
									</form:select>
								</div>
							</div>

							<div class="row mb-3">
								<label class="col-sm-3 col-form-label text-start" for="wardscbb">Phường/Xã:
								</label>
								<div class="col-sm-8">
									<form:select id="wardscbb" path="wardId"
										data-native-menu="true" class="form-control"
										aria-label="Default select example">
										<c:forEach items="${address.wardBean}" var="ward">
											<option value="${ward.id}"
												data-district="${ward.district.id}">${ward.name}</option>
										</c:forEach>
									</form:select>
								</div>
							</div>

							<div class="row mb-3">
								<label class="col-sm-3 col-form-label text-start">Địa
									chỉ: </label>
								<div class="col-sm-8">
									<form:textarea id="address-input" type="text"
										class="form-control" placeholder="enter address line"
										path="addressLine" rows="3" />
								</div>
							</div>
							<script>
								lazyLoading()
							</script>

							<div class="row mb-3 ">
								<label class="col-sm-3 col-form-label"></label>
								<div class="col-sm-8">
										<button type="submit" class="btn btn-success"
											id="add-new-address">Lưu</button>
								</div>
							</div>

						</form:form>
					</div>
				</div>
				<div style="min-height: 400px;"></div>
				<!-- Form END -->
			</div>
		</div>
	</div>




	<div id="snippetContent">

<!-- 		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
			integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA="
			crossorigin="anonymous">
 -->
	</div>
	<!-- Thư viện tìm kiếm cbb -->
	<!-- Include Select2 CSS -->

	<link
		href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/css/select2.min.css"
		rel="stylesheet" />

	<!-- Include jQuery (cần thiết cho Select2) -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<!-- Include Select2 JavaScript -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/js/select2.min.js"
		defer></script>


	<script>
		$(document).ready(function() {
			$(".nice-select").remove();
			$('#wardscbb').select2({
				placeholder : "Chọn phường, xã",
				allowClear : true
			});

			$('#districtscbb').select2({
				placeholder : "Chọn tỉnh quận, huyện",
				allowClear : true
			});
			$('#provincescbb').select2({
				placeholder : "Chọn tỉnh, thành phố",
				allowClear : true
			});

			$('#provincescbb').val(null).trigger('change');
			$('#wardscbb').val(null).trigger('change');
			$('#districtscbb').val(null).trigger('change');
			$('.nice-select').hide();

			// Gắn sự kiện 'change' cho combobox 'provincescbb'
			$('#provincescbb').change(function() {
				// Kiểm tra giá trị của combobox 'provincescbb'
				if ($(this).val() == null) {
					// Nếu giá trị là null, vô hiệu hóa combobox 'districtscbb'
					$('#districtscbb').prop('disabled', true);
					$('#districtscbb').val(null).trigger('change');
				} else {
					// Nếu giá trị không phải null, bỏ vô hiệu hóa combobox 'districtscbb'
					$('#districtscbb').prop('disabled', false);
					selectDistrictsByProvince($('#provincescbb').val());
				}
				$('#wardscbb').prop('disabled', true);
				$('#wardscbb').val(null).trigger('change');

			});

			$('#districtscbb').change(function() {
				// Kiểm tra giá trị của combobox 'districtscbb'
				if ($(this).val() == '') {
					// Nếu giá trị là null, vô hiệu hóa combobox 'wardscbb'
					$('#wardscbb').prop('disabled', true);
					$('#wardscbb').val(null).trigger('change');
				} else {
					// Nếu giá trị không phải null, bỏ vô hiệu hóa combobox 'wardscbb'
					$('#wardscbb').prop('disabled', false);
					selectWardsByDistrict($('#districtscbb').val());
				}
			});

			$("#wardscbb").change(function() {
				if ($(this).val() == '') {
					$('#add-new-address').prop('disabled',true);
				}else{
					address_validate();
				}
			});
		});
	</script>
	<script>
		function address_validate() {
			if (document.querySelector('#wardscbb').value != '') {
				var addressValue = document.querySelector('#address-input').value;
				var regex = /\S/; // Biểu thức chính quy kiểm tra kí tự không phải là khoảng trắng hoặc dấu xuống dòng

				if (regex.test(addressValue)) {
					// addressValue chứa ít nhất một kí tự không phải là khoảng trắng hoặc dấu xuống dòng
					document.querySelector('#add-new-address').disabled = false;
				} else {
					// addressValue chỉ chứa khoảng trắng hoặc dấu xuống dòng
					document.querySelector('#add-new-address').disabled = true;
				}
			} else {
				document.querySelector('#add-new-address').disabled = true;
			}
		}
		document.addEventListener('change', function(event) {
			// Xử lý sự kiện change ở đây
			address_validate();
		});
		
		var textArea = document.querySelector('#address-input');

		textArea.addEventListener('input', function(event) {
			// Xử lý sự kiện khi nội dung của textarea thay đổi
			address_validate();
		});
	</script>

	<script type="text/javascript">
		// Ngay sau khi load xong trang làm những điều này
		window.addEventListener("load", function() {
			// Đặt mã của bạn ở đây
			$('#districtscbb').prop('disabled', true);
			$('#wardscbb').prop('disabled', true);
			document.querySelector('#add-new-address').disabled = true;
		});
	</script>


</body>

</html>