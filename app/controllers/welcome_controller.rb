class WelcomeController < ApplicationController
	skip_before_action :verify_authenticity_token
	
  def index
    @quiz=Quiz.find(params[:quiz_id])
  	@questions=Question.all
  end

  def evaluate_score
    
  	@totalscore=0
    @quiz_id=params[:quiz_id]
    @quiz=Quiz.find(@quiz_id)
    @questions=Question.all
   @questions.each do |question|
   x=params[question.id.to_s]
   
  if x!=nil 
   	option=Option.find(x)
   	if option.correct
   	@totalscore=@totalscore+1
    end
  end
 end
 end	
end
