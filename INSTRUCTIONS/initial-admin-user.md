# To set the initial admin user

The initial admin user is set via the rake task `super_admin`

This also works for granting/revoking any admin access via rake task (rather than via the app).

It is done from a terminal prompt.  
* When running on localhost, it simply a rake task: "bundle exec rake super_admin:help"
* When running on Heroku, use the heroku toolbelts "heroku run --app APP rake super_admin:help"

The `super_admin:help` task lists the other tasks.  Here is a complete list:

```
169-231-86-120:~ pconrad$ heroku run --app anacapa-grader-alpha-pr-11 rake super_admin:help
Running rake super_admin:help on ⬢ anacapa-grader-alpha-pr-11... up, run.2645
 to list all users           rake super_admin:list_users   
 to list all admins          rake super_admin:list_admins   
 to list all non-admins      rake super_admin:list_non_admins   
 to make a user an admin     rake super_admin:grant_admin_permission[< user's id >]   
 to revoke admin privleges   rake super_admin:revoke_admin_permission[< user's id >]   
169-231-86-120:~ pconrad$ 
```

Here is an example of setting the initial admin user:

```
169-231-86-120:~ pconrad$ heroku run --app anacapa-grader-alpha-pr-11 rake super_admin:list_users
Running rake super_admin:list_users on ⬢ anacapa-grader-alpha-pr-11... up, run.4731
+---------------------+--------------+----+----------+
| email               | name         | id | is_admin |
+---------------------+--------------+----+----------+
| pconrad@cs.ucsb.edu | Phill Conrad | 1  | false    |
+---------------------+--------------+----+----------+
1 row in set
For syntax of how to grant or revoke admin privs, type rake super_admin:help
169-231-86-120:~ pconrad$ heroku run --app anacapa-grader-alpha-pr-11 rake super_admin:grant_admin_permission[1]
Running rake super_admin:grant_admin_permission[1] on ⬢ anacapa-grader-alpha-pr-11... up, run.5038
+---------------------+--------------+----+----------+
| email               | name         | id | is_admin |
+---------------------+--------------+----+----------+
| pconrad@cs.ucsb.edu | Phill Conrad | 1  | true     |
+---------------------+--------------+----+----------+
1 row in set
169-231-86-120:~ pconrad$ 
```

# Is this the best way to solve this problem of configuring the initial admin user?

Maybe, maybe not.

However this serves another important function in our ecosystem: an example of how to 
wrap specific database manipulations into a rake task.   This may come in handy if/when we want to build applications 
where certain  administrative functions are needed but we don't want or need a full web panel for those, and we want something a bit more controlled than hacking at a production database in raw Sequel or even in interactive ruby.
