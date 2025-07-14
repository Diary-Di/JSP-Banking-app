document.addEventListener('DOMContentLoaded', () => {
    // Define SVG icon paths (mimicking "import")
    const icons = {
        home: 'images/home.svg',
        client: 'images/client.svg',
        transfert: 'images/transfert.svg',
        retrait: 'images/retrait.svg',
        transactions: 'images/transactions.svg'
    };

    // Add icons dynamically to menu links
    document.querySelectorAll('.menu-link').forEach(link => {
        const page = link.getAttribute('data-page');
        const iconSrc = icons[page];
        if (iconSrc) {
            const icon = document.createElement('img');
            icon.src = iconSrc;
            icon.alt = `${page.charAt(0).toUpperCase() + page.slice(1)} Icon`;
            icon.className = 'menu-icon';
            link.prepend(icon); // Add the icon before the text
        }

        link.addEventListener('click', (e) => {
            e.preventDefault();
            const page = link.getAttribute('data-page');
            loadContent(page);
            setActiveLink(link);
        });
    });

    loadContent('home');
    setActiveLink(document.querySelector('.menu-link[data-page="home"]'));
});

function loadContent(page) {
    const mainContent = document.querySelector('.main-content');
    mainContent.innerHTML = '<p>Loading...</p>';
    fetch(`Controller?page=${page}`, {
        headers: { 'X-Requested-With': 'XMLHttpRequest' }
    })
        .then(response => response.text())
        .then(data => {
            mainContent.innerHTML = data;

            // Reinitialize JavaScript for dynamically loaded content
            initializeDynamicContent();
        })
        .catch(error => {
            console.error('Error loading content:', error);
            mainContent.innerHTML = '<p>Error loading content. Please try again.</p>';
        });
}

function setActiveLink(activeLink) {
    document.querySelectorAll('.menu-link').forEach(link => {
        link.classList.remove('active');
    });
    activeLink.classList.add('active');
}

function initializeDynamicContent() {
    // Reinitialize event listeners for dynamically loaded content
    const modal = document.getElementById('modal');
    const closeModal = document.getElementById('closeModal');

    // Use event delegation to handle the "newBtn" click
    document.body.addEventListener('click', (event) => {
        if (event.target && event.target.id === 'newBtn') {
            console.log("New button clicked");
            modal.style.display = 'flex'; // Show the modal
        }
    });

    if (closeModal) {
        closeModal.addEventListener('click', () => {
            console.log("Close button clicked");
            modal.style.display = 'none'; // Hide the modal
        });
    }

    window.addEventListener('click', (event) => {
        if (event.target === modal) {
            console.log("Clicked outside modal");
            modal.style.display = 'none'; // Hide the modal when clicking outside
        }
    });
}

document.addEventListener("DOMContentLoaded", function () {
    const categoryButtons = document.querySelectorAll(".category-btn");

    categoryButtons.forEach(button => {
        button.addEventListener("click", function () {
            // Remove the active class from all buttons
            categoryButtons.forEach(btn => btn.classList.remove("active"));

            // Add the active class to the clicked button
            this.classList.add("active");
        });
    });
});