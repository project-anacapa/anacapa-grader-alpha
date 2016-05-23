var AdminPanel = function() {
    var self = this;
    $('.admin_toggle').change(function() {
        self.togglePrivileges(this, $(this).data('url'), 'admin', this.checked);
    });
    $('.instructor_toggle').change(function() {
        console.log('stub');
    });

    this.togglePrivileges = function(element, url, role, privilege) {
        $.ajax({
            url: url,
            type: 'POST',
            data: {toggle_to: privilege},
            success: function(data) {
                console.log(data);
            },
            error: function(err) {
                console.log('errror');
                console.log(err);
            }
        });
    }
};

$(document).ready(AdminPanel);
$(document).on('page:load', AdminPanel);
