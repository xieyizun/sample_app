class MicropostsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
	before_filter :correct_user, only: [:destroy]

	def index
	end

	def create
		@micropost = current_user.microposts.build(params[:micropost])
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to root_url
		else
			flash[:error] = "The micropost is blank or too long. The maximum length is #{@micropost.maximum_length}."
			redirect_to root_url
		end
	end

	def destroy
		@micropost.destroy
		redirect_to root_url
	end

	private
	   def correct_user
	   	  @micropost = current_user.microposts.find_by_id(params[:id])
	   	  redirect_to root_url if @micropost.nil?
	   end
end