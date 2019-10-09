class PostsController < ApplicationController

    before_action :find_post, only [:show]

    def index
        @posts = Post.all
    end

    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        redirect_to post_path(@post)
    end

    private
    def post_params
        params.require(:post).require(:category_id, :content)
    end

    def find_post
        @post = Post.find(params[:id])
    end

end