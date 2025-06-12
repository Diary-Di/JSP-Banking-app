<!-- filepath: /d:/L3 project/JSP/Mobile_money/src/main/webapp/WEB-INF/pages/form_client.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Client Registration Form</title>
</head>
<body>
    <h1>Client Registration Form</h1>
    <form action="processClient.jsp" method="post">
        <!-- Field 1: Full Name -->
        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" required>
        <br><br>

        <!-- Field 2: Email -->
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <br><br>

        <!-- Field 3: Phone Number -->
        <label for="phone">Phone Number:</label>
        <input type="tel" id="phone" name="phone" required>
        <br><br>

        <!-- Field 4: Address -->
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>
        <br><br>

        <!-- Field 5: Date of Birth -->
        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" required>
        <br><br>

        <!-- Field 6: Gender -->
        <label for="gender">Gender:</label>
        <select id="gender" name="gender" required>
            <option value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
        </select>
        <br><br>

        <!-- Submit Button -->
        <button type="submit">Submit</button>
    </form>
</body>
</html>