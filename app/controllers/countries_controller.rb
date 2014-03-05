class CountriesController < ApplicationController
  include ActionController::MimeResponds

  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.all

    respond_to do |format|
      format.json { render json: @countries }
      format.any(:xml, :html) { render xml: @countries }
    end
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    @country = Country.find(params[:id])

    render json: @country
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)

    if @country.save
      render json: @country, status: :created, location: @country
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    @country = Country.find(country_params)

    if @country.update(params[:country])
      head :no_content
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country = Country.find(params[:id])
    @country.destroy

    head :no_content
  end
  
  def country_params
     params.require(:country).permit(:name, :iso2, :iso3, :notes)
   end
end