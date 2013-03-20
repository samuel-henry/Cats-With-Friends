class PostsController < ApplicationController

  #before filters on Posts. only authorized user can edit, destroy, and create posts
  before_filter :authorize_user_modify_post, :only => [:edit, :destroy]
  before_filter :authorize_user_create_post, :only => [:create]

  #only let user modify their own posts
  def authorize_user_modify_post
    @user = User.find(Post.find(params[:id]).user_id)
    if @user.id != session[:user_id]
      redirect_to root_url, notice: "Nice Try"
    end
  end

  #only let user create their own posts (ie prevent user 3 from posting from /users/5/posts/new)
  def authorize_user_create_post
    @user = User.find(params[:post][:user_id])
    if @user.id != session[:user_id]
      redirect_to root_url, notice: "Nice Try"
    end
  end

  # GET /posts
  # GET /posts.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  #upvote implementation influenced by http://stackoverflow.com/q/7085509/1443027
  #Note: user need not be signed in to upvote!!! No content walls on Cats With Friends!!
  def upvote
    @post = Post.find (params[:id])
    @post.upvotes += 1
    @post.save
    redirect_to(posts_url)
  end
end
