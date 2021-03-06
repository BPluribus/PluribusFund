# PluribusFund

The best crowdsourcing platform for Washington D.C.
You cane wee our webite at: [http://www.pluribusfund.com/](http://www.pluribusfund.com/)

## Setup Development Environment

Welcome to Catarse's source code repository.
Our goal with opening the source code is to stimulate the creation of a community of developers around a high-quality crowdfunding platform.

		$ git clone git@github.com:BPluribus/PluribusFund.git

1. Install [Librarian-Chef](https://github.com/applicationsonline/librarian-chef)

		$ gem install librarian-chef

1. Install cookbooks:

		$ librarian-chef install

1. Run Vagrant

		$ vagrant up

    Attention: You should not be running postgresql on your machine.

1. Copy config/database.sample.yml to config/database.yml

1. Setup the database

		$ rake db:setup && rake db:migrate

1. Run specs

		$ rake

    All tests should pass. If not, see gotchas below.

1. Be Happy!

## Setup Heroku Environment


1. Create the heorku app

		$ heroku create appname

1. Add [Heroku Postgres](https://addons.heroku.com/heroku-postgresql)

		$ heroku addons:add heroku-postgresql

1. Add [PG Backups](https://addons.heroku.com/pgbackups)

		$ heroku addons:add pgbackups:auto-month

1. Push the code

		$ git push heroku master

1. Setup the database

		$ heroku pg:psql

    Run:

    ```
		=> \i db/structure-initial.sql
    ```

    Output example:

    ```
    ---> Connecting to HEROKU_POSTGRESQL_BLUE_URL (DATABASE_URL)
    psql (9.3.2)
    SSL connection (cipher: DHE-RSA-AES256-SHA, bits: 256)
    Type "help" for help.

    d32a8v2hy7a2j4=> \i db/structure-initial.sql
    SET
    SET
    SET
    SET
    SET
    SET
    CREATE EXTENSION
    CREATE EXTENSION
    SET
    SET
    SET
    CREATE TABLE
    CREATE FUNCTION
    ...

    ```

    Run:

    ```
		=> \q
    ```

    Run migrations:

		$ heroku run rake db:migrate

1. Seed the database

		$ heroku run rake db:seed

1. Install [Redis To Go](https://addons.heroku.com/redistogo)

		$ heroku addons:add redistogo

    Attention: Do not use any other redis addon, use Redit To Go.

1. Create users

```bash
$ git clone https://github.com/catarse/catarse.git
$ cd catarse
$ cp config/database.sample.yml config/database.yml
$ vim config/database.yml
# change username/password and save
$ bundle install
$ rake db:create db:migrate db:seed
$ rails server
```

    ```
    puts "Adding Admin user..."

      User.find_or_create_by!(name: "Admin") do |u|
        u.nickname = "Admin"
        u.email = "admin@example.com"
        u.password = "password"
        u.password_confirmation = "password"
        u.remember_me = false
        u.admin = true
      end

    puts "Adding Funder user..."

      User.find_or_create_by!(name: "Funder") do |u|
        u.email = "funder@example.com"
        u.nickname = "Funder"
        u.password = "password"
        u.password_confirmation = "password"
        u.remember_me = false
      end

    puts "Adding Test user..."

      User.find_or_create_by!(name: "Test") do |u|
        u.email = "test@example.com"
        u.nickname = "Test"
        u.password = "password"
        u.password_confirmation = "password"
        u.remember_me = false
      end

    puts "Done!"
    ```

1. Configure environment variables

    Se o seu app estiver rodando em http://pluribusfund-staging.herokuapp.com/, rode:

		$ heroku config:add SUBDOMAINS_REGEXP='^(?!www|pluribusfund-staging)(\w+)'
		$ heroku config:add BASE_URL=http://pluribusfund-staging.herokuapp.com

1. Be Happy!

		$ heroku open

### Development and Deployment Cycle

1. Go to master branch

		$ git checkout master

1. Get the latest modifications:

		$ git pull --rebase

1. Do the modifications you want and commit them saying what the commit do. Example:

		$ git commit -am "changes the text of homepage"

1. Adds Heroku repository (just one time)

		$ git remote add heroku git@heroku.com:pluribusfund-production.git

1. To push the code to the repository and to deploy to staging, run:

		$ rake integrate

    **ATTENTION: You should NOT run `$ git push`. Never! Use the command above!**

### Gotchas

1. To have all specs running ans passing your computer must be configured with timezone. To set it on Mac OS:

		$ sudo systemsetup -settimezone America/Sao_Paulo

1. There are some deprecation warnings, don't worry with that.

### Credits

The first version of pluribusfund website was written by [Rafael Lima](http://rafael.adm.br)

## Catarse

This code war forked from Catarse, the first crowdfunding platform from Brazil

The official repo is https://github.com/catarse/catarse

#### Translations

We hope to support a lot of languages in the future.
So we are willing to accept pull requests with translations to other languages.

Thanks a lot to Daniel Walmsley, from http://purpose.com, for starting the internationalization and beginning the english translation.

### Payment gateways

Currently, we support MoIP, PayPal and WePay through our payment engines. Payment engines are extensions to Catarse that implement a specific payment gateway logic.
The current working engines are:
* MoIP
* PayPal
* WePay

If you have created a different payment engine to Catarse please contact us so we can link your engine here.
If you want to create a payment engine please join our mailing list at http://groups.google.com/group/catarse-dev

## How to contribute with code

Before contributing, take a look at our Roadmap (https://www.pivotaltracker.com/projects/427075) and discuss your plans in our mailing list (http://groups.google.com/group/catarse-dev).

Our pivotal is concerned with user visible features using user stories. But we do have some features not visible to users that are planned such as:
* Turn Catarse into a Rails Engine with customizable views.
* Make a installer script to guide users through initial Catarse configuration.

After that, just fork the project, change what you want, and send us a pull request.

### Best practices (or how to get your pull request accepted faster)

* Follow this style guide: https://github.com/bbatsov/ruby-style-guide
* Create one acceptance tests for each scenario of the feature you are trying to implement.
* Create model and controller tests to keep 100% of code coverage at least in the new parts that you are writing.
* Feel free to add specs to the code that is already in the repository without the proper coverage ;)
* Regard the existing tests for a style guide, we try to use implicit spec subjects and lazy evaluation as often as we can.

### Credits

Author: Daniel Weinmann

Contributors: You know who you are ;) The commit history can help, but the list was getting bigger and pointless to keep in the README.

### License

Copyright (c) 2011 Softa

Licensed under the MIT license (see MIT-LICENSE file)
