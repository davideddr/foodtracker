class MealsController < ApplicationController
	
	def index
		@meals = current_user.meals
		render :index, layout: false	
	end
	def show
		@meal=Meal.find(params[:id])
	end
	def new
		@meal = Meal.new
		@meal.foods = [Food.new,Food.new]
		render :new, layout: false	
	end
	def edit
		@meal = Meal.find(params[:id])
	end
	def create
		@meal=Meal.new(meal_params)
		@meal.user_id = current_user.id
		if @meal.save
			flash[:notice] = "Meal successfully saved"
			redirect_to '/'
		else 
			render 'new'
		end
	end
	def update
		@meal = Meal.find(params[:id])
		if @meal.update(meal_params)
			flash[:notice] = "Meal successfully update"
			redirect_to '/'
		else
			render 'edit'
		end
	end
	def destroy
		@meal = Meal.find(params[:id])
		@meal.destroy
		redirect_to @meal
	end

	private
	def meal_params
		params.require(:meal).permit(:name, :description, foods_attributes: [:id, :name, :quantity, :units, :_destroy])
	end

end
