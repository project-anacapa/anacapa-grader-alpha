var AdminPanel = function() {
    var self = this;
    $('.admin_toggle').change(function() {
        self.togglePrivileges(this, $(this).data('url'), 'site_admin', this.checked);
    });
    $('.instructor_toggle').change(function() {
        self.togglePrivileges(this, $(this).data('url'), 'site_instructor', this.checked);
    });

    this.togglePrivileges = function(element, url, role, privilege) {
        $.ajax({
            url: url,
            type: privilege ? 'PUT' : 'DELETE',
            success: function() {
                console.log("success");
            },
            error: function(err) {
                console.log('error');
                console.log(err);
            }
        });
    }
};

$(document).ready(AdminPanel);
$(document).on('page:load', AdminPanel);
