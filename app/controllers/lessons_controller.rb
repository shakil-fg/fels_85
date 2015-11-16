class LessonsController < ApplicationController
  before_action :load_dependency, only: [:index]


  def create
    @category = Category.find params[:category_id]
  end

  private

  def load_dependency
    @categories = Category.all
  end
end
