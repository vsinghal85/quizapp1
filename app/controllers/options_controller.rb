class OptionsController < ApplicationController
  before_action :set_option, only: [:show, :edit, :update, :destroy]

  # GET /options
  # GET /options.json
  def index
    @options = Option.all
  end

  # GET /options/1
  # GET /options/1.json
  def show
    

   #find the option id
    a=params[:id]
    #find the option
    o=Option.find(a)
    #Find the question id
    z=o.Question.id
    #Find the Question
    question=Question.find(z)
    #Find the Quiz id of the Question
    x=question.Quiz.id
    #Find the actual quiz that the question belongs to
    quiz=Quiz.find(x)
    #This query can also be written in one line as
    #ans=Quiz.find(Question.find(Option.find(params[:id]).Question.id).Quiz.id)        



    return redirect_to "/quizzes/#{x}"
  end

  # GET /options/new
  def new
    @option = Option.new
    @question=params[:question_id]
    
    
  end

  # GET /options/1/edit
  def edit
  end

  # POST /options
  # POST /options.json
  def create
    
    puts option_params
    @option = Option.new(option_params)
    puts @option.Question_id
    
    respond_to do |format|
      if @option.save
        format.html { redirect_to @option, notice: 'Option was successfully created.' }
        format.json { render :show, status: :created, location: @option }
      else
        format.html { render :new }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  
    

  # PATCH/PUT /options/1
  # PATCH/PUT /options/1.json
  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to @option, notice: 'Option was successfully updated.' }
        format.json { render :show, status: :ok, location: @option }
      else
        format.html { render :edit }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /options/1
  # DELETE /options/1.json
  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to options_url, notice: 'Option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option
      @option = Option.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def option_params
      
    
      params.require(:option).permit(:Question_id, :correct, :text)

      
    end
end
