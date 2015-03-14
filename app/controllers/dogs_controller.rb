class DogsController < ApplicationController
	def index
		@dogs = Dog.all
	end
	def show
		@dog = Dog.find(params[:id])
	end
	def new
		@dog = Dog.new
	end
	def create
    		@dog = Dog.create(dog_params)
    		if @dog.save #If saving the dog was successful
      			redirect_to @dog #Go to the show view of the dog
    		else
      			render "new" #Go to the new view for the dog
    		end
	end
	private

	def dog_params
		params.require(:dog).permit(:name, :age)
	end
end
