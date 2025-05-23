// Define your page components
const HomePage = {
    template: `
        <div>
            <h1>Home Page</h1>
            <p>Welcome to the Mobile Money Home Page</p>
        </div>`
}

const ClientPagePage = {
    template: `
        <div>
            <h1>Client Page</h1>
            <p>client page</p>
        </div>`
}

const TransfertPage = {
    template: `
        <div>
            <h1>Transfert Page</h1>
            <p>Make your transfer here</p>
        </div>`
}

const RetraitPage = {
    template: `
        <div>
            <h1>Retrait Page</h1>
            <p>Withdraw money here</p>
        </div>`
}

const TransactionsPage = {
    template: `
        <div>
            <h1>Transactions Page</h1>
            <p>View your transaction history here</p>
        </div>`
}

// Sidebar component that emits navigation events
const Sidebar = {
    template: `
        <div class="sidebar">
            <a href="#" @click.prevent="$emit('navigate', 'HomePage')">Home</a>
            <a href="#" @click.prevent="$emit('navigate', 'TransfertPage')">Transfert</a>
            <a href="#" @click.prevent="$emit('navigate', 'RetraitPage')">Retrait</a>
            <a href="#" @click.prevent="$emit('navigate', 'TransactionsPage')">Transactions</a>
        </div>
    `
}

// Vue app definition
const app = Vue.createApp({
    components: {
        Sidebar,  // Register Sidebar component
        HomePage,  // Register HomePage component
        ClientPage,  // Register ClientPage component
        TransfertPage,  // Register TransfertPage component
        RetraitPage,  // Register RetraitPage component
        TransactionsPage  // Register TransactionsPage component
    },
    data() {
        return {
            currentPage: 'HomePage'  // Default page loaded
        }
    }
})

// Mount the Vue app to the DOM
app.mount('#app')
