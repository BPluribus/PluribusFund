# config/initializers/jumpup-heroku.rb
Jumpup::Heroku.configure do |config|
  config.app = 'pluribusfund-production'
end if Rails.env.development?