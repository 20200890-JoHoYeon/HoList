// Get all accordion spans
accordions = document.querySelectorAll('.accordion');

// Add click event listener to each accordion
accordions.forEach(accordion => {

	accordion.addEventListener('click', function() {
			
		const submenu = this.nextElementSibling;
		const isActive = submenu.style.display === 'block';
		
		// Close all open submenus
		accordions.forEach(acc => {
			if (acc !== accordion) {
				const sub = acc.nextElementSibling;
				sub.style.display = 'none';
			}
		});

		// Toggle the clicked submenu
		submenu.style.display = isActive ? 'none' : 'block';
	});
});