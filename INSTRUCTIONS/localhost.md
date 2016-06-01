# Configuration for running on `localhost`

1. You will need a postgres database running.
2. If you have not yet created the database for the application, you will need to run `bundle exec db:create` 
3. You may need to run `bundle exec db:migrate`
4. To enable github OAuth authentication, the [`SAMPLE.env`](SAMPLE.env) file should be copied to `.env` and edited. The values for `GITHUB_CLIENT_ID` and `GITHUB_CLIENT_SECRET` come from the OAuth Applications tab on the github settings for a user or organization.   The file `.env` is ignored via the [`.gitignore`](.gitignore) file, since it contains these values that should be kept confidential.
5. You then need to run `. .env` at the command line before starting `bundle exec rails s`
