class DashboardController < ApplicationController
  def index
    @latest_product_feeds = ProductFeed.where(deleted: false).last(10)
    @latest_imports = Import.last(10)
  end
end