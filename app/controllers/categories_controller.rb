class CategoriesController < ApplicationController
  before_action :load_dependency, only: [:index]

  def index
  end

  private

  def load_dependency
    @categories = Category.all
  end
end
