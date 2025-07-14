<!-- form_client.jsp -->
<div id="clientModal" class="modal">
    <div class="modal-content">
        <span class="close-btn" id="closeModal">&times;</span>
        <h3>Add Client</h3>
        <form action="ajouterClient" method="post" class="modal-form">
            <input type="text" name="numtel" placeholder="Phone" required>
            <input type="text" name="nom" placeholder="Name" required>
            <select name="sexe" required>
                <option value="">Select Gender</option>
                <option value="Homme">Male</option>
                <option value="Femme">Female</option>
            </select>
            <input type="number" name="age" placeholder="Age" required>
            <input type="number" step="0.01" name="solde" placeholder="Balance" required>
            <input type="email" name="mail" placeholder="Email" required>
            <button type="submit" class="submit-btn">Add</button>
        </form>
    </div>
</div>


