class FoodsController < ApplicationController
	
	def index
		@foods = Food.all
		render :index, layout: false	
	end
	def show
		@food=Food.find(params[:id])
	end
	def new
		@food = Food.new
		render :new, layout: false	
	end
	def edit
		@food = Food.find(params[:id])
		render :edit, layout: false
	end
	def create
		@food=Food.new(food_params)
		@meal= Meal.new(user_id: current_user.id , name: "snack")
		@meal.foods << @food
		if @meal.save
			flash[:notice] = "Food successfully saved"
			redirect_to '/'
		else 
			render 'new'
		end
	end
	def update
		@food = Food.find(params[:id])
		if @food.update(food_params)
			flash[:notice] = "Food successfully update"
			redirect_to '/'
		else
			render 'edit'
		end
	end
	def destroy
		@food = Food.find(params[:id])
		@food.destroy
		render nothing: true
	end
	private
	def food_params
		params.require(:food).permit(:name, :quantity, :units)
	end
end