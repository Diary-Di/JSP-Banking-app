<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <td>${client.numtel_client}</td>
                        <td>${client.nom_client}</td>

                        <td>
                            <c:choose>
                                <c:when test="${client.sexe_client == 'M'}">Masculin</c:when>
                                <c:when test="${client.sexe_client == 'F'}">Féminin</c:when>
                                <c:otherwise>Non spécifié</c:otherwise>
                            </c:choose>
                        </td>

                        <td>${client.age_client}</td>
                        <td>${client.solde_client}</td>
                        <td>${client.mail_client}</td>
                        <td>
                            <button type="button"
                                class="icon-btn btn-edit"
                                title="Modifier"
                                data-numtel="${client.numtel_client}"
                                data-nom="${client.nom_client}"
                                data-sexe="${client.sexe_client}"
                                data-age="${client.age_client}"
                                data-solde="${client.solde_client}"
                                data-mail="${client.mail_client}">
                            <img src="${pageContext.request.contextPath}/images/edit.svg" alt="Modifier" class="action-icon">
                        </button>

                            <!-- Supprimer button with confirmation -->
                            <a href="#" class="btn-delete" data-numtel="${client.numtel_client}" title="Supprimer">
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
    
            <form
                id="clientForm"
                action="${pageContext.request.contextPath}/ClientServlet"
                method="post"
                class="modal-form"
                data-list-url="${pageContext.request.contextPath}/Controller?page=client">
    
                <h3 id="formTitle">Ajouter un client</h3>
    
                <!-- Hidden flags for UPDATE mode (set/reset by JS) -->
                <input type="hidden" name="isEdit" id="isEdit" value="" />
    
                <!-- Téléphone (prefix + number combined server-side) -->
                <input type="hidden" name="fullNumTel" id="fullNumTel" value="" />
                
                <label for="numtel">Téléphone</label>
                <div class="phone-input-group">
                    <select name="prefix" id="prefix" required>
                        <option value="034">034</option>
                        <option value="037">037</option>
                    </select>
                    <!-- 7 digits example; adjust pattern/maxlength as needed -->
                    <input type="text"
                           name="numtel"
                           id="numtel"
                           placeholder="1234567"
                           pattern="\d{7}"
                           maxlength="7"
                           required>
                </div>
    
                <!-- Nom -->
                <label for="nom">Nom</label>
                <input type="text" name="nom" id="nom" placeholder="Nom" required>
    
                <!-- Sexe -->
                <label for="sexe">Sexe</label>
                <select name="sexe" id="sexe" required>
                    <option value="">Sélectionner le sexe</option>
                    <option value="M">Masculin</option>
                    <option value="F">Féminin</option>
                </select>
    
                <!-- Âge -->
                <label for="age">Âge</label>
                <input type="number" name="age" id="age" placeholder="Âge" min="0" required>
    
                <!-- Solde (INTEGER) -->
                <label for="solde">Solde</label>
                <input type="number" step="1" name="solde" id="solde" placeholder="Solde" required>
    
                <!-- Email -->
                <label for="mail">Adresse email</label>
                <input type="email" name="mail" id="mail" placeholder="Adresse email" required>
    
                <button type="submit" class="submit-btn">Ajouter</button>
            </form>
        </div>
    </div>
    
    
    
</body>
</html>
