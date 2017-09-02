class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params.merge(user: current_user))

      if @post.save
        render json: @post, status: :created, location: @post 
      else
        render json: @post.errors, status: :unprocessable_entity 
      end
  end

  # PATCH/PUT /posts/1
  def update
      if @post.update(post_params)
        render json: @post, status: :ok, location: @post 
      else
        render json: @post.errors, status: :unprocessable_entity 
      end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
