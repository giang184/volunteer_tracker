require 'rspec'
require 'pg'
require 'pry'
require 'project'
require 'volunteer'

DB = PG.connect({ dbname: 'volunteer_tracker_test', host: 'db', user: 'postgres', password: 'password' })

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM projects *;")
    DB.exec("DELETE FROM volunteers *;")
  end
end
