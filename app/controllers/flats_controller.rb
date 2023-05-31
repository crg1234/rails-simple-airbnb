class FlatsController < ApplicationController
before_action :set_flat, only: [:show, :edit, :update, :destroy]

end

  def index
    @flats = Flat.all
  end

  def show
    # @flat = Flat.find_by(id: params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @flat = Flat.find_by(id: params[:id])
  end

  def update
    # @flat = Flat.find_by(id: params[:id])
    if @flat.update(params)
      redirect_to flat_path(@flat)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @flat = Flat.find_by(id: params[:id])
    @flat.destroy
    redirect_to flats_path
  end

  private

  def params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end

end
