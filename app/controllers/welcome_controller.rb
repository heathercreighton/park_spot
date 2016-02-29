class WelcomeController < ApplicationController
  

  def index


  end


	def new_session

  	if params[:role_select] == "Search"
			redirect_to spaces_index_path
  	elsif params[:role_select] == "Rent"
  		redirect_to spaces_new_path
  	else
  		redirect_to root_path, notice: 'Please make a selection.'
  	end
  end
end
