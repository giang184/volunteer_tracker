require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require 'pry'
require "pg"
require('./lib/project')
require('./lib/volunteer')

DB = PG.connect({ dbname: 'volunteer_tracker', host: 'db', user: 'postgres', password: 'password' })

get '/' do
  redirect to('/projects')
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

get ('/trains/new') do
  erb(:new_project)
end