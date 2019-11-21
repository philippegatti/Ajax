class EmailsController < ApplicationController
	def new
	end
	def create
		@email=Email.new(object: Faker::Superhero.power, body: Faker::Lorem.sentence)
		if @email.save
	        respond_to do |format|
		      format.html { redirect_to root_path }
		      format.js { }
		    end
    	else
	      redirect_to root_path
	      flash[:notice] = "Please try again"
    	end
	end
	def show
		@email=Email.find(params[:id])
		respond_to do |format|
	      format.html { redirect_to email_path(@email.id)}
	      format.js { }
	    end
	end
	def index
		@emails = Email.all
	end
	def destroy
	    @email = Email.find(params[:id])
	    @email.destroy
	    respond_to do |format|
	      format.html { redirect_to root_path}
	      format.js { }
	    end
	end
end
