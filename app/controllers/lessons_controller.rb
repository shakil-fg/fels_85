class LessonsController < ApplicationController
  before_action :load_user, only: [:create]
  before_action :load_lesson, only: [:update]

  def create
    question_limit = 20
    words = Word.not_learned_words(@user).filter_category(params["category_id"]).limit(question_limit)
    if words.count < question_limit
      render :show
    else
      @lesson = @user.lessons.new category_id: params["category_id"]
      words.each {|word| @lesson.lesson_words.build word_id: word.id }
      @lesson.save!
      redirect_to @lesson
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def update
    if @lesson.update_attributes lesson_params
      @lesson.result = @lesson.word_answers.correct.count
      @lesson.save!
      flash.now[:success] = t :lesson_updated
      params[:generate_result]=1
      render :show
    else
      flash[:danger] = t :lesson_error
      redirect_to categories_path
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit(:id, lesson_words_attributes: [:id, :word_answer_id])
  end

  def load_lesson
    @lesson = Lesson.find(params[:id])
  end

  def load_user
    @user = current_user
  end
end