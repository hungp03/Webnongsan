document.getElementById('paymentButton').addEventListener('click', function() {
    var codRadio = document.getElementById('cod');
    var bankingRadio = document.getElementById('banking');
    
    if (codRadio.checked) {
        window.location.href = 'link_to_checkout_processing_page_for_COD';
    } else if (bankingRadio.checked) {
        //window.location.href = 'https://google.com';
    	window.open('https://google.com', '_blank');
    }
});
