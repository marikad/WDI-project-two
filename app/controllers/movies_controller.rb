class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]


  # GET /movies
  # GET /movies.json
  def index
    @title = "Discover Movies & TV Shows"
    @movies = Movie.all.page(params[:page]).per(52)
    if params[:q]
      @q = Movie.ransack(params[:q])
      @movies = @q.result(distinct: true).page(params[:page])
    end
  
  end

  def upvote
    @movie = Movie.find(params[:id])
    @movie.upvote_by current_user
    @movie.unliked_by current_user
    redirect_to @movie
  end

  def downvote
    @movie = Movie.find(params[:id])
    @movie.downvote_by current_user
    @movie.unliked_by current_user
    redirect_to @movie
  end

  def novote
    @movie = Movie.find(params[:id])
    @currentUserLikes = Movie.where(trackable_id: @movie.id, owner_id: current_user.id, key: "movie.upvote")
    @currentUserLikes.destroy_all
    redirect_to @movie
  end


  def films
    @title = "Movies"
    @movies = Movie.films.page(params[:page]).per(52)
    render :index
  end

  def tv_shows
    @title = "TV Shows"
    @movies = Movie.tv_shows.page(params[:page]).per(52)
    render :index
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @comments = @movie.comments
    @movie = Movie.find(params[:id])
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :realease_date, :description, :image, :format, :trailer)
    end
end
