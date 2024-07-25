/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


// Function to display a confirmation popup
function confirmAction(action) {
    return confirm("Are you sure you want to " + action + " this department?");
}

// Add event listener to the add button
document.getElementById("addButton").addEventListener("click", function() {
    if (confirmAction("add")) {
        // Submit the form for adding a department
        document.getElementById("addForm").submit();
    }
});

// Add event listener to the delete button
document.getElementById("deleteButton").addEventListener("click", function() {
    if (confirmAction("delete")) {
        // Submit the form for deleting a department
        document.getElementById("deleteForm").submit();
    }
});

// Add event listener to the update button
document.getElementById("updateButton").addEventListener("click", function() {
    if (confirmAction("update")) {
        // Submit the form for updating a department
        document.getElementById("updateForm").submit();
    }
});



