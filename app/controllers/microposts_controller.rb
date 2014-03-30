class MicropostsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
	before_filter :correct_user, only: [:destroy]

	def index
	end

	def show
		store_location
		@micropost = Micropost.find_by_id(params[:id])
		@comment =  Comment.new
		@comments = @micropost.comments.paginate(page: params[:page])
	end
	def create
		@micropost = current_user.microposts.build(params[:micropost])
		@feed_items = current_user.feed.paginate(page: params[:page]) if signed_in?
		if @micropost.save
			respond_to do |format|
			   format.html {redirect_to root_url}
			   format.js
		    end
		else
			respond_to do |format|
			   format.html {redirect_to root_url}
			   format.js
		    end
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