var elements = document.getElementsByTagName("h2");

for (var i = 0, max = elements.length; i < max; i++) {
	var element = elements[i];
	setColourByRating(element, parseInt(element.innerHTML));
}

function setColourByRating(element, rating) {
	switch (rating) {
		case 1:
			setColour(element, '#d99068');
			break;
		case 2:
			setColour(element, '#e4b152');
			break;
		case 3:
			setColour(element, '#f0d356');
			break;
		case 4:
			setColour(element, '#becd4c');
			break;
		case 5:
			setColour(element, '#7fb863');
	}
} 

function setColour(element, colour) {
	element.parentNode.style.background=colour;
}
