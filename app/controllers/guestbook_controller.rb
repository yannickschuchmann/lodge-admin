class GuestbookController < ApplicationController
  before_action :set_guestbook_post, only: [:show, :edit, :update, :destroy]

  # GET /guestbook_posts
  # GET /guestbook_posts.json
  def index
    @posts = GuestbookPost.all.order(created_at: :desc)
  end

  # GET /guestbook_posts/1
  # GET /guestbook_posts/1.json
  def show
    @posts = GuestbookPost.all.order(created_at: :desc)
    @latest_posts = @posts.limit(5)

    current_index = @posts.to_a.index(@post)
    next_index = current_index - 1
    @next_post = next_index >= 0 ? @posts[next_index] : nil # newer and avoid negative indices
    @prev_post = @posts[current_index + 1] # older
  end

  # GET /guestbook_posts/new
  def new
    @post = GuestbookPost.new
    @post.trip = Trip.new
  end

  # GET /guestbook_posts/1/edit
  def edit
  end

  # POST /guestbook_posts
  # POST /guestbook_posts.json
  def create
    @post = GuestbookPost.new(guestbook_post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Guestbook post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guestbook_posts/1
  # PATCH/PUT /guestbook_posts/1.json
  def update
    respond_to do |format|
      if @post.update(guestbook_post_params)
        format.html { redirect_to @post, notice: 'Guestbook post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guestbook_posts/1
  # DELETE /guestbook_posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to guestbook_posts_url, notice: 'Guestbook post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guestbook_post
      @post = GuestbookPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guestbook_post_params
      params.require(:guestbook_post).permit(:title, :body, :user_id, trip_attributes: [:id, :started_at, :ended_at])
    end
end
