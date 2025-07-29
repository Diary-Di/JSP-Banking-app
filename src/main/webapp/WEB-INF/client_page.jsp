<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Clients</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/client_page.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form_client.css">
</head>
<body>

    <h2>Liste des clients</h2>

    <div class="panel">
        <div class="panel-header">
            <input type="text" id="searchInput" placeholder="Rechercher un client" class="search-input">
            <button id="newBtn" class="new-btn">Nouveau</button>
        </div>
    
        <table border="1" cellpadding="10">
            <thead>
                <tr>
                    <th>Téléphone</th>
                    <th>Nom</th>
                    <th>Sexe</th>
                    <th>Âge</th>
                    <th>Solde</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="client" items="${clients}">
                    <tr>
                        <td>${clients.numtel}</td>
                        <td>${clients.nom}</td>
                        <td>${clients.sexe}</td>
                        <td>${clients.age}</td>
                        <td>${clients.solde}</td>
                        <td>${clients.mail}</td>
                        <td>
                            <a href="#" class="icon-btn" title="Modifier">
                                <img src="${pageContext.request.contextPath}/images/edit.svg" alt="Modifier" class="action-icon">
                            </a>
                            <a href="#" class="icon-btn" title="Supprimer">
                                <img src="${pageContext.request.contextPath}/images/delete.svg" alt="Supprimer" class="action-icon">
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
    
                <!-- Téléphone (with prefix selector) -->
                <label for="numtel">Téléphone</label>
                <div class="phone-input-group">
                    <select name="prefix" id="prefix" required>
                        <option value="034">034</option>
                        <option value="037">037</option>
                    </select>
                    <input type="text" name="numtel" id="numtel" placeholder="1234567" required>
                </div>

    
                <!-- Nom -->
                <label for="nom">Nom</label>
                <input type="text" name="nom" id="nom" placeholder="Nom" required>
    
                <!-- Sexe -->
                <label for="sexe">Sexe</label>
                <select name="sexe" id="sexe" required>
                    <option value="">Sélectionner le sexe</option>
                    <option value="Homme">Homme</option>
                    <option value="Femme">Femme</option>
                </select>
    
                <!-- Âge -->
                <label for="age">Âge</label>
                <input type="number" name="age" id="age" placeholder="Âge" required>
    
                <!-- Solde -->
                <label for="solde">Solde</label>
                <input type="number" step="0.01" name="solde" id="solde" placeholder="Solde" required>
    
                <!-- Email -->
                <label for="mail">Adresse email</label>
                <input type="email" name="mail" id="mail" placeholder="Adresse email" required>
    
                <button type="submit" class="submit-btn">Ajouter</button>
            </form>
        </div>
    </div>
    
</body>
</html>
