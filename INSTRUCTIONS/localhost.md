# To run this web application on localhost

1. Fork and/or clone this repo
1. Ensure you have `postgresql` [installed](https://wiki.postgresql.org/wiki/Detailed_installation_guides) and running on localhost
1. Execute `bundle install --path vendor/bundle`
  * If you have a problem installing `pg`, try running `sudo env ARCHFLAGS='-arch x86_64' gem install pg`
1. The [`SAMPLE.env`](SAMPLE.env) file in the project root should be copied to `.env` and edited. 
  * You can run `cp SAMPLE.env .env`
  * Populate the `GITHUB_CLIENT_ID` and `GITHUB_CLIENT_SECRET` with your own Github App configurations (see [/INSTRUCTIONS/github-oauth-configuration.md](/INSTRUCTIONS/github-oauth-configuration.md)
  * The file `.env` is ignored via the [`.gitignore`](.gitignore) file, since it contains these values that should be kept confidential.
1. If you are running this for the first time, run `bundle exec rake db:create`
1. Execute `bundle exec rake db:migrate`
1. Execute `bundle exec rails s`
1. The rails server should now be running on [http://localhost:3000](http://localhost:3000)
