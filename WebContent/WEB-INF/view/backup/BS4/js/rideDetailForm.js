$('#deny').click(function() {
	return confirm('This will send a denial notice to requester and DELETE THE RIDE!!  Continue?');
});

$('#detailForm').submit(function() {
	if(confirm('Confirm ride and send Confirmation email?')) {
		$('#rideConfirmCheckbox').prop('checked', true);
		return true;
	} else { return false; }
});