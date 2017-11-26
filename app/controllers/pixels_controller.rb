class PixelsController < ApplicationController
  before_action :set_pixel, only: [:show, :edit, :update, :destroy]

  # GET /pixels
  def index
    @pixels = Pixel.all
  end

  # GET /pixels/1
  def show
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
