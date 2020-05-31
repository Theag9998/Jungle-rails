class Admin::DashboardController < ApplicationController
  USER_NAME, PASSWORD = ENV['USER_NAME'], ENV['PASSWORD']
  
  before_filter :authenticate

  def show
    @product_count = Product.count
    @category_count = Category.count
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password| 
      username == USER_NAME && password == PASSWORD
    end
  end
end
