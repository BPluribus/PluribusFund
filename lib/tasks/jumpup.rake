namespace :jumpup do
  namespace :heroku do
    task :open do
      system('heroku open')
    end
  end
end

INTEGRATION_TASKS = %w(
  jumpup:heroku:start
  jumpup:start
  jumpup:bundle_install
  db:migrate
  spec
  jumpup:finish
  jumpup:heroku:finish
  jumpup:heroku:open
)