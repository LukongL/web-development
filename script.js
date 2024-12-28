document.addEventListener('DOMContentLoaded', function() {
    const hamburgerMenu = document.querySelector('.hamburger-menu');
    const navLinks = document.querySelector('.nav-links');

    hamburgerMenu.addEventListener('click', () => {
        navLinks.classList.toggle('nav-active');
        const expanded = hamburgerMenu.getAttribute('aria-expanded') === 'true' || false;
        hamburgerMenu.setAttribute('aria-expanded', String(!expanded));
        adjustCarouselContainer(); // Adjust carousel container size after toggling menu
    });

    // Add event listener to submenu items
    const subMenuLinks = document.querySelectorAll('.nav-links ul li ul li a');
    subMenuLinks.forEach(link => {
        link.addEventListener('click', () => {
            adjustCarouselContainer(); // Adjust carousel container size after submenu item click
        });
    });

    // Add event listener to main menu items
    const mainMenuLinks = document.querySelectorAll('.nav-links > li > a');
    mainMenuLinks.forEach(link => {
        link.addEventListener('click', () => {
            adjustCarouselContainer(); // Adjust carousel container size after main menu item click
        });
    });
});

// Function to adjust carousel container size based on header height
function adjustCarouselContainer() {
    const headerHeight = document.querySelector('header').offsetHeight;
    const carouselContainer = document.querySelector('.carousel-container');
    carouselContainer.style.marginTop = headerHeight + 'px';
}
