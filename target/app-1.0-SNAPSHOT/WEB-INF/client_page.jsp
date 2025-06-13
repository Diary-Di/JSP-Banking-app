<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Static Data Table</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/client_page.css">
</head>
<body>

    <h2>Liste des employés</h2>

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
                    <th>Age</th>
                    <th>Solde</th>
                    <th>Mail</th>
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

</body>
</html>
