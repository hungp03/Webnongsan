document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('paymentButton').addEventListener('click', function(event) {
        var codRadio = document.getElementById('cod');
        var bankingRadio = document.getElementById('banking');

        if (!codRadio.checked && !bankingRadio.checked) {
            alert("Vui lòng chọn hình thức thanh toán.");
            event.preventDefault(); // Ngăn chặn hành động mặc định của nút bấm
            return;
        }

        if (codRadio.checked) {
            window.location.href = 'link_to_checkout_processing_page_for_COD';
            event.preventDefault(); // Ngăn chặn form gửi đi nếu muốn xử lý điều hướng
        } else if (bankingRadio.checked) {
            window.open('https://google.com', '_blank');
            event.preventDefault(); // Ngăn chặn form gửi đi nếu muốn mở trang mới
        }
    });
});
