class StorehouseController < ApplicationController
  def index
  	@food = Food.new
  	@meal = Meal.new
  end
end
