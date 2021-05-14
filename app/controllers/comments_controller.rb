class CommentsController < ApplicationController

  def show
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(text: params[:comment][:text])
  end
end
