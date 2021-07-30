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

post ('/projects') do
  title = params[:title]
  project = Project.new({:title => title, :id => nil})
  project.save
  redirect to('/')
end