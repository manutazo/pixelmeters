class PixelsController < ApplicationController
  before_action :set_pixel, only: [:show, :edit, :update, :destroy]

  # GET /pixels
  def index
    @pixels = Pixel.all
  end

  # GET /pixels/1
  def show
  end

  # GET /pixels/new
  def new
    @pixel = Pixel.new
  end

  # GET /pixels/1/edit
  def edit
  end

  # POST /pixels
  def create
    @pixel = Pixel.new(pixel_params)

    if @pixel.save
      redirect_to @pixel, notice: 'Pixel was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pixels/1
  def update
    if @pixel.update(pixel_params)
      redirect_to @pixel, notice: 'Pixel was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pixels/1
  def destroy
    @pixel.destroy
    redirect_to pixels_url, notice: 'Pixel was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pixel
      @pixel = Pixel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pixel_params
      params.require(:pixel).permit(:name, :description, :tags, :tracks_id)
    end
end
