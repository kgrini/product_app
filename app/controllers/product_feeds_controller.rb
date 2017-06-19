class ProductFeedsController < ApplicationController
  before_action :set_product_feed, only: [:show, :edit, :update, :destroy]

  # GET /product_feeds
  # GET /product_feeds.json
  def index
    @product_feeds = ProductFeed.all
  end

  # GET /product_feeds/1
  # GET /product_feeds/1.json
  def show
  end

  # GET /product_feeds/new
  def new
    @product_feed = ProductFeed.new
  end

  # GET /product_feeds/1/edit
  def edit
  end

  # POST /product_feeds
  # POST /product_feeds.json
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

  # PATCH/PUT /product_feeds/1
  # PATCH/PUT /product_feeds/1.json
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

  # DELETE /product_feeds/1
  # DELETE /product_feeds/1.json
  def destroy
    @product_feed.destroy
    respond_to do |format|
      format.html { redirect_to product_feeds_url, notice: 'Product feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_feed
      @product_feed = ProductFeed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_feed_params
      params.fetch(:product_feed, {})
    end
end
