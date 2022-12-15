class Api::V1::ListingsController < ApplicationController

  def index
    @listings = Listing.all
    render json: @listings
  end

  def show
    @listing = Listing.find(params[:id])
    render json: @listing
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      render json: @listing
    else
      render json: {status: 'Error', message: 'listing is not saved', data:@listing.errors}, status: :unprocessable_entity
    end
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update_attributes(listing_params)
      render json: @listing
    else
      render json: {status: 'Error', message: 'listing is not updated', data:@listing.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    render json: @listing
  end

  private
    def listing_params
      params.permit(:num_rooms)
    end
end
