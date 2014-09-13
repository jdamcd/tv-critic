var elements = document.getElementsByTagName("p");
var maxLength = 220;

for (var i = 0, max = elements.length; i < max; i++) {
	var text = elements[i].textContent; 
	if (text.length > maxLength) {
		elements[i].innerHTML = text.substr(0, maxLength - 3) + "...";
	}
}