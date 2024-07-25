/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
    var addModal = document.getElementById("myModal");
    var editModal = document.getElementById("editModal");

    var addForm = document.getElementById("deptForm");
    var editForm = document.getElementById("editForm");

    var addButton = document.getElementById("openModalBtn");
    var addClose = addModal.getElementsByClassName("close")[0];
    var editClose = editModal.getElementsByClassName("close")[0];

    // Open Add Modal
    addButton.onclick = function() {
        addForm.reset();
        addModal.style.display = "block";
    }

    // Close Add Modal
    addClose.onclick = function() {
        addModal.style.display = "none";
    }

    // Close Edit Modal
    editClose.onclick = function() {
        editModal.style.display = "none";
    }

    // Close modals when clicking outside
    window.onclick = function(event) {
        if (event.target == addModal) {
            addModal.style.display = "none";
        }
        if (event.target == editModal) {
            editModal.style.display = "none";
        }
    }

    // Handle Add Form submission
    $('#deptForm').on('submit', function(event) {
        event.preventDefault();
        var formData = $(this).serialize();

        $.ajax({
            url: 'add_dept.jsp',
            method: 'POST',
            data: formData,
            success: function(response) {
              //  alert(response);
                alert('Department added successfully!');
                addModal.style.display = "none";
                location.reload();
            },
            error: function(xhr, status, error) {ss
               // alert(error);
                alert('Error adding department');
            }
        });
    });

    // Handle Edit Form submission
    $('#editForm').on('submit', function(event) {
        event.preventDefault();
        var formData = $(this).serialize();

        $.ajax({
            url: 'UpdateDepartmentServlet',
            method: 'POST',
            data: formData,
            success: function(response) {
                alert('Department updated successfully!');
                editModal.style.display = "none";
                location.reload();
            },
            error: function(xhr, status, error) {
                alert('Error updating department');
            }
        });
    });

    // Handle edit button click
    $(document).on('click', '.editButton', function() {
        var row = $(this).closest('tr');
        var id = row.find('td:eq(0)').text();
        var name = row.find('td:eq(1)').text();
        var description = row.find('td:eq(2)').text();
        var productionUnits = row.find('td:eq(3)').text();
        var targetDate = row.find('td:eq(4)').text();
        var targetUnits = row.find('td:eq(5)').text();

        $('#editId').val(id);
        $('#editName').val(name);
        $('#editDescription').val(description);
        $('#editProductionUnits').val(productionUnits);
        $('#editTargetDate').val(targetDate);
        $('#editTargetUnits').val(targetUnits);

        editModal.style.display = "block";
    });

    // Handle delete button click
    $(document).on('click', '.deleteButton', function() {
        if (confirm('Are you sure you want to delete this department?')) {
            var row = $(this).closest('tr');
            var deleteId = row.find('td:eq(0)').text();

            $.ajax({
                url: 'DeleteDepartmentServlet',
                method: 'POST',
                data: { deptId: deleteId },
                success: function(response) {
                    alert('Department deleted successfully!');
                    location.reload();
                },
                error: function(xhr, status, error) {
                    alert('Error deleting department');
                }
            });
        }
    });
});
