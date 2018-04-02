function validateGL() {
	var regEx = /^[0-9]{4}?[.][0-9]{4}$/im;
    var glCode = document.getElementById("glCode").value;
    if (glCode !== regEx) {
        alert("That is not a valid GL account");
        return false;
    }
}
