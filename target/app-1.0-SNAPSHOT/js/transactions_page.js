document.addEventListener("DOMContentLoaded", function () {
    const categoryButtons = document.querySelectorAll(".category-btn");

    categoryButtons.forEach(button => {
        button.addEventListener("click", function () {
            // Remove the active class from all buttons
            categoryButtons.forEach(btn => btn.classList.remove("active"));

            // Add the active class to the clicked button
            this.classList.add("active");
        });
    });
});