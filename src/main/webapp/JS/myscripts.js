$(function() { 

    let editStatus = false;
    
    $('#editBtn').click(function() {
        if (editStatus === false) {
            $("#profile-detail").hide();
            $("#profile-edit").show();
            editStatus = true;
            $(this).text("Back");
        } else {
            $("#profile-detail").show();
            $("#profile-edit").hide();
            editStatus = false;
            $(this).text("Edit");
        }
    });
});
