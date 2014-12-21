Simple project
-

Third-party service badges

[![Build Status](https://semaphoreapp.com/api/v1/projects/e3a4d9a1-82f7-48b0-9aa2-74eeb6878aca/298773/shields_badge.svg)](https://semaphoreapp.com/DamirMakhmutov/simple-project)
[![Test Coverage](https://codeclimate.com/github/DamirMakhmutov/simple-project/badges/coverage.svg)](https://codeclimate.com/github/DamirMakhmutov/simple-project)
[![Code Climate](https://codeclimate.com/github/DamirMakhmutov/simple-project/badges/gpa.svg)](https://codeclimate.com/github/DamirMakhmutov/simple-project)


Information about ruby and rails versions.

- PostgreSQL 9.4
  - `brew install postgres`
- Ruby 2.1.2
  - `rbenv install 2.1.2`
- Rails 4.1.7

Quick Start
-

Clone this repo:

```
git clone https://github.com/DamirMakhmutov/simlpe-project.git
cd simple-project
```

Run bootstrap script

```
bin/bootstrap
```

Initializers
-

* `01_config.rb` - shortcut for getting application config with `app_config`
* `mailer.rb` - setup default hosts for mailer from configuration
* `requires.rb` - automatically requires everything in lib/ & lib/extensions

Scripts
-

* `bin/bootstrap` - setup required gems and migrate db if needed
* `bin/quality` - run brakeman and rails_best_practices for the app
* `bin/ci` - should be used in the CI to run specs

Continuous Integration
[Semaphore](https://semaphoreapp.com/DamirMakhmutov/simple-project)
[CodeClimate](https://codeclimate.com/github/DamirMakhmutov/simple-project).

Staging
http://my-simple-project.herokuapp.com