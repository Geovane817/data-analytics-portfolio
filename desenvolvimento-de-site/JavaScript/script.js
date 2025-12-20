// JavaScript to toggle dropdown menu visibility
document.getElementById("dropdownButton").addEventListener("click", function(event) {
    // Prevent the default link behavior
    event.preventDefault();

    // Get the dropdown menu content
    var dropdownContent = document.getElementById("dropdownContent");

    // Toggle visibility
    if (dropdownContent.style.display === "block") {
        dropdownContent.style.display = "none";  // Hide the dropdown
    } else {
        dropdownContent.style.display = "block";  // Show the dropdown
    }
});

// Optionally, close the dropdown if clicked anywhere else on the page
document.addEventListener("click", function(event) {
    var dropdownContent = document.getElementById("dropdownContent");
    var dropdownButton = document.getElementById("dropdownButton");

    if (!dropdownButton.contains(event.target) && !dropdownContent.contains(event.target)) {
        dropdownContent.style.display = "none";  // Hide dropdown if clicked outside
    }
});
