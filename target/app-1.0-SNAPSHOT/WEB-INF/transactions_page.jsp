<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Static Data Table</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/transactions_page.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form_client.css">
</head>
<body>

    <h2>Liste des transactions</h2>

    <div class="panel">
        <div class="panel-header">
            <input type="text" id="searchInput" placeholder="Rechercher un numéro" class="search-input">
            <button id="newBtn" class="new-btn">Nouveau</button>
        </div>

        <!-- New panel for category buttons -->
        <div class="panel-category">
            <button id="filterBtn" class="category-btn">Transfert</button>
            <button id="exportBtn" class="category-btn">Retrait</button>
        </div>
    
        <table border="1" cellpadding="10">
            <thead>
                <tr>
                    <th>Identifiant</th>
                    <th>Envoyeur</th>
                    <th>Récépteur</th>
                    <th>Montant</th>
                    <th>Date</th>
                    <th>+ Retrait</th>
                    <th>Raison</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="transfert" items="${tranferts}">
                    <tr>
                        <td>${transfert.id}</td>
                        <td>${transfert.envoyeur}</td>
                        <td>${transfert.recepteur}</td>
                        <td>${transfert.montant}</td>
                        <td>${transfert.date}</td>
                        <td>${transfert.fr_retrait}</td>
                        <td>${transfert.raison}</td>
                        <td>
                            <a href="#" class="icon-btn" title="Modifier">
                                <img src="${pageContext.request.contextPath}/images/edit.svg" alt="Edit" class="action-icon">
                            </a>
                            <a href="#" class="icon-btn" title="Supprimer">
                                <img src="${pageContext.request.contextPath}/images/delete.svg" alt="Delete" class="action-icon">
                            </a>
                        </td>
                        
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>    

     <!-- Fenêtre modale -->
     <div class="modal" id="modal">
        <div class="modal-content">
            <span class="close-btn" id="closeModal">&times;</span>
            <form action="ajouterClient" method="post" class="modal-form">
                <h3>Ajouter un client</h3>
                <input type="text" name="numtel" placeholder="Téléphone de l'envoyeur" required>
                <input type="text" name="nom" placeholder="Téléphone du récépteur" required>
                <input type="number" name="montant" placeholder="Montant à envoyer" required>
                <select name="frais_retrait" placeholder="Frais de retrait" required>
                    <option value="Oui">Oui</option>
                    <option value="Non">Non</option>
                </select>
                
                <input type="text" step="0.01" name="raison" placeholder="Raison" required>
                <button type="submit" class="submit-btn">Ajouter</button>
            </form>
        </div>
    </div>

    

</body>
</html>
