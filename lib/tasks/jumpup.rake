INTEGRATION_TASKS = %w(
  jumpup:heroku:start
  jumpup:start
  jumpup:bundle_install
  db:migrate
  spec
  jumpup:finish
  jumpup:heroku:finish
)