class Admin::CategoriesController < ApplicationController
	USER_NAME, PASSWORD = ENV['USER_NAME'], ENV['PASSWORD']
  
  before_filter :authenticate
	
	def index
    @categories = Category.order(id: :desc).all
  end
 
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    
  

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
	end

  private

  def	category_params
    params.require(:category).permit(
      :name,
    )
  end

	def authenticate
    authenticate_or_request_with_http_basic do |username, password| 
      username == USER_NAME && password == PASSWORD
    end
  end
end
