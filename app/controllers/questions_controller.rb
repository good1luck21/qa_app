class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      if params[:question][:answer].present?
        params[:question][:answer].each do |answer|
          @question.answers.create(content: answer)
        end
      end
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def question_params
      params.require(:question).permit(:content)
    end
end
