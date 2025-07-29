// Guards to avoid rebinding global handlers multiple times
let __globalHandlersBound = false;

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
        if (iconSrc && !link.querySelector('img.menu-icon')) {
            const icon = document.createElement('img');
            icon.src = iconSrc;
            icon.alt = `${page.charAt(0).toUpperCase() + page.slice(1)} Icon`;
            icon.className = 'menu-icon';
            link.prepend(icon);
        }

        // Sidebar navigation: AJAX load
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const page = link.getAttribute('data-page');
            loadContent(page);
            setActiveLink(link);
        });
    });

    // Initial content load
    loadContent('home');
    const homeLink = document.querySelector('.menu-link[data-page="home"]');
    if (homeLink) setActiveLink(homeLink);

    // Bind global handlers once
    bindGlobalHandlers();
});

function loadContent(page) {
    const mainContent = document.querySelector('.main-content');
    if (!mainContent) return;

    mainContent.innerHTML = '<p>Loading...</p>';

    fetch(`Controller?page=${encodeURIComponent(page)}`, {
        headers: { 'X-Requested-With': 'XMLHttpRequest' },
        credentials: 'same-origin'
    })
    .then(response => {
        if (!response.ok) throw new Error(`HTTP ${response.status}`);
        return response.text();
    })
    .then(html => {
        mainContent.innerHTML = html;
        initializeDynamicContent(); // ← rebind handlers in new content
    })
    .catch(error => {
        console.error('Error loading content:', error);
        mainContent.innerHTML = '<p>Error loading content. Please try again.</p>';
    });
}

function setActiveLink(activeLink) {
    document.querySelectorAll('.menu-link').forEach(link => link.classList.remove('active'));
    if (activeLink) activeLink.classList.add('active');
}

function bindGlobalHandlers() {
    if (__globalHandlersBound) return;
    __globalHandlersBound = true;

    // Open modal (new client)
    document.body.addEventListener('click', (event) => {
        if (event.target && event.target.id === 'newBtn') {
            const modal = document.getElementById('modal');
            if (modal) {
                resetFormToAddMode(); // reset before showing
                modal.style.display = 'flex';
            }
        }

        // Close modal (x button)
        if (event.target && event.target.id === 'closeModal') {
            const modal = document.getElementById('modal');
            if (modal) {
                resetFormToAddMode();
                modal.style.display = 'none';
            }
        }
    });

    // Close modal if clicking outside of it
    window.addEventListener('click', (event) => {
        const modal = document.getElementById('modal');
        if (modal && event.target === modal) {
            resetFormToAddMode();
            modal.style.display = 'none';
        }
    });
}

// Runs after every AJAX content injection
function initializeDynamicContent() {
    bindClientFormHandlers();
    bindEditButtons();
    bindDeleteButtons();
}

// AJAX form submission (Fix A)
function bindClientFormHandlers() {
    const form = document.getElementById('clientForm');
    if (!form || form.__bound) return;
    form.__bound = true;

    const submitBtn = form.querySelector('.submit-btn');

    form.addEventListener('submit', async (e) => {
        e.preventDefault();

        const insertUrl = form.getAttribute('action') || 'ClientServlet';

        try {
            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.textContent = 'Traitement...';
            }

            const fd = new FormData(form);
            const body = new URLSearchParams(fd); // Fix A: URL encoded

            const insertResp = await fetch(insertUrl, {
                method: 'POST',
                body,
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
                    'X-Requested-With': 'XMLHttpRequest'
                },
                credentials: 'same-origin'
            });

            if (!insertResp.ok && insertResp.status !== 204) {
                throw new Error('Insertion échouée (HTTP ' + insertResp.status + ')');
            }

            // Success: reload client page
            loadContent('client');

            // Close modal & reset form
            const modal = document.getElementById('modal');
            if (modal) modal.style.display = 'none';
            resetFormToAddMode();

        } catch (err) {
            console.error(err);
            alert('Erreur: ' + err.message);
        } finally {
            if (submitBtn) {
                submitBtn.disabled = false;
                submitBtn.textContent = form.querySelector('#isEdit').value ? 'Mettre à jour' : 'Ajouter';
            }
        }
    });
}

// Edit button: open modal and prefill form
function bindEditButtons() {
    const container = document.querySelector('.main-content');
    if (!container) return;

    container.querySelectorAll('.btn-edit').forEach(btn => {
        if (btn.__bound) return;
        btn.__bound = true;

        btn.addEventListener('click', () => {
            const modal = document.getElementById('modal');
            const form = document.getElementById('clientForm');
            if (!modal || !form) return;

            const fullNum = btn.dataset.numtel || '';
            const prefix = fullNum.substring(0, 3);
            const rest = fullNum.substring(3);

            form.querySelector('#prefix').value = prefix;
            form.querySelector('#numtel').value = rest;
            form.querySelector('#fullNumTel').value = fullNum; // Set hidden field
            form.querySelector('#nom').value = btn.dataset.nom || '';
            form.querySelector('#sexe').value = btn.dataset.sexe || '';
            form.querySelector('#age').value = btn.dataset.age || '';
            form.querySelector('#solde').value = btn.dataset.solde || '';
            form.querySelector('#mail').value = btn.dataset.mail || '';

            form.querySelector('#isEdit').value = 'true';
            form.querySelector('#prefix').disabled = true;
            form.querySelector('#numtel').disabled = true;

            const title = document.getElementById('formTitle');
            if (title) title.textContent = 'Mettre à jour le client';
            const submitBtn = form.querySelector('.submit-btn');
            if (submitBtn) submitBtn.textContent = 'Mettre à jour';

            modal.style.display = 'flex';
        });
    });
}

function bindDeleteButtons() {
    const container = document.querySelector('.main-content');
    if (!container) return;

    container.querySelectorAll('.btn-delete').forEach(btn => {
        if (btn.__bound) return;  // avoid rebinding
        btn.__bound = true;

        btn.addEventListener('click', async (e) => {
            e.preventDefault();

            if (!confirm('Voulez-vous vraiment supprimer ce client ?')) return;

            const numtel = btn.dataset.numtel;
            if (!numtel) return;

            try {
                const response = await fetch(`ClientServlet?action=delete&numtel=${encodeURIComponent(numtel)}`, {
                    method: 'GET',
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest'
                    },
                    credentials: 'same-origin'
                });

                if (!response.ok) {
                    throw new Error(`Erreur de suppression (HTTP ${response.status})`);
                }

                // Refresh client list
                loadContent('client');

            } catch (err) {
                console.error(err);
                alert('Erreur lors de la suppression : ' + err.message);
            }
        });
    });
}


// Reset modal form to ADD mode
function resetFormToAddMode() {
    const form = document.getElementById('clientForm');
    if (!form) return;

    form.reset();
    form.querySelector('#isEdit').value = '';
    form.querySelector('#prefix').disabled = false;
    form.querySelector('#numtel').disabled = false;

    const title = document.getElementById('formTitle');
    if (title) title.textContent = 'Ajouter un client';
    const submitBtn = form.querySelector('.submit-btn');
    if (submitBtn) submitBtn.textContent = 'Ajouter';
}
