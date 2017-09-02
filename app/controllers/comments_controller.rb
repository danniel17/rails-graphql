class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  def index
    @post =  Post.find(params[:post_id])
    @comments = @post.comments.all

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params.merge(user = current_user))

      if @comment.save
        render json: @comment, status: :created, location: @comment 
      else
        render json: @comment.errors, status: :unprocessable_entity 
      end
  end

  # PATCH/PUT /comments/1
  def update
      if @comment.update(comment_params)
        render json: @comment, status: :ok, location: @comment 
      else
        render json: @comment.errors, status: :unprocessable_entity 
      end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
