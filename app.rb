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

get ('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  erb(:project)
end

get ('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

patch ('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update({:title => params[:title]})
  erb(:project)
end

delete ('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.delete()
  redirect to('/')
end

post ('/projects/:id/volunteers') do
  @project = Project.find(params[:id].to_i())
  volunteer = Volunteer.new({:name => params[:volunteer_name], :project_id => @project.id, :id => nil})
  volunteer.save()
  erb(:project)
end

# get ('/trains/:id/cities/:city_id') do
#   @city = City.find(params[:city_id].to_i())
#   redirect to ("/cities/#{params[:city_id].to_i()}")
# end