<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Static Data Table</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/transactions_page.css">
</head>
<body>

    <h2>Frais de transactions</h2>

    <div class="panel">
        <div class="panel-header">
            <div class="toggle-switch">
                <input type="radio" id="envoiToggle" name="transactionToggle" class="toggle-input" checked>
                <label for="envoiToggle" class="toggle-label">Envoi</label>

                <input type="radio" id="receptionToggle" name="transactionToggle" class="toggle-input">
                <label for="receptionToggle" class="toggle-label">Récéption</label>
            </div>
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
                <c:forEach var="transaction" items="${transactions}">
                    <tr>
                        <td>${transaction.id}</td>
                        <td>${transaction.min}</td>
                        <td>${transaction.max}</td>
                        <td>${transaction.frais}</td>
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