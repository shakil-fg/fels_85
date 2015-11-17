class WordsController < ApplicationController
  before_action :logged_in_user, :load_dependencies

  def index
  end

  private
  def load_dependencies
    @categories = Category.all
    unless params[:category_id].nil?
      @category = Category.find params[:category_id]
      @words = generate_words
    end
  end

  def generate_words
    if params[:word_stat] == "not_learned"
      Word.not_learned_words(current_user).filter_category(@category.id)
    elsif params[:word_stat] == "learned"
      Word.learned_words(current_user).filter_category(@category.id)
    else
      Word.filter_category(@category.id)
    end
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t :log_in_flash
      redirect_to login_url
    end
  end
end