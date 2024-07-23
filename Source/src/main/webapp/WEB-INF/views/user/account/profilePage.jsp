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
	<div class="container mb-5">
		<div class="row">
			<div class="col-12">
				<!-- Page title -->
				<div class="my-5">
					<h3>Thông tin cá nhân</h3>
					<hr>
				</div>
				<!-- Form START -->
				<table class="file-upload">
					<div class="row mb-4 gx-5">
						<%@include file="/WEB-INF/views/layouts/user/account-menu.jsp"%>
						<form:form action="UpdateProfileInfo.htm"
							modelAttribute="profileInfo" method="post">
							<div class="col-lg-6 mb-5 mb-xxl-0">
								<div class="bg-secondary-soft px-4 py-5 rounded">
									<div class="row g-3">
										<h4 class="mb-5 mt-0">Thông tin</h4>
										<div class="col-sm-12" style="visibility: hidden"></div>
										<div class="col-sm-6">
											<label class="form-label">Họ</label>
											<form:input path="FirstName" class="form-control"
												autocomplete="off" required="true"/>
											<form:errors class="text-danger" path="firstName" />
										</div>
										<!-- Last name -->
										<div class="col-sm-6">
											<label class="form-label">Tên</label>
											<form:input path="LastName" class="form-control"
												autocomplete="off" required="true"/>
											<form:errors class="text-danger" path="lastName" />
										</div>
										<!-- Email number -->
										<div class="col-sm-12">
											<label class="form-label" class="form-control">Email</label>
											<form:input path="Email" class="form-control"
												autocomplete="off" required="true" id="email"/>
											<form:errors class="text-danger" path="email" />
											<div class="text-danger">${mess}</div>
										</div>
										<!-- Phone number -->
										<div class="col-sm-12">
											<label class="form-label" class="form-control">Số điện thoại</label>
											<form:input path="PhoneNumber" class="form-control"
												autocomplete="off" required="true" id="phoneNumber"/>
											<form:errors class="text-danger" path="phoneNumber" />
											
										</div>
										<div>
											<button class="btn btn-primary ml-3 mt-3">Cập nhật</button>
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
									<div style="display: flex; justify-content: center; align-items: center;">
										<h4 class="mb-4 mt-0" style="text-align: center;">Ảnh đại diện</h4>
									</div>
										
										<div class="">
											<!-- Image upload -->
											<!-- <div class="square position-relative display-2 mb-3"> -->
											<div class="mb-3" style="visibility: visible">
												<i class="fas fa-fw position-absolute top-0 start-0"
													style="font-size: 5rem; width: 300px; height: 300px; visibility: visibility; margin-bottom: 1px">
													<c:choose>
											<c:when test="${not empty userInfo.avatar}">
												<img
												id = "preview"
												style="position: relative;width: 300px; height: 300px;";
													src="assets/user/img/account/${userInfo.avatar};";
													alt="User photo"">
											</c:when>
											<c:otherwise>
												<img
													id = "preview"
													src="assets/user/img/account/defaultavatar.png";
													alt="#"
													style="position: relative;width: 300px; height: 300px;";>
											</c:otherwise>
											</c:choose>
													</i>
											</div>
											<!-- Button -->
											<div class="col-sm-12"
												style="visibility: hidden; background-color: black; width: 300px; height: 300px"></div>
											<div class="col-sm-12"
												style="size: 500px; visibility: visibility;">
												
												<div class="col-sm-12">
												<form></form>
												<form action="account/UploadAvatar.htm" method="post" enctype="multipart/form-data">
													<input type="file" id="customFile" name="userAvatar"  onchange="previewImage(event)"
														style="border: 2px solid red" hidden>
													<div class="col-sm-12" style="display: flex; justify-content: center;">
														<label style="margin: 0px 10px 0px 0px;" class="btn btn-secondary" for="customFile"  onchange="previewImage(event)">Chọn ảnh</label>
														<button type="submit" class="btn btn-success">Tải lên</button>
													</div>
												</form>
													
												</div>		
											</div>
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
								<th scope="col" style="text-align: center;">Đặt làm mặc định</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${allAdress }" var="address" varStatus="loop">
								<tr>
									<td>${address.getFullAddress()}</td>

									<td style="text-align: center;"><c:if
											test="${defaultAddressNumber != address.getAddressId()}">
											<a
												href="account/ChooseDefaultAddress.htm?addressId=${address.getAddressId()}"><button
													type="button" class="btn btn-success" style="width: 60px;">Chọn</button></a>
										</c:if> <c:if
											test="${defaultAddressNumber == address.getAddressId()}">
											<a href="account/RemoveDefaultAddress.htm"><button
													type="button" class="btn btn-dark" style="width: 60px;">Bỏ</button></a>
										</c:if></td>


									<td><a
										href="account/DeleteAddress.htm?addressId=${address.getAddressId()}"><button
												class="btn btn-danger">Xóa</button></a></td>
								</tr>
							</c:forEach>
							<!-- Các dòng khác có thể được thêm vào đây -->
						</tbody>
					</table>
					<c:choose>
						<c:when test="${deleteAddressMessage == 0}">
							<div class="  alert alert-danger alert-dismissible fade show"
								role="alert">Xóa địa chỉ thất bại vui lòng bỏ địa chỉ mặc định trước khi xóa</div>


						</c:when>
						<c:when test="${deleteAddressMessage == 1}">
							<div class=" alert alert-success alert-dismissible fade show"
								role="alert">Xóa địa chỉ thành công</div>
						</c:when>
					</c:choose>
				</div>

				<div>

					<div class="col-9 p-3">
						<div class="h4 text-uppercase">Thêm địa chỉ mới</div>
						<hr>

						<form:form action="account/AddNewAddress.htm" id="address-form"
							modelAttribute="userAddress" method="post">

							<div class="row mb-3">
								<label class="col-sm-3 col-form-label text-start" for="province">Tỉnh/Thành phố:</label>
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
			</div>
		</div>
	</div>

	<link
		href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/css/select2.min.css"
		rel="stylesheet" />


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
					$('#add-new-address').prop('disabled', true);
				} else {
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
	<c:remove var="deleteAddressMessage" scope="session" />
    <script>
        function previewImage(event) {
            var preview = document.getElementById('preview');
            var file = event.target.files[0];
            var reader = new FileReader();

            reader.onload = function(){
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            }
        }
    </script>
        <script type="text/javascript">
    function validateEmail() {
        var emailInput = document.getElementById('email');
        var email = emailInput.value;
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailPattern.test(email)) {
            alert('Vui lòng nhập địa chỉ email hợp lệ!');
            return false;
        }

        return true;
    }
    function validatePhoneNumber() {
        var phoneNumberInput = document.getElementById('phoneNumber');
        var phoneNumber = phoneNumberInput.value;
        var phoneNumberPattern = /^0[0-9]{9}$/;

        if (!phoneNumberPattern.test(phoneNumber)) {
            alert('Vui lòng nhập số điện thoại hợp lệ! Số điện thoại phải bắt đầu bằng số 0 và có tổng cộng 10 chữ số.');
            return false;
        }

        return true;
    }
    function validateForm(){
    	if(!validateEmail()){
    		return false;
    	}
    	if(!validatePhoneNumber()){
    		return false;
    	}
    	return true;
    }
    </script>
</body>

</html>