<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Static Data Table</title>
    
</head>
<body>

    <h2>Employee Information</h2>

<div class="table-actions">
    <button class="new-btn">Nouveau</button>
</div>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Department</th>
            <th>Role</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>101</td>
            <td>Alice</td>
            <td>alice@example.com</td>
            <td>HR</td>
            <td>Manager</td>
            <td>Active</td>
            <td>
                <button class="edit-btn">Modifier</button>
                <button class="delete-btn">Supprimer</button>
            </td>
        </tr>
        <tr>
            <td>102</td>
            <td>Bob</td>
            <td>bob@example.com</td>
            <td>Finance</td>
            <td>Analyst</td>
            <td>Active</td>
            <td>
                <button class="edit-btn">Modifier</button>
                <button class="delete-btn">Supprimer</button>
            </td>
        </tr>
        <tr>
            <td>103</td>
            <td>Charlie</td>
            <td>charlie@example.com</td>
            <td>IT</td>
            <td>Developer</td>
            <td>Inactive</td>
            <td>
                <button class="edit-btn">Modifier</button>
                <button class="delete-btn">Supprimer</button>
            </td>
        </tr>
    </tbody>
</table>
    
    </body>
    </html>
