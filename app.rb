require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload('lib/**/*.rb')
require('./lib/question')
require('./lib/survey')
require('pry')
require('pg')

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

post('/surveys') do
  @surveys = Survey.all()
  survey_name = params.fetch('survey_name')
  new_survey = Survey.create({:name => survey_name})
  erb(:index)
end

get('/surveys/:id/questions') do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:questions)
end

patch('/surveys/:id/questions') do
  @questions = Question.all()
  @survey = Survey.find(params.fetch("id").to_i())
  name = params.fetch("name")
  @survey.update({:name => name})
  erb(:questions)
end

delete('/surveys/:id/questions') do
  @questions = Question.all()
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.delete()
  @surveys = Survey.all()
  erb(:index)
end

post('/surveys/:id/questions') do
  q_text = params.fetch('q_text')
  survey_id = params.fetch('survey_id').to_i()
  @survey = Survey.find(survey_id)
  new_question = Question.create({:q_text => q_text, :survey_id => survey_id})
  erb(:questions)
end

patch('/surveys/:id/questions/:q_id') do
  @questions = Question.all()
  @survey = Survey.find(params.fetch("id").to_i())
  @question = Question.find(params.fetch("q_id").to_i())
  q_text = params.fetch("q_text")
  @question.update({:q_text => q_text})
  erb(:questions)
end

delete('/surveys/:id/questions/:q_id') do
  @survey = Survey.find(params.fetch("id").to_i())
  @question = Question.find(params.fetch("q_id").to_i())
  @question.delete()
  @questions = Question.all()
  erb(:questions)
end

get('/surveys/:id/questions/:q_id/edit') do
  @survey = Survey.find(params.fetch("id").to_i())
  @question = Question.find(params.fetch("q_id").to_i())
  erb(:question_edit)
end
