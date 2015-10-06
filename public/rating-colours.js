var elements = document.getElementsByTagName("h2");

for (var i = 0, max = elements.length; i < max; i++) {
	var element = elements[i];
	setColourByRating(element, parseInt(element.innerHTML));
}

function setColourByRating(element, rating) {
	switch (rating) {
		case 1:
			setColour(element, '#EF5350');
			break;
		case 2:
			setColour(element, '#FF7043');
			break;
		case 3:
			setColour(element, '#FFB300');
			break;
		case 4:
			setColour(element, '#9CCC65');
			break;
		case 5:
			setColour(element, '#4CAF50');
	}
} 

function setColour(element, colour) {
	element.parentNode.style.background=colour;
}
