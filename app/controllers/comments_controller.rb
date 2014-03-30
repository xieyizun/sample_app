class CommentsController < ApplicationController
  def new
  end

  def create

      @micropost = Micropost.find_by_id(params[:id])
      @comments = @micropost.comments.paginate(page: params[:page])
      @comment = current_user.comments.build(params[:comment])
      @comment.micropost_id = @micropost.id
      #if @comment.save
       # redirect_to session[:return_to]
        #session.delete(:return_to)
      #end
      @comment.save
      respond_to do |format|
        format.html {redirect_to @micropost}
        format.js
      end
      
  end

  def show
  end

  def destroy
    @comment = current_user.comments.find_by_id(params[:id])
    @micropost = Micropost.find_by_id(@comment.micropost_id)
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to @micropost}
      format.js
    end

    #redirect_to session[:return_to]
    #session.delete(:return_to)
  end
end
