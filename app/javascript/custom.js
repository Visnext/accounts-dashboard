$(document).on('turbolinks:load', function() {
	$('#item-price').change(function() {
		calculateTotalPrice()
	})

	$('#item-quantity').change(function() {
		calculateTotalPrice()
	})

	function calculateTotalPrice() {
		let quantity = $('#item-quantity').val() ? $('#item-quantity').val() : 0
		let price = $('#item-price').val() ? $('#item-price').val() : 0
		let totalPrice = quantity * price
  	 $('#item-total-price').html(totalPrice)
	}

	$('#show-seller-form').click(() => {
		$('#hidden-seller-form').toggleClass('hide-content');
		$('#seller-selector').toggleClass('hide-content');
	})

	$('#show-seller-selecter').click(() => {
		$('#hidden-seller-form').toggleClass('hide-content');
		$('#seller-selector').toggleClass('hide-content');
	})
})