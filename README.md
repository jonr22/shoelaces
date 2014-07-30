# Shoelaces

Shoelaces is a base Rails application forked from
[Suspenders](https://github.com/thoughtbot/suspenders) by
[thoughtbot](http://thoughtbot.com).

It's almost exactly the same as Suspenders, however the main difference
is the use of [Bootstrap](http://getbootstrap.com/) instead of
[Bourbon](http://bourbon.io/).

The code is largely all from [thoughtbot](http://thoughtbot.com), so
this project owes a big thanks to their fantastic open source contributions.

Installation
------------

First install the shoelaces gem:

    gem install shoelaces

Then run:

    shoelaces projectname

This will create a Rails app in `projectname` using the latest version of Rails.

Gemfile
-------

To see the latest and greatest gems, look at Shoelaces'
[Gemfile](templates/Gemfile.erb), which will be appended to the default
generated projectname/Gemfile.

It includes application gems like:

* [Airbrake](https://github.com/airbrake/airbrake) for exception notification
* [Boostrap](https://github.com/twbs/bootstrap-sass) for bootstrap
* [Delayed Job](https://github.com/collectiveidea/delayed_job) for background
  processing
* [Email Validator](https://github.com/balexand/email_validator) for email
  validation
* [High Voltage](https://github.com/thoughtbot/high_voltage) for static pages
* [jQuery Rails](https://github.com/rails/jquery-rails) for jQuery
* [Postgres](https://github.com/ged/ruby-pg) for access to the Postgres database
* [Rack Timeout](https://github.com/kch/rack-timeout) to abort requests that are
  taking too long
* [Recipient Interceptor](https://github.com/croaky/recipient_interceptor) to
  avoid accidentally sending emails to real people from staging
* [Simple Form](https://github.com/plataformatec/simple_form) for form markup
  and style
* [Title](https://github.com/calebthompson/title) for storing titles in
  translations
* [Unicorn](https://github.com/defunkt/unicorn) to serve HTTP requests

And gems only for staging and production like:

* [New Relic RPM](https://github.com/newrelic/rpm) for monitoring performance
* [Rails 12 Factor](https://github.com/heroku/rails_12factor) to make running
  Rails 4 apps easier on Heroku

And development gems like:

* [Dotenv](https://github.com/bkeepers/dotenv) for loading environment variables
* [Pry Rails](https://github.com/rweng/pry-rails) for interactively exploring
  objects
* [ByeBug](https://github.com/deivid-rodriguez/byebug) for interactively
  debugging behavior
* [Spring](https://github.com/rails/spring) for fast Rails actions via
  pre-loading

And testing gems like:

* [Capybara](https://github.com/jnicklas/capybara) and
  [Capybara Webkit](https://github.com/thoughtbot/capybara-webkit) for
  integration testing
* [Factory Girl](https://github.com/thoughtbot/factory_girl) for test data
* [Formulaic](https://github.com/thoughtbot/formulaic) for integration testing
  HTML forms
* [RSpec](https://github.com/rspec/rspec) for unit testing
* [RSpec Mocks](https://github.com/rspec/rspec-mocks) for stubbing and spying
* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) for common
  RSpec matchers
* [Timecop](https://github.com/jtrupiano/timecop-console) for testing time

Other goodies
-------------

Shoelaces also comes with:

* The [`./bin/setup`][bin] convention for new developer setup
* Rails' flashes set up and in application layout
* A few nice time formats set up for localization
* `Rack::Deflater` to [compress responses with Gzip][compress]
* [Fast-failing factories][fast]
* A [low database connection pool limit][pool]
* [Safe binstubs][binstub]
* [t() and l() in specs without prefixing with I18n][i18n]
* An automatically-created `SECRET_KEY_BASE` environment variable in all
  environments.
* Configuration for [Travis Pro][travis] continuous integration.
* The analytics adapter [Segment.io][segment] (and therefore config for Google
  Analytics, Intercom, Facebook Ads, Twitter Ads, etc.).
* A few static pages included home, about, and contact with some basic styling

[bin]: http://robots.thoughtbot.com/bin-setup
[compress]: http://robots.thoughtbot.com/content-compression-with-rack-deflater/
[fast]: http://robots.thoughtbot.com/testing-your-factories-first
[pool]: https://devcenter.heroku.com/articles/concurrency-and-database-connections
[binstub]: https://github.com/thoughtbot/suspenders/pull/282
[i18n]: https://github.com/thoughtbot/suspenders/pull/304
[travis]: http://docs.travis-ci.com/user/travis-pro/
[segment]: https://segment.io

Heroku
------

You can optionally create Heroku staging and production apps:

    shoelaces app --heroku true

This:

* Creates a staging and production Heroku app
* Sets them as `staging` and `production` Git remotes
* Configures staging with `RACK_ENV` and `RAILS_ENV` environment variables set
  to `staging`

Git
---

This will initialize a new git repository for your Rails app. You can
bypass this with the `--skip-git` option:

    shoelaces app --skip-git true

GitHub
------

You can optionally create a GitHub repository for the suspended Rails app. It
requires that you have [Hub](https://github.com/github/hub) on your system:

    curl http://hub.github.com/standalone -sLo ~/bin/hub && chmod +x ~/bin/hub
    shoelaces app --github organization/project

This has the same effect as running:

    hub create organization/project

Port
----

You can manually set the port for the application to use instead of using the
random selection:

    shoelaces app --port 4040

Dependencies
------------

Shoelaces requires the latest version of Ruby.

Some gems included in Shoelaces have native extensions. You should have GCC
installed on your machine before generating an app with Shoelaces.

Use [OS X GCC Installer](https://github.com/kennethreitz/osx-gcc-installer/) for
Snow Leopard (OS X 10.6).

Use [Command Line Tools for XCode](https://developer.apple.com/downloads/index.action)
for Lion (OS X 10.7) or Mountain Lion (OS X 10.8).

We use [Capybara Webkit](https://github.com/thoughtbot/capybara-webkit) for
full-stack JavaScript integration testing. It requires QT. Instructions for
installing QT are
[here](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit).

PostgreSQL needs to be installed and running for the `db:create` rake task.

Issues
------

If you have problems, please create a
[GitHub Issue](https://github.com/jonr22/shoelaces/issues).

Contributing
------------

To update Shoelaces' Ruby version, change `.ruby-version` and `.travis.yml`.

Please see [CONTRIBUTING.md](CONTRIBUTING.md) for further details.

Credits
-------

All credit should go to the guys at thoughtbot for creating and
maintaining Suspenders:

![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

Suspenders is maintained and funded by
[thoughtbot, inc](http://thoughtbot.com/community).

The names and logos for thoughtbot are trademarks of thoughtbot, inc.

License
-------

I don't know much about licensing, but I've included the Suspenders license in
case:

Suspenders is Copyright © 2008-2014 thoughtbot. It is free software, and may be
redistributed under the terms specified in the LICENSE file.
