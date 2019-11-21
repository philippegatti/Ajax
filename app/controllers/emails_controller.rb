class EmailsController < ApplicationController
	def new
	end
	def create
		@emails = Email.all.order(created_at: :desc)
		@email=Email.new(object: Faker::Superhero.power, body: Faker::Lorem.sentence, read: false)
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
		@emails = Email.all.order(created_at: :desc)
		@email=Email.find(params[:id])
		@email.update(read: true)
		respond_to do |format|
	      format.html { redirect_to email_path(@email.id)}
	      format.js { }
	    end
	end
	def update
		@emails = Email.all.order(created_at: :desc)
		@email = Email.find(params[:id])
		if @email.read == true
    		@email.update(read: false)
    	else
    		@email.update(read: true)
    	end
    	respond_to do |format|
	      format.html {redirect_to root_path}
	      format.js { }
	    end
    end
	def index
		@emails = Email.all.order(created_at: :desc)
	end
	def destroy
		@emails = Email.all.order(created_at: :desc)
	    @email = Email.find(params[:id])
	    @email.destroy
	    respond_to do |format|
	      format.html { redirect_to root_path}
	      format.js { }
	    end
	end
end
