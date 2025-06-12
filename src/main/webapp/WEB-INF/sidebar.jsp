<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="sidebar">
    <h2>ééé</h2>
    <ul>
        <li>
            <a href="Controller?page=home" class="menu-link ${currentPage == 'home' ? 'active' : ''}" data-page="home">
                <span class="menu-text">Home</span>
            </a>
        </li>
        <li>
            <a href="Controller?page=client" class="menu-link ${currentPage == 'client' ? 'active' : ''}" data-page="client">
                <span class="menu-text">Client</span>
            </a>
        </li>
        <li>
            <a href="Controller?page=transfert" class="menu-link ${currentPage == 'transfert' ? 'active' : ''}" data-page="transfert">
                <span class="menu-text">Transfert</span>
            </a>
        </li>
        <li>
            <a href="Controller?page=retrait" class="menu-link ${currentPage == 'retrait' ? 'active' : ''}" data-page="retrait">
                <span class="menu-text">Retrait</span>
            </a>
        </li>
        <li>
            <a href="Controller?page=transactions" class="menu-link ${currentPage == 'transactions' ? 'active' : ''}" data-page="transactions">
                <span class="menu-text">Transactions</span>
            </a>
        </li>
    </ul>
</div>