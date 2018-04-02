$("#typeRange").click(function() {
	$("#clockTimes").css("display", "none");
	$("#recurrence").css("display", "none");
	// store session state of these to load with page
});

$("#typeDetailed").click(function() {

	$("#clockTimes").css("display", "block");
	$("#recurrence").css("display", "block");
	
});

$("#patternDay").click(function() {
	$("#dayPattern").css("display", "block");
	$("#weekPattern").css("display", "none");
	
});

$("#patternWeek").click(function() {
	$("#dayPattern").css("display", "none");
	$("#weekPattern").css("display", "block");
	
});