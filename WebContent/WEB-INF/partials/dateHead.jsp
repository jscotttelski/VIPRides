	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/test/bootstrap-datetimepicker.css">
		
	<script src="${pageContext.request.contextPath}/resources/js/moment.js"></script>
	<script type="text/javascript">
		$(function () {
			$('#datetimepicker1').datetimepicker({format: 'YYYY-MM-DD hh:mm A', ignoreReadonly: true});
		});
		$(function () {
			$('#datetimepicker2').datetimepicker({format: 'YYYY-MM-DD hh:mm A', ignoreReadonly: true});
		});
		$(function () {
			$('#datetimepicker3').datetimepicker({format: 'YYYY-MM-DD'});
		});
	</script>