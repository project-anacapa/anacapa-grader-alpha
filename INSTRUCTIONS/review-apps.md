# Review Apps on Heroku

We have set up an integration with Heroku so that each time there is a pull request, a "review app" can be created.

This fires up a heroku app that is running the version of the code in the pull request.

This is mostly an automatic process, but there is one manual configuration step, namely the OAuth configuration.   If you fail to do this, the symptom you get is a redirect error when trying to authenticate via OAuth.

To do the necessary OAuth configuration, you first need to be a collaborator on the Dashboard for the Heroku application [anacapa-grader-alpha](https://dashboard.heroku.com/apps/anacapa-grader-alpha/resources)

You must then visit one or the other of these pages to obtain values for `GITHUB_CLIENT_ID` and `GITHUB_CLIENT_SECRET` that will be associated with the callback URL for your review app.

* To create under your personal github account: https://github.com/settings/developers
* To create under the project-anacapa organization: https://github.com/organizations/project-anacapa/settings/applications

You must then click on Deploy, then the Pipeline, then you will see the review apps.  It looks, for example, like this:

![Review Apps Example](/INSTRUCTIONS/IMAGES/review-app-example.png "Example Review App Dashboard")

The review apps appear on the left hand side.  Click on the one that corresponds to the pull request you want to review, and bring up its dashboard.  You then need to access "Settings" and "Reveal Config Vars", and set the `GITHUB_CLIENT_ID` and `GITHUB_CLIENT_SECRET` as explained in the [Instructions for configuration OAuth](/INSTRUCTIONS/oauth-configuration.md).

There may be some caching involved, so be patient if the redirect url does not respond right away.  A delay of 1-3 minutes is normal.
