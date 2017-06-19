class ProductFeedsController < ApplicationController
  before_action :set_product_feed, only: [:show, :edit, :update, :destroy]

  def index
    # binding.pry
    @product_feeds =
      ProductFeed
      .visible
      .paginate(
        page: params[:page],
        per_page: 30
      )
  end

  def show
  end

  def new
    @product_feed = ProductFeed.new
  end

  def edit
  end

  def create
    @product_feed = ProductFeed.new(product_feed_params)

    respond_to do |format|
      if @product_feed.save
        format.html { redirect_to @product_feed, notice: 'Product feed was successfully created.' }
        format.json { render :show, status: :created, location: @product_feed }
      else
        format.html { render :new }
        format.json { render json: @product_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product_feed.update(product_feed_params)
        format.html { redirect_to @product_feed, notice: 'Product feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_feed }
      else
        format.html { render :edit }
        format.json { render json: @product_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product_feed.update_attributes(
      deleted: true,
      deleted_at: Time.now
    )
    respond_to do |format|
      format.html { redirect_to product_feeds_url, notice: 'Product feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_product_feed
    @product_feed = ProductFeed.find(params[:id])
  end

  def product_feed_params
    params
      .require(:product_feed)
      .permit(
        :title,
        :description,
        :image_url,
        :price,
        :affiliate_code,
        :campaign_name
      )
  end
end
