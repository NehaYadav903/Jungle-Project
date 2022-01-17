class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["J_USERNAME"], password: ENV["J_PASSWORD"]

  def show
    @category = Category.all
    @product = Product.all
  end
end
