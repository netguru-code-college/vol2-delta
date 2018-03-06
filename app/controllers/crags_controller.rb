class CragsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_crag, only: [:show, :edit, :update, :destroy]

  def index
     @crags = Crag.includes(:sectors).all.page(params[:page]).per(10)

     @crags_hash = Gmaps4rails.build_markers(@crags) do |crag, marker|
       marker.lat crag.latitude
       marker.lng crag.longitude
       marker.infowindow crag.name
     end
  end

  def show
  end

  def new
    @crag = Crag.new
  end

  def edit
  end

  def create
    params[:crag][:country] = country_name crag_params[:country]
    @crag = Crag.new(crag_params)
    if @crag.save
      redirect_to crag_path(@crag), notice: 'Crag was successfully created'
    else
      redirect_to new_crag_path(@crag), alert: 'Error: crag was not created'
    end
  end

  def update
    params[:crag][:country] = country_name crag_params[:country]
    respond_to do |format|
      if @crag.update(crag_params)
        format.html { redirect_to @crag, notice: 'Crag was successfully updated.' }
        format.json { render :show, status: :ok, location: @crag }
      else
        format.html { render :edit }
        format.json { render json: @crag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @crag.destroy
    respond_to do |format|
      format.html { redirect_to crags_url, notice: 'Crag was successfully destroyed.' }
    end
  end

  private

  def set_crag
    @crag = Crag.find(params[:id])
  end

  def crag_params
    params.require(:crag).permit(:name, :country, :latitude, :longitude, :page)
  end

  def country_name country_code
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end

end
