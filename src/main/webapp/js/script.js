document.addEventListener('DOMContentLoaded', () => {
    // Define SVG icon paths
    const icons = {
        home: 'images/home.svg',
        client: 'images/client.svg',
        transfert: 'images/transfert.svg',
        retrait: 'images/retrait.svg',
        transactions: 'images/transactions.svg'
    };

    // Add icons to menu links dynamically
    document.querySelectorAll('.menu-link').forEach(link => {
        const page = link.getAttribute('data-page');
        const iconSrc = icons[page];
        if (iconSrc) {
            const icon = document.createElement('img');
            icon.src = iconSrc;
            icon.alt = `${page.charAt(0).toUpperCase() + page.slice(1)} Icon`;
            icon.className = 'menu-icon';
            link.prepend(icon);
        }

        link.addEventListener('click', (e) => {
            e.preventDefault();
            const page = link.getAttribute('data-page');
            loadContent(page);
            setActiveLink(link);
        });
    });

    // Initial content load
    loadContent('home');
    setActiveLink(document.querySelector('.menu-link[data-page="home"]'));

    // Set category button toggle handler
    initCategoryButtons();
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
            initializeDynamicContent(); // Reinitialize events for dynamic content
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
    // Open modal on button click (delegated)
    document.body.addEventListener('click', (event) => {
        if (event.target && event.target.id === 'newBtn') {
            const modal = document.getElementById('modal');
            if (modal) {
                console.log("New button clicked");
                modal.style.display = 'flex';
            }
        }

        // Close modal if clicking the close button
        if (event.target && event.target.id === 'closeModal') {
            const modal = document.getElementById('modal');
            if (modal) {
                console.log("Close button clicked");
                modal.style.display = 'none';
            }
        }
    });

    // Close modal if clicking outside of it
    window.addEventListener('click', (event) => {
        const modal = document.getElementById('modal');
        if (modal && event.target === modal) {
            console.log("Clicked outside modal");
            modal.style.display = 'none';
        }
    });
}

function initCategoryButtons() {
    const categoryButtons = document.querySelectorAll(".category-btn");
    categoryButtons.forEach(button => {
        button.addEventListener("click", function () {
            categoryButtons.forEach(btn => btn.classList.remove("active"));
            this.classList.add("active");
        });
    });
}
