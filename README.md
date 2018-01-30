# Rails Girls Costa Rica


System Dependencies
-------------------
- Ruby 2.5.0 (install with [rvm](https://rvm.io/))
- Rails 5.1.4
- Bundler (`gem install bundler`)
- Rubygems (`bundle install/update`)
- PostgreSQL (`ENV VAR`)

* Configuration
  Using figaro take a look https://github.com/laserlemon/figaro

* Database initialization
  ```use <%= ENV["DATABASE_URL"] %>```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions We are using Codeship(Codeship is a Continuous Integration Platform in the cloud.) https://codeship.com/
