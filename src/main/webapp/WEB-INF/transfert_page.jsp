<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Static Data Table</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/client_page.css">
</head>
<body>

    <h2>Liste des tranferts d'argents</h2>

    <div class="panel">
        <div class="panel-header">
            <input type="text" id="searchInput" placeholder="Rechercher un numéro" class="search-input">
            <button id="newBtn" class="new-btn">Nouveau</button>
        </div>
    
        <table border="1" cellpadding="10">
            <thead>
                <tr>
                    <th>Identifiant</th>
                    <th>Minimum</th>
                    <th>Maximum</th>
                    <th>Frais</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="Frais" items="${frais}">
                    <tr>
                        <td>${Frais.id}</td>
                        <td>${Frais.minimum}</td>
                        <td>${Frais.maximum}</td>
                        <td>${Frais.frais}</td>
                        <td>
                            <a href="#" class="icon-btn" title="Modifier">
                                <img src="${pageContext.request.contextPath}/images/edit.svg" alt="Edit" class="action-icon">
                            </a>
                            <a href="#" class="icon-btn" title="Supprimer">
                                <img src="${pageContext.request.contextPath}/images/delete.svg" alt="Delete" class="action-icon">
                            </a>
                        </td>
                    
                </c:forEach>
            </tbody>
        </table>
    </div>    

</body>
</html>
