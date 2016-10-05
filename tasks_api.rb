require 'sinatra'
require_relative 'task'
require 'json'

get '/api/tasks' do
  if !params['completed'].nil?
    Task.where(completed: params['completed']).to_json
  elsif !params['search'].nil?
    Task.where("description like ?", "%#{params['search']}%").to_json
  elsif !params['sort'].nil?
    Task.order(priority: :asc).to_json
  else
    Task.all.to_json
  end
end

get '/api/tasks/:id' do
  task = Task.find_by_id(params['id'])
  if task.nil?
    halt(404)
  end
  task.to_json(methods: :description)
end

post '/api/tasks' do
  Task.create(description: params['description'], priority: params['priority'], completed: params['completed']).to_json #if i have to_json here, it won't save; get an error that it's an undefined method on a string object
  status 201
end

put '/api/tasks/:id' do
  t = Task.find_by(id: params[:id])
  if t.nil?
    halt(404)
  end
	t.update(
		description: 	params['description'],
    priority: params['priority'],
    completed: params['completed']
		).to_json
end

delete '/api/tasks/:id' do
  t = Task.find_by(id: params[:id])
  if t.nil?
    halt(404)
  end
  t.destroy
end
